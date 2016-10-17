#include "ast.h"

// Id
struct IdNode {
	const char *id;
};

// Exp
typedef enum ExpE {
	EXP_KINT,
	EXP_KFLOAT,
	EXP_KSTR,
	EXP_VAR,
	// EXP_PAR, ?????
	// EXP_CALL, TODO
	// EXP_NEW, TODO
	EXP_MINUS,
	EXP_NOT,
	EXP_MUL,
	EXP_ADD,
	EXP_COMP,
	EXP_AND,
	EXP_OR
} ExpE;

struct ExpNode {
	ExpE tag;
	union {
		int i;
		double f;
		const char *str;
		// Var var;
		// TODO
	} u;
};

// Var
typedef enum VarE {
	VAR_ID,
	VAR_INDEXED
} VarE;

struct VarNode {
	VarE tag;
	union {
		// VarId
		const char *id;
		// VarIndexed
		struct {
			ExpNode *e1, *e2;
		} indexed;
	} u;
};

// Def
typedef enum DefE {
	DEF_VAR,
	DEF_FUNC,
} DefE;

struct DefNode {
	DefE tag;
	union {

	} u;
};

// Cmd
typedef enum CmdE {
	CMD_IF,
	CMD_WHILE,
	CMD_ASG,
	CMD_RETURN,
	CMD_COMP
} CmdE;

struct CmdNode {
	CmdE tag;
};

// Type
typedef enum TypeE {
	TYPE_INT,
	TYPE_FLOAT,
	TYPE_CHAR,
	TYPE_VOID,
	TYPE_ARRAY,
} TypeE;

struct TypeNode {
	TypeE tag;
	TypeNode *t;
};

// Node
union Node {
	// NodeE tag;
	ExpNode exp;
	VarNode var;
	DefNode def;
	CmdNode cmd;
	TypeNode type;
};

// ============================================================================
//
//	Para construir a árvore
//
// ============================================================================

// Node* current_head;

// // Node* add_node(NodeE tag, void *value, Node **sons) {
// Node* add_node(NodeE tag, Node **sons) {
// 	Node* n = (Node*)malloc(sizeof(Node));
// 	if (n == NULL) {
// 		printf("insufficient memory for node\n");
// 		exit(1);
// 	}

// 	n->tag = tag;
// 	// n->value = value;
// 	n->sons = sons;

// 	current_head = n;
// 	return current_head;
// }

// Node* get_head() {
// 	return current_head;
// }
