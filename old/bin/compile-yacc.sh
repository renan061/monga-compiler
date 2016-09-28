#!/bin/sh

cd src

# Removing old yacc.o (if any)
if [ -f "../pkg/yacc.o" ]
then
	rm ../pkg/yacc.o
fi

# Compiles yacc module
bison -d monga.y
gcc -c monga.tab.c -o yacc.o

rm monga.tab.c
mv yacc.o ../pkg/yacc.o

mv monga.tab.h yacc.h
