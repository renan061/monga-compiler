#!/bin/sh

cd src

# Removing old lex.o (if any)
if [ -f "../pkg/lex.o" ]
then
	rm ../pkg/lex.o
fi

# Compiles lex module
flex rules.lex
gcc -c lex.yy.c -o lex.o

rm lex.yy.c
mv lex.o ../pkg/lex.o
