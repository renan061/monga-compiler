#include <stdio.h>
#include "lex.h"
#include "yacc.h"
#include "syntax.h"

int main(int argc, char *argv[]) {
	printf((!yyparse()) ? "OK\n" : "FAIL\n");
    return 0;
}
