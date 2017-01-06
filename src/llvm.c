#include <stdio.h>
#include <strings.h>

#include "macros.h"
#include "llvm.h"
#include "ast.h"

#define MAX_STRS 1000

#define LLVM_EQ 	"eq"
#define LLVM_ADD 	"add"
#define LLVM_FADD	"fadd"
#define LLVM_SUB 	"sub"
#define LLVM_MUL 	"mul"
#define LLVM_DIV 	"div"
#define LLVM_GT 	"gt"
#define LLVM_GE 	"ge"
#define LLVM_LT 	"lt"
#define LLVM_LE 	"le"

#define PRINTF_ID_CHAR		"pchar"
#define PRINTF_ID_INT		"pint"
#define PRINTF_ID_FLOAT		"pfloat"
#define PRINTF_ID_STR		"pstr"
#define PRINTF_ID_ADDRESS	"paddress"

// ==================================================
//
//	Macros
//
//	FIXME: Find a way to get rid of these horrible
//	macros (maybe write_value function)
//
// ==================================================

// @.<str> = private unnamed_addr constant [3 x i8] c"%<percent>\00"
#define LLVM_SETUP_AUX(str, percent)						\
	printf("@." str " = private unnamed_addr constant ");	\
	printf("[3 x i8] c\"%%" percent "\\00\"\n");			\

// <n1>, %l1][<n2>, %l2
#define LLVM_PHI2_AUX(num_func, n1, n2)					\
	num_func(n1); printf(", "); write_label_temp(l1);	\
	printf("], [");										\
	num_func(n2); printf(", "); write_label_temp(l2);	\

//  = <add> <type> <num>, 0
#define LLVM_KNUM_AUX(add, type_func, num_func, num)	\
	printf(" = %s ", add); type_func(); printf(" ");	\
	num_func(num); printf(", "); num_func(0);			\

// <sub> <type> 0
#define LLVM_MINUS_AUX(sub, type_func, zero_func)	\
	printf("%s ", sub); type_func();				\
	printf(" "); zero_func(0);						\

// Calls llvm_cmp with the right op
#define LLVM_CMP_AUX(op1, op2, type, t1, t2)				\
	switch (type->tag) {									\
		case TYPE_INT:										\
			return llvm_cmp(op1, type, t1, t2);				\
		case TYPE_FLOAT:									\
			return llvm_cmp(op2, type, t1, t2);				\
		default:											\
			MONGA_INTERNAL_ERR("llvm_cmp: invalid type");	\
	}														\

// ==================================================
//
//	Private
//
// ==================================================

static unsigned int tablvl = 0, temp = 0, label = 0;

// Length and accumulator for strs
static unsigned int lenstrs = 0, accstrs = 0;
static const char* strs[MAX_STRS];

// Used by llvm_new
static int sizeof_char = sizeof(char);
static int sizeof_int = sizeof(int);
static int sizeof_double = sizeof(double);
static int sizeof_indexed = sizeof(void*);

static void write_tabs() {
	for (int i = 0; i < tablvl; i++) {
		printf("  ");
	}
}

static void write_temp(LLVMTemp t) {
	printf("%%t%d", t);
}

static void write_label(LLVMLabel l) {
	printf("l%d:\n", l);
}

static void write_label_temp(LLVMLabel l) {
	printf("%%l%d", l);
}

static void write_type_int()	{ printf("i32");	}
static void write_type_float()	{ printf("double");	}
static void write_type_char()	{ printf("i8"); 	}
static void write_type_void()	{ printf("void"); 	}

static void write_type(TypeNode* type) {
	switch (type->tag) {
	case TYPE_INT:		write_type_int();	break;
	case TYPE_FLOAT:	write_type_float();	break;
	case TYPE_CHAR:		write_type_char();	break;
	case TYPE_VOID:		write_type_void();	break;
	case TYPE_INDEXED:
		write_type(type->indexed);
		printf("*");
		break;
	}
}

