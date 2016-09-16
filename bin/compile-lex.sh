#!/bin/sh

clear
cd src

# Compiles lex module
flex rules.lex
gcc -c lex.yy.c -o lex.o

rm lex.yy.c
rm ../pkg/lex.o
mv lex.o ../pkg/lex.o
