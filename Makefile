# 
# PUC-RJ - INF1715
# Renan Almeida de Miranda Santos
#
# Monga language compiler
# 

CC := gcc

program_OBJS := $(wildcard obj/*.o)
program_EXES := $(wildcard bin/*)

all: main

parser:
	bison -v -d src/monga.y
	@- mv monga.tab.c src/yacc.c
	@- mv monga.tab.h src/yacc.h
	$(CC) $(CFLAGS) -c src/yacc.c -o obj/parser.o
	$(CC) $(CFLAGS) -c src/ast.c -o obj/ast.o
	@- $(RM) src/yacc.c

lex: parser
	flex src/monga.lex
	$(CC) $(CFLAGS) -c lex.yy.c -o obj/lex.o -Isrc/
	@- $(RM) lex.yy.c

main: lex parser
	$(CC) $(CFLAGS) -o bin/lextest obj/lex.o obj/parser.o obj/ast.o src/lex_test.c -ll
	$(CC) $(CFLAGS) -o bin/parsertest obj/lex.o obj/parser.o obj/ast.o src/parser_test.c -ll

lex_test:
	@- sh tests/lex/testlex.sh

parser_test:
	@- sh tests/parser/testparser.sh

ast_test:
	$(CC) $(CFLAGS) -o bin/asttest obj/lex.o obj/parser.o obj/ast.o src/ast_test.c -ll
	@- bin/asttest < ast_test.in

# test: lex_test parser_test
test: all ast_test

clean:
	@- $(RM) monga.output
	@- $(RM) $(program_OBJS)
	@- $(RM) $(program_EXES)
