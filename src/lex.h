#if !defined(lex_h)
#define lex_h

#include <stdlib.h>
#include <limits.h>

extern FILE * yyin;
extern int yylex(void);

typedef union SemInfo {
	int i;
	double f;
	const char *s;
} SemInfo;
extern SemInfo seminfo;

typedef enum Token {
	TK_KEY_INT = UCHAR_MAX + 1,
	TK_KEY_FLOAT,
	TK_KEY_CHAR,
	TK_KEY_IF,
	TK_KEY_ELSE,
	TK_KEY_WHILE,
	TK_KEY_NEW,
	TK_KEY_RETURN,
	TK_KEY_VOID,

	TK_EQUAL,
	TK_NEQUAL, 
	TK_LEQUAL,
	TK_GEQUAL,
	TK_AND,
	TK_OR,

	TK_ID,

	TK_INT,
	TK_FLOAT
	// TODO: É preciso fazer num novo TK para hexas? (Don't think so)
	// TK_HEXA_INT ???

} Token;

#endif
