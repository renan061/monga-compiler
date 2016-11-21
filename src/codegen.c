#include <stdio.h>

#include "macros.h"
#include "ast.h"

// Aux
static void cg_def(DefNode* def);
static void cg_type(TypeNode* type);
static void cg_id(IdNode* id);
static void cg_cmd(CmdNode* cmd);
static void cg_var(VarNode* cmd);
static void cg_exp(ExpNode* exp);
static void cg_call(CallNode* call);

void codegen(ProgramNode* program) {
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
		printf("define ");
		cg_type(def->u.func.type);
		printf(" @");
		cg_id(def->u.func.id);
		printf("(");
		
		if (def->u.func.params != NULL) {
			DefNode* aux = def->u.func.params;
			while (1) { // It's ugly but necessary
				cg_type(aux->u.var.type);
				printf(" ");
				cg_id(aux->u.var.id); // TODO: Conflicts when user writes t2?
				if (aux->next == NULL) {
					break;
				}
				printf(", ");
				aux = aux->next;
			}
		}

		printf(") {\n");
		cg_cmd(def->u.func.block);
		printf("}\n");
		break;
	default:
		MONGA_INTERNAL_ERR("cg_def: invalid tag");
	}

	if (def->next != NULL) {
		cg_def(def->next);
	}
}

static void cg_type(TypeNode* type) {
	switch (type->tag) {
	case TYPE_INT:		printf("i32");			break;
	case TYPE_FLOAT:	printf("float");		break;
	case TYPE_CHAR:		printf("signext i8");	break; // TODO: ???
	case TYPE_VOID:		printf("void"); 		break;
	case TYPE_INDEXED:
		// TODO
		break;
	default: MONGA_ERR("cg: invalid tag");
	}
}

// TODO: Maybe this is only used inside cg_def for funcs?
static void cg_id(IdNode* id) {
	printf("%s", id->u.str);
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
