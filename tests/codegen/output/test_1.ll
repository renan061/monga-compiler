target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @puts(i8*)

define i32 @main(i32 %t1, i32 %t2) {
  %t3 = alloca i32
  %t4 = alloca i32
  %t5 = add i32 65, 0
  %t6 = add i32 10, 0
  %t7 = sub i32 0, %t6
  %t8 = add i32 %t5, %t7
  %t9 = add i32 10, 0
  %t10 = add i32 %t8, %t9
  %t11 = add i32 10, 0
  %t12 = sub i32 %t10, %t11
  %t13 = add i32 10, 0
  %t14 = add i32 %t12, %t13
  %t15 = add i32 2, 0
  %t16 = mul i32 %t14, %t15
  %t17 = add i32 2, 0
  %t18 = sdiv i32 %t16, %t17
  store i32 %t18, i32* %t4
  %t19 = load i32, i32* %t4
  call i32 @putchar(i32 %t19)
  %t20 = alloca i8
  %t21 = alloca i8*
  %t22 = getelementptr inbounds [11 x i8], [11 x i8]* @.str22 , i32 0, i32 0
  store i8* %t22, i8** %t21
  %t23 = getelementptr inbounds [3 x i8], [3 x i8]* @.str23 , i32 0, i32 0
  call i32 @puts(i8* %t23)
  %t24 = load i8*, i8** %t21
  call i32 @puts(i8* %t24)
  %t25 = add i32 0, 0
  store i32 %t25, i32* %t3
  %t26 = load i32, i32* %t3
  ret i32 %t26
}

@.str22 = private unnamed_addr constant [11 x i8] c"uma string\00"
@.str23 = private unnamed_addr constant [3 x i8] c" 
\00"
