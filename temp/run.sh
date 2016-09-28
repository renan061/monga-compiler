#!/bin/sh
clear

# mv rules.tab.hacc rules.tab.h
# mv rules.tab.cacc rules.tab.c

bison -d rules.y
flex rules.lex

cc lex.yy.c rules.tab.c -ly -ll
./a.out < test.in