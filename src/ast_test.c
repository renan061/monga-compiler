#include <stdio.h>
#include "parser.h"
#include "ast.h"
#include "yacc.h"

#define DEBUGGING 0

#define TEST_ERROR(...) printf(__VA_ARGS__); exit(1);

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

static void print_lex_symbol(LexSymbol symbol) {
	switch (symbol) {
	case '!':
	case '>':
	case '<':
	case '+':
	case '-':
	case '*':
	case '/':
		printf("%c", symbol);
		break;
	case TK_OR:
		printf("||");
		break;
	case TK_AND:
		printf("&&");
		break;
	case TK_EQUAL:
		printf("==");
		break;
	case TK_LEQUAL:
		printf("<=");
		break;
	case TK_GEQUAL:
		printf(">=");
		break;
	default:
		TEST_ERROR("print_lex_symbol: invalid symbol");
	}
}

// ==================================================
//
//	Print functions
//
// ==================================================

static void print_program(ProgramNode* program);
static void print_def(DefNode* def, int layer);
static void print_type(TypeNode* type);
static void print_id(IdNode* id);
static void print_param(ParamNode* param);
static void print_cmd(CmdNode* cmd, int layer);
static void print_var(VarNode* var, int layer);
static void print_exp(ExpNode* exp);
static void print_call(CallNode* call);

// ==================================================
//
//	Main
//
// ==================================================

int main(int argc, char *argv[]) {
	printf((!yyparse()) ? "Parsing ok\n" : "Parsing failed\n");
	ProgramNode* program = ast_program_node();
	print_program(program);
    return 0;
}

// ==================================================
//
//	Print functions
//
// ==================================================

static void print_program(ProgramNode* program) {
	printf("*** Started printing AST ***\n\n");
	test_log("print_program");
	print_def(program->defs, 0);
	printf("\n*** Finished printing AST ***\n");
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
		print_type(def->u.func.type);
		printf(" ");
		print_id(def->u.func.id);
		if (def->u.func.params == NULL) {
			printf("()");
		} else {
			printf("(");
			print_param(def->u.func.params);
			printf(")");
		}
		printf(" {\n");
		print_cmd(def->u.func.cmd, layer + 1);
		print_tabs(layer);
		printf("}\n");
		break;
	default:
		TEST_ERROR("print_def: invalid tag");
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
	case TYPE_ARRAY:
		print_type(type->array);
		printf("[]");
		break;
	default:
		TEST_ERROR("print_type: invalid tag");
	}
}

static void print_id(IdNode* id) {
	test_log("print_id");
	printf("%s", id->str);
}

static void print_param(ParamNode* param) {
	test_log("print_param");

	print_type(param->type);
	printf(" ");
	print_id(param->id);
	if (param->next != NULL) {
		printf(", ");
		print_param(param->next);
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
		if (cmd->u.exp != NULL) {
			print_exp(cmd->u.exp);
		}
		printf(";\n");
		break;
	case CMD_CALL:
		print_tabs(layer);
		print_call(cmd->u.call);
		printf(";\n");
		break;
	default:
		TEST_ERROR("print_cmd: invalid tag");
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
		print_id(var->u.id);
		break;
	case VAR_INDEXED:
		print_tabs(layer);
		print_exp(var->u.indexed.exp1);
		printf("[");
		print_exp(var->u.indexed.exp2);
		printf("]");
		break;
	default:
		TEST_ERROR("print_var: invalid tag");
	}
}

void print_exp(ExpNode* exp) {
	test_log("print_exp");

	printf("(");
	switch (exp->tag) {
	case EXP_KINT:
		printf("%d", exp->u.intvalue);
		break;
	case EXP_KFLOAT:
		printf("%f", exp->u.floatvalue);
		break;
	case EXP_KSTR:
		printf("%s", exp->u.strvalue);
		break;
	case EXP_VAR:
		print_var(exp->u.var, 0);
		break;
	case EXP_CALL:
		print_call(exp->u.call);
		break;
	case EXP_NEW:
		printf("new ");
		print_type(exp->u.new.type);
		printf("[");
		print_exp(exp->u.new.exp);
		printf("]");
		break;
	case EXP_UNARY:
		print_lex_symbol(exp->u.unary.symbol);
		print_exp(exp->u.unary.exp);
		break;
	case EXP_BINARY:
		print_exp(exp->u.binary.exp1);
		print_lex_symbol(exp->u.binary.symbol);
		print_exp(exp->u.binary.exp2);
		break;
	default:
		TEST_ERROR("print_exp: invalid tag");
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

	print_id(call->id);
	printf("(");
	if (call->params != NULL) {
		print_exp(call->params);
	}
	printf(")");
}