static void write_float(double d) {
	long long p;
	memcpy(&p, &d, sizeof(double));
	printf("0x%llx", p);
}

static void write_int(int i) {
	printf("%d", i);
}

static void write_zero(TypeNode* type) {
	switch (type->tag) {
	case TYPE_CHAR:
		// Fallthrough
	case TYPE_INT:
		write_int(0);
		break;
	case TYPE_FLOAT:
		write_float(0);
		break;
	case TYPE_INDEXED:
		printf("null");
		break;
	default:
		MONGA_INTERNAL_ERR("write_zero: invalid type")
	}
}

// ==================================================
//
//	LLVM
//
// ==================================================

// Required headers
void llvm_setup() {
	printf("declare i32 @putchar(i32)\n");
	printf("declare i32 @printf(i8*, ...)\n");
	printf("declare i8* @malloc(i64)\n");
	LLVM_SETUP_AUX(PRINTF_ID_CHAR, "c");
	LLVM_SETUP_AUX(PRINTF_ID_INT, "d");
	LLVM_SETUP_AUX(PRINTF_ID_FLOAT, "f");
	LLVM_SETUP_AUX(PRINTF_ID_STR, "s");
	LLVM_SETUP_AUX(PRINTF_ID_ADDRESS, "p");
	printf("\n");
}

// ;str
void llvm_commentary(const char* str) {
	printf(";%s\n", str);
}

// l%t:
void llvm_label(LLVMLabel l) {
	write_label(l);
}

// LLVMLabel label
LLVMLabel llvm_label_temp() {
	return ++label;
}

// %ret = alloca <type>
LLVMTemp llvm_alloca(TypeNode* type) {
	write_tabs();
	write_temp(++temp);
	printf(" = alloca ");
	write_type(type);
	printf("\n");
	return temp;
}

// store <type> %from, <type>* %to
void llvm_store(TypeNode* type, LLVMTemp from, LLVMTemp to) {
	write_tabs();
	printf("store ");
	write_type(type);
	printf(" ");
	write_temp(from);
	printf(", ");
	write_type(type);
	printf("* ");
	write_temp(to);
	printf("\n");
}

// %ret = load <type>, <type>* %t
LLVMTemp llvm_load(TypeNode* type, LLVMTemp t) {
	write_tabs();
	write_temp(++temp);
	printf(" = load ");
	write_type(type);
	printf(", ");
	write_type(type);
	printf("* ");
	write_temp(t);
	printf("\n");
	return temp;
}

// %ret = getelementptr <type>, <type>* %t, <indextype> <indextemp>
LLVMTemp llvm_getelementptr(LLVMTemp t, TypeNode* type, ExpNode* index) {
	write_tabs();
	write_temp(++temp);
	printf(" = getelementptr ");
	write_type(type);
	printf(", ");
	write_type(type);
	printf("* ");
	write_temp(t);
	printf(", ");
	write_type(index->type);
	printf(" ");
	write_temp(index->temp);
	printf("\n");
	return temp;
}

// br label %l
void llvm_br1(LLVMLabel l) {
	write_tabs();
	printf("br label ");
	write_label_temp(l);
	printf("\n");
}

// br i1 %b label %lt, label %lf
void llvm_br3(TypeNode* type, LLVMTemp t, LLVMLabel lt, LLVMLabel lf) {
	write_tabs();
	printf("br i1 ");
	write_temp(temp);
	printf(", label ");
	write_label_temp(lt);
	printf(", label ");
	write_label_temp(lf);
	printf("\n");
}

// %ret = phi <type> [<v1>, %l1][<v2>, %l2]
LLVMTemp llvm_phi2(TypeNode* type, LLVMValue v1, LLVMLabel l1, LLVMValue v2,
	LLVMLabel l2) {

	write_tabs();
	write_temp(++temp);
	printf(" = phi ");
	write_type(type);
	printf(" [");
	switch (type->tag) {
		case TYPE_INT:
			LLVM_PHI2_AUX(write_int, v1.i, v2.i);
			break;
		case TYPE_FLOAT:
			LLVM_PHI2_AUX(write_float, v1.f, v2.f);
			break;
		default:
			MONGA_INTERNAL_ERR("llvm_phi2: invalid type");
	}
	printf("]\n");
	return temp;
}

