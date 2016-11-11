#include <stdio.h>
#include <stdlib.h>

#include "macros.h"
#include "ast.h"
#include "symtable.h"

// ==================================================
//
//	Auxiliary
//
// ==================================================

static void sem_error(int line, const char* details, const char* id) {
	if (id == NULL) {
		MONGA_ERR("semantical error line %d (%s)\n", line, details);
	} else {
		MONGA_ERR("semantical error line %d (%s - id \"%s\")\n", line, details,
			id);
	}
}

static int tp_equal(TypeNode* type1, TypeNode* type2) {
	int equal_tags = (type1->tag == type2->tag);
	if (type1->indexed == NULL && type2->indexed == NULL) {
		return equal_tags;
	}
	return equal_tags && tp_equal(type1->indexed, type2->indexed);
}

static int tp_in(TypeNode* type, TypeNode* types[], int size) {
	for (int i = 0; i < size; i++) {
		if (tp_equal(type, types[i])) {
			return 1;
		}
	}
	return 0;
}

// static void print_type(TypeNode* type) {
// 	switch (type->tag) {
// 	case TYPE_INT:
// 		printf("TypeInt");
// 		break;
// 	case TYPE_FLOAT:
// 		printf("TypeFloat");
// 		break;
// 	case TYPE_CHAR:
// 		printf("TypeChar");
// 		break;
// 	case TYPE_VOID:
// 		printf("TypeVoid");
// 		break;
// 	case TYPE_INDEXED:
// 		printf("TypeIndexed");
// 		break;
// 	default:
// 		MONGA_INTERNAL_ERR("sem_print_type");
// 	}
// }

TypeNode *type_int, *type_float, *type_char;

// ==================================================
//
//	Type checking
//
// ==================================================

static void type_check_def(SymbolTable* table, DefNode* def);
static void type_check_cmd(SymbolTable* table, CmdNode* cmd);
static void type_check_var(SymbolTable* table, VarNode* var);
static void type_check_exp(SymbolTable* table, ExpNode* exp);
static void type_check_call(SymbolTable* table, CallNode* call);

static void type_check_def(SymbolTable* table, DefNode* def) {
	switch (def->tag) {
	case DEF_VAR:
		if (!st_insert(table, def)) {
			sem_error(def->u.var.id->line, "redeclaration",
				def->u.var.id->u.str);
		}
		break;
	case DEF_FUNC:
		if (!st_insert(table, def)) {
			sem_error(def->u.func.id->line, "redeclaration",
				def->u.func.id->u.str);
		}
		st_enter_scope(table);
		if (def->u.func.params != NULL) {
			type_check_def(table, def->u.func.params);
		}
		if (def->u.func.cmd != NULL) {
			type_check_cmd(table, def->u.func.cmd);
		}
		st_leave_scope(table);
		break;
	default:
		MONGA_INTERNAL_ERR("type_check_def: invalid tag");
	}

	if (def->next != NULL) {
		type_check_def(table, def->next);
	}
}

static void type_check_cmd(SymbolTable* table, CmdNode* cmd) {
	switch (cmd->tag) {
	case CMD_BLOCK:
		if (cmd->u.block.defs != NULL) {
			type_check_def(table, cmd->u.block.defs);
		}
		if (cmd->u.block.cmds != NULL) {
			type_check_cmd(table, cmd->u.block.cmds);
		}
		break;
	case CMD_IF:
		type_check_exp(table, cmd->u.ifwhile.exp);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifwhile.cmd);
		st_leave_scope(table);
		break;
	case CMD_IF_ELSE:
		type_check_exp(table, cmd->u.ifelse.exp);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifelse.ifcmd);
		st_leave_scope(table);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifelse.elsecmd);
		st_leave_scope(table);
		break;
	case CMD_WHILE:
		type_check_exp(table, cmd->u.ifwhile.exp);
		st_enter_scope(table);
		type_check_cmd(table, cmd->u.ifwhile.cmd);
		st_leave_scope(table);
		break;
	case CMD_ASG:
		type_check_var(table, cmd->u.asg.var);
		type_check_exp(table, cmd->u.asg.exp);
		// TODO: Check if var can be assigned exp
		break;
	case CMD_RETURN:
		if (cmd->u.exp != NULL) {
			type_check_exp(table, cmd->u.exp);
			// TODO: Check if func can return exp
		} else {
			// TODO: Check if func can return NULL
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
		type_check_cmd(table, cmd->next);
	}
}

