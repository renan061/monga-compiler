#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "macros.h"
#include "ast.h"
#include "yacc.h"

// Only used inside ast_type
#define AST_NODE_TYPE(node_type, n)	\
	if (node_type == NULL) {		\
		MONGA_MALLOC(n, TypeNode);	\
		node_type = n;				\
	} else {						\
		return node_type;			\
	}								\

// Auxiliary
static int in_array(ScannerSymbol symbol, ScannerSymbol *arr)  {
	int len = sizeof(arr)/sizeof(arr[0]);
	for (int i = 0; i < len; i++)
		if (symbol != arr[i])
			return 1;
	return 0;
}

TypeNode* node_type_int = NULL;
TypeNode* node_type_float = NULL;
TypeNode* node_type_char = NULL;
TypeNode* node_type_void = NULL;

// ==================================================
//
//	Functions
//
// ==================================================

static ProgramNode* program_node;
ProgramNode* ast_get_program() {
	return program_node;
}

// Program
void ast_program(DefNode* defs) {
	ProgramNode* n;
	MONGA_MALLOC(n, ProgramNode);
	n->defs = defs;
	program_node = n;
}

// Def
DefNode* ast_def_var(TypeNode* type, IdNode* id) {
	DefNode* n;
	MONGA_MALLOC(n, DefNode);
	n->tag = DEF_VAR;
	n->next = NULL;
	n->u.var.type = type;
	n->u.var.id = id;
	n->u.var.temp = 0;
	// OBS: n->u.var.global undefined
	return n;
}

DefNode* ast_def_func(TypeNode* type, IdNode* id, DefNode* params,
	CmdNode* block) {

	DefNode* n;
	MONGA_MALLOC(n, DefNode);
	n->tag = DEF_FUNC;
	n->next = NULL;
	n->u.func.type = type;
	n->u.func.id = id;
	n->u.func.params = params;
	assert(block->tag == CMD_BLOCK);
	n->u.func.block = block;
	return n;
}

// Type
TypeNode* ast_type(TypeE tag) {
	TypeNode* n;

	switch (tag) {
	case TYPE_INT:
		AST_NODE_TYPE(node_type_int, n);
		break;
	case TYPE_FLOAT:
		AST_NODE_TYPE(node_type_float, n);
		break;
	case TYPE_CHAR:
		AST_NODE_TYPE(node_type_char, n);
		break;
	case TYPE_VOID:
		AST_NODE_TYPE(node_type_void, n);
		break;
	default:
		MONGA_INTERNAL_ERR("ast_type: invalid tag");
	}

	n->tag = tag;
	n->indexed = NULL;
	return n;
}

TypeNode* ast_type_indexed(TypeNode* node) {
	TypeNode* n;
	MONGA_MALLOC(n, TypeNode);
	n->tag = TYPE_INDEXED;
	n->indexed = node;
	return n;
}

// Id
IdNode* ast_id(int line, const char* id) {
	IdNode* n;
	MONGA_MALLOC(n, IdNode);
	n->line = line;
	n->u.str = id;
	return n;
}

// Cmd
CmdNode* ast_cmd_block(int line, DefNode* defs, CmdNode* cmds) {
	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_BLOCK;
	n->line = line;
	n->next = NULL;
	n->u.block.defs = defs;
	n->u.block.cmds = cmds;
	return n;
}

CmdNode* ast_cmd_if(int line, ExpNode* exp, CmdNode* cmd) {
	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_IF;
	n->line = line;
	n->next = NULL;
	n->u.ifwhile.exp = exp;
	n->u.ifwhile.cmd = cmd;
	return n;
}

CmdNode* ast_cmd_if_else(int line, ExpNode* exp, CmdNode* ifcmd,
	CmdNode* elsecmd) {

	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_IF_ELSE;
	n->line = line;
	n->next = NULL;
	n->u.ifelse.exp = exp;
	n->u.ifelse.ifcmd = ifcmd;
	n->u.ifelse.elsecmd = elsecmd;
	return n;
}

CmdNode* ast_cmd_while(int line, ExpNode* exp, CmdNode* cmd) {
	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_WHILE;
	n->line = line;
	n->next = NULL;
	n->u.ifwhile.exp = exp;
	n->u.ifwhile.cmd = cmd;
	return n;
}

