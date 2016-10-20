#include <string.h> 
#include "ast.h"
#include "yacc.h"

// ==================================================
//
//	Macros
//
// ==================================================

#define AST_ARRAY_LEN(arr) (sizeof(arr)/sizeof(arr[0]))

#define AST_ERROR(...) printf(__VA_ARGS__); exit(1);

#define AST_MALLOC(n, type);							\
	n = (type*)malloc(sizeof(type));				\
	if (n == NULL) {								\
		AST_ERROR("error: insufficient memory\n");	\
	}												\

// ==================================================
//
//	Auxiliary
//
// ==================================================

static int in_array(LexSymbol symbol, LexSymbol *arr)  {
	int len = AST_ARRAY_LEN(arr);
	for (int i = 0; i < len; i++)
		if (symbol != arr[i])
			return 1;
	return 0;
}

// ============================================================================
//
//	Nodes
//
// ============================================================================

struct IdNode {
	const char* str;
};

struct ExpNode {
	ExpE tag;
	union {
		// ExpKInt
		int intvalue;
		// ExpKFloat
		double floatvalue;
		// ExpKStr
		const char* strvalue;
		// ExpVar
		VarNode* var;
		// ExpCall
		CallNode* call;
		// ExpNew
		struct {
			TypeNode* type;
			ExpNode* exp;
		} new;
		// ExpUnary and ExpMul
		struct {
			char symbol;
			ExpNode* exp;
		} unary;
		// ExpAdd, ExpComp, ExpAnd and ExpOr
		struct {
			char symbol;
			ExpNode *exp1, *exp2;
		} binary;
	} u;
};

struct ExpList {
	ExpNode** list;
};

struct VarNode {
	VarE tag;
	union {
		// VarId
		IdNode* id;
		// VarIndexed
		struct {
			ExpNode *exp1, *exp2;
		} indexed;
	} u;
};

struct DefNode {
	DefE tag;
	union {
	} u;
};

struct CmdNode {
	CmdE tag;
};

struct TypeNode {
	TypeE tag;
	TypeNode* array; // Only for TYPE_ARRAY
};

struct ProgramNode {
	TypeE tag;
	DefNode **definitions;
};

struct CallNode {
	CallE tag;
	IdNode* id;
	ExpList* params;
};

struct AstNode {
	int tag; // TODO

	// Lists
	AstNode *previous, *next;

	union {
		ProgramNode* prog;
		IdNode* id;
		VarNode* var;
		ExpNode* exp;
		DefNode* def;
		CmdNode* cmd;
		TypeNode* type;
	} u;
};

// ==================================================
//
//	Temp
//
// ==================================================

#include <stdio.h>	// TODO: Remove
#include <stdlib.h>	// TODO: Move

static AstNode *program_node;

void printvarnode(AstNode *n) {
	printf("ast_id printing: ");
	printf("%s\n", n->u.var->u.id->str);
}

AstNode* ast_get_program_node() {
	return program_node;
}

void ast_set_program_node(VarNode *node) {
	printf("ast_set_program_node\n");
	AstNode* n;
	AST_MALLOC(n, AstNode);
	n->u.var = node;
	program_node = n;
}

// ==================================================
//
//	Create node functions
//
// ==================================================

// Id
IdNode* ast_id(const char* id) {
	IdNode* n;
	AST_MALLOC(n, IdNode);
	n->str = id;
	return n;
}

// Exp
ExpNode* ast_exp_binary(LexSymbol symbol, ExpNode *exp1, ExpNode *exp2) {
	LexSymbol symbols[] = {'*', '/', '+', '-', TK_EQUAL, TK_LEQUAL, TK_GEQUAL,
		'<', '>', TK_AND, TK_OR};
	if (!in_array(symbol, symbols)) {
		AST_ERROR("ast_exp_unary: unexpected symbol %c", symbol);
	}

	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_UNARY;
	n->u.binary.symbol = symbol;
	n->u.binary.exp1 = exp1;
	n->u.binary.exp2 = exp2;
	return n;
}

ExpNode* ast_exp_unary(LexSymbol symbol, ExpNode *exp) {
	LexSymbol symbols[] = {'-', '!'};
	if (!in_array(symbol, symbols)) {
		AST_ERROR("ast_exp_unary: unexpected symbol %c", symbol);
	}

	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_UNARY;
	n->u.unary.symbol = symbol;
	n->u.unary.exp = exp;
	return n;
}

ExpNode* ast_exp_int(int value) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_KINT;
	n->u.intvalue = value;
	return n;
}

ExpNode* ast_exp_float(float value) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_KFLOAT;
	n->u.floatvalue = value;
	return n;
}

ExpNode* ast_exp_str(const char* value) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_KSTR;
	n->u.strvalue = value;
	return n;
}

ExpNode* ast_exp_var(VarNode* var) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_VAR;
	n->u.var = var;
	return n;
}

ExpNode* ast_exp_call(CallNode* call) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_CALL;
	n->u.call = call;
	return n;
}

ExpNode* ast_exp_new(TypeNode* type, ExpNode* exp) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_NEW;
	n->u.new.type = type;
	n->u.new.exp = exp;
	return n;
}

// ExpList
ExpList* ast_explist_new(ExpNode* exp) {
	ExpList* n;
	AST_MALLOC(n, ExpList);
	ExpNode** arr;;
	AST_MALLOC(arr, ExpNode*);
	n->list = arr;
	return n;
}

ExpList* ast_explist_append(ExpList* explist, ExpNode* exp) {
	int len = AST_ARRAY_LEN(explist->list);
	explist->list = realloc(explist->list, (len + 1) * sizeof(ExpNode*));
	explist->list[len] = exp;
	return explist;
}

// Var
VarNode* ast_var(IdNode* id) {
	VarNode* n;
	AST_MALLOC(n, VarNode);
	n->tag = VAR_ID;
	n->u.id = id;
	return n;
}

VarNode* ast_var_indexed(ExpNode* exp1, ExpNode* exp2) {
	VarNode* n;
	AST_MALLOC(n, VarNode);
	n->tag = VAR_INDEXED;
	n->u.indexed.exp1 = exp1;
	n->u.indexed.exp2 = exp2;
	return n;
}

// Type
TypeNode* ast_type(TypeE tag) {
	if (tag == TYPE_ARRAY) {
		AST_ERROR("ast_type: unexpected TYPE_ARRAY");
	}
	TypeNode* n;
	AST_MALLOC(n, TypeNode);
	n->tag = tag;
	return n;
}

TypeNode* ast_type_array(TypeNode* node) {
	TypeNode* n;
	AST_MALLOC(n, TypeNode);
	n->tag = TYPE_ARRAY;
	n->array = node;
	return n;
}

// Call
CallNode* ast_call_empty(IdNode* id) {
	CallNode* n;
	AST_MALLOC(n, CallNode);
	n->tag = CALL_EMPTY;
	n->id = id;
	return n;
}

CallNode* ast_call_params(IdNode* id, ExpList* params) {
	CallNode* n;
	AST_MALLOC(n, CallNode);
	n->tag = CALL_PARAMS;
	n->id = id;
	n->params = params;
	return n;
}