// %ret = getelementptr <type>* @<id>, i32 0
LLVMTemp llvm_global_address(TypeNode* type, IdNode* id) {
	write_tabs();
	write_temp(++temp);
	printf(" = getelementptr ");
	write_type(type);
	printf(", ");
	write_type(type);
	printf("* @%s, i32 0\n", id->u.str);
	return temp;
}

// @<id> = global <type> <zerovalue>
void llvm_def_global(TypeNode* type, IdNode* id) {
	printf("@");
	printf("%s", id->u.str);
	printf(" = global ");
	write_type(type);	
	printf(" ");
	write_zero(type);
	printf("\n");
}

void llvm_func_start(TypeNode* type, IdNode* id, DefNode* params) {
	write_tabs();
	printf("define ");
	write_type(type);
	printf(" @%s(", id->u.str);
	
	for (DefNode* aux = params; aux != NULL; aux = aux->next) {
		write_type(aux->u.var.type);
		printf(" ");
		write_temp(++temp);
		aux->u.var.temp = temp;
		if (aux->next == NULL) { // FIXME: This is horrible.
			break;
		}
		printf(", ");
	}

	printf(") {\n");
	tablvl++;

	for (DefNode* aux = params; aux != NULL; aux = aux->next) {
		int t = llvm_alloca(aux->u.var.type);
		llvm_store(aux->u.var.type, aux->u.var.temp, t);
		aux->u.var.temp = temp;
	}
}

void llvm_func_end() {
	tablvl--;
	printf("}\n");

	if (lenstrs) {
		for (int i = 0; i < lenstrs; i++) {
			printf("@.str%d = private unnamed_addr constant ", i + accstrs);
			printf("[%lu x i8] c\"%s\\00\"\n", strlen(strs[i]) + 1, strs[i]);
			strs[i] = NULL;
		}
		printf("\n");
		accstrs += lenstrs;
		lenstrs = 0;
	}

	temp = label = 0;
}

void llvm_print(ExpNode* exp) {
	write_tabs();
	printf("call i32 (i8*, ...) @printf(i8* getelementptr ");
	printf("([3 x i8], [3 x i8]* @.");

	switch (exp->type->tag) {
	case TYPE_CHAR:		
		printf(PRINTF_ID_CHAR);
		break;
	case TYPE_INT:
		printf(PRINTF_ID_INT);
		break;
	case TYPE_FLOAT:
		printf(PRINTF_ID_FLOAT);
		break;
	case TYPE_INDEXED:
		switch (exp->type->indexed->tag) {
		case TYPE_CHAR:
			printf(PRINTF_ID_STR);
			break;
		default:
			printf(PRINTF_ID_INT);
		}
		break;
	case TYPE_VOID:
		MONGA_INTERNAL_ERR("llvm_print: void type");
	}

	printf(", i32 0, i32 0), ");
	write_type(exp->type);
	printf(" ");
	write_temp(exp->temp);
	printf(")\n");
}

void llvm_ret_exp(TypeNode* type, LLVMTemp t) {
	write_tabs();
	printf("ret ");
	write_type(type);
	printf(" ");
	write_temp(t);
	printf("\n");
}

void llvm_ret_void() {
	write_tabs();
	printf("ret ");
	write_type_void();
	printf("\n");
}

void llvm_ret_zero(TypeNode* type) {
	write_tabs();
	printf("ret ");
	switch (type->tag) {
	case TYPE_CHAR: // Fallthrough
	case TYPE_INT:
		write_type_int();
		printf(" ");
		write_int(0);
		break;
	case TYPE_FLOAT:
		write_type_float();
		printf(" ");
		write_float(0);
		break;
	case TYPE_VOID:
		write_type_void();
		break;
	case TYPE_INDEXED:
		write_type(type);
		printf(" null");
		break;
	}
	printf("\n");
}

