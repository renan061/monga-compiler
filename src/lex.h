#if !defined(a_h)
#define a_h

extern int yylex(void);

typedef enum Token {
	TK_INT = UCHAR_MAX + 1,
	TK_FLOAT,
	TK_ERR
} Token;

typedef union SemInfo {
	int i;
	double f;
	const char *s;
} SemInfo;

extern SemInfo seminfo;

#endif