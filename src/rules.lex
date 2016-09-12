%{
	#include "lex.h"
	SemInfo seminfo;
%}
%%
"\t"				{
						// TODO: ?
					}
" "					{
						// Why not ' ' ? 
					}

"int"				{ return TK_KEY_INT;	}
"float"				{ return TK_KEY_FLOAT;	}
"char"				{ return TK_KEY_CHAR;	}
"if"				{ return TK_KEY_IF;		}
"else"				{ return TK_KEY_ELSE;	}
"while"				{ return TK_KEY_WHILE;	}
"new"				{ return TK_KEY_NEW;	}
"return"			{ return TK_KEY_RETURN;	}
"void"				{ return TK_KEY_VOID;	}

[0-9]+				{ 
						// TODO: Expoente
						// TODO
						seminfo.i = strtoul(yytext, NULL, 10);
						return TK_INT;
					}
[0-9]+"."[0-9]+		{
						// TODO: Que função usar?
						// Essa tem precisão de 5 casas decimais...
						seminfo.f = strtod(yytext, NULL);
						return TK_FLOAT;
					}

.					{ return yytext[0]; }
%%