#if !defined(lex_h)
#define lex_h

#include <stdlib.h>
#include <limits.h>

extern int yylex(void);

typedef union SemInfo {
	int i;
	double f;
	const char *s;
} SemInfo;
extern SemInfo seminfo;

#endif
