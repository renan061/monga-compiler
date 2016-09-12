#if !defined(lex_h)
#define lex_h

#include <stdlib.h>
#include <limits.h>

extern FILE * yyin;
extern int yylex(void);

typedef enum Token {
	// Numbers
	TK_INT = UCHAR_MAX + 1,
	TK_FLOAT,
	// TODO: É preciso fazer num novo TK para numerais?
	// TK_HEXA_INT ???

	// Reserved words
	TK_KEY_INT,
	TK_KEY_FLOAT,
	TK_KEY_CHAR,
	TK_KEY_IF,
	TK_KEY_ELSE,
	TK_KEY_WHILE,
	TK_KEY_NEW,
	TK_KEY_RETURN,
	TK_KEY_VOID,

	// Logical operators
	TK_EQUAL,
	TK_NEQUAL, 
	TK_LEQUAL,
	TK_GEQUAL,
	TK_AND,
	TK_OR

} Token;

typedef union SemInfo {
	int i;
	double f;
	const char *s;
} SemInfo;

extern SemInfo seminfo;

#endif
