#!/bin/sh

# sh ex.sh <dir> <name>

# Dir
if [ "$1" = "" ]
then
	echo "ex script error: missing first argument"
	exit 1
fi

# Name
if [ "$2" = "" ]
then
	echo "ex script error: missing second argument"
	exit 1
fi

DIR=$1
NAME=$2

EXSDIR="exs/"

INPUT=$EXSDIR$DIR"/"$NAME".monga"
AST=$EXSDIR$DIR"/"$NAME".ast"
LLVM=$EXSDIR$DIR"/"$NAME".ll"
OUTPUT=$EXSDIR$DIR"/"$NAME".out"

bin/asttest < $INPUT > $AST
bin/mongacompiler < $INPUT > $LLVM
clang $LLVM -o "prog.o"
./prog.o > $OUTPUT
rm prog.o
