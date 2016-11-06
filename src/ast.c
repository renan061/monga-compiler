#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include "ast.h"
#include "yacc.h"
#include "symbol_table.h"

// ==================================================
//
//	Macros
//
// ==================================================

#define AST_ARRAY_LEN(arr) (sizeof(arr)/sizeof(arr[0]))

#define AST_ERROR(...) printf(__VA_ARGS__); exit(1);

#define AST_MALLOC(n, type);						\
	n = (type*)malloc(sizeof(type));				\
	if (n == NULL) {								\
		AST_ERROR("error: insufficient memory\n");	\
	}												\

#define AST_LIST(type, list, elem);					\
	if (list == NULL) {								\
		return elem;								\
	}												\
	type* e;										\
	for (e = list; e->next != NULL; e = e->next);	\
	e->next = elem;									\
	return list;									\
	

// ==================================================
//
//	Internal
//
// ==================================================

static int in_array(LexSymbol symbol, LexSymbol *arr)  {
	int len = AST_ARRAY_LEN(arr);
	for (int i = 0; i < len; i++)
		if (symbol != arr[i])
			return 1;
	return 0;
}

static ProgramNode* program_node;

// ==================================================
//
//	Node functions
//
// ==================================================

ProgramNode* ast_program_node() {
	return program_node;
}

// Program
void ast_program(DefNode* defs) {
	ProgramNode* n;
	AST_MALLOC(n, ProgramNode);
	n->defs = defs;
	program_node = n;
}

// Def
DefNode* ast_def_list(DefNode* list, DefNode* def) {
	AST_LIST(DefNode, list, def);
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

DefNode* ast_def_func(TypeNode* type, IdNode* id, DefNode* params,
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

// Id
IdNode* ast_id_list(IdNode* list, IdNode* id) {
	AST_LIST(IdNode, list, id);
}

IdNode* ast_id(const char* id) {
	IdNode* n;
	AST_MALLOC(n, IdNode);
	n->next = NULL;
	n->def = NULL;
	n->str = id;
	return n;
}

// Cmd
CmdNode* ast_cmd_list(CmdNode* list, CmdNode* cmd) {
	AST_LIST(CmdNode, list, cmd);
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
	n->u.ifwhile.exp = exp;
	n->u.ifwhile.cmd = cmd;
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
	n->u.ifwhile.exp = exp;
	n->u.ifwhile.cmd = cmd;
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

CmdNode* ast_cmd_return(ExpNode* exp) {
	CmdNode* n;
	AST_MALLOC(n, CmdNode);
	n->tag = CMD_RETURN;
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

// Exp
ExpNode* ast_exp_list(ExpNode* list, ExpNode* exp) {
	AST_LIST(ExpNode, list, exp);
}

ExpNode* ast_exp_binary(LexSymbol symbol, ExpNode *exp1, ExpNode *exp2) {
	LexSymbol symbols[] = {'*', '/', '+', '-', TK_EQUAL, TK_LEQUAL, TK_GEQUAL,
		'<', '>', TK_AND, TK_OR};
	if (!in_array(symbol, symbols)) {
		AST_ERROR("ast_exp_unary: unexpected symbol %c", symbol);
	}

	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_BINARY;
	n->next = NULL;
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
	n->next = NULL;
	n->u.unary.symbol = symbol;
	n->u.unary.exp = exp;
	return n;
}

ExpNode* ast_exp_int(int value) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_KINT;
	n->next = NULL;
	n->u.intvalue = value;
	return n;
}

ExpNode* ast_exp_float(float value) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_KFLOAT;
	n->next = NULL;
	n->u.floatvalue = value;
	return n;
}

ExpNode* ast_exp_str(const char* value) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_KSTR;
	n->next = NULL;
	n->u.strvalue = value;
	return n;
}

ExpNode* ast_exp_var(VarNode* var) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_VAR;
	n->next = NULL;
	n->u.var = var;
	return n;
}

ExpNode* ast_exp_call(CallNode* call) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_CALL;
	n->next = NULL;
	n->u.call = call;
	return n;
}

