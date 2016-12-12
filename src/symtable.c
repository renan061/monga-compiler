#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "macros.h"
#include "ast.h"
#include "symtable.h"

// ==================================================
//
//	Private
//
// ==================================================

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

static DefNode* find_in_scope(ScopeElem* scope, IdNode* id) {
	const char* str;

	SymbolElem* symbol = scope->first;
	while (symbol != NULL) {
		switch(symbol->def->tag) {
		case DEF_VAR:
			str = symbol->def->u.var.id->u.str;
			break;
		case DEF_FUNC:
			str = symbol->def->u.func.id->u.str;
			break;
		default:
			MONGA_INTERNAL_ERR("find_in_scope: invalid def tag\n");
		}

		if (strcmp(id->u.str, str) == 0) {
			return symbol->def;
		}

		symbol = symbol->next;
	}

	return NULL;
}

// ==================================================
//
//	Functions
//
// ==================================================

DefNode* st_find(SymbolTable* table, IdNode* id) {
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

// Obs.: Insertion of DefFunc parameters is made outside
// of this function in sem.c (intern "type_def" function)
int st_insert(SymbolTable* table, DefNode* def) {
	// Checks for repetition inside same scope
	IdNode* id;
	switch(def->tag) {
	case DEF_VAR:
		id = def->u.var.id;
		break;
	case DEF_FUNC:
		id = def->u.func.id;
		break;
	default:
		MONGA_INTERNAL_ERR("st_insert: invalid def tag\n");
	}

	int repeated = (find_in_scope(table->first, id) != NULL);
	if (repeated) {
		return 0;
	}

	SymbolElem* symbol;
	MONGA_MALLOC(symbol, SymbolElem);
	symbol->def = def;
	symbol->next = table->first->first;
	table->first->first = symbol;
	return 1;
}

void st_enter_scope(SymbolTable* table) {
	ScopeElem* scope;
	MONGA_MALLOC(scope, ScopeElem);

	scope->first = NULL;
	scope->next = table->first;

	table->first = scope;
}

void st_leave_scope(SymbolTable* table) {
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

SymbolTable* st_new() {
	SymbolTable* table;
	MONGA_MALLOC(table, SymbolTable);
	table->first = NULL;
	st_enter_scope(table);
	return table;
}

void st_free(SymbolTable* table) {
	st_leave_scope(table);
	if (table->first != NULL) {
		MONGA_INTERNAL_ERR("internal error: did not left all scopes");
	}
	free(table);
}
