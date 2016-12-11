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
  %t2 = fadd double 0x0, 0.0
  store double %t2, double* %t1
  %t3 = getelementptr inbounds [8 x i8], [8 x i8]* @.str0 , i32 0, i32 0
    call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t3)
  %t4 = add i32 0, 0
  ret i32 %t4
}
@.str0 = private unnamed_addr constant [8 x i8] c"nugget
\00"

