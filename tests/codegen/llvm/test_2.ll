target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define i32 @true_func() {
  %t1 = add i32 1, 0
  ret i32 %t1
}
define i32 @false_func() {
  %t1 = add i32 0, 0
  ret i32 %t1
}
define i32 @main() {
  %t1 = alloca i8
  %t2 = alloca i8*
  %t3 = alloca i8*
  %t4 = alloca i8
  %t5 = alloca i8
  %t6 = alloca i32
  %t7 = alloca i32
  %t8 = add i32 10, 0
  %t9 = trunc i32 %t8 to i8
  store i8 %t9, i8* %t1
  %t10 = getelementptr inbounds [4 x i8], [4 x i8]* @.str0 , i32 0, i32 0
  store i8* %t10, i8** %t2
  %t11 = getelementptr inbounds [3 x i8], [3 x i8]* @.str1 , i32 0, i32 0
  store i8* %t11, i8** %t3
  %t12 = add i32 65, 0
  %t13 = trunc i32 %t12 to i8
  store i8 %t13, i8* %t4
  %t14 = add i32 0, 0
  %t15 = trunc i32 %t14 to i8
  store i8 %t15, i8* %t5
  %t16 = add i32 1, 0
  store i32 %t16, i32* %t6
  %t17 = add i32 0, 0
  store i32 %t17, i32* %t7
  %t18 = add i32 1, 0
  %t19 = icmp ne i32 %t18, 0
  br i1 %t19, label %l1, label %l2
l1:
  %t20 = load i8*, i8** %t2
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t20)
  br label %l2
l2:
  %t21 = add i32 0, 0
  %t22 = icmp ne i32 %t21, 0
  br i1 %t22, label %l3, label %l4
l3:
  %t23 = load i8*, i8** %t3
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t23)
  br label %l4
l4:
  %t24 = load i8, i8* %t4
  %t25 = sext i8 %t24 to i32
  %t26 = icmp ne i32 %t25, 0
  br i1 %t26, label %l5, label %l6
l5:
  %t27 = load i8*, i8** %t2
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t27)
  br label %l6
l6:
  %t28 = load i8, i8* %t5
  %t29 = sext i8 %t28 to i32
  %t30 = icmp ne i32 %t29, 0
  br i1 %t30, label %l7, label %l8
l7:
  %t31 = load i8*, i8** %t3
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t31)
  br label %l8
l8:
  %t32 = load i32, i32* %t6
  %t33 = icmp ne i32 %t32, 0
  br i1 %t33, label %l9, label %l10
l9:
  %t34 = load i8*, i8** %t2
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t34)
  br label %l10
l10:
  %t35 = load i32, i32* %t7
  %t36 = icmp ne i32 %t35, 0
  br i1 %t36, label %l11, label %l12
l11:
  %t37 = load i8*, i8** %t3
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t37)
  br label %l12
l12:
  %t38 = call i32 @true_func()
  %t39 = icmp ne i32 %t38, 0
  br i1 %t39, label %l13, label %l14
l13:
  %t40 = load i8*, i8** %t2
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t40)
  br label %l14
l14:
  %t41 = call i32 @false_func()
  %t42 = icmp ne i32 %t41, 0
  br i1 %t42, label %l15, label %l16
l15:
  %t43 = load i8*, i8** %t3
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t43)
  br label %l16
l16:
  %t44 = add i32 0, 0
  ret i32 %t44
}
@.str0 = private unnamed_addr constant [4 x i8] c"Yes\00"
@.str1 = private unnamed_addr constant [3 x i8] c"No\00"

