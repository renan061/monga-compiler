%{
#include <stdio.h>
#include <string.h>
 
void yyerror(const char *str) {
	fprintf(stderr,"error: %s\n",str);
}
 
int yywrap() {
    return 1;
} 
  
main() {
	if (!yyparse()) {
		printf("OK\n");
	} else {
		printf("FAIL\n");
	}
	
} 
%}

%token NUMBER PLUS

%%
expr : NUMBER PLUS NUMBER;
%%
