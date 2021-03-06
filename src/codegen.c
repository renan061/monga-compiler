#include <stdio.h>
#include <strings.h>
#include <stdbool.h>

#include "macros.h"
#include "ast.h"
#include "yacc.h"
#include "llvm.h"

static void code_global_def(DefNode* def);
static void code_cmd(CmdNode* cmd);
static void code_var(VarNode* cmd);
static void code_exp(ExpNode* exp);
static void code_cond(ExpNode* exp, LLVMLabel lt, LLVMLabel lf);
static LLVMTemp code_call(CallNode* call);

void codegen(ProgramNode* program) {
	llvm_setup();
	code_global_def(program->defs);
}

static void code_global_def(DefNode* def) {
	switch (def->tag) {
	case DEF_VAR:
		def->u.var.global = true;
		llvm_def_global(def->u.var.type, def->u.var.id);
		break;
	case DEF_FUNC:
		for (DefNode* aux = def->u.func.params; aux != NULL; aux = aux->next) {
			aux->u.var.global = false;
		}
		llvm_func_start(def->u.func.type, def->u.func.id, def->u.func.params);
		code_cmd(def->u.func.block);
		llvm_ret_zero(def->u.func.type); // Always returns a zero value
		llvm_func_end();
		break;
	}

	if (def->next != NULL) {
		code_global_def(def->next);
	}
}

static void code_cmd(CmdNode* cmd) {
	switch (cmd->tag) {
	case CMD_BLOCK:
		// For local variable definitions
		for (DefNode* aux = cmd->u.block.defs; aux != NULL; aux = aux->next) {
			aux->u.var.global = false;
			aux->u.var.temp = llvm_alloca(aux->u.var.type);
		}
		if (cmd->u.block.cmds != NULL) {
			code_cmd(cmd->u.block.cmds);
		}
		break;
	case CMD_IF: {
		LLVMLabel lt = llvm_label_temp(), lf = llvm_label_temp();
		code_cond(cmd->u.ifwhile.exp, lt, lf);
		// If
		llvm_label(lt);
		code_cmd(cmd->u.ifwhile.cmd);
		llvm_br1(lf);
		// Next
		llvm_label(lf);
		break;
	}
	case CMD_IF_ELSE: {
		LLVMLabel lt = llvm_label_temp(), lf = llvm_label_temp();
		LLVMLabel end = llvm_label_temp();
		code_cond(cmd->u.ifelse.exp, lt, lf);
		// If
		llvm_label(lt);
		code_cmd(cmd->u.ifelse.ifcmd);
		llvm_br1(end);
		// Else
		llvm_label(lf);
		code_cmd(cmd->u.ifelse.elsecmd);
		llvm_br1(end);
		// End
		llvm_label(end);
		break;
	}
	case CMD_WHILE: {
		LLVMLabel cond = llvm_label_temp();
		LLVMLabel loop = llvm_label_temp(), end = llvm_label_temp();
		llvm_br1(cond);
		// Cond
		llvm_label(cond);
		code_cond(cmd->u.ifwhile.exp, loop, end);
		// Loop
		llvm_label(loop);
		code_cmd(cmd->u.ifwhile.cmd);
		llvm_br1(cond);
		// End
		llvm_label(end);
		break;
	}
	case CMD_PRINT:
		code_exp(cmd->u.print);
		llvm_print(cmd->u.print);
		break;
	case CMD_ASG:
		code_var(cmd->u.asg.var);
		code_exp(cmd->u.asg.exp);
		llvm_store(cmd->u.asg.var->type, cmd->u.asg.exp->temp,
			cmd->u.asg.var->temp);		
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
		code_call(cmd->u.call);
		break;
	}

	if (cmd->next != NULL) {
		code_cmd(cmd->next);
	}
}

static void code_var(VarNode* var) {
	switch (var->tag) {
	case VAR_ID:
		var->temp = (var->u.id->u.def->u.var.global)
			? llvm_global_address(var->type, var->u.id->u.def->u.var.id)
			: var->u.id->u.def->u.var.temp;
		break;
	case VAR_INDEXED:
		code_exp(var->u.indexed.array);
		code_exp(var->u.indexed.index);
		var->temp = llvm_getelementptr(var->u.indexed.array->temp,
			var->type, var->u.indexed.index);
		break;
	}
}

