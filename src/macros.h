/*
 * Macros for Monga Compiler
 */
#if !defined(macros_h)
#define macros_h

#include <stdio.h>
#include <stdlib.h>

#define MONGA_ERR(...) fprintf(stderr, __VA_ARGS__); exit(1);

#define MONGA_INTERNAL_ERR(...)				\
 	fprintf(stderr, "internal error: ");	\
 	MONGA_ERR(__VA_ARGS__);					\

#define MONGA_MALLOC(n, type)							\
	n = (type*)malloc(sizeof(type));					\
	if (n == NULL) {									\
		MONGA_ERR("error: insufficient memory\n");		\
	}													\

#endif