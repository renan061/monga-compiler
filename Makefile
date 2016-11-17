# 
# PUC-RJ - INF1715
# Renan Almeida de Miranda Santos
#
# Monga language compiler
# 

CC := gcc -std=c99 -Wall

OBJS := $(wildcard obj/*.o)
EXES := $(wildcard bin/*)

all: main

parser:
	@- bison -v -d src/monga.y
	@- mv monga.tab.c src/yacc.c
	@- mv monga.tab.h src/yacc.h
	@- $(CC) $(CFLAGS) -c src/yacc.c -o obj/parser.o
	@- $(CC) $(CFLAGS) -c src/ast.c -o obj/ast.o
	@- $(RM) src/yacc.c

sem: parser
	@- $(CC) $(CFLAGS) -c src/symtable.c -o obj/symtable.o
	@- $(CC) $(CFLAGS) -c src/sem.c -o obj/sem.o

lex: parser
	@- flex src/monga.lex
	@- $(CC) $(CFLAGS) -c lex.yy.c -o obj/lex.o -Isrc/
	@- $(RM) lex.yy.c

main: lex sem parser
	@- $(CC) $(CFLAGS) -o bin/lextest 								\
		obj/lex.o obj/parser.o obj/ast.o 							\
		src/lex_test.c -ll
	@- $(CC) $(CFLAGS) -o bin/parsertest 							\
		obj/lex.o obj/parser.o obj/ast.o 							\
		src/parser_test.c -ll
	@- $(CC) $(CFLAGS) -o bin/asttest 								\
		obj/lex.o obj/parser.o obj/ast.o obj/symtable.o obj/sem.o 	\
		src/ast_test.c -ll

lex_test: main
	@- sh tests/test.sh lex

parser_test: main
	@- sh tests/test.sh parser

ast_test: main
	@- sh tests/test.sh ast

# test: lex_test parser_test ast_test
test: ast_test

clean:
	@- $(RM) src/yacc.h
	@- $(RM) monga.output
	@- $(RM) $(OBJS)
	@- $(RM) $(EXES)
