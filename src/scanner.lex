%x IN_COMMENT
%option nounput
%{
	#include <strings.h>
	#include <assert.h>

	#include "macros.h"
	#include "scanner.h"
	#include "yacc.h"
	#include "arraylist.h"

	#define YY_NO_INPUT

	typedef enum ErrorType {
		ERR_COMMENT,
		ERR_STR_ESCAPE,
		ERR_STR_OPEN,
		ERR_STR_LINE,
	} ErrorType;
	
	static ArrayList* strs;
	static unsigned int line = 1; // Holds the current line number

	static const char* checkunique(const char* str);
	static const char* copystr(const char* str, size_t len);
	static const char* convertescapes(const char* str, size_t len);
	static void error(ErrorType err);
%}

/* Definitions  */
space		[ \t]
newline		\n
id 			[A-Za-z_][A-Za-z_0-9]*
int			[0-9]+
hexa		0[xX][0-9a-fA-F]+
float 		[0-9]+"."[0-9]+([Ee][-+]?[0-9]+)?
string 		"\""(\\.|[^\\"])*"\""

%%

"/*"						BEGIN(IN_COMMENT);
<IN_COMMENT>"*/"			BEGIN(INITIAL);
<IN_COMMENT>{newline}		line++;
<IN_COMMENT><<EOF>>			error(ERR_COMMENT);
<IN_COMMENT>.				; /* empty */

{space} 	; /* empty */

{newline}	line++;

"int"		{ yylval.intvalue = line; return TK_KEY_INT;	}
"float"		{ yylval.intvalue = line; return TK_KEY_FLOAT;	}
"char"		{ yylval.intvalue = line; return TK_KEY_CHAR;	}
"if"		{ yylval.intvalue = line; return TK_KEY_IF;		}
"else"		{ yylval.intvalue = line; return TK_KEY_ELSE;	}
"while"		{ yylval.intvalue = line; return TK_KEY_WHILE;	}
"new"		{ yylval.intvalue = line; return TK_KEY_NEW;	}
"return"	{ yylval.intvalue = line; return TK_KEY_RETURN;	}
"void"		{ yylval.intvalue = line; return TK_KEY_VOID;	}

"=="		{ yylval.intvalue = line; return TK_EQUAL;		}
"<="		{ yylval.intvalue = line; return TK_LEQUAL;		}
">="		{ yylval.intvalue = line; return TK_GEQUAL;		}
"&&"		{ yylval.intvalue = line; return TK_AND;		}
"||"		{ yylval.intvalue = line; return TK_OR;			}

{id}		{
			    const char* str = checkunique(yytext);
			    if (str == NULL) {
					str = copystr(yytext, yyleng);
			    }
			    yylval.idnode.line = line;
			    yylval.idnode.str = str;
				return TK_ID;
			}

{int}		{
				yylval.intvalue = strtoul(yytext, NULL, 10);
				return TK_INT;
			}

{hexa}		{
				yylval.intvalue = strtoul(yytext, NULL, 16);
				return TK_INT;
			}

{float}		{
				yylval.floatvalue = strtod(yytext, NULL);
				return TK_FLOAT;
			}

{string}	{
				const char* temp = convertescapes(yytext, yyleng);
				const char* str = checkunique(temp);
			    if (str == NULL) {
			    	str = temp;
			    	al_append(strs, (void*)str);
			    } else {
			    	free((char*)temp);
			    }
				yylval.strvalue = str;
				return TK_STR;
			}

"\""		{
				error(ERR_STR_OPEN);
			}

. 			{
				yylval.intvalue = line;
				return yytext[0];
			}
%%

// ==================================================
//
//	Exported
//
// ==================================================

void scanner_setup(void) {
	strs = al_new();
}

void scanner_clean(void) {
	al_free(strs);
}

unsigned int scanner_line(void) {
	return line;
}

const char* scanner_symbol(ScannerSymbol symbol) {
	switch (symbol) {
	case '!': 		return "!";
	case '>': 		return ">";
	case '<': 		return "<";
	case '+': 		return "+";
	case '-': 		return "-";
	case '*': 		return "*";
	case '/': 		return "/";
	case TK_OR:		return "||";
	case TK_AND: 	return "&&";
	case TK_EQUAL:	return "==";
	case TK_LEQUAL:	return "<=";
	case TK_GEQUAL:	return ">=";
	default:
		MONGA_INTERNAL_ERR("scanner_symbol: invalid symbol \'%c\'", symbol);
	}
}

// ==================================================
//
//	Auxiliary
//
// ==================================================

// Returns NULL if unique
static const char* checkunique(const char* str) {
	size_t size = al_size(strs);
	for (int i = 0; i < size; i++) {
		char* s = al_get(strs, i);
		if (strcmp(str, s) == 0) {
			return s;
		}
	}
	return NULL;
}

// Also adds the string to strs
static const char* copystr(const char* str, size_t len) {
	char* newstr;
	MALLOC_ARRAY(newstr, char, len + 1);
    for (int i = 0; i < len; i++) {
    	newstr[i] = str[i];
    }
    newstr[len] = '\0';
    al_append(strs, newstr);
    return newstr;
}

// TODO: Not working with LLVM constant definition "\\\\\ examples"
static const char* convertescapes(const char* str, size_t len) {
	// Calculating malloc size
	size_t size = 0;
	for (int i = 1; i < yyleng - 1; i++) {
		if (yytext[i] == '\\') {
			i++;
		}
		size++;
	}

	char* newstr;
	MALLOC_ARRAY(newstr, char, ++size);

	// Copying to the new string
	int k = 0;
	for (int i = 1; i < yyleng - 1; i++) {
		switch (yytext[i]) {
		case '\n':
			error(ERR_STR_LINE);
			break; // OBS: Unnecessary
		case '\\':
			switch (yytext[++i]) {
				case '"':	newstr[k++] = '"';	break;
				case 't':	newstr[k++] = '\t';	break;
				case 'n':	newstr[k++] = '\n';	break;
				case '\\':	newstr[k++] = '\\';	break;
				default: error(ERR_STR_ESCAPE);
			}
			break;
		default:
			newstr[k++] = yytext[i];
		}
	}

	assert(k == size - 1);
	newstr[k] = '\0';
	return newstr;
}

static void error(ErrorType err) {
	char str[100];
	sprintf(str, "scanner error line %d (", line);
	switch (err) {
	case ERR_COMMENT:		strcat(str, "open commentary");		break;
	case ERR_STR_ESCAPE:	strcat(str, "invalid escape");		break;
	case ERR_STR_OPEN:		strcat(str, "open string");			break;
	case ERR_STR_LINE:		strcat(str, "multiline string");	break;
	default: MONGA_INTERNAL_ERR("invalid lex error type");
	}
	MONGA_ERR("%s)\n", str);
}
