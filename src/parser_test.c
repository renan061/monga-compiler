#include <stdio.h>
#include "parser.h"

int main() {
	if (!yyparse()) {
		printf("OK\n");
	}
    return 0;
}
