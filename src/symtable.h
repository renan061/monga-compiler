#if !defined(symtable_h)
#define symtable_h

#include "ast.h"

typedef struct SymbolTable SymbolTable;

// Returns NULL if id could not be found
extern DefNode* st_find(SymbolTable* table, IdNode* id);

// Returns "false" if def is already declared and "true" otherwise
extern int st_insert(SymbolTable* table, DefNode* def);

extern void st_enter_scope(SymbolTable* table);
extern void st_leave_scope(SymbolTable* table);

extern SymbolTable* st_new();
extern void st_free(SymbolTable* table);

#endif