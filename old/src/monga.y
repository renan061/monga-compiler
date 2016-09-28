%{
	#include <stdio.h>
	#include "lex.h"
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
commands: /* empty */
        | commands command
        ;

command:	heat_switch
		|	target_set
        ;

heat_switch:	TK_KEY_INT TK_EQUAL
				{
	                printf("\tHeat turned on or off\n");
		        }
		        ;

target_set:		TK_KEY_INT TK_KEY_INT TK_KEY_INT
		        {
	                printf("\tTemperature set\n");
		        }
		        ;
%%
