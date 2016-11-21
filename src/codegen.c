#include <stdio.h>

#include "macros.h"
#include "ast.h"

// Aux
static void cg_def(DefNode* def);
static void cg_cmd(CmdNode* cmd);
static void cg_var(VarNode* cmd);
static void cg_exp(ExpNode* exp);
static void cg_call(CallNode* call);

void codegen(ProgramNode* program) {
	printf("codegen\n");
	cg_def(program->defs);
}

// ==================================================
//
//	Code generator
//
// ==================================================

static void cg_def(DefNode* def) {
	switch (def->tag) {
	case DEF_VAR:
		// TODO
		break;
	case DEF_FUNC:
		// TODO
		cg_cmd(def->u.func.block);
		break;
	default:
		MONGA_INTERNAL_ERR("cg_def: invalid tag");
	}

	if (def->next != NULL) {
		cg_def(def->next);
	}
}

static void cg_cmd(CmdNode* cmd) {
	switch (cmd->tag) {
	case CMD_BLOCK:
		// TODO
		if (cmd->u.block.defs != NULL) {
			cg_def(cmd->u.block.defs);
		}
		if (cmd->u.block.cmds != NULL) {
			cg_cmd(cmd->u.block.cmds);
		}
		break;
	case CMD_IF:
		// TODO
		break;
	case CMD_IF_ELSE:
		// TODO
		break;
	case CMD_WHILE:
		// TODO
		break;
	case CMD_ASG:
		// TODO
		cg_var(cmd->u.asg.var);
		cg_exp(cmd->u.asg.exp);
		break;
	case CMD_RETURN:
		// TODO
		break;
	case CMD_CALL:
		// TODO
		break;
	default:
		MONGA_INTERNAL_ERR("cg_cmd: invalid tag");
	}

	if (cmd->next != NULL) {
		cg_cmd(cmd->next);
	}
}

static void cg_var(VarNode* var) {
	switch (var->tag) {
	case VAR_ID:
		// TODO
		break;
	case VAR_INDEXED:
		// TODO
		break;
	default:
		MONGA_INTERNAL_ERR("cg_var: invalid tag");
	}
}

static void cg_exp(ExpNode* exp) {
	switch (exp->tag) {
	case EXP_KINT:
		// TODO
		break;
	case EXP_KFLOAT:
		// TODO
		break;
	case EXP_KSTR:
		// TODO
		break;
	case EXP_VAR:
		// TODO
		break;
	case EXP_CALL:
		// TODO
		cg_call(exp->u.call);
		break;
	case EXP_NEW:
		// TODO
		break;
	case EXP_UNARY:
		// TODO
		break;
	case EXP_BINARY:
		// TODO
		break;
	default:
		MONGA_INTERNAL_ERR("cg_exp: invalid tag");
	}

	if (exp->next != NULL) {
		cg_exp(exp->next);
	}
}

static void cg_call(CallNode* call) {
	// TODO
}
