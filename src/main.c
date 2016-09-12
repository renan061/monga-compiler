#include <stdio.h>
#include "lex.h"

int main(int argc, char *argv[]) {
	int token;

	// FIXME: Should this be here?
	yyin = fopen(argv[1], "r");
	if (yyin == NULL) {
		printf ("Error opening file...");
		return 1;
	}

	while(1) {
		token = yylex();

		printf("%d - ", token);
		switch (token) {
		case TK_INT:
			printf("%d", seminfo.i);
			break;
		case TK_FLOAT:
			printf("%lf", seminfo.f);
			break;
		case TK_KEY_INT:
			printf("int");
			break;
		default:
			printf(".");
		}

		printf("\n");

		// TODO: When to stop ??? EOF ???
		if (token == 0) {
			break;
		}
	}

    return 0;
}