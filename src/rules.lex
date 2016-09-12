%{
	#include "lex.h"
	SemInfo seminfo;
%}
%%
[0-9]+				{ 
						seminfo.i = strtoul(yytext, NULL, 10);
						return TK_INT;
					}
[0-9]+"."[0-9]+		{
						// TODO: Que função usar?
						seminfo.f = strtod(yytext, NULL);
						return TK_FLOAT;
					}
.					{ return TK_ERR;	}
%%