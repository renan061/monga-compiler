#if !defined(llvm_h)
#define llvm_h

#include "ast.h"

#define LLVM_ADD "add"
#define LLVM_SUB "sub"
#define LLVM_MUL "mul"
#define LLVM_DIV "div"

#define NUM_OP_TEMP "numtemp"
#define TEMP_OP_NUM "tempnum"

typedef unsigned int LLVMTemp;

extern void llvm_setup();

// Def
extern LLVMTemp llvm_alloca(TypeNode* type);
extern void llvm_func_start(TypeNode* type, IdNode* id, DefNode* params);
extern void llvm_func_end();

// Cmd
extern void llvm_print(ExpNode* exp);
extern void llvm_asg(TypeNode* type, LLVMTemp texp, LLVMTemp tvar);
extern void llvm_ret_exp(TypeNode* type, LLVMTemp t);
extern void llvm_ret_void();

extern void llvm_type(TypeNode* type); // TODO: Remove?

// Exp
extern LLVMTemp llvm_knum(TypeNode* type, double num);
extern LLVMTemp llvm_kstr(const char* str);
extern LLVMTemp llvm_load(TypeNode* type, LLVMTemp t);
extern LLVMTemp llvm_call(TypeNode* type, const char* name, ExpNode* args);

// Arithmetics
extern LLVMTemp llvm_add(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_sub(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_mul(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_div(TypeNode* type, LLVMTemp t1, LLVMTemp t2);

extern LLVMTemp llvm_karith(char* op, char* order, TypeNode* type, LLVMTemp t,
	double num);

#endif
