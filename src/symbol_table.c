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

static DefNode* find_in_scope(ScopeElem* scope, IdNode* id);

static SymbolTable* table;

// ==================================================
//
//	Functions
//
// ==================================================

DefNode* st_find_in_current_scope(IdNode* id) {
	return find_in_scope(table->first, id);
}

DefNode* st_find(IdNode* id) {
	DefNode* def;
	ScopeElem* scope = table->first;
	while (scope != NULL) {
		def = find_in_scope(scope, id);
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
	
	switch (def->tag) {
	case DEF_VAR:
		ST_MALLOC(symbol, SymbolElem);
		symbol->def = def;
		symbol->next = table->first->first;
		table->first->first = symbol;

		// TODO: Remove
		printf("*** ST - Inserted %s ***\n", def->u.var.id->str);
		break;
	case DEF_FUNC:

		break;
	default:
		ST_ERROR("st_insert: invalid def tag\n");
	}
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

static DefNode* find_in_scope(ScopeElem* scope, IdNode* id) {
	SymbolElem* symbol = scope->first;

	while (symbol != NULL) {
		switch(symbol->def->tag) {
		case DEF_VAR:
			if (strcmp(id->str, symbol->def->u.var.id->str) == 0) {
				return symbol->def;
			}
			break;
		case DEF_FUNC:
			// TODO
			break;
		default:
			ST_ERROR("find_in_scope: invalid def tag\n");
		}
		symbol = symbol->next;
	}

	return NULL;
}

