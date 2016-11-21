#include <stdio.h>
#include <stdlib.h>

#include "macros.h"
#include "parser.h"
#include "ast.h"
#include "yacc.h"
#include "sem.h"
#include "lex.h"

#define DEBUGGING 0

// ==================================================
//
//	Main
//
// ==================================================

// Auxiliary
static void test_log(const char* str);
static void print_tabs(int layer);

// Print
static void print_program(ProgramNode* program);
static void print_def(DefNode* def, int layer);
static void print_type(TypeNode* type);
static void print_id(IdNode* id);
static void print_cmd(CmdNode* cmd, int layer);
static void print_var(VarNode* var, int layer);
static void print_exp(ExpNode* exp);
static void print_call(CallNode* call);

int main() {
	yyparse();
	ProgramNode* program = ast_get_program();
	sem_type_check_program(program);
	print_program(program);

    return 0;
}

// ==================================================
//
//	Print
//
// ==================================================

static void print_program(ProgramNode* program) {
	test_log("print_program");
	print_def(program->defs, 0);
}

static void print_def(DefNode* def, int layer) {
	test_log("print_def");

	print_tabs(layer);
	switch (def->tag) {
	case DEF_VAR:
		print_type(def->u.var.type);
		printf(" ");
		print_id(def->u.var.id);
		printf(";\n");
		break;
	case DEF_FUNC:
		// define i32 @main() #0 {
		print_type(def->u.func.type);
		printf(" ");
		print_id(def->u.func.id);
		if (def->u.func.params == NULL) {
			printf("()");
		} else {
			printf("(");
			DefNode* aux = def->u.func.params;
			while (1) { // It's ugly but necessary
				cg_type(aux->u.var.type);
				printf(" ");
				cg_id(aux->u.var.id); // Not a %t? Conflicts if user writes t2?
				if (aux->next == NULL) {
					break;
				}
				printf(", ");
				aux = aux->next;
			}
			printf(")");
		}
		printf(" {\n");
		print_cmd(def->u.func.block, layer + 1);
		print_tabs(layer);
		printf("}\n");
		break;
	default:
		MONGA_ERR("print_def: invalid tag");
	}

	if (def->next != NULL) {
		print_def(def->next, layer);
	}
}

static void print_type(TypeNode* type) {
	test_log("print_type");

	switch (type->tag) {
	case TYPE_INT:
		printf("int");
		break;
	case TYPE_FLOAT:
		printf("float");
		break;
	case TYPE_CHAR:
		printf("char");
		break;
	case TYPE_VOID:
		printf("void");
		break;
	case TYPE_INDEXED:
		print_type(type->indexed);
		printf("[]");
		break;
	default:
		MONGA_ERR("print_type: invalid tag");
	}
}

static void print_id(IdNode* id) {
	test_log("print_id");
	printf("%s", id->u.str);
}

static void print_id_ref(IdNode* id) {
	test_log("print_id_ref");
	switch (id->u.def->tag) {
		case DEF_VAR:
			printf("%s", id->u.def->u.var.id->u.str);
			break;
		case DEF_FUNC:
			printf("%s", id->u.def->u.func.id->u.str);
			break;
		default:
			MONGA_ERR("print_id_def: invalid def tag");
	}
}

