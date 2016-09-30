%{
	#include <stdio.h>
	#include "lex.h"

	void yyerror(const char* err) {
		fprintf(stderr, "%s\n", err);
	}
%}

%start program
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

program	: definition_list ;

definition_list	: definition_list definition
				|
				;

definition 	: definition_var
			| definition_func
			;

definition_var : type name_list ';' ;

name_list	: TK_ID
			| name_list ',' TK_ID
			;

type : base_type | type '[' ']'

base_type : TK_KEY_INT | TK_KEY_FLOAT | TK_KEY_CHAR ;

definition_func : return_type TK_ID '(' func_param_list ')' block

return_type	: type
			| TK_KEY_VOID
			;

func_param_list	: param_list
				|
				;

param_list	:	param
			|	param_list ',' param
			;

param : type TK_ID

block: '{' '}' ;

%%
