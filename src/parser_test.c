#include <stdio.h>
#include "parser.h"

int main(int argc, char *argv[]) {
	printf((!yyparse()) ? "OK\n" : "FAIL\n");
    return 0;
}
