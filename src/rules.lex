%{
	#include "lex.h"
	SemInfo seminfo;
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
"!="				{ return TK_NEQUAL;	}
"<="				{ return TK_LEQUAL;	}
">="				{ return TK_GEQUAL;	}
"&&"				{ return TK_AND;	}
"||"				{ return TK_OR;		}

[A-Za-z_][A-Za-z_0-9]*		{
								seminfo.s = yytext;
								return TK_ID;
							}
[0-9]+						{ 
								// TODO: Expoente
								seminfo.i = strtoul(yytext, NULL, 10);
								return TK_INT;
							}
"0"[xX][0-9a-fA-F]+			{
								// TODO: Hexa float com expoente
								seminfo.i = strtoul(yytext, NULL, 16);
								return TK_INT;
							}
[0-9]+"."[0-9]+				{
								seminfo.f = strtod(yytext, NULL);
								return TK_FLOAT;
							}
.							{ return yytext[0]; }
%%