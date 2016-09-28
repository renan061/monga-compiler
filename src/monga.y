%{
	#include <stdio.h>
	#include "lex.h"

	void yyerror(const char* err) {
		printf("%s\n", err);
	}
%}

%token 
	TK_KEY_INT
	TK_KEY_FLOAT
	TK_KEY_CHAR
	TK_KEY_IF
	TK_KEY_ELSE
	TK_KEY_WHILE
	TK_KEY_NEW
	TK_KEY_RETURN
	TK_KEY_VOID
	TK_EQUAL
	TK_LEQUAL
	TK_GEQUAL
	TK_AND
	TK_OR
	TK_ID
	TK_INT
	TK_FLOAT
	TK_STR

%%
commands : TK_INT TK_INT
%%
