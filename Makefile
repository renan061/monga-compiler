# 
# PUC-RJ - INF1715
# Renan Almeida de Miranda Santos
#
# Monga language compiler
# 

CC := gcc

program_SRCS := $(wildcard src/*.c)
program_OBJS := $(wildcard obj/*.o)

all: main

lex:
	flex src/monga.lex
	$(CC) $(CFLAGS) -c lex.yy.c -o obj/lex.o -Isrc/
	@- $(RM) lex.yy.c

main: lex
	$(CC) $(CFLAGS) -o bin/lex_test obj/lex.o src/lex_test.c -ll

test:
	@- sh tests/test.sh

clean:
	@- $(RM) $(program_OBJS)
