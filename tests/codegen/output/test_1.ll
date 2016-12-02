target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i32 @puts(i8*)

@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"

define i32 @foo(i32 %t1, i32 %t2) {
  %t3 = alloca i32
  store i32 %t1, i32* %t3
  %t4 = alloca i32
  store i32 %t2, i32* %t4
  %t5 = load i32, i32* %t3
  %t6 = load i32, i32* %t4
  %t7 = add i32 %t5, %t6
  ret i32 %t7
}
define i32 @zero() {
  %t1 = add i32 0, 0
  ret i32 %t1
}
define void @testprint() {
  %t1 = getelementptr inbounds [24 x i8], [24 x i8]* @.str0 , i32 0, i32 0
  call i32 @puts(i8* %t1)
  ret void
}
@.str0 = private unnamed_addr constant [24 x i8] c"test print funcionando
\00"

define i32 @main(i32 %t1, i32 %t2) {
  %t3 = alloca i32
  store i32 %t1, i32* %t3
  %t4 = alloca i32
  store i32 %t2, i32* %t4
  %t5 = alloca double
  %t6 = add i32 2, 0
  %t7 = add i32 3, 0
  %t8 = add i32 %t6, %t7
  %t9 = sitofp i32 %t8 to double
  %t10 = fadd double 0x3fe0000000000000, 0.0
  %t11 = fmul double %t9, %t10
  store double %t11, double* %t5
  %t12 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t12)
  %t13 = getelementptr inbounds [1 x i8], [1 x i8]* @.str1 , i32 0, i32 0
  call i32 @puts(i8* %t13)
  %t14 = add i32 0, 0
  ret i32 %t14
}
@.str1 = private unnamed_addr constant [1 x i8] c"\00"

