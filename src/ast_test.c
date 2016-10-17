#include <stdio.h>
#include "parser.h"
// #include "ast.h"

int main(int argc, char *argv[]) {
	printf((!yyparse()) ? "OK\n" : "FAIL\n");

	// Node* head = get_head();
	// printf("%s\n", head);

    return 0;
}
