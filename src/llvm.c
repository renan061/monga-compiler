#include <stdio.h>
#include <strings.h>

#include "llvm.h"
#include "ast.h"

// ==================================================
//
//	Auxiliary
//
// ==================================================

// TODO: Remove fixed size
static unsigned int strscounter = 0;
static const char* strs_val[100];
static LLVMTemp strs_temp[100];

static unsigned int tablvl = 0, temp = 0;

static void tabs() {
	for (int i = 0; i < tablvl; i++) {
		printf("  ");
	}
}

static void llvm_temp(LLVMTemp t) {
	printf("%%t%d", t);
}

void llvm_type(TypeNode* type) {
	switch (type->tag) {
	case TYPE_INT:		printf("i32");		break;
	case TYPE_FLOAT:	printf("double");	break;
	case TYPE_CHAR:		printf("i8");		break;
	case TYPE_VOID:		printf("void");		break;
	case TYPE_INDEXED:
		llvm_type(type->indexed);
		printf("*");
		break;
	}
}

// ==================================================
//
//	LLVM
//
// ==================================================

LLVMTemp llvm_defvar(TypeNode* type) {
	tabs();
	llvm_temp(++temp);
	printf(" = alloca ");
	llvm_type(type);
	printf("\n");
	return temp;
}

void llvm_func_start(TypeNode* type, IdNode* id, DefNode* params) {
	tabs();

	printf("define ");
	llvm_type(type);
	printf(" @%s(", id->u.str); // TODO: Don't use id ?
	
	if (params != NULL) {
		DefNode* aux = params;
		while (1) { // It's ugly but necessary
			llvm_type(aux->u.var.type);
			printf(" ");
			llvm_temp(++temp);
			if (aux->next == NULL) {
				break;
			}
			printf(", ");
			aux = aux->next;
		}
	}

	printf(") {\n");
	tablvl++;
}

void llvm_func_end() {
	tablvl--;
	printf("}\n");

	if (strscounter) {
		printf("\n");
		for (int i = 0; i < strscounter; i++) {
			printf("@.str%d = private unnamed_addr constant ", strs_temp[i]);
			printf("[%lu x i8] c\"%s\\00\"\n", strlen(strs_val[i]) + 1,
				strs_val[i]);
		}
		strscounter = 0;
	}

	temp = 0;
}

void llvm_print(ExpNode* exp) {
	tabs();
	switch (exp->type->tag) {
	case TYPE_CHAR:
		printf("call i32 @putchar(i32 %%t%d)\n", exp->temp);
		break;
	case TYPE_INT:
		printf("call i32 @putchar(i32 %%t%d)\n", exp->temp); // TODO
		break;
	case TYPE_FLOAT:
		break; // TODO
	case TYPE_INDEXED:
		switch (exp->type->indexed->tag) {
		case TYPE_CHAR:
			printf("call i32 @puts(i8* %%t%d)\n", exp->temp);
			break;
		default:
			// TODO
			break;
		}
		break;
	case TYPE_VOID:
		break; // TODO: Error
	}
}

void llvm_asg(TypeNode* type, LLVMTemp texp, LLVMTemp tvar) {
	tabs();
	printf("store ");
	llvm_type(type);
	printf(" ");
	llvm_temp(texp);
	printf(", ");
	llvm_type(type);
	printf("* ");
	llvm_temp(tvar);
	printf("\n");
}

void llvm_ret_exp(TypeNode* type, LLVMTemp t) {
	tabs();
	printf("ret ");
	llvm_type(type);
	printf(" ");
	llvm_temp(t);
	printf("\n");
}

void llvm_ret_void() {
	tabs();
	printf("ret void\n");
}

LLVMTemp llvm_knum(TypeNode* type, double num) {
	// TODO: This is horrible
	temp++;
	tabs();
	int isfloat = (type->tag == TYPE_FLOAT);
	llvm_temp(temp);
	printf(" = %s ", (isfloat) ? "f" LLVM_ADD : LLVM_ADD);
	llvm_type(type);
	printf(" ");
	if (isfloat) {
		printf("TODO");
	} else {
		printf("%d, 0", (int)num);
	}
	printf("\n");
	return temp;
}

LLVMTemp llvm_kstr(const char* str) {
	tabs();
	temp++;
	llvm_temp(temp);
	printf(" = getelementptr inbounds ");
	int len = strlen(str) + 1;
	printf("[%d x i8], [%d x i8]* @.str%d , i32 0, i32 0\n", len, len, temp);

	// TODO
	strs_val[strscounter] = str;
	strs_temp[strscounter] = temp;
	strscounter++;

	return temp;
}

LLVMTemp llvm_load(TypeNode* type, LLVMTemp t) {
	tabs();
	llvm_temp(++temp);
	printf(" = load ");
	llvm_type(type);
	printf(", ");
	llvm_type(type);
	printf("* %%t%d\n", t);
	return temp;
}

// For llvm add, sub, mul and div
static LLVMTemp llvm_arith(const char* op, TypeNode* type, LLVMTemp t1,
	LLVMTemp t2) {

	tabs();
	temp++;
	int isfloat = (type->tag == TYPE_FLOAT);
	llvm_temp(temp);
	printf(" = %s%s ", (isfloat) ? "f" :
		(!strcmp(op, LLVM_DIV)) ? "s" : "", op);
	llvm_type(type);
	printf(" ");
	llvm_temp(t1);
	printf(", ");
	llvm_temp(t2);
	printf("\n");
	return temp;
}

LLVMTemp llvm_add(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	return llvm_arith(LLVM_ADD, type, t1, t2);
}

LLVMTemp llvm_sub(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	return llvm_arith(LLVM_SUB, type, t1, t2);
}

LLVMTemp llvm_mul(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	return llvm_arith(LLVM_MUL, type, t1, t2);
}

LLVMTemp llvm_div(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	return llvm_arith(LLVM_DIV, type, t1, t2);
}

LLVMTemp llvm_karith(char* op, char* order, TypeNode* type, LLVMTemp t,
	double num) {

	tabs();
	temp++;
	int isfloat = (type->tag == TYPE_FLOAT);
	llvm_temp(temp);
	printf(" = %s%s ", (isfloat) ? "f" :
		(!strcmp(op, LLVM_DIV)) ? "s" : "", op);
	llvm_type(type);
	printf(" ");

	if (order == NUM_OP_TEMP) {
		printf("%d", (int)num);
		printf(", ");
		llvm_temp(t);
	} else if (order == TEMP_OP_NUM) {
		llvm_temp(t);
		printf(", ");
		printf("%d", (int)num);
	}

	printf("\n");
	return temp;
}
