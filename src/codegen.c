#include <stdio.h>

#include "macros.h"
#include "ast.h"

// Auxiliary
static int tablvl, temp;

static void tabs();

// static void print_char(const char c);
// static void print_int(int i);
// static void print_float(double f);
// static void print_string(const char* str);

// Code generator
static void code_def(DefNode* def);
static void code_type(TypeNode* type);
static void code_id(IdNode* id);
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
		code_type(def->u.var.type);
		printf("\n");
		break;
	case DEF_FUNC:
		printf("define ");
		code_type(def->u.func.type);
		printf(" @");
		code_id(def->u.func.id);
		printf("(");
		
		if (def->u.func.params != NULL) {
			DefNode* aux = def->u.func.params;
			while (1) { // It's ugly but necessary
				code_type(aux->u.var.type);
				printf(" ");
				code_id(aux->u.var.id); // Not a %t? Conflicts if user writes t2?
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

static void code_type(TypeNode* type) {
	switch (type->tag) {
	case TYPE_INT:		printf("i32");		break;
	case TYPE_FLOAT:	printf("double");	break;
	case TYPE_CHAR:		printf("i8");		break;
	case TYPE_VOID:		printf("void"); 	break;
	case TYPE_INDEXED:
		// TODO
		break;
	default: MONGA_ERR("cg: invalid tag");
	}
}

// TODO: Maybe this is only used inside code_def for funcs?
static void code_id(IdNode* id) {
	printf("%s", id->u.str);
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
		tabs();
		printf("call i32 @putchar(i32 %%t%d)\n", cmd->u.print->temp);
		break;
	case CMD_ASG:
		// TODO
		code_var(cmd->u.asg.var);
		code_exp(cmd->u.asg.exp);

		printf(";CmdAsg\n");
		tabs();
		// TODO: VarIndexed ?
		printf("store i32 %%t%d, i32* %%t%d\n", cmd->u.asg.exp->temp,
			cmd->u.asg.var->u.id->u.def->temp);
		break;
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
		printf(";VarId\n");
		var->temp = var->u.id->u.def->temp;
		break;
	case VAR_INDEXED:
		printf(";VarIndexed\n");
		// TODO
		break;
	default:
		MONGA_INTERNAL_ERR("code_var: invalid tag");
	}
}

static void code_exp(ExpNode* exp) {
	switch (exp->tag) {
	case EXP_KINT:
		printf(";ExpKInt\n");
		exp->temp = temp++;
		tabs();
		printf("%%t%d = add i32 %d, 0\n", exp->temp, exp->u.intvalue);
		break;
	case EXP_KFLOAT:
		// TODO
		break;
	case EXP_KSTR:
		// TODO
		break;
	case EXP_VAR:
		code_var(exp->u.var);
		printf(";ExpVar\n");
		exp->temp = temp++;
		tabs();
		printf("%%t%d = load i32, i32* %%t%d\n", exp->temp, exp->u.var->temp);
		// TODO
		break;
	case EXP_CALL:
		// TODO
		code_call(exp->u.call);
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

// static void print_char(const char c) {
// 	tabs();
// 	printf("call i32 @putchar(i32 %d)\n", c);
// }

// static void print_uint(unsigned int i) {
//     if (i / 10 != 0) {
//         print_uint(i / 10);
//     }
//     print_char((i % 10) + '0');
// }

// static void print_int(int i) {
//     if (i < 0) {
//         print_char('-');
//         i = -i;
//     }
//     print_uint((unsigned int) i);
// }

// static void print_float(double f) {
//     print_int((int) f); // TODO
// }

// static void print_string(const char* str) {
// 	for (int i = 0; str[i] != '\0'; i++) {
// 		print_char(str[i]);
// 	}
// }
