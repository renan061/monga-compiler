#!/bin/sh
clear

# Compile lex module
flex rules.lex
gcc -c lex.yy.c -o lex.o
rm lex.yy.c

# Link with main
gcc lex.o main.c -ll
rm lex.o

# Removing old diff test files
DIFF_DIR="$PWD/tests/diff/"
if [ $(ls -1 $DIFF_DIR | wc -l) != 0 ]
then
	for DIFF_FILE in $DIFF_DIR"*.txt"
	do
		rm $DIFF_FILE
	done
fi

# Testing
i=1
for INPUT_FILE in $PWD/tests/input/*.in
do
	RESULT_FILE="test_result_"$i".txt"
	./a.out < $INPUT_FILE > $RESULT_FILE
	ANSWER_FILE="tests/answers/test_answer_"$i".txt"
	diff -a --suppress-common-lines -y $ANSWER_FILE $RESULT_FILE > diff.txt
	if [ -s diff.txt ]
	then
		echo "TEST "$i" - FAIL"
		mv diff.txt "tests/diff/test_diff_"$i".txt"
	else
	    echo "TEST "$i" - OK"
	    rm diff.txt
	fi

	# Cleaning up
	rm $RESULT_FILE

	((i++))
done

rm a.out