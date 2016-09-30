#!/bin/sh
clear

# Compile lex module
flex rules.lex
gcc -c lex.yy.c -o lex.o
rm lex.yy.c

# Link with main
gcc lex.o main.c -ll
rm lex.o

# Testing

TESTFILE="tests/test_"$i".in"
./a.out < $TESTFILE > test_result_1.txt
diff -a --suppress-common-lines -y test_answer_1.txt test_result_1.txt > diff.txt
if [ -s temp.txt ]
then
	echo "TEST 1 - FAIL"
	mv diff.txt test_diff_1.txt
else
    echo "TEST 1 - OK"
    rm diff.txt
fi

# Cleaning up
rm test_result_1.txt
rm a.out