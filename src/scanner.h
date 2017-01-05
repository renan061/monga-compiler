#if !defined(scanner_h)
#define scanner_h

#include "ast.h" // FIXME: Why?

extern void scanner_setup(void);
extern void scanner_clean(void);
extern unsigned int scanner_line(void);
extern const char* scanner_symbol(ScannerSymbol symbol);

extern int yylex(void);

#endif
