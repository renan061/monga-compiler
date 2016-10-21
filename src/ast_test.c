#include <stdio.h>
#include "parser.h"
#include "ast.h"

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
	printf("*** Started printing AST ***\n");
	test_log("print_program");
	DefNode* def = program->defs;
	while (def != NULL) {
		print_def(def, 0);
		def = def->next;
	}
	printf("*** Finished printing AST ***\n");
}

static void print_def(DefNode* def, int layer) {
	test_log("print_def");

	switch (def->tag) {
	case DEF_VAR:
		print_type(def->u.var.type);
		print_id(def->u.var.id);
		printf(" {\n");
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
		break;
	default:
		TEST_ERROR("print_def: invalid tag");
	}
	print_tabs(layer);
	printf("\n}\n");
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
		print_tabs(layer);
		printf("teste");
		break;
	// TODO
	default:
		TEST_ERROR("print_cmd: invalid tag");
	}
}