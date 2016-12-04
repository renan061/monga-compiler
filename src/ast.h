#if !defined(ast_h)
#define ast_h

// Aesthetic
typedef unsigned int LexSymbol;

// ==================================================
//
//	Tags
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
	TYPE_INDEXED,
} TypeE;

typedef enum CmdE {
	CMD_BLOCK,
	CMD_IF,
	CMD_IF_ELSE,
	CMD_WHILE,
	CMD_PRINT,
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
	EXP_CAST,
	EXP_UNARY,
	EXP_BINARY
} ExpE;

// ==================================================
//
//	Node Structs
//
// ==================================================

typedef struct ProgramNode ProgramNode;
typedef struct DefNode DefNode;
typedef struct TypeNode TypeNode;
typedef struct IdNode IdNode;
typedef struct CmdNode CmdNode;
typedef struct VarNode VarNode;
typedef struct ExpNode ExpNode;
typedef struct CallNode CallNode;

struct ProgramNode {
	DefNode* defs;
};

struct DefNode {
	DefE tag;
	unsigned int temp;
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
			DefNode* params;
			CmdNode* block;
		} func;
	} u;
};

struct TypeNode {
	TypeE tag;
	TypeNode* indexed; // Only for TYPE_INDEXED
};

struct IdNode {
	int line;
	union {
		const char* str;
		DefNode* def;
	} u;
};

struct CmdNode {
	CmdE tag;
	int line;
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
		// CmdPrint
		ExpNode* print;
		// CmdAsg
		struct {
			VarNode* var;
			ExpNode* exp;
		} asg;
		// CmdReturn
		ExpNode* ret;
		// CmdCall
		CallNode* call;
	} u;
};

struct VarNode {
	VarE tag;
	int line;
	unsigned int temp;
	TypeNode* type;

	union {
		// VarId
		IdNode* id;
		// VarIndexed
		struct {
			ExpNode *array, *index;
		} indexed;
	} u;
};

struct ExpNode {
	ExpE tag;
	int line; // Initialized as "-1" for ExpInt, ExpFloat and ExpStr
	unsigned int temp;
	TypeNode* type;
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
			ExpNode* size;
		} new;
		// ExpCast
		ExpNode* cast;
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
	ExpNode* args;
};

// ==================================================
//
//	Functions
//
// ==================================================

// Program
extern ProgramNode* ast_get_program(); // Getter
extern void ast_program(DefNode *defs); // Setter

// Def
extern DefNode* ast_def_var(TypeNode* type, IdNode* id);
extern DefNode* ast_def_func(TypeNode* type, IdNode* id, DefNode* params,
	CmdNode* block);

// Type
extern TypeNode* ast_type(TypeE tag);
extern TypeNode* ast_type_indexed(TypeNode* node);

// Id
extern IdNode* ast_id(int line, const char* id);

// Cmd
extern CmdNode* ast_cmd_block(int line, DefNode* defs, CmdNode* cmds);
extern CmdNode* ast_cmd_if(int line, ExpNode* exp, CmdNode* cmd);
extern CmdNode* ast_cmd_if_else(int line, ExpNode* exp, CmdNode* ifcmd,
	CmdNode* elsecmd);
extern CmdNode* ast_cmd_while(int line, ExpNode* exp, CmdNode* cmd);
extern CmdNode* ast_cmd_print(int line, ExpNode* exp);
extern CmdNode* ast_cmd_asg(int line, VarNode* var, ExpNode* exp);
extern CmdNode* ast_cmd_return(int line, ExpNode* exp);
extern CmdNode* ast_cmd_call(int line, CallNode* call);

// Var
extern VarNode* ast_var(IdNode* id);
extern VarNode* ast_var_indexed(int line, ExpNode* array, ExpNode* index);

// Exp
extern ExpNode* ast_exp_binary(int line, LexSymbol symbol, ExpNode *exp1,
	ExpNode *exp2);
extern ExpNode* ast_exp_unary(int line, LexSymbol symbol, ExpNode *exp);
extern ExpNode* ast_exp_int(int value);
extern ExpNode* ast_exp_float(float value);
extern ExpNode* ast_exp_str(const char* value);
extern ExpNode* ast_exp_var(VarNode* var);
extern ExpNode* ast_exp_call(CallNode* call);
extern ExpNode* ast_exp_new(int line, TypeNode* type, ExpNode* size);
extern ExpNode* ast_exp_cast(TypeNode* type, ExpNode* exp); // Used by sem.c

// Call
extern CallNode* ast_call(IdNode* id, ExpNode* args);

#endif