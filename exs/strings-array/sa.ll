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
  %t1 = alloca i8
  %t2 = alloca i8*
  %t3 = alloca i8**
  %t4 = getelementptr inbounds [7 x i8], [7 x i8]* @.str0 , i32 0, i32 0
  store i8* %t4, i8** %t2
  %t5 = load i8*, i8** %t2
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t5)
  %t6 = load i8*, i8** %t2
  %t7 = add i32 0, 0
  %t8 = getelementptr inbounds i8, i8* %t6, i32 %t7
  %t9 = load i8, i8* %t8
  %t10 = sext i8 %t9 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t10)
  %t11 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t11)
  %t12 = add i32 2, 0
  %t13 = sext i32 %t12 to i64
  %t14 = mul i64 %t13, 8
  %t15 = call i8* @malloc(i64 %t14)
  %t16 = bitcast i8* %t15 to i8**
  store i8** %t16, i8*** %t3
  %t17 = load i8**, i8*** %t3
  %t18 = add i32 0, 0
  %t19 = getelementptr inbounds i8*, i8** %t17, i32 %t18
  %t20 = load i8*, i8** %t2
  store i8* %t20, i8** %t19
  %t21 = load i8**, i8*** %t3
  %t22 = add i32 1, 0
  %t23 = getelementptr inbounds i8*, i8** %t21, i32 %t22
  %t24 = add i32 2, 0
  %t25 = sext i32 %t24 to i64
  %t26 = mul i64 %t25, 1
  %t27 = call i8* @malloc(i64 %t26)
  store i8* %t27, i8** %t23
  %t28 = load i8**, i8*** %t3
  %t29 = add i32 1, 0
  %t30 = getelementptr inbounds i8*, i8** %t28, i32 %t29
  %t31 = load i8*, i8** %t30
  %t32 = add i32 0, 0
  %t33 = getelementptr inbounds i8, i8* %t31, i32 %t32
  %t34 = add i32 79, 0
  %t35 = trunc i32 %t34 to i8
  store i8 %t35, i8* %t33
  %t36 = load i8**, i8*** %t3
  %t37 = add i32 1, 0
  %t38 = getelementptr inbounds i8*, i8** %t36, i32 %t37
  %t39 = load i8*, i8** %t38
  %t40 = add i32 1, 0
  %t41 = getelementptr inbounds i8, i8* %t39, i32 %t40
  %t42 = add i32 105, 0
  %t43 = trunc i32 %t42 to i8
  store i8 %t43, i8* %t41
  %t44 = load i8**, i8*** %t3
  %t45 = add i32 0, 0
  %t46 = getelementptr inbounds i8*, i8** %t44, i32 %t45
  %t47 = load i8*, i8** %t46
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t47)
  %t48 = load i8**, i8*** %t3
  %t49 = add i32 1, 0
  %t50 = getelementptr inbounds i8*, i8** %t48, i32 %t49
  %t51 = load i8*, i8** %t50
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t51)
  ret void
  ret void
}
@.str0 = private unnamed_addr constant [7 x i8] c"string\00"
@.str1 = private unnamed_addr constant [2 x i8] c"
\00"

