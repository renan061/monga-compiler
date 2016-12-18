# Monga Language Compiler

Monga is a subset of C, with Java-like arrays.

| Command | Description |
| --- | --- |
| Create binary | make |
| Test | make test |
| Test lex | make lex_test |
| Test parser | make parser_test |
| Test AST / types | make ast_test |
| Test code generation | make codegen_test |
| Clean | make clean |


Obs1.: To run any of the binaries you must redirect stdin (binary < INPUT_FILE).

Obs2.: The Makefile and the test scripts use clang to compile the .ll file
generated by `mongacompiler`.
