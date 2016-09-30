%{
	#include <stdio.h>
	#include "lex.h"

	void yyerror(const char* err) {
		fprintf(stderr, "syntax error line %d\n", current_line());
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

definition_func	: type TK_ID '(' func_param_list ')' block
				| TK_KEY_VOID TK_ID '(' func_param_list ')' block
				;

func_param_list	: param_list
				|
				;

param_list	:	param
			|	param_list ',' param
			;

param : type TK_ID

block : '{' block_definition_var_list block_command_list '}' ;

block_definition_var_list	: definition_var_list
							|
							;

definition_var_list	: definition_var_list definition_var
					|
					;

block_command_list	: command_list
					|
					;

command_list	: command
				| command_list command
				;

command	: TK_KEY_IF '(' exp ')' command
		| TK_KEY_IF '(' exp ')' command_x TK_KEY_ELSE command
		| TK_KEY_WHILE '(' exp ')' command
		| var '=' exp ';'
		| command_return ';'
		| func_call ';'
		| block
		;

command_x	: TK_KEY_IF '(' exp ')' command_x TK_KEY_ELSE command_x
			| TK_KEY_WHILE '(' exp ')' command_x
			| var '=' exp ';'
			| command_return ';'
			| func_call ';'
			| block
			;

command_return	: TK_KEY_RETURN
				| TK_KEY_RETURN exp
				;

var	: TK_ID
	| exp '[' exp ']'
	;

exp	: TK_INT
	| TK_STR
	;

func_call	: TK_ID '(' ')'
			| TK_ID '(' exp_list ')'
			;

exp_list	: exp
			| exp_list ',' exp
			;

%%
