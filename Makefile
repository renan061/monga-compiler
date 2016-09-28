# 
# PUC-RJ - INF1715
# Renan Almeida de Miranda Santos
#
# Monga language compiler
# 

CC := gcc

program_SRCS := $(wildcard src/*.c)
program_OBJS := $(wildcard obj/*.o)
program_EXES := $(wildcard bin/*)

all: main

yacc:
	bison -d src/monga.y
	@- mv monga.tab.c src/yacc.c
	@- mv monga.tab.h src/yacc.h
	gcc -c src/yacc.c -o obj/yacc.o
	@- $(RM) src/yacc.c

lex: yacc
	flex src/monga.lex
	$(CC) $(CFLAGS) -c lex.yy.c -o obj/lex.o -Isrc/
	@- $(RM) lex.yy.c

main: yacc lex
	$(CC) $(CFLAGS) -o bin/lextest obj/lex.o src/lex_test.c -ll
	$(CC) $(CFLAGS) -o bin/sintest obj/lex.o obj/yacc.o src/yacc_test.c -ll

# TODO: Naming
testlex:
	@- sh tests/testlex.sh

# TODO: Naming
test: all
	clear
	@-sh testsyntax.sh

clean:
	@- $(RM) $(program_OBJS)
	@- $(RM) $(program_EXES)
