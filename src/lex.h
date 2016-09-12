#if !defined(lex_h)
#define lex_h

#include <stdlib.h>
#include <limits.h>

extern FILE * yyin;
extern int yylex(void);

typedef enum Token {
	TK_INT = UCHAR_MAX + 1,
	TK_FLOAT,
	TK_ERR
} Token;

// typedef union SemInfo {
// 	int i;
// 	double f;
// 	const char *s;
// } SemInfo;

// extern SemInfo seminfo;

#endif