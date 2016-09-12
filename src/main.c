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
		default:
			printf("Default");
		}

		printf("\n");

		// TODO: Onde parar ??? EOF ???
		if (token == 0) {
			break;
		}
	}

	printf("Hi");

	// fclose(yyin);
    return 0;
}