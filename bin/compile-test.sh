#!/bin/sh

cd src

# Removing old lex_test.out (if any)
if [ -f "../pkg/lex_test.out" ]
then
	rm ../pkg/lex_test.out
fi

# Link with lex_test
gcc -o ../pkg/lex_test.out ../pkg/lex.o lex_test.c -ll
