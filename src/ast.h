#if !defined(ast_h)
#define ast_h

// ==================================================
//
//	Enums
//
// ==================================================

// Auxiliary
typedef unsigned int LexSymbol;

typedef enum ExpE {
	EXP_KINT,
	EXP_KFLOAT,
	EXP_KSTR,
	EXP_VAR,
	// EXP_PAR, ?????
	EXP_CALL,
	EXP_NEW,
	EXP_UNARY,
	EXP_MUL,
	EXP_ADD,
	EXP_COMP,
	EXP_AND,
	EXP_OR
} ExpE;

typedef enum VarE {
	VAR_ID,
	VAR_INDEXED
} VarE;

typedef enum DefE {
	DEF_VAR,
	DEF_FUNC,
} DefE;

typedef enum CmdE {
	CMD_IF,
	CMD_WHILE,
	CMD_ASG,
	CMD_RETURN,
	CMD_COMP
} CmdE;

typedef enum TypeE {
	TYPE_INT,
	TYPE_FLOAT,
	TYPE_CHAR,
	TYPE_VOID,
	TYPE_ARRAY,
} TypeE;

typedef enum CallE {
	CALL_EMPTY,
	CALL_PARAMS
} CallE;

// ==================================================
//
//	Typedefs
//
// ==================================================

typedef struct ProgramNode ProgramNode;
/* Ok */ typedef struct IdNode IdNode;
/* Ok */ typedef struct VarNode VarNode;
/* Ok */ typedef struct ExpNode ExpNode;
/* Ok */ typedef struct ExpList ExpList;
typedef struct DefNode DefNode;
typedef struct CmdNode CmdNode;
/* Ok */ typedef struct TypeNode TypeNode;
/* Ok */ typedef struct CallNode CallNode;
typedef struct AstNode AstNode;

// ==================================================
//
//	Temp
//
// ==================================================

// Temp
void printvarnode(AstNode *n);

extern AstNode* ast_get_program_node();
extern void ast_set_program_node(VarNode *node);

// extern AstNode* ast_list_add(AstNode* list, AstNode* node);
// extern AstNode* ast_list_add(AstNode* list, int value);

extern void ast_list_append(void** list, void* value);

// ==================================================
//
//	Create node functions
//
// ==================================================

// Id
extern IdNode* ast_id(const char* id);

// Exp
extern ExpNode* ast_exp_binary(LexSymbol symbol, ExpNode *exp1, ExpNode *exp2);
extern ExpNode* ast_exp_unary(LexSymbol symbol, ExpNode *exp);
extern ExpNode* ast_exp_int(int value);
extern ExpNode* ast_exp_float(float value);
extern ExpNode* ast_exp_str(const char* value);
extern ExpNode* ast_exp_var(VarNode* var);
extern ExpNode* ast_exp_call(CallNode* call);
extern ExpNode* ast_exp_new(TypeNode* type, ExpNode* exp);

// ExpList
extern ExpList* ast_explist_new(ExpNode* exp);
extern ExpList* ast_explist_append(ExpList* explist, ExpNode* exp);

// Var
extern VarNode* ast_var(IdNode* id);
extern VarNode* ast_var_indexed(ExpNode* exp1, ExpNode* exp2);

// Type
extern TypeNode* ast_type(TypeE tag);
extern TypeNode* ast_type_array(TypeNode* node);

// Call
extern CallNode* ast_call_empty(IdNode* id);
extern CallNode* ast_call_params(IdNode* id, ExpList* params);

#endif