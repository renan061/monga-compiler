#include <stdio.h>
#include <strings.h>

#include "macros.h"
#include "llvm.h"
#include "ast.h"

#define LLVM_EQ 	"eq"

#define LLVM_ADD 	"add"
#define LLVM_FADD	"fadd"

// TODO
// #define LLVM_SUB "sub"
#define LLVM_MUL 	"mul"
#define LLVM_DIV 	"div"
#define LLVM_GT 	"gt"
#define LLVM_GE 	"ge"
#define LLVM_LT 	"lt"
#define LLVM_LE 	"le"

// printf
#define PRINTF_ID_CHAR		"pchar"
#define PRINTF_ID_INT		"pint"
#define PRINTF_ID_FLOAT		"pfloat"
#define PRINTF_ID_STR		"pstr"
#define PRINTF_ID_ADDRESS	"paddress"

// ==================================================
//
//	Macros
//
// ==================================================

//  = <add> <type> <num>, <zero>
#define LLVM_KNUM_AUX(add, type_func, num_func, num, zero)	\
	printf(" = %s ", add); type_func(); printf(" ");		\
	num_func(num); printf(", " zero);						\

// ==================================================
//
//	Auxiliary
//
// ==================================================

// Length and accumulator for strs
static unsigned int lenstrs = 0, accstrs = 0;
static const char* strs[1000]; // TODO: Error when out of bounds

// TODO: Reset label at end of function
static unsigned int tablvl = 0, temp = 0, label = 0;

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

// ==================================================
//
//	LLVM
//
// ==================================================

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

