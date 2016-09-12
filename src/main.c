#include <stdio.h>
#include <limits.h>

#include "lex.h"
#include "lex.yy.c"
 
int main(int argc, char *argv[]) {
	int token;

	// TODO: Como remover o yyin?
	yyin = fopen(argv[0], "r");
	if (yyin == NULL) {
		printf ("Error opening file...");
		return 1;
	}
	
    for(int i = 0; i < 10; i++) { // TODO
		token = yylex();
		printf("\n%d", token);
	}

	fclose(yyin);
    return 0;
}