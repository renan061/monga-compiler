#if !defined(lex_h)
#define lex_h

#include "ast.h" // FIXME: Why?

extern int yylex(void);
extern int current_line();

// Auxiliary
const char* lex_symbol(LexSymbol symbol);

#endif
