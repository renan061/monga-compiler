#include "parser.h"
#include "ast.h"
#include "sem.h"
#include "codegen.h"

int main() {
	yyparse();
	ProgramNode* program = ast_get_program();
	sem_type_check_program(program);
	codegen(program);
    return 0;
}
