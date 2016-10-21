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

// ==================================================
//
//	Getter
//
// ==================================================

static ProgramNode* program_node;

ProgramNode* ast_program_node() {
	return program_node;
}

// ==================================================
//
//	Creators
//
// ==================================================

// Program
void ast_program(DefNode* defs) {
	ProgramNode* n;
	AST_MALLOC(n, ProgramNode);
	n->defs = defs;
	program_node = n;
}

// Def
DefNode* ast_def_list(DefNode* list, DefNode* def) {
	if (list == NULL) {
		return def;
	}
	DefNode* temp;
	for (temp = list; temp->next != NULL; temp = temp->next);
	temp->next = def;
	return list;
}

DefNode* ast_def_var(TypeNode* type, IdNode* id) {
	DefNode* n;
	AST_MALLOC(n, DefNode);
	n->tag = DEF_VAR;
	n->next = NULL;
	n->u.var.type = type;
	n->u.var.id = id;
	return n;
}

DefNode* ast_def_func(TypeNode* type, IdNode* id, ParamNode* params,
	CmdNode* cmd) {

	DefNode* n;
	AST_MALLOC(n, DefNode);
	n->tag = DEF_FUNC;
	n->next = NULL;
	n->u.func.type = type;
	n->u.func.id = id;
	n->u.func.params = params;
	n->u.func.cmd = cmd;
	return n;
}

// Id
IdNode* ast_id_list(IdNode* list, IdNode* id) {
	if (list == NULL) {
		return id;
	}
	IdNode* temp;
	for (temp = list; temp->next != NULL; temp = temp->next);
	temp->next = id;
	return list;
}

IdNode* ast_id(const char* id) {
	IdNode* n;
	AST_MALLOC(n, IdNode);
	n->next = NULL;
	n->str = id;
	return n;
}

// Param
ParamNode* ast_param_list(ParamNode* list, ParamNode* param) {
	if (list == NULL) {
		return param;
	}
	ParamNode* temp;
	for (temp = list; temp->next != NULL; temp = temp->next);
	temp->next = param;
	return list;
}

ParamNode* ast_param(TypeNode* type, IdNode* id) {
	ParamNode* n;
	AST_MALLOC(n, ParamNode);
	n->next = NULL;
	n->type = type;
	n->id = id;
	return n;
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

// Cmd
CmdNode* ast_cmd_list(CmdNode* list, CmdNode* cmd) {
	if (list == NULL) {
		return cmd;
	}
	CmdNode* temp;
	for (temp = list; temp->next != NULL; temp = temp->next);
	temp->next = cmd;
	return list;
}

CmdNode* ast_cmd_block(DefNode* defs, CmdNode* cmds) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_BLOCK;
	n->next = NULL;
	n->u.block.defs = defs;
	n->u.block.cmds = cmds;
	return n;
}

CmdNode* ast_cmd_if(ExpNode* exp, CmdNode* cmd) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_IF;
	n->next = NULL;
	n->u.ifcmd.exp = exp;
	n->u.ifcmd.cmd = cmd;
	return n;
}

CmdNode* ast_cmd_if_else(ExpNode* exp, CmdNode* ifcmd, CmdNode* elsecmd) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_IF_ELSE;
	n->next = NULL;
	n->u.ifelse.exp = exp;
	n->u.ifelse.ifcmd = ifcmd;
	n->u.ifelse.elsecmd = elsecmd;
	return n;
}

CmdNode* ast_cmd_while(ExpNode* exp, CmdNode* cmd) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_WHILE;
	n->next = NULL;
	n->u.whilecmd.exp = exp;
	n->u.whilecmd.cmd = cmd;
	return n;
}

CmdNode* ast_cmd_asg(VarNode* var, ExpNode* exp) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_ASG;
	n->next = NULL;
	n->u.asg.var = var;
	n->u.asg.exp = exp;
	return n;
}

CmdNode* ast_cmd_return_null() {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_RETURN_NULL;
	n->next = NULL;
	return n;
}

CmdNode* ast_cmd_return_exp(ExpNode* exp) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_RETURN_EXP;
	n->next = NULL;
	n->u.exp = exp;
	return n;
}

CmdNode* ast_cmd_call(CallNode* call) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_CALL;
	n->next = NULL;
	n->u.call = call;
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
