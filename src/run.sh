#!bin/bash
clear

# Compile lex module
flex rules.lex
gcc -c lex.yy.c -o lex.o
rm lex.yy.c

# Link with main
gcc lex.o main.c -ll
rm lex.o

# Run main
./a.out < teste1.in
rm a.out