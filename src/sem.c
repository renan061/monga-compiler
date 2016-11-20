#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "macros.h"
#include "ast.h"
#include "symtable.h"
#include "yacc.h"
#include "lex.h"

static void type_check_def(SymbolTable* table, DefNode* def);
static void type_check_cmd(SymbolTable* table, CmdNode* cmd,
	TypeNode* funcreturn);
static void type_check_var(SymbolTable* table, VarNode* var);
static void type_check_exp(SymbolTable* table, ExpNode* exp);
static void type_check_call(SymbolTable* table, CallNode* call);

// Aux
static int tp_equal(TypeNode* type1, TypeNode* type2);
static void tp_cast(ExpNode** ptr, TypeNode* desirable);
static void tp_check(int line, const char* err, ExpNode** ptr,
	TypeNode* desirable);
static int tp_num(TypeNode* type);
static TypeNode* tp_highest(TypeNode* type1, TypeNode* type2);

TypeNode *type_int, *type_float, *type_char, *type_void;
TypeNode *types_int_char[2], *types_int_float_char[3];

// ==================================================
//
//	Error Handling
//
// ==================================================

static void print_type_for_error(TypeNode* type) {
	if (type == NULL) {
		return;
	}

	switch (type->tag) {
	case TYPE_INT:
		fprintf(stderr, "int");
		break;
	case TYPE_FLOAT:
		fprintf(stderr, "float");
		break;
	case TYPE_CHAR:
		fprintf(stderr, "char");
		break;
	case TYPE_VOID:
		fprintf(stderr, "void");
		break;
	case TYPE_INDEXED:
		print_type_for_error(type->indexed);
		fprintf(stderr, "[]");
		break;
	default:
		MONGA_INTERNAL_ERR("print_type_for_error: invalid tag");
	}
}

static void type_error(int line, const char* details, TypeNode* desirable,
	TypeNode* obtained) {

	fprintf(stderr, "semantical error line %d (%s - cannot use \"",
		line, details);
	print_type_for_error(obtained);
	fprintf(stderr, "\" as \"");
	print_type_for_error(desirable);
	fprintf(stderr, "\")\n");
	exit(1);
}

static void sem_error(int line, const char* details) {
	MONGA_ERR("semantical error line %d (%s)\n", line, details);
}

static void sem_error_id(int line, const char* details, const char* id) {
	MONGA_ERR("semantical error line %d (%s - id \"%s\")\n", line, details, id);
}

static void err_binop(int line, int expnum, LexSymbol symbol) {
	const char *msg, *order, *sym = lex_symbol(symbol);
	msg = "semantical error line %d (invalid type for %s expression in \"%s\")";
	order = (expnum == 1) ? "first" : (expnum == 2) ? "second" : "";
	MONGA_ERR(msg, line, order, sym);
}

// ==================================================
//
//	Exported
//
// ==================================================

void sem_type_check_program(ProgramNode* program) {
	// Auxiliary
	type_int = ast_type(TYPE_INT);
	type_float = ast_type(TYPE_FLOAT);
	type_char = ast_type(TYPE_CHAR);
	type_void = ast_type(TYPE_VOID);
	types_int_char[0] = type_int;
	types_int_char[1] = type_char;
	types_int_float_char[0] = type_int;
	types_int_float_char[1] = type_float;
	types_int_float_char[2] = type_char;

	// Main
	SymbolTable* table = st_new();
	type_check_def(table, program->defs);
	st_free(table);
}

// ==================================================
//
//	Type checking
//
// ==================================================

static void type_check_def(SymbolTable* table, DefNode* def) {
	switch (def->tag) {
	case DEF_VAR:
		if (!st_insert(table, def)) {
			sem_error_id(def->u.var.id->line, "redeclaration",
				def->u.var.id->u.str);
		}
		break;
	case DEF_FUNC:
		if (!st_insert(table, def)) {
			sem_error_id(def->u.func.id->line, "redeclaration",
				def->u.func.id->u.str);
		}
		st_enter_scope(table);
		if (def->u.func.params != NULL) {
			type_check_def(table, def->u.func.params);
		}
		type_check_cmd(table, def->u.func.block, def->u.func.type);		
		st_leave_scope(table);
		break;
	default:
		MONGA_INTERNAL_ERR("type_check_def: invalid tag");
	}

	if (def->next != NULL) {
		type_check_def(table, def->next);
	}
}

