%x IN_COMMENT
%{
	#include <errno.h>
	#include "lex.h"

	SemInfo seminfo;

	// Types of lexical errors
	typedef enum ErrorType {
		ERR_COMMENTARY_OPEN,
		ERR_STRING_INVALID_ESCAPE
	} ErrorType;

	// Error dealing function
	static void error(int err) {
		switch (err) {
		case ERR_COMMENTARY_OPEN:
			printf("LEXICAL ERROR - Open commentary");
			break;
		case ERR_STRING_INVALID_ESCAPE:
			printf("LEXICAL ERROR - Invalid escape");
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

"/*"					BEGIN(IN_COMMENT);
<IN_COMMENT>"*/"		BEGIN(INITIAL);
<IN_COMMENT><<EOF>>		{ error(ERR_COMMENTARY_OPEN); }
<IN_COMMENT>.			{ }

. { return yytext[0]; }
%%
