target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define i32 @main() {
  %t1 = alloca double
  %t2 = fadd double 0x3f1a36e2e0000000, 0x0
  store double %t2, double* %t1
  %t3 = load double, double* %t1
  %t4 = icmp ne i32 %t3, 0
  br i1 %t4, label %l1, label %l4
l4:
  %t5 = load double, double* %t1
  %t6 = icmp ne i32 %t5, 0
  br i1 %t6, label %l1, label %l2
l1:
  br label %l3
l2:
  br label %l3
l3:
  %t7 = phi i32 [1, %l1], [0, %l2]
  %t8 = sitofp i32 %t7 to double
  store double %t8, double* %t1
  %t9 = load double, double* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t9)
  %t10 = add i32 0, 0
  ret i32 %t10
  ret i32 0
}
