#include <stdio.h>
#include <strings.h>

#include "macros.h"
#include "ast.h"
#include "yacc.h"

// Auxiliary
static int tablvl, temp;

static void tabs();

// static void print_char(const char c);
// static void print_string(const char* str);

// LLVM auxiliary
static void llvm_temp(int temp);
static void llvm_load(int dest, TypeNode* type, int source);
static void llvm_type(TypeNode* type);
static void llvm_knum(int dest, TypeNode* type, double val);
static void llvm_add(int dest, TypeNode* type, int temp1, int temp2);
static void llvm_sub(int dest, TypeNode* type, int temp1, int temp2);
static void llvm_mul(int dest, TypeNode* type, int temp1, int temp2);
static void llvm_div(int dest, TypeNode* type, int temp1, int temp2);

// Code generator
static void code_def(DefNode* def);
static const char* code_id(IdNode* id);
static void code_cmd(CmdNode* cmd);
static void code_var(VarNode* cmd);
static void code_exp(ExpNode* exp);
static void code_call(CallNode* call);

void codegen(ProgramNode* program) {
	// Setup
	printf("target triple = \"x86_64-apple-macosx10.11.0\"\n"); // TODO
	printf("declare i32 @putchar(i32)\n\n");
	tablvl = 0;
	temp = 1;

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
		printf(";DefVar\n");
		tabs();
		def->temp = temp++;
		printf("%%t%d = alloca ", def->temp);
		llvm_type(def->u.var.type);
		printf("\n");
		break;
	case DEF_FUNC:
		printf("define ");
		llvm_type(def->u.func.type);
		printf(" @%s(", code_id(def->u.func.id));
		
		if (def->u.func.params != NULL) {
			DefNode* aux = def->u.func.params;
			while (1) { // It's ugly but necessary
				llvm_type(aux->u.var.type);
				printf(" %s", code_id(aux->u.var.id)); // Not a %t? Conflicts if user writes t2?
				if (aux->next == NULL) {
					break;
				}
				printf(", ");
				aux = aux->next;
			}
		}

		printf(") {\n");
		tablvl++;
		code_cmd(def->u.func.block);
		tablvl--;
		printf("}\n");
		break;
	default:
		MONGA_INTERNAL_ERR("code_def: invalid tag");
	}

	if (def->next != NULL) {
		code_def(def->next);
	}
}

// TODO: Maybe this is only used inside code_def for funcs?
static const char* code_id(IdNode* id) {
	return id->u.str;
}

