# 
# PUC-RJ - INF1715
# Renan Almeida de Miranda Santos
# Monga language compiler
# 

CC := gcc-5 -std=c99 -Wall

OBJS := $(wildcard obj/*.o)
EXES := $(wildcard bin/*)

main: objs
	@- $(CC) $(CFLAGS) -o bin/mongacompiler 						\
	obj/arraylist.o obj/scanner.o obj/parser.o obj/ast.o 			\
	obj/symtable.o obj/sem.o obj/llvm.o obj/codegen.o				\
	src/main.c -ll

# make run INPUT=input.monga
run: main
	@- ./bin/mongacompiler < $(INPUT) > "a.ll"
	@- clang "a.ll" -o a.o
	@- ./a.o
	@- $(RM) a.ll
	@- $(RM) a.o

# 
# Objs
# 

objs: scanner parser sem codegen

arraylist:
	@- $(CC) $(CFLAGS) -c src/arraylist.c -o obj/arraylist.o

parser:
	@- bison -v -d src/monga.y
	@- mv monga.tab.c src/yacc.c
	@- mv monga.tab.h src/yacc.h
	@- $(CC) $(CFLAGS) -c src/yacc.c -o obj/parser.o
	@- $(CC) $(CFLAGS) -c src/ast.c -o obj/ast.o

scanner: arraylist parser
	@- flex src/scanner.lex
	@- $(CC) $(CFLAGS) -c lex.yy.c -o obj/scanner.o -Isrc/

sem: parser
	@- $(CC) $(CFLAGS) -c src/symtable.c -o obj/symtable.o
	@- $(CC) $(CFLAGS) -c src/sem.c -o obj/sem.o

codegen: sem
	@- $(CC) $(CFLAGS) -c src/llvm.c -o obj/llvm.o
	@- $(CC) $(CFLAGS) -c src/codegen.c -o obj/codegen.o

# 
# Tests
# 

arraylist_test: arraylist
	@- $(CC) $(CFLAGS) -o bin/arraylisttest 					\
	obj/arraylist.o 											\
	src/arraylist_test.c
	
	@- ./bin/arraylisttest

scanner_test: scanner
	@- $(CC) $(CFLAGS) -o bin/scannertest						\
	obj/arraylist.o obj/scanner.o obj/parser.o obj/ast.o 		\
	src/scanner_test.c -ll

	@- sh tests/test.sh scanner

parser_test: objs
	@- $(CC) $(CFLAGS) -o bin/parsertest 						\
	obj/arraylist.o obj/scanner.o obj/parser.o obj/ast.o 		\
	src/parser_test.c -ll

	@- sh tests/test.sh parser

ast_test: objs
	@- $(CC) $(CFLAGS) -o bin/asttest 							\
	obj/arraylist.o obj/scanner.o obj/parser.o obj/ast.o 		\
	obj/symtable.o obj/sem.o 									\
	src/ast_test.c -ll

	@- sh tests/test.sh ast

codegen_test: objs
	@- $(CC) $(CFLAGS) -o bin/codegentest						\
	obj/arraylist.o  obj/scanner.o obj/parser.o obj/ast.o 		\
	obj/symtable.o obj/sem.o obj/llvm.o obj/codegen.o			\
	src/main.c -ll

	@- sh tests/test.sh codegen

test: arraylist_test scanner_test parser_test ast_test codegen_test

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
	@- $(RM) src/yacc.c
	@- $(RM) lex.yy.c
	@- $(RM) monga.output
	@- $(RM) -rf $(OBJS)
	@- $(RM) -rf $(EXES)