ExpNode* ast_exp_new(TypeNode* type, ExpNode* exp) {
	ExpNode* n;
	AST_MALLOC(n, ExpNode);
	n->tag = EXP_NEW;
	n->next = NULL;
	n->u.new.type = type;
	n->u.new.exp = exp;
	return n;
}

// Call
CallNode* ast_call(IdNode* id, ExpNode* params) {
	CallNode* n;
	AST_MALLOC(n, CallNode);
	n->id = id;
	n->params = params;
	return n;
}

// ==================================================
//
//	Typing Functions
//
// ==================================================

// Headers (TODO: ?)
static void type_def(DefNode* def);
static void type_cmd(CmdNode* cmd);
static void type_var(VarNode* var);
static void type_exp(ExpNode* exp);
static void type_call(CallNode* call);

void ast_type_program() {
	st_new();
	type_def(program_node->defs);
}

static void type_def(DefNode* def) {
	// TODO: Check repeated inside same scope?
	st_insert(def);
	if (def->tag == DEF_FUNC) {
		st_enter_scope();
		type_def(def->u.func.params);
		type_cmd(def->u.func.cmd);
		st_leave_scope();
	}

	if (def->next != NULL) {
		type_def(def->next);
	}
}

static void type_cmd(CmdNode* cmd) {
	switch (cmd->tag) {
	case CMD_BLOCK:
		if (cmd->u.block.defs != NULL) {
			type_def(cmd->u.block.defs);
		}
		if (cmd->u.block.cmds != NULL) {
			type_cmd(cmd->u.block.cmds);
		}
		break;
	case CMD_IF:
		type_exp(cmd->u.ifwhile.exp);
		st_enter_scope();
		type_cmd(cmd->u.ifwhile.cmd);
		st_leave_scope();
		break;
	case CMD_IF_ELSE:
		type_exp(cmd->u.ifelse.exp);
		st_enter_scope();
		type_cmd(cmd->u.ifelse.ifcmd);
		st_leave_scope();
		st_enter_scope();
		type_cmd(cmd->u.ifelse.elsecmd);
		st_leave_scope();
		break;
	case CMD_WHILE:
		type_exp(cmd->u.ifwhile.exp);
		st_enter_scope();
		type_cmd(cmd->u.ifwhile.cmd);
		st_leave_scope();
		break;
	case CMD_ASG:
		type_var(cmd->u.asg.var);
		type_exp(cmd->u.asg.exp);
		break;
	case CMD_RETURN:
		if (cmd->u.exp != NULL) {
			type_exp(cmd->u.exp);
		}
		break;
	case CMD_CALL:
		type_call(cmd->u.call);
		break;
	default:
		AST_ERROR("type_cmd: invalid tag");
	}

	// Cmd list
	if (cmd->next != NULL) {
		type_cmd(cmd->next);
	}
}

void type_var(VarNode* var) {
	switch (var->tag) {
	case VAR_ID:
		var->u.id->def = st_find(var->u.id); // TODO: Really like this?
		break;
	case VAR_INDEXED:
		type_exp(var->u.indexed.exp1);
		type_exp(var->u.indexed.exp2);
		break;
	default:
		AST_ERROR("type_var: invalid tag");
	}
}

void type_exp(ExpNode* exp) {
	switch (exp->tag) {
	case EXP_VAR:
		type_var(exp->u.var);
		break;
	case EXP_CALL:
		type_call(exp->u.call);
		break;
	case EXP_NEW:
		type_exp(exp->u.new.exp);
		break;
	case EXP_UNARY:
		type_exp(exp->u.unary.exp);
		break;
	case EXP_BINARY:
		type_exp(exp->u.binary.exp1);
		type_exp(exp->u.binary.exp2);
		break;
	default:
		break;
	}

	// Exp list
	if (exp->next != NULL) {
		type_exp(exp->next);
	}
}

void type_call(CallNode* call) {
	// TODO: Really like this? Check NULL?
	call->id->def = st_find(call->id);
	if (call->params != NULL) {
		type_exp(call->params);
	}
}