CmdNode* ast_cmd_print(int line, ExpNode* exp) {
	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_PRINT;
	n->line = line;
	n->next = NULL;
	n->u.print = exp;
	return n;
}

CmdNode* ast_cmd_asg(int line, VarNode* var, ExpNode* exp) {
	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_ASG;
	n->line = line;
	n->next = NULL;
	n->u.asg.var = var;
	n->u.asg.exp = exp;
	return n;
}

CmdNode* ast_cmd_return(int line, ExpNode* exp) {
	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_RETURN;
	n->line = line;
	n->next = NULL;
	n->u.ret = exp;
	return n;
}

CmdNode* ast_cmd_call(int line, CallNode* call) {
	CmdNode* n;
	MONGA_MALLOC(n, CmdNode);
	n->tag = CMD_CALL;
	n->line = line;
	n->next = NULL;
	n->u.call = call;
	return n;
}

// Var
VarNode* ast_var(IdNode* id) {
	VarNode* n;
	MONGA_MALLOC(n, VarNode);
	n->tag = VAR_ID;
	n->line = id->line;
	n->temp = 0;
	n->type = NULL;
	n->u.id = id;
	return n;
}

VarNode* ast_var_indexed(int line, ExpNode* array, ExpNode* index) {
	VarNode* n;
	MONGA_MALLOC(n, VarNode);
	n->tag = VAR_INDEXED;
	n->line = line;
	n->temp = 0;
	n->type = NULL;
	n->u.indexed.array = array;
	n->u.indexed.index = index;
	return n;
}

// Exp
ExpNode* ast_exp_binary(int line, ScannerSymbol symbol,
	ExpNode *exp1, ExpNode *exp2) {

	ScannerSymbol symbols[] = {'*', '/', '+', '-', TK_EQUAL, TK_LEQUAL,
		TK_GEQUAL, '<', '>', TK_AND, TK_OR};
	assert(in_array(symbol, symbols));

	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_BINARY;
	n->line = line;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.binary.symbol = symbol;
	n->u.binary.exp1 = exp1;
	n->u.binary.exp2 = exp2;
	return n;
}

ExpNode* ast_exp_unary(int line, ScannerSymbol symbol, ExpNode *exp) {
	ScannerSymbol symbols[] = {'-', '!'};
	assert(in_array(symbol, symbols));

	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_UNARY;
	n->line = line;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.unary.symbol = symbol;
	n->u.unary.exp = exp;
	return n;
}

ExpNode* ast_exp_int(int value) {
	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_KINT;
	n->line = -1;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.intvalue = value;
	return n;
}

ExpNode* ast_exp_float(float value) {
	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_KFLOAT;
	n->line = -1;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.floatvalue = value;
	return n;
}

ExpNode* ast_exp_str(const char* value) {
	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_KSTR;
	n->line = -1;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.strvalue = value;
	return n;
}

ExpNode* ast_exp_var(VarNode* var) {
	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_VAR;
	n->line = var->line;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.var = var;
	return n;
}

ExpNode* ast_exp_call(CallNode* call) {
	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_CALL;
	n->line = call->id->line;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.call = call;
	return n;
}

ExpNode* ast_exp_new(int line, TypeNode* type, ExpNode* size) {
	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_NEW;
	n->line = line;
	n->temp = 0;
	n->type = NULL;
	n->next = NULL;
	n->u.new.type = type;
	n->u.new.size = size;
	return n;
}

ExpNode* ast_exp_cast(TypeNode* type, ExpNode* exp) {
	ExpNode* n;
	MONGA_MALLOC(n, ExpNode);
	n->tag = EXP_CAST;
	n->line = exp->line;
	n->temp = 0;
	n->type = type;
	n->next = exp->next;
	exp->next = NULL;
	n->u.cast = exp;
	return n;	
}

// Call
CallNode* ast_call(IdNode* id, ExpNode* args) {
	CallNode* n;
	MONGA_MALLOC(n, CallNode);
	n->id = id;
	n->args = args;
	return n;
}
