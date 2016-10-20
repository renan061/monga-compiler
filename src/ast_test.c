#include <stdio.h>
#include "parser.h"
#include "ast.h"

#define DEBUGGING 0

#define TEST_ERROR(...) printf(__VA_ARGS__); exit(1);

void test_log(const char* str) {
	if (DEBUGGING) {
		printf("%s\n", str);
	}
}

// ==================================================
//
//	Print functions
//
// ==================================================

static void print_id(IdNode* id) {
	test_log("print_id");
	printf("Id %s\n", id->str);
}

static void print_type(TypeNode* type) {
	test_log("print_type");
	switch (type->tag) {
	case TYPE_INT:
		printf("TypeInt\n");
	case TYPE_FLOAT:
		printf("TypeFloat\n");
	case TYPE_CHAR:
		printf("TypeChar\n");
	case TYPE_VOID:
		printf("TypeVoid\n");
	case TYPE_ARRAY:
		print_type(type->array);
		printf(" []");
	default:
		TEST_ERROR("print_type: invalid tag");
	}
}

static void print_def(DefNode* def) {
	test_log("print_def");
	switch (def->tag) {
	case DEF_VAR:
		print_type(def->u.var.type);
		print_id(def->u.var.id);
		break;
	case DEF_FUNC:
		print_id(def->u.func.id);
		break;
	default:
		TEST_ERROR("print_def: invalid tag");
	}
}

static void print_program(ProgramNode* program) {
	test_log("print_program");
	printf("*** Started printing AST ***\n");
	DefNode* def = program->defs;
	while (def != NULL) {
		print_def(def);
		def = def->next;
	}
	printf("*** Finished printing AST ***\n");
}

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