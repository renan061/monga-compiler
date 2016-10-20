%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "lex.h"
	#include "ast.h"

	extern char yytext[];

	void yyerror(const char* err) {
		fprintf(stderr, "syntax error line %d\n", current_line());
	}
%}

%union {
	int intvalue;
	float floatvalue;
	const char* strvalue;

	DefNode* defnode;

	VarNode* varnode;
	CmdNode* cmdnode;
	TypeNode* typenode;
	ExpNode* expnode;
	CallNode* callnode;

	ExpList* explist;
}

%start program

%token <intvalue> TK_KEY_INT TK_KEY_FLOAT TK_KEY_CHAR TK_KEY_IF TK_KEY_ELSE
	TK_KEY_WHILE TK_KEY_NEW TK_KEY_RETURN TK_KEY_VOID TK_EQUAL TK_LEQUAL
	TK_GEQUAL TK_AND TK_OR

%token <intvalue> TK_INT
%token <floatvalue> TK_FLOAT
%token <strvalue> TK_STR TK_ID

// %type <node> program definition_list definition
%type <defnode>		definition_list definition definition_var definition_func
%type <varnode>		var
%type <cmdnode>		block command command_x command_return
%type <typenode>	type base_type
%type <expnode>		exp exp_or exp_and exp_comp exp_add exp_mul exp_unary exp_simple
%type <callnode>	func_call

%type <explist>		exp_list
// definition definition_var name_list definition_func func_param_list param_list param definition_var_list command_list
%%

program			: definition_list
					{
						ast_program($1);
					}
				;

definition_list	: definition_list definition
					{
						printf("definition_list_junta\n");
						$$ = ast_def_list($1, $2);
					}
				| /* empty */				
					{
						printf("definition_list_null\n");
						$$ = NULL;
					}
				;

definition 		: definition_var
					{
						$$ = $1;
					}
				| definition_func
					{
						$$ = $1;
					}
				;

definition_var	: type name_list ';'
					{
						// $$ = ast_def_var($1, $2);
						$$ = ast_def_var($1, ast_id("name_list"));
					}
				;

name_list	: TK_ID
			| name_list ',' TK_ID
			;

type	: base_type		{ $$ = $1;					}
		| type '[' ']'	{ $$ = ast_type_array($1);	}
		;

base_type	: TK_KEY_INT	{ $$ = ast_type(TYPE_INT);		}
			| TK_KEY_FLOAT	{ $$ = ast_type(TYPE_FLOAT);	}
			| TK_KEY_CHAR	{ $$ = ast_type(TYPE_CHAR);		}
			;

definition_func	: type TK_ID '(' func_param_list ')' block
					{
						$$ = ast_def_func(ast_id($2));
					}
				| TK_KEY_VOID TK_ID '(' func_param_list ')' block
					{
						printf("definition_func\n");
						$$ = ast_def_func(ast_id($2));
					}
				;

func_param_list	: param_list
				| /* empty */
				;

param_list	:	param
			|	param_list ',' param
			;

param	: type TK_ID
		;

block	: '{' definition_var_list command_list '}'
			// { $$ = ast_cmd_block($2, $3); }
			// { $$ = ast_set_program_node($2, $3); }
		;

definition_var_list	: definition_var_list definition_var
					| /* empty */
					;

command_list	: command_list command
				| /* empty */
				;

command	: TK_KEY_IF '(' exp ')' command
			{ $$ = ast_cmd_if($3, $5);			}
		| TK_KEY_IF '(' exp ')' command_x TK_KEY_ELSE command
			{ $$ = ast_cmd_if_else($3, $5, $7);	}
		| TK_KEY_WHILE '(' exp ')' command
			{ $$ = ast_cmd_while($3, $5);		}
		| var '=' exp ';'
			{ $$ = ast_cmd_asg($1, $3);			}
		| command_return ';'
			{ $$ = $1;							}
		| func_call ';'
			{ $$ = ast_cmd_call($1);			}
		| block
			// { $$ = $1;							}
		;