LLVMTemp llvm_kval(TypeNode* type, LLVMValue val) {
	write_tabs();
	write_temp(++temp);
	switch (type->tag) {
	case TYPE_INT:
		LLVM_KNUM_AUX(LLVM_ADD, write_type_int, write_int, val.i);
		break;
	case TYPE_FLOAT:
		LLVM_KNUM_AUX(LLVM_FADD, write_type_float, write_float, val.f);
		break;
	case TYPE_INDEXED:
		if (type->indexed->tag == TYPE_CHAR) {
			int len = strlen(val.str) + 1;
			printf(" = getelementptr [%d x i8], [%d x i8]*", len, len);
			printf(" @.str%d , i32 0, i32 0", lenstrs + accstrs);
			if (lenstrs >= MAX_STRS) {
				MONGA_ERR("error: too many strings\n");
			}
			strs[lenstrs++] = val.str;
			break;
		}
		// Fallthrough
	default:
		MONGA_INTERNAL_ERR("llvm_kval: invalid type")
	}
	printf("\n");
	return temp;
}

LLVMTemp llvm_call(TypeNode* type, const char* id, ExpNode* args) {
	write_tabs();

	int ret = -1;
	if (type->tag != TYPE_VOID) {
		ret = ++temp;
		write_temp(ret);
		printf(" = ");
	}
	
	printf("call ");
	write_type(type);
	printf(" @%s(", id);

	for (ExpNode* aux = args; aux != NULL; aux = aux->next) {
		write_type(aux->type);
		printf(" ");
		write_temp(aux->temp);
		if (aux->next == NULL) { // FIXME: This is horrible.
			break;
		}
		printf(", ");
	}

	printf(")\n");
	return ret;
}

LLVMTemp llvm_new(TypeNode* type, ExpNode* size) {
	int type_size;
	switch (type->tag) {
		case TYPE_CHAR:		type_size = sizeof_char;	break;
		case TYPE_INT:		type_size = sizeof_int;		break;
		case TYPE_FLOAT:	type_size = sizeof_double;	break;
		case TYPE_INDEXED:	type_size = sizeof_indexed;	break;
		case TYPE_VOID:		MONGA_INTERNAL_ERR("llvm_new: invalid type");
	}

	// %t2 = sext <sizetype> <sizetemp> to i64
	write_tabs();
	write_temp(++temp);
	printf(" = sext ");
	write_type(size->type);
	printf(" ");
	write_temp(size->temp);
	printf(" to i64\n");

	// %t3 = mul i64 %t2, <type_size>
	write_tabs();
	write_temp(++temp);
	printf(" = mul i64 ");
	write_temp(temp - 1);
	printf(", %d\n", type_size);

	// %t4 = call i8* @malloc(i64 %t3)
	write_tabs();
	write_temp(++temp);
	printf(" = call i8* @malloc(i64 ");
	write_temp(temp - 1);
	printf(")\n");

	// %t5 = bitcast i8* %t4 to <type>*
	if (type->tag != TYPE_CHAR) {
		write_tabs();
		write_temp(++temp);
		printf(" = bitcast i8* ");
		write_temp(temp - 1);
		printf(" to ");
		write_type(type);
		printf("*\n");
	}

	return temp;
}

LLVMTemp llvm_cast(TypeNode* from, LLVMTemp t, TypeNode* to) {
	const char* cast;
	if (from->tag == TYPE_INT && to->tag == TYPE_FLOAT) {
		cast = "sitofp";
	} else if (from->tag == TYPE_INT && to->tag == TYPE_CHAR) {
		cast = "trunc";
	} else if (from->tag == TYPE_CHAR && to->tag == TYPE_INT) {
		cast = "sext";
	} else {
		MONGA_INTERNAL_ERR("llvm_cast: invalid cast");
	}

	write_tabs();
	write_temp(++temp);
	printf(" = %s ", cast);
	write_type(from);
	printf(" ");
	write_temp(t);
	printf(" to ");
	write_type(to);
	printf("\n");
	return temp;
}		

