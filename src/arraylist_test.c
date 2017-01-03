#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <stdbool.h>

#include "arraylist.h"

char* val1 = "1";
char* val2 = "2";
char* val3 = "3";
char* val4 = "4";
char* val5 = "5";
char* val6 = "6";
char* val7 = "7";
char* val8 = "8";
char* val9 = "9";
char* val10 = "10";
char* val11 = "11";

int main(void) {
	// al_new
	ArrayList* list = al_new();
	assert(list != NULL);

	// al_size
	assert(al_size(list) == 0);

	// al_empty
	assert(al_empty(list) == true);

	// al_append
	al_append(list, val1);
	assert(al_size(list) == 1);
	al_append(list, val2);
	assert(al_size(list) == 2);
	al_append(list, val3);
	assert(al_size(list) == 3);
	al_append(list, val4);
	al_append(list, val5);
	al_append(list, val6);
	al_append(list, val7);
	al_append(list, val8);
	al_append(list, val9);
	al_append(list, val10);
	al_append(list, val11);
	assert(al_size(list) == 11);

	// al_get
	assert(al_get(list, 0) == val1);
	assert(al_get(list, 1) == val2);
	assert(al_get(list, 2) == val3);
	assert(al_get(list, 10) == val11);

	// al_replace
	al_replace(list, 6, val10);
	assert(al_get(list, 6) == val10);

	// al_destroy
	al_destroy(list);

	printf("OK arraylist test 1\n");
	return 0;
}