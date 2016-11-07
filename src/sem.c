#include <stdio.h>
#include <stdlib.h>
#include "ast.h"
#include "symtable.h"

// TODO: Create macro.h with this kind of code
#define SEM_ERROR(...) printf(__VA_ARGS__); exit(1);

// ==================================================
//
//	Private
//
// ==================================================

static void sem_fail(const char* type, const char* details) {
	// TODO: How to indicate line number?
	fprintf(stderr, "error: sem fail: %s (%s)\n", type, details);
	exit(1);
}

static void type_def(SymbolTable* table, DefNode* def);
static void type_cmd(SymbolTable* table, CmdNode* cmd);
static void type_var(SymbolTable* table, VarNode* var);
static void type_exp(SymbolTable* table, ExpNode* exp);
static void type_call(SymbolTable* table, CallNode* call);

static void type_def(SymbolTable* table, DefNode* def) {
	switch (def->tag) {
	case DEF_VAR:
		if (!st_insert(table, def)) {
			sem_fail("redeclaration", def->u.var.id->str);
		}
		break;
	case DEF_FUNC:
		if (!st_insert(table, def)) {
			sem_fail("redeclaration", def->u.func.id->str); // TODO: Duplicate? Move?
		}
		st_enter_scope(table);
		if (def->u.func.params != NULL) {
			type_def(table, def->u.func.params);
		}
		if (def->u.func.cmd != NULL) {
			type_cmd(table, def->u.func.cmd);
		}
		st_leave_scope(table);
		break;
	default:
		SEM_ERROR("internal error: type_def: invalid tag");
	}

	if (def->next != NULL) {
		type_def(table, def->next);
	}
}

static void type_cmd(SymbolTable* table, CmdNode* cmd) {
	switch (cmd->tag) {
	case CMD_BLOCK:
		if (cmd->u.block.defs != NULL) {
			type_def(table, cmd->u.block.defs);
		}
		if (cmd->u.block.cmds != NULL) {
			type_cmd(table, cmd->u.block.cmds);
		}
		break;
	case CMD_IF:
		type_exp(table, cmd->u.ifwhile.exp);
		st_enter_scope(table);
		type_cmd(table, cmd->u.ifwhile.cmd);
		st_leave_scope(table);
		break;
	case CMD_IF_ELSE:
		type_exp(table, cmd->u.ifelse.exp);
		st_enter_scope(table);
		type_cmd(table, cmd->u.ifelse.ifcmd);
		st_leave_scope(table);
		st_enter_scope(table);
		type_cmd(table, cmd->u.ifelse.elsecmd);
		st_leave_scope(table);
		break;
	case CMD_WHILE:
		type_exp(table, cmd->u.ifwhile.exp);
		st_enter_scope(table);
		type_cmd(table, cmd->u.ifwhile.cmd);
		st_leave_scope(table);
		break;
	case CMD_ASG:
		type_var(table, cmd->u.asg.var);
		type_exp(table, cmd->u.asg.exp);
		break;
	case CMD_RETURN:
		if (cmd->u.exp != NULL) {
			type_exp(table, cmd->u.exp);
		}
		break;
	case CMD_CALL:
		type_call(table, cmd->u.call);
		break;
	default:
		SEM_ERROR("internal error: type_cmd: invalid tag");
	}

	// Cmd list
	if (cmd->next != NULL) {
		type_cmd(table, cmd->next);
	}
}

static void type_var(SymbolTable* table, VarNode* var) {
	DefNode* def;
	switch (var->tag) {
	case VAR_ID:
		def = st_find(table, var->u.id);
		if (def == NULL) {
			sem_fail("type checking", var->u.id->str);
		}
		var->u.id->def = def;
		break;
	case VAR_INDEXED:
		type_exp(table, var->u.indexed.exp1);
		type_exp(table, var->u.indexed.exp2);
		break;
	default:
		SEM_ERROR("internal error: type_var: invalid tag");
	}
}

static void type_exp(SymbolTable* table, ExpNode* exp) {
	switch (exp->tag) {
	case EXP_VAR:
		type_var(table, exp->u.var);
		break;
	case EXP_CALL:
		type_call(table, exp->u.call);
		break;
	case EXP_NEW:
		type_exp(table, exp->u.new.exp);
		break;
	case EXP_UNARY:
		type_exp(table, exp->u.unary.exp);
		break;
	case EXP_BINARY:
		type_exp(table, exp->u.binary.exp1);
		type_exp(table, exp->u.binary.exp2);
		break;
	default:
		break;
	}

	// Exp list
	if (exp->next != NULL) {
		type_exp(table, exp->next);
	}
}

static void type_call(SymbolTable* table, CallNode* call) {
	DefNode* def = st_find(table, call->id);
	if (def == NULL) {
		sem_fail("type checking", call->id->str);
	}

	call->id->def = def;
	if (call->args != NULL) {
		type_exp(table, call->args);
	}
}

// ==================================================
//
//	Functions
//
// ==================================================

void sem_type_program(ProgramNode* program) {
	SymbolTable* table = st_new();
	type_def(table, program->defs);
	st_free(table);
}
