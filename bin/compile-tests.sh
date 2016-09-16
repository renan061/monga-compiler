#!/bin/sh

clear
cd src

# Cleaning up
rm ../pkg/lex_test.out

# Link with main
gcc -o ../pkg/lex_test.out ../pkg/lex.o lex_test.c -ll
