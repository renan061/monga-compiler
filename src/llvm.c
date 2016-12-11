#include <stdio.h>
#include <strings.h>

#include "macros.h"
#include "llvm.h"
#include "ast.h"

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

static void tabs() {
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

static void llvm_type(TypeNode* type) {
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
	tabs();
	write_temp(++temp);
	printf(" = alloca ");
	llvm_type(type);
	printf("\n");
	return temp;
}

// store <type> %from, <type>* %to
void llvm_store(TypeNode* type, LLVMTemp from, LLVMTemp to) {
	tabs();
	printf("store ");
	llvm_type(type);
	printf(" ");
	write_temp(from);
	printf(", ");
	llvm_type(type);
	printf("* ");
	write_temp(to);
	printf("\n");
}

// %ret = load <type>, <type>* %t
LLVMTemp llvm_load(TypeNode* type, LLVMTemp t) {
	tabs();
	write_temp(++temp);
	printf(" = load ");
	llvm_type(type);
	printf(", ");
	llvm_type(type);
	printf("* ");
	write_temp(t);
	printf("\n");
	return temp;
}

// %ret = getelementptr inbounds <type>, <type>* %t, <indextype> <indextemp>
LLVMTemp llvm_getelementptr(LLVMTemp t, TypeNode* type, ExpNode* index) {
	tabs();
	write_temp(++temp);
	printf(" = getelementptr inbounds ");
	llvm_type(type);
	printf(", ");
	llvm_type(type);
	printf("* ");
	write_temp(t);
	printf(", ");
	llvm_type(index->type);
	printf(" ");
	write_temp(index->temp);
	printf("\n");
	return temp;
}

// br label %l
void llvm_br1(LLVMLabel l) {
	tabs();
	printf("br label ");
	write_label_temp(l);
	printf("\n");
}

// %b = icmp eq i32 %t, 0
// br i1 %b label %lt, label %lf
void llvm_br3(LLVMTemp t, LLVMLabel lt, LLVMLabel lf) {
	tabs();
	write_temp(++temp);
	printf(" = icmp eq i32 ");
	write_temp(t);
	printf(", 0\n");

	tabs();
	printf("br i1 ");
	write_temp(temp);
	printf(", label ");
	write_label_temp(lf);
	printf(", label ");
	write_label_temp(lt);
	printf("\n");
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
	tabs();

	printf("define ");
	llvm_type(type);
	printf(" @%s(", id->u.str); // TODO: Don't use id ?
	
	for (DefNode* aux = params; aux != NULL; aux = aux->next) {
		llvm_type(aux->u.var.type);
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
		tabs(); // TODO: Remove this
		printf("call i32 @putchar(i32 ");
		break;
	case TYPE_INT:
	case TYPE_FLOAT:
		tabs();
		printf("call i32 (i8*, ...) @printf(i8* getelementptr inbounds ");
		printf("([3 x i8], [3 x i8]* @.%s, i32 0, i32 0), ",
			(exp->type->tag == TYPE_INT) ? "pint" : "pfloat");
		llvm_type(exp->type);
		printf(" ");
		break;
	case TYPE_INDEXED:
		tabs();
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
	tabs();
	printf("ret ");
	llvm_type(type);
	printf(" ");
	write_temp(t);
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
	write_temp(temp);
	printf(" = %s ", (isfloat) ? "f" LLVM_ADD : LLVM_ADD);
	llvm_type(type);
	printf(" ");
	if (isfloat) {
		long long p;
		memcpy(&p, &num, sizeof(double));
		printf("0x%llx, 0.0", p);
	} else {
		printf("%d, 0", (int)num);
	}
	printf("\n");
	return temp;
}

LLVMTemp llvm_kstr(const char* str) {
	tabs();
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
	tabs();

	int ret = -1;
	if (type->tag != TYPE_VOID) {
		ret = ++temp;
		write_temp(ret);
		printf(" = ");
	}
	
	printf("call ");
	llvm_type(type);
	printf(" @%s(", name);

	for (ExpNode* aux = args; aux != NULL; aux = aux->next) {
		llvm_type(aux->type);
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
	tabs();
	write_temp(++temp);
	printf(" = sext ");
	llvm_type(size->type);
	printf(" ");
	write_temp(size->temp);
	printf(" to i64\n");

	// %t3 = mul i64 %t2, <type_size>
	tabs();
	write_temp(++temp);
	printf(" = mul i64 ");
	write_temp(temp - 1);
	printf(", %d\n", type_size);

	// %t4 = call i8* @malloc(i64 %t3)
	tabs();
	write_temp(++temp);
	printf(" = call i8* @malloc(i64 ");
	write_temp(temp - 1);
	printf(")\n");

	// %t5 = bitcast i8* %t4 to <type>*
	if (type->tag != TYPE_CHAR) {
		tabs();
		write_temp(++temp);
		printf(" = bitcast i8* ");
		write_temp(temp - 1);
		printf(" to ");
		llvm_type(type);
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

	tabs();
	write_temp(++temp);
	printf(" = %s ", cast);
	llvm_type(from);
	printf(" ");
	write_temp(t);
	printf(" to ");
	llvm_type(to);
	printf("\n");
	return temp;
}		

// For llvm add, sub, mul and div
static LLVMTemp llvm_arith(const char* op, TypeNode* type, LLVMTemp t1,
	LLVMTemp t2) {

	tabs();
	temp++;
	int isfloat = (type->tag == TYPE_FLOAT);
	write_temp(temp);
	printf(" = %s%s ", (isfloat) ? "f" :
		(!strcmp(op, LLVM_DIV)) ? "s" : "", op);
	llvm_type(type);
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

	tabs();
	temp++;
	int isfloat = (type->tag == TYPE_FLOAT);
	write_temp(temp);
	printf(" = %s%s ", (isfloat) ? "f" :
		(!strcmp(op, LLVM_DIV)) ? "s" : "", op);
	llvm_type(type);
	printf(" ");

	if (order == NUM_OP_TEMP) {
		printf("%d", (int)num);
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
