#!/bin/sh

# Removing old diff test reports
DIFF_DIR="tests/diff/"
if [ $(ls -1 $DIFF_DIR | wc -l) != 0 ]
then
	for DIFF_FILE in $DIFF_DIR"*.txt"
	do
		rm $DIFF_FILE
	done
fi

# Testing
for i in `seq 1 $(ls -1 tests/input/ | wc -l)`
do
	INPUT_FILE="tests/input/test_"$i".in"
	ANSWER_FILE="tests/answers/test_answer_"$i".txt"
	RESULT_FILE="test_result_"$i".txt"

	bin/lextest < $INPUT_FILE > $RESULT_FILE
	diff -a --suppress-common-lines -y $ANSWER_FILE $RESULT_FILE > "diff.txt"
	if [ -s "diff.txt" ]
	then
		echo "TEST "$i" - FAIL"
		mv "diff.txt" "tests/diff/test_diff_"$i".txt"
	else
	    echo "TEST "$i" - OK"
	    rm "diff.txt"
	fi

	# Cleaning up
	rm $RESULT_FILE
done