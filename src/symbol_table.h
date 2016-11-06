#if !defined(symbol_table_h)
#define symbol_table_h

#include "ast.h"

// TODO: IdNode or ExpNode? Can funcs and vars have same names inside same scope?
extern DefNode* st_find_in_current_scope(IdNode* id);
extern DefNode* st_find(IdNode* id);

// TODO: Should this return bool in case of same scope insertion?
extern void st_insert(DefNode* def);

extern void st_enter_scope();
extern void st_leave_scope();

extern void st_new();

#endif