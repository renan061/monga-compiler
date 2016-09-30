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

parser:
	bison -d src/monga.y
	@- mv monga.tab.c src/yacc.c
	@- mv monga.tab.h src/yacc.h
	gcc -c src/yacc.c -o obj/parser.o
	@- $(RM) src/yacc.c

lex: parser
	flex src/monga.lex
	$(CC) $(CFLAGS) -c lex.yy.c -o obj/lex.o -Isrc/
	@- $(RM) lex.yy.c

main: lex parser
	$(CC) $(CFLAGS) -o bin/lextest obj/lex.o src/lex_test.c -ll
	$(CC) $(CFLAGS) -o bin/parsertest obj/lex.o obj/parser.o src/parser_test.c -ll

# TODO: Naming
lext_test:
	@- sh tests/testlex.sh

parser_test:
	@- sh testparser.sh

# TODO: Naming
test: all
	# clear
	@- sh testparser.sh

clean:
	@- $(RM) $(program_OBJS)
	@- $(RM) $(program_EXES)
