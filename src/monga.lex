%x IN_COMMENT
%option nounput
%{
	#include <strings.h>

	#include "macros.h"
	#include "lex.h"
	#include "yacc.h"

	#define YY_NO_INPUT

	// Holds the current line number
	static int line_number = 1;

	// Auxliary enum for types of lexical errors
	typedef enum ErrorType {
		ERR_ID_MEM,
		ERR_COMMENT,
		ERR_STR_ESCAPE,
		ERR_STR_OPEN,
		ERR_STR_LINE,
		ERR_STR_MEM,
	} ErrorType;

	// Auxiliary error dealing function
	static void lex_error(int err) {
		char str[100];
		sprintf(str, "lexical error line %d (", line_number);

		switch (err) {
		case ERR_ID_MEM:
			strcat(str, "insufficient memory for identifier");
		case ERR_COMMENT:
			strcat(str, "open commentary");
			break;
		case ERR_STR_ESCAPE:
			strcat(str, "invalid escape");
			break;
		case ERR_STR_OPEN:
			strcat(str, "open string");
			break;
		case ERR_STR_LINE:
			strcat(str, "multiline string");
			break;
		case ERR_STR_MEM:
			strcat(str, "insufficient memory for string");
			break;
		default:
			MONGA_INTERNAL_ERR("invalid lex error type");
		}

		strcat(str, ")\n");
		MONGA_ERR("%s", str);
	}
%}
%%
"\n"				{ line_number++; }
"\t"				{ }
" "					{ }

"int"				{ yylval.intvalue = line_number; return TK_KEY_INT;		}
"float"				{ yylval.intvalue = line_number; return TK_KEY_FLOAT;	}
"char"				{ yylval.intvalue = line_number; return TK_KEY_CHAR;	}
"if"				{ yylval.intvalue = line_number; return TK_KEY_IF;		}
"else"				{ yylval.intvalue = line_number; return TK_KEY_ELSE;	}
"while"				{ yylval.intvalue = line_number; return TK_KEY_WHILE;	}
"new"				{ yylval.intvalue = line_number; return TK_KEY_NEW;		}
"return"			{ yylval.intvalue = line_number; return TK_KEY_RETURN;	}
"void"				{ yylval.intvalue = line_number; return TK_KEY_VOID;	}

"=="				{ yylval.intvalue = line_number; return TK_EQUAL;	}
"<="				{ yylval.intvalue = line_number; return TK_LEQUAL;	}
">="				{ yylval.intvalue = line_number; return TK_GEQUAL;	}
"&&"				{ yylval.intvalue = line_number; return TK_AND;		}
"||"				{ yylval.intvalue = line_number; return TK_OR;		}

[A-Za-z_][A-Za-z_0-9]*				{
										int len = strlen(yytext);
									    char* str = (char*)malloc(len + 1);
									    if (str == NULL) { 
									        lex_error(ERR_ID_MEM);
									    }
									    memcpy(str, yytext, len + 1);
									    yylval.idnode.line = line_number;
									    yylval.idnode.str = str;
										return TK_ID;
									}
[0-9]+								{ 
										yylval.intvalue = strtoul(yytext, NULL, 10);
										return TK_INT;
									}
"0"[xX][0-9a-fA-F]+					{
										yylval.intvalue = strtoul(yytext, NULL, 16);
										return TK_INT;
									}
[0-9]+"."[0-9]+([Ee][-+]?[0-9]+)?	{
										yylval.floatvalue = strtod(yytext, NULL);
										return TK_FLOAT;
									}

"/*"						BEGIN(IN_COMMENT);
<IN_COMMENT>"*/"			BEGIN(INITIAL);
<IN_COMMENT>"\n"			{ line_number++; }
<IN_COMMENT><<EOF>>			{ lex_error(ERR_COMMENT); }
<IN_COMMENT>.				{ }

"\""(\\.|[^\\"])*"\""	{
							int i, k = 0;
							int malloc_len = 0, yytext_len = strlen(yytext);
							char c, *str, *result;

							// Calculating malloc size
							for (i = 0; i < yytext_len; i++) {
								c = yytext[i];
								if (c == '\\') {
									continue;
								}
								malloc_len++;
							}

							// Result string malloc
							result = (char*)malloc(malloc_len * sizeof(char));
							if (result == NULL) {
								lex_error(ERR_STR_MEM);
							}

							// Filling the result
							for (i = 0; i < yytext_len; i++) {
								str = &yytext[i];
								if (*str == '\n') {
									free(result);
									lex_error(ERR_STR_LINE);
								} else if (*str == '\\') {
									i++;
									switch (*(str+1)) {
										case '"':
											result[k++] = '"';
											break;
										case 't':
											result[k++] = '\t';
											break;
										case 'n':
											result[k++] = '\n';
											break;
										case '\\':
											result[k++] = '\\';
											break;
										default:
											free(result);
											lex_error(ERR_STR_ESCAPE);
									}
								} else {
									result[k++] = yytext[i];
								}
							}

							yylval.strvalue = result;
							return TK_STR;
						}
"\""					{ lex_error(ERR_STR_OPEN); }

. { yylval.intvalue = line_number; return yytext[0]; }
%%

int current_line() {
	return line_number;
}

// Auxiliary
const char* lex_symbol(LexSymbol symbol) {
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
		MONGA_INTERNAL_ERR("lex_symbol: invalid symbol \'%c\'", symbol);
	}
}
