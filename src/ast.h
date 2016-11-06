#if !defined(ast_h)
#define ast_h

// ==================================================
//
//	Typedefs
//
// ==================================================

typedef struct ProgramNode ProgramNode;
typedef struct DefNode DefNode;
typedef struct TypeNode TypeNode;
typedef struct IdNode IdNode;
typedef struct ParamNode ParamNode;
typedef struct CmdNode CmdNode;
typedef struct VarNode VarNode;
typedef struct ExpNode ExpNode;
typedef struct CallNode CallNode;

typedef unsigned int LexSymbol;

// ==================================================
//
//	Node Enums
//
// ==================================================

typedef enum DefE {
	DEF_VAR,
	DEF_FUNC,
} DefE;

typedef enum TypeE {
	TYPE_INT,
	TYPE_FLOAT,
	TYPE_CHAR,
	TYPE_VOID,
	TYPE_ARRAY,
} TypeE;

typedef enum CmdE {
	CMD_BLOCK,
	CMD_IF,
	CMD_IF_ELSE,
	CMD_WHILE,
	CMD_ASG,
	CMD_RETURN,
	CMD_CALL
} CmdE;

typedef enum VarE {
	VAR_ID,
	VAR_INDEXED
} VarE;

typedef enum ExpE {
	EXP_KINT,
	EXP_KFLOAT,
	EXP_KSTR,
	EXP_VAR,
	EXP_CALL,
	EXP_NEW,
	EXP_UNARY,
	EXP_BINARY
} ExpE;

typedef enum CallE {
	CALL_EMPTY,
	CALL_PARAMS
} CallE;

// ==================================================
//
//	Node Structs
//
// ==================================================

struct ProgramNode {
	DefNode* defs;
};

struct DefNode {
	DefE tag;
	DefNode* next;
	union {
		// DefVar
		struct {
			TypeNode* type;
			IdNode* id;
		} var;
		// DefFunc
		struct {
			TypeNode* type;
			IdNode* id;
			ParamNode* params;
			CmdNode* cmd;
		} func;
	} u;
};

struct TypeNode {
	TypeE tag;
	TypeNode* array; // Only for TYPE_ARRAY
};

struct IdNode {
	const char* str;
	IdNode* next;
};

struct ParamNode {
	ParamNode* next;
	TypeNode* type;
	IdNode* id;
};

struct CmdNode {
	CmdE tag;
	CmdNode* next;
	union {
		// CmdBlock
		struct {
			DefNode* defs;
			CmdNode* cmds;
		} block;
		// CmdIf and CmdWhile
		struct {
			ExpNode* exp;
			CmdNode* cmd;
		} ifwhile;
		// CmdIfElse
		struct {
			ExpNode* exp;
			CmdNode *ifcmd, *elsecmd;
		} ifelse;
		// CmdAsg
		struct {
			VarNode* var;
			ExpNode* exp;
		} asg;
		// CmdReturn
		ExpNode* exp;
		// CmdCall
		CallNode* call;
	} u;
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

struct ExpNode {
	ExpE tag;
	ExpNode* next;
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
		// ExpUnary
		struct {
			LexSymbol symbol;
			ExpNode* exp;
		} unary;
		// ExpMul, ExpAdd, ExpComp, ExpAnd and ExpOr
		struct {
			LexSymbol symbol;
			ExpNode *exp1, *exp2;
		} binary;
	} u;
};

struct CallNode {
	IdNode* id;
	ExpNode* params;
};

// ==================================================
//
//	Node Functions
//
// ==================================================

// Program
extern ProgramNode* ast_program_node(); // Getter
extern void ast_program(DefNode *defs); // Setter

// Def
extern DefNode* ast_def_list(DefNode* list, DefNode* def);
extern DefNode* ast_def_var(TypeNode* type, IdNode* id);
extern DefNode* ast_def_func(TypeNode* type, IdNode* id, ParamNode* params,
	CmdNode* block);

// Type
extern TypeNode* ast_type(TypeE tag);
extern TypeNode* ast_type_array(TypeNode* node);

// Id
extern IdNode* ast_id_list(IdNode* list, IdNode* id);
extern IdNode* ast_id(const char* id);

// Param
extern ParamNode* ast_param_list(ParamNode* list, ParamNode* param);
extern ParamNode* ast_param(TypeNode* type, IdNode* id);

// Cmd
extern CmdNode* ast_cmd_list(CmdNode* list, CmdNode* cmd);
extern CmdNode* ast_cmd_block(DefNode* defs, CmdNode* cmds);
extern CmdNode* ast_cmd_if(ExpNode* exp, CmdNode* cmd);
extern CmdNode* ast_cmd_if_else(ExpNode* exp, CmdNode* ifcmd, CmdNode* elsecmd);
extern CmdNode* ast_cmd_while(ExpNode* exp, CmdNode* cmd);
extern CmdNode* ast_cmd_asg(VarNode* var, ExpNode* exp);
extern CmdNode* ast_cmd_return(ExpNode* exp);
extern CmdNode* ast_cmd_call(CallNode* call);

// Var
extern VarNode* ast_var(IdNode* id);
extern VarNode* ast_var_indexed(ExpNode* exp1, ExpNode* exp2);

// Exp
extern ExpNode* ast_exp_list(ExpNode* list, ExpNode* exp);
extern ExpNode* ast_exp_binary(LexSymbol symbol, ExpNode *exp1, ExpNode *exp2);
extern ExpNode* ast_exp_unary(LexSymbol symbol, ExpNode *exp);
extern ExpNode* ast_exp_int(int value);
extern ExpNode* ast_exp_float(float value);
extern ExpNode* ast_exp_str(const char* value);
extern ExpNode* ast_exp_var(VarNode* var);
extern ExpNode* ast_exp_call(CallNode* call);
extern ExpNode* ast_exp_new(TypeNode* type, ExpNode* exp);

// Call
extern CallNode* ast_call(IdNode* id, ExpNode* params);

#endif