static void type_check_var(SymbolTable* table, VarNode* var) {
	DefNode* def;
	switch (var->tag) {
	case VAR_ID:
		def = st_find(table, var->u.id);
		if (def == NULL) {
			sem_error(var->u.id->line, "var not defined", var->u.id->u.str);
		} else if (def->tag != DEF_VAR) {
			sem_error(var->u.id->line, "not a variable", var->u.id->u.str);
		}
		var->u.id->u.def = def;
		var->type = def->u.var.type;
		break;
	case VAR_INDEXED:
		type_check_exp(table, var->u.indexed.exp1);
		type_check_exp(table, var->u.indexed.exp2);
		// TODO: var->type = malloc type
		break;
	default:
		MONGA_INTERNAL_ERR("type_check_var: invalid tag");
	}
}

static void type_check_exp(SymbolTable* table, ExpNode* exp) {
	TypeNode* type;

	switch (exp->tag) {
	case EXP_KINT:
		exp->type = type_int;
		break;
	case EXP_KFLOAT:
		exp->type = type_float;
		break;
	case EXP_KSTR:
		exp->type = type_char;
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
		type_check_exp(table, exp->u.new.exp);
		exp->type = type_int;
		break;
	case EXP_UNARY:
		type_check_exp(table, exp->u.unary.exp);
		type = exp->u.unary.exp->type;
		if (exp->u.unary.symbol == '-') {
			TypeNode* types[] = {type_int, type_float, type_char};
			if (tp_in(type, types, 3)) {
				exp->type = type;
			} else {
				sem_error(exp->line, "invalid type for unary minus", NULL);
			}
		} else if (exp->u.unary.symbol == '!') {
			TypeNode* types[] = {type_int, type_char};
			if (tp_in(type, types, 2)) {
				exp->type = type_int;
			} else {
				sem_error(exp->line, "invalid type for unary not", NULL);
			}
		} else {
			MONGA_INTERNAL_ERR("type_check_exp: invalid symbol");
		}
		break;
	case EXP_BINARY:
		type_check_exp(table, exp->u.binary.exp1);
		type_check_exp(table, exp->u.binary.exp2);
		// TODO
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
		sem_error(line, "func not defined", call->id->u.str);
	} else if (def->tag != DEF_FUNC) {
		sem_error(line, "not a function", call->id->u.str);
	}
	call->id->u.def = def;

	params = def->u.func.params;
	if (call->args != NULL) {
		type_check_exp(table, call->args);
		if (params != NULL) {
			// Call with arguments and function has parameters
			DefNode* param = params;
			ExpNode* arg = call->args;

			while (arg != NULL) {
				if (param == NULL) {
					sem_error(line, "invalid arguments - too many",
						def->u.func.id->u.str);
				}
				// TODO: Casting
				if (!tp_equal(arg->type, param->u.var.type)) {
					sem_error(line, "invalid arguments - mismatching types",
						def->u.func.id->u.str);	
				}

				param = param->next;
				arg = arg->next;
			}
			if (param != NULL) {
				sem_error(line, "invalid arguments - too few",
						def->u.func.id->u.str);
			}
		} else {
			// Call with arguments, but function has no parameters
			sem_error(line, "invalid arguments - no parameters",
				def->u.func.id->u.str);
		}
	} else {
		// Call with no arguments, but function has parameters
		if (params != NULL) {
			sem_error(line, "invalid arguments - too few",
				def->u.func.id->u.str);
		}
	}
}

// ==================================================
//
//	Functions
//
// ==================================================

void sem_type_check_program(ProgramNode* program) {
	type_int = ast_type(TYPE_INT);
	type_float = ast_type(TYPE_FLOAT);
	type_char = ast_type(TYPE_CHAR);

	SymbolTable* table = st_new();
	type_check_def(table, program->defs);
	st_free(table);
}
