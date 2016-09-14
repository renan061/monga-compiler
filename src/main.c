#include <stdio.h>
#include "lex.h"

int main(int argc, char *argv[]) {
	int token;

	do {
		token = yylex();

		printf("%d - ", token);
		switch (token) {
		case TK_INT:
			printf("%d", seminfo.i);
			break;
		case TK_FLOAT:
			printf("%lf", seminfo.f);
			break;
		case TK_ID:
			printf("%s", seminfo.s);
			break;
		case TK_KEY_INT:
			printf("int");
			break;
		case 0:
			printf("Done");
			break;
		default:
			printf("%d $-$ %lf $-$ %s", seminfo.i, seminfo.f, seminfo.s);
		}

		printf("\n");
	} while(token != 0); // TODO: When to stop ??? EOF ???

    return 0;
}