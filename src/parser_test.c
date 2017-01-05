#include <stdio.h>

#include "scanner.h"
#include "parser.h"

int main() {
	scanner_setup();
	if (!yyparse()) {
		printf("OK\n");
	}
	scanner_clean();
    return 0;
}
