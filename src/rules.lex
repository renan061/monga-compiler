%x IN_COMMENT
%{
	#include <errno.h>
	#include "lex.h"

	SemInfo seminfo;

	// Types of lexical errors
	typedef enum ErrorType {
		ERR_COMMENT,
		ERR_STR_ESCAPE,
		ERR_STR_OPEN
	} ErrorType;

	// Error dealing function
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

"\""(\\.|[^\\"])*"\""		{
								int i, k = 0, len = strlen(yytext);
								char *str,
									*result = (char*)malloc(len * sizeof(char));
								// TODO: String is bigget, malloc is wrong...
								for (i = 0; i < len; i++) {
									str = &yytext[i];
									if (*str == '\\') {
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
											default:
												lex_error(ERR_STR_ESCAPE);
										}
									} else {
										result[k++] = yytext[i];
									}
								}

								seminfo.s = result;
								return TK_STR;
							}
"\""						{ lex_error(ERR_STR_OPEN); }

. { return yytext[0]; }
%%
