#include <stdio.h>
#include "lex.h"
#include "yacc.h"

int main(int argc, char *argv[]) {
	int token;
	do {
		token = yylex();
		switch (token) {
		case TK_KEY_INT:		printf("TK_KEY_INT");		break;
		case TK_KEY_FLOAT:		printf("TK_KEY_FLOAT");		break;
		case TK_KEY_CHAR:		printf("TK_KEY_CHAR");		break;
		case TK_KEY_IF:			printf("TK_KEY_IF");		break;
		case TK_KEY_ELSE:		printf("TK_KEY_ELSE");		break;
		case TK_KEY_WHILE:		printf("TK_KEY_WHILE");		break;
		case TK_KEY_NEW:		printf("TK_KEY_NEW");		break;
		case TK_KEY_RETURN:		printf("TK_KEY_RETURN");	break;
		case TK_KEY_VOID:		printf("TK_KEY_VOID");		break;
		case TK_EQUAL:			printf("TK_EQUAL");			break;
		case TK_LEQUAL:			printf("TK_LEQUAL");		break;
		case TK_GEQUAL:			printf("TK_GEQUAL");		break;
		case TK_AND:			printf("TK_AND");			break;
		case TK_OR:				printf("TK_OR");			break;
		case TK_ID:				printf("TK_ID - %s", seminfo.s);		break;
		case TK_INT:			printf("TK_INT - %d", seminfo.i);		break;
		case TK_FLOAT:			printf("TK_FLOAT - %.16g", seminfo.f);	break;
		case TK_STR:			printf("TK_STR - %s", seminfo.s);		break;
		case 0:		return 0;
		default:	printf("%c", token);
		}

		printf("\n");
	} while(token != 0);
    return 0;
}