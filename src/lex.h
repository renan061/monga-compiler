#if !defined(lex_h)
#define lex_h

#include "ast.h" // FIXME: Why? Ask Roberto

extern int yylex(void);
extern int current_line();

#endif
