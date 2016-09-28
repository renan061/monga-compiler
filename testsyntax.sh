# #!/bin/sh

INPUT_FILE="test_syn_1.in"
ANSWER_FILE="test_syn_1.asw"
OUTPUT_FILE="test_syn_1.out"

bin/sintest < $INPUT_FILE > $OUTPUT_FILE
diff -a --suppress-common-lines -y $ANSWER_FILE $OUTPUT_FILE || true
# TODO diff returns bool?