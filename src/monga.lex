%x IN_COMMENT
%{
	#include <errno.h>
	#include "lex.h"
	#include "yacc.h"

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
		printf("lexical error line %d (", line_number);
		switch (err) {
		case ERR_ID_MEM:
			printf("insufficient memory for identifier");
		case ERR_COMMENT:
			printf("open commentary");
			break;
		case ERR_STR_ESCAPE:
			printf("invalid escape");
			break;
		case ERR_STR_OPEN:
			printf("open string");
			break;
		case ERR_STR_LINE:
			printf("multiline string");
			break;
		case ERR_STR_MEM:
			printf("insufficient memory for string");
			break;
		default:
			exit(2);
		}

		printf(")\n");
		errno = err;
		exit(1);
	}

	// Exported
	int current_line() {
		return line_number;
	}
%}
%%
"\n"				{ line_number++; }
"\t"				{ }
" "					{ }

"int"				{ return TK_KEY_INT;	}
"float"				{ return TK_KEY_FLOAT;	}
"char"				{ return TK_KEY_CHAR;	}
"if"				{ return TK_KEY_IF;		}
"else"				{ return TK_KEY_ELSE;	}
"while"				{ return TK_KEY_WHILE;	}
"new"				{ return TK_KEY_NEW;	}
"return"			{ return TK_KEY_RETURN;	}
"void"				{ return TK_KEY_VOID;	}

"=="				{ return TK_EQUAL;	}
"<="				{ return TK_LEQUAL;	}
">="				{ return TK_GEQUAL;	}
"&&"				{ return TK_AND;	}
"||"				{ return TK_OR;		}

[A-Za-z_][A-Za-z_0-9]*				{
										int len = strlen(yytext);
									    char* str = (char*)malloc(len + 1);
									    if (str == NULL) { 
									        lex_error(ERR_ID_MEM);
									    }
									    memcpy(str, yytext, len + 1);
									    yylval.strvalue = str;
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
