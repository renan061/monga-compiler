#include <stdio.h>
#include "parser.h"
#include "ast.h"

int main(int argc, char *argv[]) {
	printf("***\nStarting AST test\n");
	printf((!yyparse()) ? "Parsing ok\n" : "Parsing failed\n");

	AstNode* programnode = ast_get_program_node();
	if (programnode == NULL) {
		printf("Program node é NULL");
		return 0;
	}

	printvarnode(programnode);

	printf("***\n");
    return 0;
}
