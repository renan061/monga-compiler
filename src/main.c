#include "scanner.h"
#include "parser.h"
#include "ast.h"
#include "sem.h"
#include "codegen.h"

int main() {
	scanner_setup();
	yyparse();
	scanner_clean();
	ProgramNode* program = ast_get_program();
	sem_type_check_program(program);
	codegen(program);
    return 0;
}