static void type_check_cmd(SymbolTable* table, CmdNode* cmd,
	TypeNode* funcreturn) {

	switch (cmd->tag) {
	case CMD_BLOCK:
		if (cmd->u.block.defs != NULL) {
			type_check_def(table, cmd->u.block.defs);
		}
		if (cmd->u.block.cmds != NULL) {
			type_check_cmd(table, cmd->u.block.cmds, funcreturn);
		}
		break;
	case CMD_IF:
		type_check_exp(table, cmd->u.ifwhile.exp);
		tp_check(cmd->line, "invalid \"if\" expression", &cmd->u.ifwhile.exp,
			type_int);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifwhile.cmd, funcreturn);
		st_leave_scope(table);
		break;
	case CMD_IF_ELSE:
		type_check_exp(table, cmd->u.ifelse.exp);
		tp_check(cmd->line, "invalid \"if else\" expression",
			&cmd->u.ifwhile.exp, type_int);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifelse.ifcmd, funcreturn);
		st_leave_scope(table);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifelse.elsecmd, funcreturn);
		st_leave_scope(table);
		break;
	case CMD_WHILE:
		type_check_exp(table, cmd->u.ifwhile.exp);
		tp_check(cmd->line, "invalid \"while\" expression", &cmd->u.ifwhile.exp,
			type_int);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifwhile.cmd, funcreturn);
		st_leave_scope(table);
		break;
	case CMD_ASG:
		type_check_var(table, cmd->u.asg.var);
		type_check_exp(table, cmd->u.asg.exp);
		tp_check(cmd->line, "invalid assignment expression", &cmd->u.asg.exp,
			cmd->u.asg.var->type);
		break;
	case CMD_RETURN:
		if (cmd->u.ret != NULL) {
			type_check_exp(table, cmd->u.ret);
			tp_check(cmd->line, "invalid type for return", &cmd->u.ret,
				funcreturn);
		} else if (funcreturn != NULL) {
			type_error(cmd->line, "invalid type for return", funcreturn,
				type_void);
		}
		break;
	case CMD_CALL:
		type_check_call(table, cmd->u.call);
		break;
	default:
		MONGA_INTERNAL_ERR("type_check_cmd: invalid tag");
	}

	// Cmd list
	if (cmd->next != NULL) {
		type_check_cmd(table, cmd->next, funcreturn);
	}
}

static void type_check_var(SymbolTable* table, VarNode* var) {
	switch (var->tag) {
	case VAR_ID: {
		DefNode* def = st_find(table, var->u.id);
		if (def == NULL) {
			sem_error_id(var->u.id->line, "var not defined", var->u.id->u.str);
		} else if (def->tag != DEF_VAR) {
			sem_error_id(var->u.id->line, "not a variable", var->u.id->u.str);
		}
		var->u.id->u.def = def;
		var->type = def->u.var.type;
	}	break;
	case VAR_INDEXED: {
		type_check_exp(table, var->u.indexed.array);
		type_check_exp(table, var->u.indexed.index);
		if (var->u.indexed.array->type->tag != TYPE_INDEXED) {
			sem_error(var->line, "not indexed type");
		}
		tp_check(var->line, "invalid index type for array",
			&var->u.indexed.index, type_int);
		var->type = var->u.indexed.array->type->indexed;
	}	break;
	default:
		MONGA_INTERNAL_ERR("type_check_var: invalid tag");
	}
}

static void type_check_exp(SymbolTable* table, ExpNode* exp) {
	switch (exp->tag) {
	case EXP_KINT:
		exp->type = type_int;
		break;
	case EXP_KFLOAT:
		exp->type = type_float;
		break;
	case EXP_KSTR:
		exp->type = ((strlen(exp->u.strvalue)) > 1) ?
			ast_type_indexed(type_char) : type_char;
		break;
	case EXP_VAR:
		type_check_var(table, exp->u.var);
		exp->type = exp->u.var->type;
		break;
	case EXP_CALL:
		type_check_call(table, exp->u.call);
		exp->type = exp->u.call->id->u.def->u.func.type;
		break;
	case EXP_NEW:
		type_check_exp(table, exp->u.new.size);
		tp_check(exp->line, "invalid size type for array", &exp->u.new.size,
			type_int);
		exp->type = ast_type_indexed(exp->u.new.type);
		break;
	case EXP_UNARY:
		type_check_exp(table, exp->u.unary.exp);

		TypeNode* type = exp->u.unary.exp->type;
		switch (exp->u.unary.symbol) {
		case '-':
			if (!tp_num(type)) {
				sem_error(exp->line, "invalid type for unary minus");
			} else if (type->tag == TYPE_CHAR) {
				tp_cast(&exp->u.unary.exp, type_int);
				exp->type = type_int;
			} else {
				exp->type = type;
			}
			break;
		case '!':
			tp_check(exp->line, "invalid type for unary not", &exp->u.unary.exp,
				type_int);
			exp->type = type_int;
			break;
		default:
			MONGA_INTERNAL_ERR("type_check_exp unary: invalid symbol");
		}
		break;
	case EXP_BINARY:
		type_check_exp(table, exp->u.binary.exp1);
		type_check_exp(table, exp->u.binary.exp2);

		TypeNode* type1 = exp->u.binary.exp1->type;
		TypeNode* type2 = exp->u.binary.exp2->type;
		LexSymbol symbol = exp->u.binary.symbol;

		if (!tp_num(type1)) {
			err_binop(exp->line, 1, symbol);
		}
		if (!tp_num(type2)) {
			err_binop(exp->line, 2, symbol);
		}

		exp->type = tp_highest(type1, type2);
		if (type1 != exp->type) {
			tp_cast(&exp->u.binary.exp1, exp->type);
		}
		if (type2 != exp->type) {
			tp_cast(&exp->u.binary.exp2, exp->type);
		}
		
		if (symbol == TK_EQUAL || symbol == TK_LEQUAL || symbol == TK_GEQUAL ||
			symbol == '<' || symbol == '>' || symbol == TK_AND ||
			symbol == TK_OR) {
			exp->type = type_int;
		}
		break;
	default:
		MONGA_INTERNAL_ERR("type_check_exp: invalid tag");
	}

	// Exp list
	if (exp->next != NULL) {
		type_check_exp(table, exp->next);
	}
}

