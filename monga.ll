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
  %t1 = alloca i8
  %t2 = add i32 65, 0
  %t3 = trunc i32 %t2 to i8
  store i8 %t3, i8* %t1
  %t4 = load i8, i8* %t1
  %t5 = icmp ne i8 %t4, 0
  br i1 %t5, label %l1, label %l2
l1:
  %t6 = getelementptr [5 x i8], [5 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t6)
  br label %l2
l2:
  %t7 = getelementptr [2 x i8], [2 x i8]* @.str1 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t7)
  %t8 = alloca double
  %t9 = fadd double 0x3fb99999a0000000, 0x0
  store double %t9, double* %t8
  %t10 = load double, double* %t8
  %t11 = fcmp one double %t10, 0x0
  br i1 %t11, label %l3, label %l4
l3:
  %t12 = getelementptr [5 x i8], [5 x i8]* @.str2 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t12)
  br label %l4
l4:
  %t13 = alloca i32*
  %t14 = add i32 10, 0
  %t15 = sext i32 %t14 to i64
  %t16 = mul i64 %t15, 4
  %t17 = call i8* @malloc(i64 %t16)
  %t18 = bitcast i8* %t17 to i32*
  store i32* %t18, i32** %t13
  %t19 = load i32*, i32** %t13
  %t20 = icmp ne i32* %t19, null
  br i1 %t20, label %l5, label %l6
l5:
  %t21 = getelementptr [5 x i8], [5 x i8]* @.str3 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t21)
  br label %l6
l6:
  %t22 = add i32 0, 0
  ret i32 %t22
  ret i32 0
}
@.str0 = private unnamed_addr constant [5 x i8] c"Yes
\00"
@.str1 = private unnamed_addr constant [2 x i8] c"
\00"
@.str2 = private unnamed_addr constant [5 x i8] c"Yes
\00"
@.str3 = private unnamed_addr constant [5 x i8] c"Yes
\00"

