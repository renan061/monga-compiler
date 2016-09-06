#include <stdio.h>
#include <limits.h>

enum TOKEN {
	TK_INT = UCHAR_MAX + 1,
	TK_FLOAT,
	TK_ERR
};

#include "lex.yy.c"
 
int main(int argc, char *argv[]) {
	int token;
	yyin = fopen(argv[1], "r");
    for(int i = 0; i < 10; i++) { // TODO
		token = yylex();
		printf("\n%d", token);
	}

	fclose(yyin);
    return 0;
}