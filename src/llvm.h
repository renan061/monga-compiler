#if !defined(llvm_h)
#define llvm_h

#include "ast.h"

#define LLVM_SUB "sub" // TODO

#define NUM_OP_TEMP "numtemp"
#define TEMP_OP_NUM "tempnum"

typedef unsigned int LLVMTemp;
typedef unsigned int LLVMLabel;

// LLVM
extern void llvm_commentary(const char* str);
extern void llvm_label(LLVMLabel l);
extern LLVMLabel llvm_label_temp();
extern LLVMTemp llvm_alloca(TypeNode* type);
extern void llvm_store(TypeNode* type, LLVMTemp from, LLVMTemp to);
extern LLVMTemp llvm_load(TypeNode* type, LLVMTemp t);
extern LLVMTemp llvm_getelementptr(LLVMTemp t, TypeNode* type, ExpNode* index);
extern void llvm_br1(LLVMLabel l);
extern void llvm_br3(LLVMTemp t, LLVMLabel lt, LLVMLabel lf);

extern void llvm_setup();

// Def
extern void llvm_func_start(TypeNode* type, IdNode* id, DefNode* params);
extern void llvm_func_end();

// Cmd
extern void llvm_print(ExpNode* exp);
extern void llvm_ret_exp(TypeNode* type, LLVMTemp t);
extern void llvm_ret_void();

// Exp
extern LLVMTemp llvm_knum(TypeNode* type, double num);
extern LLVMTemp llvm_kstr(const char* str);
extern LLVMTemp llvm_call(TypeNode* type, const char* name, ExpNode* args);
extern LLVMTemp llvm_new(TypeNode* type, ExpNode* size);
extern LLVMTemp llvm_cast(TypeNode* from, LLVMTemp t, TypeNode* to);

// Arithmetics
extern LLVMTemp llvm_add(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_sub(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_mul(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_div(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_karith(char* op, char* order, TypeNode* type, LLVMTemp t,
	double num);

// Compares
extern LLVMTemp llvm_cmp_eq(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_gt(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_ge(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_lt(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_le(TypeNode* type, LLVMTemp t1, LLVMTemp t2);

#endif
