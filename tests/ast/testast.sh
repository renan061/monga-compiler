#!/bin/sh

cd tests/ast

# Removing old diff test report
if [ -s "diff.txt" ]
then
    rm "diff.txt"
fi

# Testing
INPUT_FILE="test.in"
ANSWER_FILE="answer.txt"
OUTPUT_FILE="result.txt"

../../bin/asttest < $INPUT_FILE > $OUTPUT_FILE
diff -a --suppress-common-lines -y $ANSWER_FILE $OUTPUT_FILE > "diff.txt"
if [ -s "diff.txt" ]
then
	echo "FAIL ast test"
else
    echo "OK ast test"
    rm "diff.txt"
fi