static void print_cmd(CmdNode* cmd, int layer) {
	test_log("print_cmd");

	switch (cmd->tag) {
	case CMD_BLOCK:
		if (cmd->u.block.defs != NULL) {
			print_def(cmd->u.block.defs, layer + 1);
		}
		if (cmd->u.block.cmds != NULL) {
			print_cmd(cmd->u.block.cmds, layer + 1);
		}
		break;
	case CMD_IF:
		print_tabs(layer);
		printf("(if(");
		print_exp(cmd->u.ifwhile.exp);
		printf(") {\n");
		print_cmd(cmd->u.ifwhile.cmd, layer + 1);
		print_tabs(layer);
		printf("})\n");
		break;
	case CMD_IF_ELSE:
		print_tabs(layer);
		printf("(if(");
		print_exp(cmd->u.ifelse.exp);
		printf(") {\n");
		print_cmd(cmd->u.ifelse.ifcmd, layer + 1);
		print_tabs(layer);
		printf("} else {\n");
		print_cmd(cmd->u.ifelse.elsecmd, layer + 1);
		print_tabs(layer);
		printf("})\n");
		break;
	case CMD_WHILE:
		print_tabs(layer);
		printf("(while(");
		print_exp(cmd->u.ifwhile.exp);
		printf(") {\n");
		print_cmd(cmd->u.ifwhile.cmd, layer + 1);
		print_tabs(layer);
		printf("})\n");
		break;
	case CMD_ASG:
		print_var(cmd->u.asg.var, layer);
		printf(" = ");
		print_exp(cmd->u.asg.exp);
		printf(";\n");
		break;
	case CMD_RETURN:
		print_tabs(layer);
		printf("return ");
		if (cmd->u.ret != NULL) {
			print_exp(cmd->u.ret);
		}
		printf(";\n");
		break;
	case CMD_CALL:
		print_tabs(layer);
		print_call(cmd->u.call);
		printf(";\n");
		break;
	default:
		MONGA_ERR("print_cmd: invalid tag");
	}

	// Cmd list
	if (cmd->next != NULL) {
		print_cmd(cmd->next, layer);
	}
}

void print_var(VarNode* var, int layer) {
	test_log("print_var");

	switch (var->tag) {
	case VAR_ID:
		print_tabs(layer);
		print_id_ref(var->u.id);
		printf(":");
		print_type(var->type);
		break;
	case VAR_INDEXED:
		print_tabs(layer);
		print_exp(var->u.indexed.array);
		printf("[");
		print_exp(var->u.indexed.index);
		printf("]");
		printf(":");
		print_type(var->type);
		break;
	default:
		MONGA_ERR("print_var: invalid tag");
	}
}

void print_exp(ExpNode* exp) {
	test_log("print_exp");

	printf("(");
	switch (exp->tag) {
	case EXP_KINT:
		printf("%d:", exp->u.intvalue);
		print_type(exp->type);
		break;
	case EXP_KFLOAT:
		printf("%f:", exp->u.floatvalue);
		print_type(exp->type);
		break;
	case EXP_KSTR:
		printf("\"%s\":", exp->u.strvalue);
		print_type(exp->type);
		break;
	case EXP_VAR:
		print_var(exp->u.var, 0);
		break;
	case EXP_CALL:
		print_call(exp->u.call);
		printf(":");
		print_type(exp->type);
		break;
	case EXP_NEW:
		printf("new ");
		print_type(exp->u.new.type);
		printf("[");
		print_exp(exp->u.new.size);
		printf("]:");
		print_type(exp->type);
		break;
	case EXP_CAST:
		print_exp(exp->u.cast);
		printf(" as ");
		print_type(exp->type);
		break;
	case EXP_UNARY:
		printf("%s", lex_symbol(exp->u.unary.symbol));
		print_exp(exp->u.unary.exp);
		printf(":");
		print_type(exp->type);
		break;
	case EXP_BINARY:
		print_exp(exp->u.binary.exp1);
		printf("%s", lex_symbol(exp->u.binary.symbol));
		printf(":");
		print_type(exp->type);
		print_exp(exp->u.binary.exp2);
		break;
	default:
		MONGA_ERR("print_exp: invalid tag");
	}
	printf(")");

	// Exp list
	if (exp->next != NULL) {
		printf(", ");
		print_exp(exp->next);
	}
}

static void print_call(CallNode* call) {
	test_log("print_call");

	print_id(call->id->u.def->u.func.id);
	printf("(");
	if (call->args != NULL) {
		print_exp(call->args);
	}
	printf(")");
}

// ==================================================
//
//	Auxiliary
//
// ==================================================

static void test_log(const char* str) {
	if (DEBUGGING) {
		printf("%s\n", str);
	}
}

static void print_tabs(int layer) {
	for (int i = 0; i < layer; i++) {
		printf("  ");
	}
}