// CONTROVERSIAL: I know goto is ugly, but I think it's the most
// legible solution for this case
static void code_exp(ExpNode* exp) {
	switch (exp->tag) {
	case EXP_KINT: {
		LLVMValue val;
		val.i = exp->u.intvalue;
		exp->temp = llvm_kval(exp->type, val);
		break;
	}
	case EXP_KFLOAT: {
		LLVMValue val;
		val.f = exp->u.floatvalue;
		exp->temp = llvm_kval(exp->type, val);
		break;
	}
	case EXP_KSTR: {
		LLVMValue val;
		val.str = exp->u.strvalue;
		exp->temp = llvm_kval(exp->type, val);
		break;
	}
	case EXP_VAR:
		code_var(exp->u.var);
		exp->temp = llvm_load(exp->type, exp->u.var->temp);
		break;
	case EXP_CALL:
		exp->temp = code_call(exp->u.call);
		break;
	case EXP_NEW:
		code_exp(exp->u.new.size);
		exp->temp = llvm_new(exp->u.new.type, exp->u.new.size);
		break;
	case EXP_CAST:
		// FIXME: Remove int->char and char->int cast from sem.c and llvm.c
		code_exp(exp->u.cast);
		exp->temp = llvm_cast(exp->u.cast->type, exp->u.cast->temp, exp->type);
		break;
	case EXP_UNARY:
		switch (exp->u.unary.symbol) {
		case '-':
			code_exp(exp->u.unary.exp);
			exp->temp = llvm_minus(exp->type, exp->u.unary.exp->temp);
			break;
		case '!':
			goto DEFAULT_EXP;
		}
		break;
	case EXP_BINARY: {
		ExpNode* exp1 = exp->u.binary.exp1;
		ExpNode* exp2 = exp->u.binary.exp2;

		switch (exp->u.binary.symbol) {
		case TK_EQUAL:
		case TK_AND:
		case TK_OR:
			goto DEFAULT_EXP;
		case '+':
			code_exp(exp->u.binary.exp1);
			code_exp(exp->u.binary.exp2);
			exp->temp = llvm_add(exp->type, exp1->temp, exp2->temp);
			break;
		case '-':
			code_exp(exp->u.binary.exp1);
			code_exp(exp->u.binary.exp2);
			exp->temp = llvm_sub(exp->type, exp1->temp, exp2->temp);
			break;
		case '*':
			code_exp(exp->u.binary.exp1);
			code_exp(exp->u.binary.exp2);
			exp->temp = llvm_mul(exp->type, exp1->temp, exp2->temp);
			break;
		case '/':
			code_exp(exp->u.binary.exp1);
			code_exp(exp->u.binary.exp2);
			exp->temp = llvm_div(exp->type, exp1->temp, exp2->temp);
			break;
		case '>':
		case '<':
		case TK_GEQUAL:
		case TK_LEQUAL:
			goto DEFAULT_EXP;
		}
		break;
	}
	default:
		DEFAULT_EXP: { // exp ? 1 : 0
			LLVMLabel lt = llvm_label_temp(), lf = llvm_label_temp();
			LLVMLabel phi = llvm_label_temp();

			LLVMValue v1, v2;
			v1.i = 1;
			v2.i = 0;

			code_cond(exp, lt, lf);
			llvm_label(lt);
			llvm_br1(phi);
			llvm_label(lf);
			llvm_br1(phi);
			llvm_label(phi);
			exp->temp = llvm_phi2(exp->type, v1, lt, v2, lf);
		}
	}

	if (exp->next != NULL) {
		code_exp(exp->next);
	}
}

// CONTROVERSIAL: Same as code_exp for "goto"
static void code_cond(ExpNode* exp, LLVMLabel lt, LLVMLabel lf) {
	switch (exp->tag) {
	case EXP_UNARY:
		switch (exp->u.unary.symbol) {
		case '!':
			code_cond(exp->u.unary.exp, lf, lt);
			break;
		default:
			goto DEFAULT_COND;
		}
		break;
	case EXP_BINARY: {
		ExpNode* exp1 = exp->u.binary.exp1;
		ExpNode* exp2 = exp->u.binary.exp2;

		switch (exp->u.binary.symbol) {
		case TK_EQUAL: {
			code_exp(exp1);
			code_exp(exp2);
			exp->temp = llvm_cmp_eq(exp1->type, exp1->temp, exp2->temp);
			llvm_br3(exp->type, exp->temp, lt, lf);
			break;
		}
		case TK_AND: {
			LLVMLabel l = llvm_label_temp();
			code_cond(exp1, l, lf);
			llvm_label(l);
			code_cond(exp2, lt, lf);
			break;
		}
		case TK_OR: {
			LLVMLabel l = llvm_label_temp();
			code_cond(exp1, lt, l);
			llvm_label(l);
			code_cond(exp2, lt, lf);
			break;
		}
		case '>': {
			code_exp(exp1);
			code_exp(exp2);
			exp->temp = llvm_cmp_gt(exp1->type, exp1->temp, exp2->temp);
			llvm_br3(exp->type, exp->temp, lt, lf);
			break;
		}
		case '<': {
			code_exp(exp1);
			code_exp(exp2);
			exp->temp = llvm_cmp_lt(exp1->type, exp1->temp, exp2->temp);
			llvm_br3(exp->type, exp->temp, lt, lf);
			break;
		}
		case TK_GEQUAL: {
			code_exp(exp1);
			code_exp(exp2);
			exp->temp = llvm_cmp_ge(exp1->type, exp1->temp, exp2->temp);
			llvm_br3(exp->type, exp->temp, lt, lf);
			break;
		}
		case TK_LEQUAL: {
			code_exp(exp1);
			code_exp(exp2);
			exp->temp = llvm_cmp_le(exp1->type, exp1->temp, exp2->temp);
			llvm_br3(exp->type, exp->temp, lt, lf);
			break;
		}
		default:
			goto DEFAULT_COND;
		}
		break;
	}
	default:
		DEFAULT_COND: {
			code_exp(exp);
			llvm_br3(exp->type, llvm_cmp_notzero(exp->type, exp->temp), lt, lf);
			break;
		}
	}
}

static LLVMTemp code_call(CallNode* call) {
	if (call->args != NULL) {
		code_exp(call->args);
	}

	DefNode* def = call->id->u.def;
	return llvm_call(def->u.func.type, def->u.func.id->u.str, call->args);
}
