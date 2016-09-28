%x IN_COMMENT
%{
	#include <errno.h>
	#include "lex.h"
	// #include "yacc.h"

	SemInfo seminfo;

	// Auxliary enum for types of lexical errors
	typedef enum ErrorType {
		ERR_COMMENT,
		ERR_STR_ESCAPE,
		ERR_STR_OPEN,
		ERR_STR_LINE,
		ERR_STR_MEM,
	} ErrorType;

	// Auxiliary error dealing function
	static void lex_error(int err) {
		switch (err) {
		case ERR_COMMENT:
			printf("LEXICAL ERROR - Open commentary");
			break;
		case ERR_STR_ESCAPE:
			printf("LEXICAL ERROR - Invalid escape");
			break;
		case ERR_STR_OPEN:
			printf("LEXICAL ERROR - Open string");
			break;
		case ERR_STR_LINE:
			printf("LEXICAL ERROR - Multiline string");
			break;
		case ERR_STR_MEM:
			printf("LEXICAL ERROR - Insufficient memory for string");
			break;
		default:
			exit(2);
		}

		errno = err;
		exit(1);
	}
%}
%%
"\n"				{ }
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
										seminfo.s = yytext;
										return TK_ID;
									}
[0-9]+								{ 
										seminfo.i = strtoul(yytext, NULL, 10);
										return TK_INT;
									}
"0"[xX][0-9a-fA-F]+					{
										seminfo.i = strtoul(yytext, NULL, 16);
										return TK_INT;
									}
[0-9]+"."[0-9]+([Ee][-+]?[0-9]+)?	{
										seminfo.f = strtod(yytext, NULL);
										return TK_FLOAT;
									}

"/*"						BEGIN(IN_COMMENT);
<IN_COMMENT>"*/"			BEGIN(INITIAL);
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

							seminfo.s = result;
							return TK_STR;
						}
"\""					{ lex_error(ERR_STR_OPEN); }

. { return yytext[0]; }
%%
