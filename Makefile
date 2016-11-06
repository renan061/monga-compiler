# 
# PUC-RJ - INF1715
# Renan Almeida de Miranda Santos
#
# Monga language compiler
# 

CC := gcc -std=c99

program_OBJS := $(wildcard obj/*.o)
program_EXES := $(wildcard bin/*)

all: main

parser:
	bison -v -d src/monga.y
	@- mv monga.tab.c src/yacc.c
	@- mv monga.tab.h src/yacc.h
	$(CC) $(CFLAGS) -c src/yacc.c -o obj/parser.o
	@- $(RM) src/yacc.c

# TODO: Is AST inside parser?
ast: parser
	$(CC) $(CFLAGS) -c src/symbol_table.c -o obj/symtable.o
	$(CC) $(CFLAGS) -c src/ast.c -o obj/ast.o

lex: parser
	flex src/monga.lex
	$(CC) $(CFLAGS) -c lex.yy.c -o obj/lex.o -Isrc/
	@- $(RM) lex.yy.c

main: lex ast parser
	$(CC) $(CFLAGS) -o bin/lextest obj/lex.o obj/parser.o obj/ast.o obj/symtable.o src/lex_test.c -ll
	$(CC) $(CFLAGS) -o bin/parsertest obj/lex.o obj/parser.o obj/ast.o obj/symtable.o src/parser_test.c -ll
	$(CC) $(CFLAGS) -o bin/asttest obj/lex.o obj/parser.o obj/ast.o obj/symtable.o src/ast_test.c -ll

lex_test: main
	@- sh tests/lex/testlex.sh

parser_test: main
	@- sh tests/parser/testparser.sh

ast_test: main
	@- sh tests/ast/testast.sh

# test: lex_test parser_test ast_test
test: ast_test

clean:
	@- $(RM) src/yacc.h
	@- $(RM) monga.output
	@- $(RM) $(program_OBJS)
	@- $(RM) $(program_EXES)
