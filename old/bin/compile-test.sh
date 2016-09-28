#!/bin/sh

cd src

# Removing old test.out (if any)
if [ -f "../pkg/test.out" ]
then
	rm ../pkg/test.out
fi

# Link with lex_test
gcc -o ../pkg/test.out ../pkg/lex.o ../pkg/yacc.o yacc_test.c -ll
