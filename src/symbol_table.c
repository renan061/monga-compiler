#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

// ==================================================
//
//	Macros
//
// ==================================================

#define ST_ERROR(...) printf(__VA_ARGS__); exit(1);

#define ST_MALLOC(n, type);							\
	n = (type*)malloc(sizeof(type));				\
	if (n == NULL) {								\
		ST_ERROR("error: insufficient memory\n");	\
	}												\

// ==================================================
//
//	Headers (TODO: ?)
//
// ==================================================

typedef struct SymbolTable SymbolTable;
typedef struct ScopeElem ScopeElem;
typedef struct SymbolElem SymbolElem;

struct SymbolTable {
	ScopeElem* first;
};

struct ScopeElem {
	SymbolElem* first;
	ScopeElem* next;	
};

struct SymbolElem {
	DefNode* def;
	SymbolElem* next;
};

static DefNode* find_in_scope(ScopeElem* scope, ExpNode* exp);

static SymbolTable* table;

// ==================================================
//
//	Functions
//
// ==================================================

DefNode* st_find_in_current_scope(ExpNode* exp) {
	return find_in_scope(table->first, exp);
}

DefNode* st_find(ExpNode* exp) {
	DefNode* def;
	ScopeElem* scope = table->first;
	while (scope != NULL) {
		def = find_in_scope(scope, exp);
		if (def != NULL) {
			return def;
		}
		scope = scope->next;
	}
	return NULL;
}

void st_insert(DefNode* def) {
	// TODO: Should I make sure def is not repeated
	// by calling "st_find_in_current_scope()" ?
	SymbolElem* symbol;
	ST_MALLOC(symbol, SymbolElem);
	symbol->def = def;
	symbol->next = table->first->first;
	table->first->first = symbol;
}

void st_enter_scope() {
	ScopeElem* scope;
	ST_MALLOC(scope, ScopeElem);

	scope->first = NULL;
	scope->next = table->first;

	table->first = scope;
}

// TODO: Should I "free" here?
void st_leave_scope() {
	SymbolElem* aux;

	ScopeElem* scope = table->first;
	table->first = scope->next;

	while (scope->first != NULL) {
		aux = scope->first;
		scope->first = aux->next;
		free(aux);
	}
	free(scope);
}

void st_new() {
	ST_MALLOC(table, SymbolTable);
	table->first = NULL; // FIXME: Do I need this here?
	st_enter_scope();
}

// ==================================================
//
//	TODO: Internal
//
// ==================================================

static DefNode* find_in_scope(ScopeElem* scope, ExpNode* exp) {
	// TODO: Necessary?
	if (exp->tag != EXP_VAR && exp->tag != EXP_CALL) {
		ST_ERROR("symbol table: invalid exp tag");
	}

	int expIsVar = (exp->tag == EXP_VAR);
	SymbolElem* symbol = scope->first;

	while (symbol != NULL) {
		switch(symbol->def->tag) {
		case DEF_VAR:
			if (!expIsVar) {
				break;
			}
			if (strcmp(exp->u.var->u.id->str, symbol->def->u.var.id->str) == 0) {
				return symbol->def;
			}
			break;
		case DEF_FUNC:
			if (expIsVar) {
				break;
			}
			// TODO
			break;
		}

		symbol = symbol->next;
	}

	return NULL;
}