command_x	: TK_KEY_IF '(' exp ')' command_x TK_KEY_ELSE command_x
				{ $$ = ast_cmd_if_else($3, $5, $7);	}
			| TK_KEY_WHILE '(' exp ')' command_x
				{ $$ = ast_cmd_while($3, $5);		}
			| var '=' exp ';'
				{ $$ = ast_cmd_asg($1, $3);			}
			| command_return ';'
				{ $$ = $1;							}
			| func_call ';'
				{ $$ = ast_cmd_call($1);			}
			| block
				{ $$ = $1;							}
			;

command_return	: TK_KEY_RETURN		{ $$ = ast_cmd_return_null();	}
				| TK_KEY_RETURN exp	{ $$ = ast_cmd_return_exp($2);	}
				;

var	: TK_ID 					{ $$ = ast_var(ast_id($1));		}
	| exp_simple '[' exp ']'	{ $$ = ast_var_indexed($1, $3);	}
	;

/*
 *	EXP SECTION
 */

exp	: exp_or	{ $$ = $1; }
	;

exp_or	: exp_and TK_OR exp_comp	{ $$ = ast_exp_binary(TK_EQUAL, $1, $3); }
		| exp_and					{ $$ = $1;								 }
		;

exp_and	: exp_and TK_AND exp_comp	{ $$ = ast_exp_binary(TK_EQUAL, $1, $3); }
		| exp_comp					{ $$ = $1;								 }
		;

exp_comp	: exp_comp TK_EQUAL exp_add		{ $$ = ast_exp_binary(TK_EQUAL, $1, $3);	}
			| exp_comp TK_LEQUAL exp_add	{ $$ = ast_exp_binary(TK_LEQUAL, $1, $3);	}
			| exp_comp TK_GEQUAL exp_add	{ $$ = ast_exp_binary(TK_GEQUAL, $1, $3);	}
			| exp_comp '<' exp_add			{ $$ = ast_exp_binary('<', $1, $3);			}
			| exp_comp '>' exp_add			{ $$ = ast_exp_binary('>', $1, $3);			}
			| exp_add						{ $$ = $1;									}
			;

exp_add	: exp_add '+' exp_mul	{ $$ = ast_exp_binary('*', $1, $3);	}
		| exp_add '-' exp_mul	{ $$ = ast_exp_binary('-', $1, $3);	}
		| exp_mul				{ $$ = $1;							}
		;

exp_mul	: exp_mul '*' exp_unary	{ $$ = ast_exp_binary('*', $1, $3);	}
		| exp_mul '/' exp_unary { $$ = ast_exp_binary('/', $1, $3);	}
		| exp_unary 			{ $$ = $1;							}
		;

exp_unary	: '-' exp_simple	{ $$ = ast_exp_unary('-', $2);	}
			| '!' exp_simple	{ $$ = ast_exp_unary('!', $2);	}
			| exp_simple		{ $$ = $1;						}
			;

exp_simple	: TK_INT 						{ $$ = ast_exp_int($1);		}
			| TK_FLOAT 						{ $$ = ast_exp_float($1);	}
			| TK_STR						{ $$ = ast_exp_str($1);		}
			| var 							{ $$ = ast_exp_var($1); 	}
			| '(' exp ')'					{ $$ = $2;				 	}
			| func_call						{ $$ = ast_exp_call($1);	}
			| TK_KEY_NEW type '[' exp ']'	{ $$ = ast_exp_new($2, $4);	}
			;

/*
 *	END EXP SECTION
 */

func_call	: TK_ID '(' ')'				{ $$ = ast_call_empty(ast_id($1));		}
			| TK_ID '(' exp_list ')'	{ $$ = ast_call_params(ast_id($1), $3);	}
			;

exp_list	: exp 				{ $$ = ast_explist_new($1);			}
			| exp_list ',' exp 	{ $$ = ast_explist_append($1, $3);	}
			;

%%
