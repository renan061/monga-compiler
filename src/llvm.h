#if !defined(llvm_h)
#define llvm_h

#include "ast.h"

typedef unsigned int LLVMTemp;
typedef unsigned int LLVMLabel;
typedef union LLVMValue {
	int i;				// Int
	double f;			// Float
	const char* str;	// String 
} LLVMValue;

// LLVM
extern void llvm_setup();
extern void llvm_commentary(const char* str);
extern void llvm_label(LLVMLabel l);
extern LLVMLabel llvm_label_temp();
extern LLVMTemp llvm_alloca(TypeNode* type);
extern void llvm_store(TypeNode* type, LLVMTemp from, LLVMTemp to);
extern LLVMTemp llvm_load(TypeNode* type, LLVMTemp t);
extern LLVMTemp llvm_getelementptr(LLVMTemp t, TypeNode* type, ExpNode* index);
extern void llvm_br1(LLVMLabel l);
extern void llvm_br3(LLVMTemp t, LLVMLabel lt, LLVMLabel lf);
extern LLVMTemp llvm_phi2(TypeNode* type, LLVMValue v1, LLVMLabel l1,
	LLVMValue v2, LLVMLabel l2);
extern LLVMTemp llvm_global_address(TypeNode* type, IdNode* id);

// Def
extern void llvm_def_global(TypeNode* type, IdNode* id);
extern void llvm_func_start(TypeNode* type, IdNode* id, DefNode* params);
extern void llvm_func_end();

// Cmd
extern void llvm_print(ExpNode* exp);
extern void llvm_ret_exp(TypeNode* type, LLVMTemp t);
extern void llvm_ret_void();

// Exp
extern LLVMTemp llvm_kval(TypeNode* type, LLVMValue val);
extern LLVMTemp llvm_call(TypeNode* type, const char* id, ExpNode* args);
extern LLVMTemp llvm_new(TypeNode* type, ExpNode* size);
extern LLVMTemp llvm_cast(TypeNode* from, LLVMTemp t, TypeNode* to);

// Arithmetics
extern LLVMTemp llvm_minus(TypeNode* type, LLVMTemp t);
extern LLVMTemp llvm_add(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_sub(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_mul(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_div(TypeNode* type, LLVMTemp t1, LLVMTemp t2);

// Comparing
extern LLVMTemp llvm_cmp_eq(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_gt(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_ge(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_lt(TypeNode* type, LLVMTemp t1, LLVMTemp t2);
extern LLVMTemp llvm_cmp_le(TypeNode* type, LLVMTemp t1, LLVMTemp t2);

#endif
