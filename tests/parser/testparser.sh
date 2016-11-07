#!/bin/sh

cd tests/parser

# Removing old diff test reports
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
	INPUT_FILE="input/test_parser_"$i".in"
	ANSWER_FILE="answers/test_parser_"$i".asw"
	OUTPUT_FILE="test_parser_"$i".out"

	../../bin/parsertest < $INPUT_FILE >> $OUTPUT_FILE 2>&1
	diff -a --suppress-common-lines -y $ANSWER_FILE $OUTPUT_FILE > "diff.txt"
	if [ -s "diff.txt" ]
	then
		echo "FAIL parser test "$i
		mv "diff.txt" "diff/test_diff_"$i".txt"
	else
	    echo "OK parser test "$i
	    rm "diff.txt"
	fi

	# Cleaning up
	rm $OUTPUT_FILE
done
