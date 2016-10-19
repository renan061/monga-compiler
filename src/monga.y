%{
	#include <stdio.h>
	#include <stdlib.h>
	#include "lex.h"
	#include "ast.h"

	extern char yytext[];

	void yyerror(const char* err) {
		fprintf(stderr, "syntax error line %d\n", current_line());
	}

	AstNode *test;
%}

%union {
	int intvalue;
	float floatvalue;
	const char* strvalue;
	AstNode *astnode;

	VarNode *varnode;
	TypeNode *typenode;
	ExpNode *expnode;
}

%start program

%token <intvalue> TK_KEY_INT TK_KEY_FLOAT TK_KEY_CHAR TK_KEY_IF TK_KEY_ELSE
	TK_KEY_WHILE TK_KEY_NEW TK_KEY_RETURN TK_KEY_VOID TK_EQUAL TK_LEQUAL
	TK_GEQUAL TK_AND TK_OR

%token <intvalue> TK_INT
%token <floatvalue> TK_FLOAT
%token <strvalue> TK_STR TK_ID

// %type <node> program definition_list definition
%type <varnode>		var
%type <typenode>	type base_type
%type <expnode>		exp exp_or exp_and exp_comp exp_add exp_mul exp_unary exp_simple
// definition definition_var name_list definition_func func_param_list param_list param block definition_var_list command_list command command_x command_return var func_call exp_list
%%

program	: definition_list 	//{ ast_set_program_node($$); }
		;

definition_list	: definition_list definition 	//{ $$ = ast_list_add($1, $2);		}
				| /* empty */					//{ $$ = ast_list_add(NULL, NULL);	}
				;

definition 	: definition_var 	//{ $$ = ast_literal_exp(0, 10); }
			| definition_func 	//{ $$ = ast_literal_exp(0, 20); }
			;

definition_var	: type name_list ';'
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
				| TK_KEY_VOID TK_ID '(' func_param_list ')' block
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
		;

definition_var_list	: definition_var_list definition_var
					| /* empty */
					;

command_list	: command_list command
				| /* empty */
				;

command	: TK_KEY_IF '(' exp ')' command
		| TK_KEY_IF '(' exp ')' command_x TK_KEY_ELSE command
		| TK_KEY_WHILE '(' exp ')' command
		| var '=' exp ';'										{ ast_set_program_node($1); }
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
			| func_call						//{ $$ = $1; 					}
			| TK_KEY_NEW type '[' exp ']'	{ $$ = ast_exp_new($2, $4);	}
			;

/*
 *	END EXP SECTION
 */

func_call	: TK_ID '(' ')'				//{ ; }
			| TK_ID '(' exp_list ')'	//{ ; }
			;

exp_list	: exp
			| exp_list ',' exp
			;

%%