static void type_check_call(SymbolTable* table, CallNode* call) {
	DefNode* params;
	int line = call->id->line;

	DefNode* def = st_find(table, call->id);
	if (def == NULL) {
		sem_error_id(line, "func not defined", call->id->u.str);
	} else if (def->tag != DEF_FUNC) {
		sem_error_id(line, "not a function", call->id->u.str);
	}
	call->id->u.def = def;

	params = def->u.func.params;
	if (call->args != NULL) {
		type_check_exp(table, call->args);
		if (params != NULL) { // Call with arguments and function has parameters
			DefNode* param = params;
			ExpNode *arg = call->args, *previous = NULL;
			while (arg != NULL) {
				if (param == NULL) {
					sem_error_id(line, "too many arguments",
						def->u.func.id->u.str);
				}
				tp_check(line, "mismatching types of arguments", &arg,
					param->u.var.type);
				if (previous != NULL) {
					previous->next = arg;
				}
				param = param->next;
				previous = arg;
				arg = arg->next;
			}
			if (param != NULL) {
				sem_error_id(line, "too few arguments", def->u.func.id->u.str);
			}
		} else { // Call with arguments, but function has no parameters
			sem_error_id(line, "invalid arguments - no parameters",
				def->u.func.id->u.str);
		}
	} else { // Call with no arguments, but function has parameters
		if (params != NULL) {
			sem_error_id(line, "too few arguments", def->u.func.id->u.str);
		}
	}
}

// ==================================================
//
//	Auxiliary
//
// ==================================================

// Checks for type equality recursively
static int tp_equal(TypeNode* type1, TypeNode* type2) {
	int boolean = (type1->tag == type2->tag);
	return (type1->indexed == NULL || type2->indexed == NULL)
		? boolean : boolean && tp_equal(type1->indexed, type2->indexed);
}

// Always casts up, never casts down: char < int < float
// Obs.: type1[] never casts to type2[]
static void tp_cast(ExpNode** ptr, TypeNode* desirable) {
	ExpNode* exp = *ptr;
	TypeNode* type;

	switch (desirable->tag) {
	case TYPE_INT:
		// Can only cast "char" to "int"
		if (exp->type->tag != TYPE_CHAR) {
			MONGA_INTERNAL_ERR("invalid cast to int");
		}
		type = type_int;
		break;
	case TYPE_FLOAT:
		// Can only cast "char" or "int" to "float"
		if (exp->type->tag != TYPE_CHAR && exp->type->tag != TYPE_INT) {
			MONGA_INTERNAL_ERR("invalid cast to float");
		}
		type = type_float;
		break;
	default:
		MONGA_INTERNAL_ERR("invalid type to cast");
	}

	*ptr = ast_exp_cast(type, exp);
}

// Checks for type equality and casts if necessary
// Deals with errors internally
static void tp_check(int line, const char* err, ExpNode** ptr,
	TypeNode* desirable) {

	ExpNode* exp = *ptr;
	switch (desirable->tag) {
		case TYPE_CHAR:
			if (exp->type->tag != TYPE_CHAR) {
				type_error(line, err, desirable, exp->type);
			}
			break;
		case TYPE_INT:
			switch (exp->type->tag) {
			case TYPE_CHAR:	tp_cast(ptr, type_int);
			case TYPE_INT:	return;
			default: type_error(line, err, desirable, exp->type);
			}
		case TYPE_FLOAT:
			switch (exp->type->tag) {
			case TYPE_CHAR:	case TYPE_INT:	tp_cast(ptr, type_float);
			case TYPE_FLOAT:				return;
			default: type_error(line, err, desirable, exp->type);
			}
		case TYPE_VOID:
			type_error(line, err, desirable, exp->type);
		case TYPE_INDEXED:
			if (!tp_equal(desirable, exp->type)) {
				type_error(line, err, desirable, exp->type);
			}
			break;
		default:
			MONGA_INTERNAL_ERR("tp_check: invalid type tag");
	}
}

// Checks if type is TypeChar, TypeInt or TypeFloat
static int tp_num(TypeNode* type) {
	return !(type->tag == TYPE_VOID || type->tag == TYPE_INDEXED);
}

// char == int < float
static TypeNode* tp_highest(TypeNode* type1, TypeNode* type2) {
	return (type1->tag == TYPE_FLOAT || type2->tag == TYPE_FLOAT)
		? type_float : type_int;
}
