#if !defined(symtable_h)
#define symtable_h

#include "ast.h"

typedef struct SymbolTable SymbolTable;

// TODO: Var e Func no mesmo escopo com mesmo nome?
// Qual o escopo que a func deve ficar, e os parâmetros da func?
// Repetir no escopo de fora e no de dentro?
extern DefNode* st_find(SymbolTable* table, IdNode* id);

// TODO: Should this return bool in case of same scope insertion?
// Returns "false" in case of errors (redeclaration) and "true" otherwise
extern int st_insert(SymbolTable* table, DefNode* def);

extern void st_enter_scope(SymbolTable* table);
extern void st_leave_scope(SymbolTable* table);

extern SymbolTable* st_new();
extern void st_free(SymbolTable* table);

#endif