static void code_cmd(CmdNode* cmd) {
	switch (cmd->tag) {
	case CMD_BLOCK:
		// TODO
		if (cmd->u.block.defs != NULL) {
			code_def(cmd->u.block.defs);
		}
		if (cmd->u.block.cmds != NULL) {
			code_cmd(cmd->u.block.cmds);
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
	case CMD_PRINT:
		code_exp(cmd->u.print);
		printf(";CmdPrint\n");
		switch (cmd->u.print->type->tag) {
		case TYPE_CHAR:
			break; // TODO
		case TYPE_INT:
			break; // TODO
		case TYPE_FLOAT:
			break; // TODO
		case TYPE_INDEXED:
			break; // TODO
		case TYPE_VOID:
			break; // TODO: Error
		}
		tabs();
		printf("call i32 @putchar(i32 %%t%d)\n", cmd->u.print->temp);
		break;
	case CMD_ASG: {
		// TODO
		code_var(cmd->u.asg.var);
		code_exp(cmd->u.asg.exp);

		printf(";CmdAsg\n");
		tabs();
		// TODO: VarIndexed ?

		printf("store ");
		llvm_type(cmd->u.asg.var->type);
		printf(" %%t%d, ", cmd->u.asg.exp->temp);
		llvm_type(cmd->u.asg.var->type);
		printf("* %%t%d\n", cmd->u.asg.var->u.id->u.def->temp);
	}	break;
	case CMD_RETURN:
		tabs();
		printf("ret i32 0\n"); // TODO
		break;
	case CMD_CALL:
		// TODO
		break;
	default:
		MONGA_INTERNAL_ERR("code_cmd: invalid tag");
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
	default:
		MONGA_INTERNAL_ERR("code_var: invalid tag");
	}
}

static void code_exp(ExpNode* exp) {
	switch (exp->tag) {
	case EXP_KINT:
		exp->temp = temp++;
		llvm_knum(exp->temp, exp->type, exp->u.intvalue);
		break;
	case EXP_KFLOAT:
		exp->temp = temp++;
		llvm_knum(exp->temp, exp->type, exp->u.floatvalue);
		break;
	case EXP_KSTR:
		// TODO
		break;
	case EXP_VAR:
		code_var(exp->u.var);
		exp->temp = temp++;
		llvm_load(exp->temp, exp->type, exp->u.var->temp);
		break;
	case EXP_CALL:
		// TODO
		code_call(exp->u.call);
		break;
	case EXP_NEW:
		// TODO
		break;
	case EXP_UNARY: {
		code_exp(exp->u.unary.exp);
		printf(";ExpUnary\n");

		tabs();
		exp->temp = temp++;

		switch (exp->u.unary.symbol) {
		case '-':
			// TODO: mul type
			printf("%%t%d = mul ", exp->temp);
			llvm_type(exp->type);
			printf(" %%t%d, -1\n", exp->u.unary.exp->temp);
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
		exp->temp = temp++;

		switch (exp->u.binary.symbol) {
		case TK_EQUAL:
		case TK_AND:
		case TK_OR:
			// TODO
			break;
		case '+': llvm_add(exp->temp, exp->type, exp1->temp, exp2->temp); break;
		case '-': llvm_sub(exp->temp, exp->type, exp1->temp, exp2->temp); break;
		case '*': llvm_mul(exp->temp, exp->type, exp1->temp, exp2->temp); break;
		case '/': llvm_div(exp->temp, exp->type, exp1->temp, exp2->temp); break;
		case '>':
		case '<':
		case TK_GEQUAL:
		case TK_LEQUAL:
			// TODO
			break;
		}
		// TODO
	}	break;
	default:
		MONGA_INTERNAL_ERR("code_exp: invalid tag");
	}

	if (exp->next != NULL) {
		code_exp(exp->next);
	}
}

static void code_call(CallNode* call) {
	// TODO
}

// ==================================================
//
//	Auxiliary
//
// ==================================================

static void tabs() {
	for (int i = 0; i < tablvl; i++) {
		printf("  ");
	}
}

// ==================================================
//
//	LLVM auxiliary
//
// ==================================================

static void llvm_temp(int temp) {
	printf("%%t%d", temp);
}

static void llvm_load(int dest, TypeNode* type, int source) {
	tabs();
	printf("%%t%d = load ", dest);
	llvm_type(type);
	printf(", ");
	llvm_type(type);
	printf("* %%t%d\n", source);
}

static void llvm_type(TypeNode* type) {
	switch (type->tag) {
	case TYPE_INT:		printf("i32");		break;
	case TYPE_FLOAT:	printf("double");	break;
	case TYPE_CHAR:		printf("i8");		break;
	case TYPE_VOID:		printf("void");		break;
	case TYPE_INDEXED:
		llvm_type(type->indexed);
		printf("*");
		break;
	}
}

static void llvm_knum(int dest, TypeNode* type, double val) {
	int isfloat = (type->tag == TYPE_FLOAT);
	tabs();
	llvm_temp(dest);
	printf(" = %s ", (isfloat) ? "fadd" : "add");
	llvm_type(type);
	printf(" ");

	if (isfloat) {
		printf("TODO");
	} else {
		printf("%d, 0", (int)val);
	}

	printf("\n");
}

// For llvm add, sub, mul and div
static void llvm_arith(const char* op, int dest, TypeNode* type, int temp1,
	int temp2) {

	int isfloat = (type->tag == TYPE_FLOAT);
	tabs();
	llvm_temp(dest);
	printf(" = %s%s ", (isfloat) ? "f" : (!strcmp(op, "div")) ? "s" : "", op);
	llvm_type(type);
	printf(" ");
	llvm_temp(temp1);
	printf(", ");
	llvm_temp(temp2);
	printf("\n");
}

static void llvm_add(int dest, TypeNode* type, int temp1, int temp2) {
	llvm_arith("add", dest, type, temp1, temp2);
}

static void llvm_sub(int dest, TypeNode* type, int temp1, int temp2) {
	llvm_arith("sub", dest, type, temp1, temp2);
}

static void llvm_mul(int dest, TypeNode* type, int temp1, int temp2) {
	llvm_arith("mul", dest, type, temp1, temp2);
}

static void llvm_div(int dest, TypeNode* type, int temp1, int temp2) {
	llvm_arith("div", dest, type, temp1, temp2);
}
