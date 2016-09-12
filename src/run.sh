#!bin/bash
clear
sh clean.sh
flex rules.lex
gcc main.c -Wall -ll
./a.out program.monga

# gcc -o lex.o lex.yy.c
# gcc lex.o main.c