LLVMTemp llvm_minus(TypeNode* type, LLVMTemp t) {
	write_tabs();
	write_temp(++temp);
	printf(" = ");
	switch (type->tag) {
	case TYPE_INT:
		LLVM_MINUS_AUX(LLVM_SUB, write_type_int, write_int);
		break;
	case TYPE_FLOAT:
		LLVM_MINUS_AUX("f" LLVM_SUB, write_type_float, write_float);
		break;
	default:
		MONGA_INTERNAL_ERR("llvm_minus: invalid type");
	}
	printf(", ");
	write_temp(t);
	printf("\n");
	return temp;
}

// %ret = <op> <type> %t1, %t2
static LLVMTemp llvm_arith(const char* op, TypeNode* type,
	LLVMTemp t1, LLVMTemp t2) {

	write_tabs();
	write_temp(++temp);
	printf(" = ");
	switch (type->tag) {
	case TYPE_INT:
		if (strcmp(op, LLVM_DIV) == 0) { // FIXME: Remove strcmp
			printf("s");
		}
		break;
	case TYPE_FLOAT:
		printf("f");
		break;
	default:
		MONGA_INTERNAL_ERR("llvm_arith: invalid type");
	}
	printf("%s", op);
	printf(" ");
	write_type(type);
	printf(" ");
	write_temp(t1);
	printf(", ");
	write_temp(t2);
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

// %b = <type>cmp <op> <type> %t1, %t2
static LLVMTemp llvm_cmp(const char* op, TypeNode* type, LLVMTemp t1,
	LLVMTemp t2) {

	write_tabs();
	write_temp(++temp);
	// About \n: Invalid type internal error treated already, just a safeguard
	printf(" = %ccmp %s ", (type->tag == TYPE_INT) ? 'i' :
		(type->tag == TYPE_FLOAT) ? 'f' : '\n', op);
	write_type(type);
	printf(" ");
	write_temp(t1);
	printf(", ");
	write_temp(t2);
	printf("\n");
	
	return temp;
}

LLVMTemp llvm_cmp_eq(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	LLVM_CMP_AUX(LLVM_EQ, "o" LLVM_EQ, type, t1, t2);
}

LLVMTemp llvm_cmp_gt(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	LLVM_CMP_AUX("s" LLVM_GT, "o" LLVM_GT, type, t1, t2);
}

LLVMTemp llvm_cmp_ge(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	LLVM_CMP_AUX("s" LLVM_GE, "o" LLVM_GE, type, t1, t2);
}

LLVMTemp llvm_cmp_lt(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	LLVM_CMP_AUX("s" LLVM_LT, "o" LLVM_LT, type, t1, t2);
}

LLVMTemp llvm_cmp_le(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	LLVM_CMP_AUX("s" LLVM_LE, "o" LLVM_LE, type, t1, t2);
}

// %ret = <type>cmp <type>ne <type> %t, <zerovalue>
LLVMTemp llvm_cmp_notzero(TypeNode* type, LLVMTemp t) {
	write_tabs();
	write_temp(++temp);
	printf(" = ");
	switch (type->tag) {
		case TYPE_CHAR:
			// Fallthrough
		case TYPE_INT:
			printf("i");
			break;
		case TYPE_FLOAT:
			printf("f");
			break;
		default:
			MONGA_INTERNAL_ERR("llvm_cmp_ne: invalid type");
	}
	printf("cmp ");
	switch (type->tag) {
		case TYPE_CHAR:
			// Fallthrough
		case TYPE_INT:
			break;
		case TYPE_FLOAT:
			printf("o");
			break;
		default:
			MONGA_INTERNAL_ERR("llvm_cmp_ne: invalid type");
	}
	printf("ne ");
	write_type(type);
	printf(" ");
	write_temp(t);
	printf(", ");
	write_zero(type);
	printf("\n");
	return temp;
}
