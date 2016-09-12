#include <stdio.h>
#include "lex.h"
// #include "lex.yy.c"

// TODO yyin
// #define YY_STDINIT "program.monga"

int main(int argc, char *argv[]) {
	int token;

	printf("Hi");

	// TODO: Como remover o yyin?
	// yyin = fopen(argv[0], "r");
	// if (yyin == NULL) {
	// 	printf ("Error opening file...");
	// 	return 1;
	// }
	token = yylex();
	printf("%d", token);

	printf("Hi");
	
    for(int i = 0; i < 10; i++) { // TODO
		token = yylex();
		printf("\n%d", token);
	}

	printf("Hi");

	// fclose(yyin);
    return 0;
}