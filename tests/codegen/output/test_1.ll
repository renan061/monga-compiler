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
  %t5 = alloca i32
  %t6 = add i32 65, 0
  %t7 = add i32 10, 0
  %t8 = sub i32 0, %t7
  %t9 = add i32 %t6, %t8
  %t10 = add i32 10, 0
  %t11 = add i32 %t9, %t10
  %t12 = add i32 10, 0
  %t13 = sub i32 %t11, %t12
  %t14 = add i32 10, 0
  %t15 = add i32 %t13, %t14
  %t16 = add i32 2, 0
  %t17 = mul i32 %t15, %t16
  %t18 = add i32 2, 0
  %t19 = sdiv i32 %t17, %t18
  store i32 %t19, i32* %t5
  %t20 = load i32, i32* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t20)
  %t21 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1 , i32 0, i32 0
  call i32 @puts(i8* %t21)
  %t22 = alloca i8
  %t23 = alloca i8*
  %t24 = getelementptr inbounds [11 x i8], [11 x i8]* @.str2 , i32 0, i32 0
  store i8* %t24, i8** %t23
  %t25 = getelementptr inbounds [2 x i8], [2 x i8]* @.str3 , i32 0, i32 0
  call i32 @puts(i8* %t25)
  %t26 = load i8*, i8** %t23
  call i32 @puts(i8* %t26)
  %t27 = add i32 32, 0
  %t28 = add i32 33, 0
  %t29 = call i32 @foo(i32 %t27, i32 %t28)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t29)
  %t30 = add i32 10, 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t30)
  %t31 = call i32 @zero()
  %t32 = add i32 65, 0
  %t33 = add i32 %t31, %t32
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t33)
  %t34 = getelementptr inbounds [2 x i8], [2 x i8]* @.str4 , i32 0, i32 0
  call i32 @puts(i8* %t34)
  call void @testprint()
  %t35 = add i32 4, 0
  %t36 = add i32 3, 0
  %t37 = sdiv i32 %t35, %t36
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t37)
  %t38 = getelementptr inbounds [1 x i8], [1 x i8]* @.str5 , i32 0, i32 0
  call i32 @puts(i8* %t38)
  %t39 = fadd double 0x3ff8000000000000, 0.0
  %t40 = fadd double 0x4008000000000000, 0.0
  %t41 = fdiv double %t39, %t40
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t41)
  %t42 = getelementptr inbounds [1 x i8], [1 x i8]* @.str6 , i32 0, i32 0
  call i32 @puts(i8* %t42)
  %t43 = add i32 0, 0
  ret i32 %t43
}
@.str1 = private unnamed_addr constant [2 x i8] c"
\00"
@.str2 = private unnamed_addr constant [11 x i8] c"uma string\00"
@.str3 = private unnamed_addr constant [2 x i8] c"
\00"
@.str4 = private unnamed_addr constant [2 x i8] c"
\00"
@.str5 = private unnamed_addr constant [1 x i8] c"\00"
@.str6 = private unnamed_addr constant [1 x i8] c"\00"

