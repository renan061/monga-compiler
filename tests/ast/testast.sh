#!/bin/sh

cd tests/ast

# Removing old diff test report
DIFF_DIR="diff/"
if [ $(ls -1 $DIFF_DIR | wc -l) != 0 ]
then
	for DIFF_FILE in $DIFF_DIR"*.txt"
	do
		rm $DIFF_FILE
	done
fi

# Testing
for i in `seq 1 $(ls -1 input/ | wc -l)`
do
	INPUT_FILE="input/test_"$i".in"
	ANSWER_FILE="answers/test_"$i".asw"
	OUTPUT_FILE="test_"$i".out"

	../../bin/asttest < $INPUT_FILE >> $OUTPUT_FILE 2>&1
	diff -a --suppress-common-lines -y $ANSWER_FILE $OUTPUT_FILE > "diff.txt"
	if [ -s "diff.txt" ]
	then
		echo "FAIL ast test "$i
		mv "diff.txt" "diff/diff_"$i".txt"
	else
	    echo "OK ast test "$i
	    rm "diff.txt"
	fi

	# Cleaning up
	rm $OUTPUT_FILE
done
