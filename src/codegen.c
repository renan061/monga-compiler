#include <stdio.h>
#include <strings.h>

#include "macros.h"
#include "ast.h"
#include "yacc.h"
#include "llvm.h"

// Code generator
static void code_def(DefNode* def);
static void code_cmd(CmdNode* cmd);
static void code_var(VarNode* cmd);
static void code_exp(ExpNode* exp);

void codegen(ProgramNode* program) {
	// Setup
	printf("target triple = \"x86_64-apple-macosx10.11.0\"\n"); // TODO
	printf("declare i32 @putchar(i32)\n");
	printf("declare i32 @puts(i8*)\n\n");

	code_def(program->defs);
}

// ==================================================
//
//	Code generator
//
// ==================================================

static void code_def(DefNode* def) {
	switch (def->tag) {
	case DEF_VAR:
		// TODO: Global DefVar
		break;
	case DEF_FUNC:
		llvm_func_start(def->u.func.type, def->u.func.id, def->u.func.params);
		code_cmd(def->u.func.block);
		llvm_func_end();
		break;
	}

	if (def->next != NULL) {
		code_def(def->next);
	}
}

static void code_cmd(CmdNode* cmd) {
	switch (cmd->tag) {
	case CMD_BLOCK:
		for (DefNode* aux = cmd->u.block.defs; aux != NULL; aux = aux->next) {
			aux->temp = llvm_alloca(aux->u.var.type);
		}
		if (cmd->u.block.cmds != NULL) {
			code_cmd(cmd->u.block.cmds);
		}
		// TODO: Always return
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
	case CMD_PRINT:
		code_exp(cmd->u.print);
		llvm_print(cmd->u.print);
		break;
	case CMD_ASG:
		code_var(cmd->u.asg.var);
		code_exp(cmd->u.asg.exp);
		// TODO: VarIndexed ?
		llvm_asg(cmd->u.asg.var->type, cmd->u.asg.exp->temp,
			cmd->u.asg.var->u.id->u.def->temp);
		break;
	case CMD_RETURN:
		if (cmd->u.ret != NULL) {
			code_exp(cmd->u.ret);
			llvm_ret_exp(cmd->u.ret->type, cmd->u.ret->temp);
		} else {
			llvm_ret_void();
		}
		break;
	case CMD_CALL:
		// TODO
		break;
	}

	if (cmd->next != NULL) {
		code_cmd(cmd->next);
	}
}

static void code_var(VarNode* var) {
	switch (var->tag) {
	case VAR_ID:
		var->temp = var->u.id->u.def->temp;
		break;
	case VAR_INDEXED:
		// TODO
		break;
	}
}

static void code_exp(ExpNode* exp) {
	switch (exp->tag) {
	case EXP_KINT:
		exp->temp = llvm_knum(exp->type, exp->u.intvalue);
		break;
	case EXP_KFLOAT:
		exp->temp = llvm_knum(exp->type, exp->u.floatvalue);
		break;
	case EXP_KSTR:
		exp->temp = llvm_kstr(exp->u.strvalue);
		break;
	case EXP_VAR:
		code_var(exp->u.var);
		exp->temp = llvm_load(exp->type, exp->u.var->temp);
		break;
	case EXP_CALL: {
		if (exp->u.call->args != NULL) {
			code_exp(exp->u.call->args);
		}

		DefNode* def = exp->u.call->id->u.def;
		exp->temp = llvm_call(def->u.func.type, def->u.func.id->u.str,
			exp->u.call->args);
	}	break;
	case EXP_NEW:
		// TODO
		break;
	case EXP_CAST:
		// TODO
		break;
	case EXP_UNARY: {
		code_exp(exp->u.unary.exp);
		switch (exp->u.unary.symbol) {
		case '-':
			exp->temp = llvm_karith(LLVM_SUB, NUM_OP_TEMP, exp->type,
				exp->u.unary.exp->temp, 0);
			break;
		case '!':
			// TODO
			break;
		}
	}	break;
	case EXP_BINARY: {
		code_exp(exp->u.binary.exp1);
		code_exp(exp->u.binary.exp2);
		ExpNode* exp1 = exp->u.binary.exp1;
		ExpNode* exp2 = exp->u.binary.exp2;

		switch (exp->u.binary.symbol) {
		case TK_EQUAL:
		case TK_AND:
		case TK_OR:
			// TODO
			break;
		case '+':
			exp->temp = llvm_add(exp->type, exp1->temp, exp2->temp);
			break;
		case '-':
			exp->temp = llvm_sub(exp->type, exp1->temp, exp2->temp);
			break;
		case '*':
			exp->temp = llvm_mul(exp->type, exp1->temp, exp2->temp);
			break;
		case '/':
			exp->temp = llvm_div(exp->type, exp1->temp, exp2->temp);
			break;
		case '>':
		case '<':
		case TK_GEQUAL:
		case TK_LEQUAL:
			// TODO
			break;
		}
	}	break;
	}

	if (exp->next != NULL) {
		code_exp(exp->next);
	}
}