// %ret = getelementptr inbounds <type>, <type>* %t, <indextype> <indextemp>
LLVMTemp llvm_getelementptr(LLVMTemp t, TypeNode* type, ExpNode* index) {
	write_tabs();
	write_temp(++temp);
	printf(" = getelementptr inbounds ");
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

// %b = icmp ne i32 %t, 0
// br i1 %b label %lt, label %lf
void llvm_br3(LLVMTemp t, LLVMLabel lt, LLVMLabel lf) {
	write_tabs();
	write_temp(++temp);
	printf(" = icmp ne i32 ");
	write_temp(t);
	printf(", 0\n");

	write_tabs();
	printf("br i1 ");
	write_temp(temp);
	printf(", label ");
	write_label_temp(lt);
	printf(", label ");
	write_label_temp(lf);
	printf("\n");
}

LLVMTemp llvm_phi2(TypeNode* type, LLVMValue v1, LLVMLabel l1, LLVMValue v2,
	LLVMLabel l2) {

	write_tabs();
	write_temp(++temp);
	printf(" = phi ");
	write_type(type);
	printf(" [");
	switch (type->tag) {
		case TYPE_INT:
			write_int(v1.i);
			printf(", ");
			write_label_temp(l1);
			printf("], [");
			write_int(v2.i);
			printf(", ");
			write_label_temp(l2);
			break;
		case TYPE_FLOAT:
			write_float(v1.f);
			printf(", ");
			write_label_temp(l1);
			printf("], [");
			write_int(v2.f);
			printf(", ");
			write_label_temp(l2);
			break;
		default:
			MONGA_INTERNAL_ERR("llvm_phi2: invalid type");
	}
	printf("]\n");
	return temp;
}

// ==================================================
//
//	Auxiliary
//
// ==================================================

// Only used inside llvm_setup
#define DECLARE_PRINTF_FORMAT(str, percent)					\
	printf("@." str " = private unnamed_addr constant ");	\
	printf("[3 x i8] c\"%%" percent "\\00\"\n");			\

void llvm_setup() {
	printf("target triple = \"x86_64-apple-macosx10.11.0\"\n");
	printf("declare i32 @putchar(i32)\n");
	printf("declare i32 @printf(i8*, ...)\n");
	printf("declare i8* @malloc(i64)\n");
	DECLARE_PRINTF_FORMAT(PRINTF_ID_CHAR, "c");
	DECLARE_PRINTF_FORMAT(PRINTF_ID_INT, "d");
	DECLARE_PRINTF_FORMAT(PRINTF_ID_FLOAT, "f");
	DECLARE_PRINTF_FORMAT(PRINTF_ID_STR, "s");
	DECLARE_PRINTF_FORMAT(PRINTF_ID_ADDRESS, "p");
	printf("\n");
}

void llvm_func_start(TypeNode* type, IdNode* id, DefNode* params) {
	write_tabs();

	printf("define ");
	write_type(type);
	printf(" @%s(", id->u.str); // TODO: Don't use id ?
	
	for (DefNode* aux = params; aux != NULL; aux = aux->next) {
		write_type(aux->u.var.type);
		printf(" ");
		write_temp(++temp);
		aux->temp = temp;
		if (aux->next == NULL) { // FIXME: This is horrible.
			break;
		}
		printf(", ");
	}

	printf(") {\n");
	tablvl++;

	// TODO: Really?
	for (DefNode* aux = params; aux != NULL; aux = aux->next) {
		int t = llvm_alloca(aux->u.var.type);
		llvm_store(aux->u.var.type, aux->temp, t);
		aux->temp = temp;
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

	temp = 0;
}

// TODO: Rework look llvm_print
static void llvm_printf(const char* id, TypeNode* type, LLVMTemp t) {
	write_tabs();
	printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ");
	printf("([3 x i8], [3 x i8]* @.%s, i32 0, i32 0), ", id);
	write_type(type);
	printf(" ");
	write_temp(t);
	printf(")\n");
}

void llvm_print(ExpNode* exp) {
	// TODO: Rewrite this when cast is done
	switch (exp->type->tag) {
	case TYPE_CHAR:
		// TODO: Remove cast
		llvm_printf(PRINTF_ID_CHAR, ast_type(TYPE_INT), 
			llvm_cast(exp->type, exp->temp, ast_type(TYPE_INT)));
		break;
	case TYPE_INT:
		llvm_printf(PRINTF_ID_INT, exp->type, exp->temp);
		break;
	case TYPE_FLOAT:
		llvm_printf(PRINTF_ID_FLOAT, exp->type, exp->temp);
		break;
	case TYPE_INDEXED:
		write_tabs();
		switch (exp->type->indexed->tag) {
		case TYPE_CHAR:
			llvm_printf(PRINTF_ID_STR, exp->type, exp->temp);
			break;
		default:
			// TODO: Print address
			break;
		}
		break;
	case TYPE_VOID:
		MONGA_INTERNAL_ERR("llvm_print: void type");
	}
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
	printf("ret void\n");
}

LLVMTemp llvm_kval(TypeNode* type, LLVMValue val) {
	write_tabs();
	write_temp(++temp);
	switch (type->tag) {
	case TYPE_INT:
		LLVM_KNUM_AUX(LLVM_ADD, write_type_int, write_int, val.i, "0");
		break;
	case TYPE_FLOAT:
		LLVM_KNUM_AUX(LLVM_FADD, write_type_float, write_float, val.f, "0.0");
		break;
	case TYPE_INDEXED:
		if (type->indexed->tag == TYPE_CHAR) {
			int len = strlen(val.str) + 1;
			printf(" = getelementptr inbounds [%d x i8], [%d x i8]*", len, len);
			printf(" @.str%d , i32 0, i32 0", lenstrs + accstrs);
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

LLVMTemp llvm_call(TypeNode* type, const char* name, ExpNode* args) {
	write_tabs();

	int ret = -1;
	if (type->tag != TYPE_VOID) {
		ret = ++temp;
		write_temp(ret);
		printf(" = ");
	}
	
	printf("call ");
	write_type(type);
	printf(" @%s(", name);

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
	int type_size; // TODO: Necessary?
	switch (type->tag) {
		case TYPE_CHAR:		type_size = sizeof(char);	break;
		case TYPE_INT:		type_size = sizeof(int);	break;
		case TYPE_FLOAT:	type_size = sizeof(double);	break;
		case TYPE_INDEXED:	type_size = sizeof(void*);	break;
		case TYPE_VOID:		MONGA_INTERNAL_ERR("array type void");
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
	char* cast;
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

// For llvm add, sub, mul and div
static LLVMTemp llvm_arith(const char* op, TypeNode* type, LLVMTemp t1,
	LLVMTemp t2) {

	write_tabs();
	temp++;
	int isfloat = (type->tag == TYPE_FLOAT);
	write_temp(temp);
	printf(" = %s%s ", (isfloat) ? "f" :
		(!strcmp(op, LLVM_DIV)) ? "s" : "", op);
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

LLVMTemp llvm_karith(char* op, char* order, TypeNode* type, LLVMTemp t,
	double num) {

	write_tabs();
	temp++;
	int isfloat = (type->tag == TYPE_FLOAT);
	write_temp(temp);
	printf(" = %s%s ", (isfloat) ? "f" :
		(!strcmp(op, LLVM_DIV)) ? "s" : "", op);
	write_type(type);
	printf(" ");

	if (order == NUM_OP_TEMP) {
		printf("%d", (int)num); // TODO: Float?
		printf(", ");
		write_temp(t);
	} else if (order == TEMP_OP_NUM) {
		write_temp(t);
		printf(", ");
		printf("%d", (int)num);
	}

	printf("\n");
	return temp;
}

// %b = <type>cmp <op> <type> %t1, %t2
// %ret = zext i1 %b to i32
static LLVMTemp llvm_cmp(const char* op, TypeNode* type, LLVMTemp t1,
	LLVMTemp t2) {

	write_tabs();
	write_temp(++temp);
	printf(" = ");
	switch (type->tag) {
		case TYPE_INT:		printf("i"); break;
		case TYPE_FLOAT:	printf("f"); break;
		default:			MONGA_INTERNAL_ERR("llvm_cmp: invalid type");
	}
	printf("cmp %s ", op);
	write_type(type);
	printf(" ");
	write_temp(t1);
	printf(", ");
	write_temp(t2);
	printf("\n");

	write_tabs();
	write_temp(++temp);
	printf(" = zext i1 ");
	write_temp(temp - 1);
	printf(" to i32\n");
	
	return temp;
}

// Equal
LLVMTemp llvm_cmp_eq(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	switch (type->tag) {
		case TYPE_INT:		return llvm_cmp(LLVM_EQ, type, t1, t2);
		case TYPE_FLOAT:	return llvm_cmp("o" LLVM_EQ, type, t1, t2);
		default:			MONGA_INTERNAL_ERR("llvm_cmp: invalid type");
	}
}

// Greater than
LLVMTemp llvm_cmp_gt(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	switch (type->tag) {
		case TYPE_INT:		return llvm_cmp("s" LLVM_GT, type, t1, t2);
		case TYPE_FLOAT:	return llvm_cmp("o" LLVM_GT, type, t1, t2);
		default:			MONGA_INTERNAL_ERR("llvm_cmp: invalid type");
	}
}

// Greater or equal
LLVMTemp llvm_cmp_ge(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	switch (type->tag) {
		case TYPE_INT:		return llvm_cmp("s" LLVM_GE, type, t1, t2);
		case TYPE_FLOAT:	return llvm_cmp("o" LLVM_GE, type, t1, t2);
		default:			MONGA_INTERNAL_ERR("llvm_cmp: invalid type");
	}
}

// Lesser than
LLVMTemp llvm_cmp_lt(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	switch (type->tag) {
		case TYPE_INT:		return llvm_cmp("s" LLVM_LT, type, t1, t2);
		case TYPE_FLOAT:	return llvm_cmp("o" LLVM_LT, type, t1, t2);
		default:			MONGA_INTERNAL_ERR("llvm_cmp: invalid type");
	}
}

// Lesser or equal
LLVMTemp llvm_cmp_le(TypeNode* type, LLVMTemp t1, LLVMTemp t2) {
	switch (type->tag) {
		case TYPE_INT:		return llvm_cmp("s" LLVM_LE, type, t1, t2);
		case TYPE_FLOAT:	return llvm_cmp("o" LLVM_LE, type, t1, t2);
		default:			MONGA_INTERNAL_ERR("llvm_cmp: invalid type");
	}
}
