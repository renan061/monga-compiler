#include <stdio.h>
#include <strings.h>

#include "macros.h"
#include "llvm.h"
#include "ast.h"

#define LLVM_EQ "eq" // eq(int), oeq(float)
#define LLVM_ADD "add"
// #define LLVM_SUB "sub" // TODO
#define LLVM_MUL "mul"
#define LLVM_DIV "div"
#define LLVM_GT "gt" // sgt(int), ogt(double)
#define LLVM_GE "ge" // sge(int), oge(double)
#define LLVM_LT "lt" // slt(int), olt(double)
#define LLVM_LE "le" // sle(int), ole(double)

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

static void write_type(TypeNode* type) {
	switch (type->tag) {
	case TYPE_INT:		printf("i32");		break;
	case TYPE_FLOAT:	printf("double");	break;
	case TYPE_CHAR:		printf("i8");		break;
	case TYPE_VOID:		printf("void");		break;
	case TYPE_INDEXED:
		write_type(type->indexed);
		printf("*");
		break;
	}
}

static void write_double(double d) {
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
			write_double(v1.d);
			printf(", ");
			write_label_temp(l1);
			printf("], [");
			write_int(v2.d);
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

void llvm_setup() {
	printf("target triple = \"x86_64-apple-macosx10.11.0\"\n");
	printf("declare i32 @putchar(i32)\n");
	printf("declare i32 @printf(i8*, ...)\n");
	printf("declare i32 @puts(i8*)\n"); // TODO: Always prints \n
	printf("declare i8* @malloc(i64)\n");
	printf("@.pint = private unnamed_addr constant [3 x i8] c\"%%d\\00\"\n");
	printf("@.pfloat = private unnamed_addr constant [3 x i8] c\"%%f\\00\"\n");
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

void llvm_print(ExpNode* exp) {
	int t = exp->temp; // TODO: Remove this

	switch (exp->type->tag) {
	case TYPE_CHAR:
		t = llvm_cast(exp->type, t, ast_type(TYPE_INT)); // TODO: Remove this
		write_tabs(); // TODO: Remove this
		printf("call i32 @putchar(i32 ");
		break;
	case TYPE_INT:
	case TYPE_FLOAT:
		write_tabs();
		printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ");
		printf("([3 x i8], [3 x i8]* @.%s, i32 0, i32 0), ",
			(exp->type->tag == TYPE_INT) ? "pint" : "pfloat");
		write_type(exp->type);
		printf(" ");
		break;
	case TYPE_INDEXED:
		write_tabs();
		switch (exp->type->indexed->tag) {
		case TYPE_CHAR:
			printf("call i32 @puts(i8* ");
			break;
		default:
			// TODO: Print address
			break;
		}
		break;
	case TYPE_VOID:
		MONGA_INTERNAL_ERR("llvm_print: void type");
	}

	write_temp(t); // TODO: Back to exp->temp
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
	printf("ret void\n");
}

LLVMTemp llvm_knum(TypeNode* type, double num) {
	// TODO: This is horrible
	temp++;
	write_tabs();
	// TODO: Switch
	int isfloat = (type->tag == TYPE_FLOAT);
	write_temp(temp);
	printf(" = %s ", (isfloat) ? "f" LLVM_ADD : LLVM_ADD);
	write_type(type);
	printf(" ");
	// TODO: Switch
	if (isfloat) {
		write_double(num);
		printf(", 0.0");
	} else {
		write_int((int)num); // TODO: LLVMValue
		printf(", 0");
	}
	printf("\n");
	return temp;
}

LLVMTemp llvm_kstr(const char* str) {
	write_tabs();
	temp++;
	write_temp(temp);
	printf(" = getelementptr inbounds ");
	int len = strlen(str) + 1;
	printf("[%d x i8], [%d x i8]* @.str%d , i32 0, i32 0\n", len, len,
		lenstrs + accstrs);
	strs[lenstrs++] = str;
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
