#include <stdio.h>
#include <stdlib.h>
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

static void type_program();

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
	n->str = id;
	return n;
}

// Param
ParamNode* ast_param_list(ParamNode* list, ParamNode* param) {
	AST_LIST(ParamNode, list, param);
}

ParamNode* ast_param(TypeNode* type, IdNode* id) {
	ParamNode* n;
	AST_MALLOC(n, ParamNode);
	n->next = NULL;
	n->type = type;
	n->id = id;
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

// static void print_id(IdNode* id);
// static void print_param(ParamNode* param);
// static void print_cmd(CmdNode* cmd, int layer);
// static void print_var(VarNode* var, int layer);
// static void print_exp(ExpNode* exp);
// static void print_call(CallNode* call);

static void type_program() {
	// printf("TODO: type_program\n");
	// type_def(program_node->defs);
}

// static void type_def(DefNode* def) {
// 	switch (def->tag) {
// 	case DEF_VAR:
// 		print_type(def->u.var.type);
// 		print_id(def->u.var.id);
// 		break;
// 	case DEF_FUNC:
// 		print_type(def->u.func.type);
// 		printf(" ");
// 		print_id(def->u.func.id);
// 		if (def->u.func.params == NULL) {
// 			printf("()");
// 		} else {
// 			printf("(");
// 			print_param(def->u.func.params);
// 			printf(")");
// 		}
// 		printf(" {\n");
// 		print_cmd(def->u.func.cmd, layer + 1);
// 		print_tabs(layer);
// 		printf("}\n");
// 		break;
// 	default:
// 		TEST_ERROR("print_def: invalid tag");
// 	}

// 	if (def->next != NULL) {
// 		type_def(def->next);
// 	}
// }

// static void print_type(TypeNode* type) {
// 	test_log("print_type");

// 	switch (type->tag) {
// 	case TYPE_INT:
// 		printf("int");
// 		break;
// 	case TYPE_FLOAT:
// 		printf("float");
// 		break;
// 	case TYPE_CHAR:
// 		printf("char");
// 		break;
// 	case TYPE_VOID:
// 		printf("void");
// 		break;
// 	case TYPE_ARRAY:
// 		print_type(type->array);
// 		printf("[]");
// 		break;
// 	default:
// 		TEST_ERROR("print_type: invalid tag");
// 	}
// }

// static void print_id(IdNode* id) {
// 	test_log("print_id");
// 	printf("%s", id->str);

// 	// Id list
// 	if (id->next != NULL) {
// 		printf(", ");
// 		print_id(id->next);
// 	}
// }

// static void print_param(ParamNode* param) {
// 	test_log("print_param");

// 	print_type(param->type);
// 	printf(" ");
// 	print_id(param->id);
// 	if (param->next != NULL) {
// 		printf(", ");
// 		print_param(param->next);
// 	}
// }

// static void print_cmd(CmdNode* cmd, int layer) {
// 	test_log("print_cmd");

// 	switch (cmd->tag) {
// 	case CMD_BLOCK:
// 		if (cmd->u.block.defs != NULL) {
// 			print_def(cmd->u.block.defs, layer + 1);
// 		}
// 		if (cmd->u.block.cmds != NULL) {
// 			print_cmd(cmd->u.block.cmds, layer + 1);
// 		}
// 		break;
// 	case CMD_IF:
// 		print_tabs(layer);
// 		printf("(if(");
// 		print_exp(cmd->u.ifwhile.exp);
// 		printf(") {\n");
// 		print_cmd(cmd->u.ifwhile.cmd, layer + 1);
// 		print_tabs(layer);
// 		printf("})\n");
// 		break;
// 	case CMD_IF_ELSE:
// 		print_tabs(layer);
// 		printf("(if(");
// 		print_exp(cmd->u.ifelse.exp);
// 		printf(") {\n");
// 		print_cmd(cmd->u.ifelse.ifcmd, layer + 1);
// 		print_tabs(layer);
// 		printf("} else {\n");
// 		print_cmd(cmd->u.ifelse.elsecmd, layer + 1);
// 		print_tabs(layer);
// 		printf("})\n");
// 		break;
// 	case CMD_WHILE:
// 		print_tabs(layer);
// 		printf("(while(");
// 		print_exp(cmd->u.ifwhile.exp);
// 		printf(") {\n");
// 		print_cmd(cmd->u.ifwhile.cmd, layer + 1);
// 		print_tabs(layer);
// 		printf("})\n");
// 		break;
// 	case CMD_ASG:
// 		print_var(cmd->u.asg.var, layer);
// 		printf(" = ");
// 		print_exp(cmd->u.asg.exp);
// 		printf(";\n");
// 		break;
// 	case CMD_RETURN:
// 		print_tabs(layer);
// 		printf("return ");
// 		if (cmd->u.exp != NULL) {
// 			print_exp(cmd->u.exp);
// 		}
// 		printf(";\n");
// 		break;
// 	case CMD_CALL:
// 		print_tabs(layer);
// 		print_call(cmd->u.call);
// 		printf(";\n");
// 		break;
// 	default:
// 		TEST_ERROR("print_cmd: invalid tag");
// 	}

// 	// Cmd list
// 	if (cmd->next != NULL) {
// 		print_cmd(cmd->next, layer);
// 	}
// }

// void print_var(VarNode* var, int layer) {
// 	test_log("print_var");

// 	switch (var->tag) {
// 	case VAR_ID:
// 		print_tabs(layer);
// 		print_id(var->u.id);
// 		break;
// 	case VAR_INDEXED:
// 		print_tabs(layer);
// 		print_exp(var->u.indexed.exp1);
// 		printf("[");
// 		print_exp(var->u.indexed.exp2);
// 		printf("]");
// 		break;
// 	default:
// 		TEST_ERROR("print_var: invalid tag");
// 	}
// }

// void print_exp(ExpNode* exp) {
// 	test_log("print_exp");

// 	printf("(");
// 	switch (exp->tag) {
// 	case EXP_KINT:
// 		printf("%d", exp->u.intvalue);
// 		break;
// 	case EXP_KFLOAT:
// 		printf("%f", exp->u.floatvalue);
// 		break;
// 	case EXP_KSTR:
// 		printf("%s", exp->u.strvalue);
// 		break;
// 	case EXP_VAR:
// 		print_var(exp->u.var, 0);
// 		break;
// 	case EXP_CALL:
// 		print_call(exp->u.call);
// 		break;
// 	case EXP_NEW:
// 		printf("new ");
// 		print_type(exp->u.new.type);
// 		printf("[");
// 		print_exp(exp->u.new.exp);
// 		printf("]");
// 		break;
// 	case EXP_UNARY:
// 		print_lex_symbol(exp->u.unary.symbol);
// 		print_exp(exp->u.unary.exp);
// 		break;
// 	case EXP_BINARY:
// 		print_exp(exp->u.binary.exp1);
// 		print_lex_symbol(exp->u.binary.symbol);
// 		print_exp(exp->u.binary.exp2);
// 		break;
// 	default:
// 		TEST_ERROR("print_exp: invalid tag");
// 	}
// 	printf(")");

// 	// Exp list
// 	if (exp->next != NULL) {
// 		printf(", ");
// 		print_exp(exp->next);
// 	}
// }

// static void print_call(CallNode* call) {
// 	test_log("print_call");

// 	print_id(call->id);
// 	printf("(");
// 	if (call->params != NULL) {
// 		print_exp(call->params);
// 	}
// 	printf(")");
// }
