# 
# PUC-RJ - INF1715
# Renan Almeida de Miranda Santos
#
# Monga language compiler
# 

CC := gcc -std=c99 -Wall

OBJS := $(wildcard obj/*.o)
EXES := $(wildcard bin/*)

main: objs
	@- $(CC) $(CFLAGS) -o bin/mongacompiler 						\
	obj/lex.o obj/parser.o obj/ast.o obj/symtable.o obj/sem.o 		\
	obj/llvm.o obj/codegen.o										\
	src/main.c -ll

# 
# Objs
# 

objs: lex parser sem codegen

parser:
	@- bison -v -d src/monga.y
	@- mv monga.tab.c src/yacc.c
	@- mv monga.tab.h src/yacc.h
	@- $(CC) $(CFLAGS) -c src/yacc.c -o obj/parser.o
	@- $(CC) $(CFLAGS) -c src/ast.c -o obj/ast.o
	@- $(RM) src/yacc.c

lex: parser
	@- flex src/monga.lex
	@- $(CC) $(CFLAGS) -c lex.yy.c -o obj/lex.o -Isrc/
	@- $(RM) lex.yy.c

sem: parser
	@- $(CC) $(CFLAGS) -c src/symtable.c -o obj/symtable.o
	@- $(CC) $(CFLAGS) -c src/sem.c -o obj/sem.o

codegen: sem
	@- $(CC) $(CFLAGS) -c src/llvm.c -o obj/llvm.o
	@- $(CC) $(CFLAGS) -c src/codegen.c -o obj/codegen.o

# 
# Tests
# 

lex_test: objs
	@- $(CC) $(CFLAGS) -o bin/lextest 							\
	obj/lex.o obj/parser.o obj/ast.o 							\
	src/lex_test.c -ll

	@- sh tests/test.sh lex

parser_test: objs
	@- $(CC) $(CFLAGS) -o bin/parsertest 						\
	obj/lex.o obj/parser.o obj/ast.o 							\
	src/parser_test.c -ll

	@- sh tests/test.sh parser

ast_test: objs
	@- $(CC) $(CFLAGS) -o bin/asttest 							\
	obj/lex.o obj/parser.o obj/ast.o obj/symtable.o obj/sem.o 	\
	src/ast_test.c -ll

	@- sh tests/test.sh ast

codegen_test: objs
	@- $(CC) $(CFLAGS) -o bin/codegentest						\
	obj/lex.o obj/parser.o obj/ast.o obj/symtable.o obj/sem.o 	\
	obj/llvm.o obj/codegen.o									\
	src/main.c -ll

	@- sh tests/test.sh codegen

test: lex_test parser_test ast_test codegen_test

#
# Exs
#

exs: main ast_test
	@- sh exs/ex.sh arith arith
	@- sh exs/ex.sh func-array-arith faa
	@- sh exs/ex.sh strings-array sa

# 
# Clean
# 

clean:
	@- $(RM) src/yacc.h
	@- $(RM) monga.output
	@- $(RM) $(OBJS)
	@- $(RM) $(EXES)
