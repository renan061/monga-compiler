#if !defined(symbol_table_h)
#define symbol_table_h

#include "ast.h"

extern DefNode* st_find_in_current_scope();
extern DefNode* st_find(ExpNode* exp);

extern void st_insert(DefNode* def);

extern void st_enter_scope();
extern void st_leave_scope();

extern void st_new();

#endif