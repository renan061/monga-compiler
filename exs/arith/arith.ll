target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define void @main() {
  %t1 = alloca i32
  %t2 = alloca i32
  %t3 = alloca double
  %t4 = add i32 20, 0
  store i32 %t4, i32* %t1
  %t5 = add i32 30, 0
  store i32 %t5, i32* %t2
  %t6 = load i32, i32* %t1
  %t7 = load i32, i32* %t2
  %t8 = add i32 %t6, %t7
  %t9 = sitofp i32 %t8 to double
  %t10 = fadd double 0x4024000000000000, 0x0
  %t11 = fdiv double %t9, %t10
  store double %t11, double* %t3
  %t12 = load double, double* %t3
  %t13 = add i32 25, 0
  %t14 = sub i32 0, %t13
  %t15 = sitofp i32 %t14 to double
  %t16 = fmul double %t12, %t15
  %t17 = add i32 10, 0
  %t18 = sitofp i32 %t17 to double
  %t19 = fsub double %t16, %t18
  store double %t19, double* %t3
  %t20 = load double, double* %t3
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t20)
  ret void
  ret void
}
