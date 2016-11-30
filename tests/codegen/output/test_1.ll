target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @puts(i8*)

define i32 @main(i32 %t1, i32 %t2) {
  %t3 = alloca i32
  %t4 = add i32 65, 0
  %t5 = add i32 10, 0
  %t6 = sub i32 0, %t5
  %t7 = add i32 %t4, %t6
  %t8 = add i32 10, 0
  %t9 = add i32 %t7, %t8
  %t10 = add i32 10, 0
  %t11 = sub i32 %t9, %t10
  %t12 = add i32 10, 0
  %t13 = add i32 %t11, %t12
  %t14 = add i32 2, 0
  %t15 = mul i32 %t13, %t14
  %t16 = add i32 2, 0
  %t17 = sdiv i32 %t15, %t16
  store i32 %t17, i32* %t3
  %t18 = load i32, i32* %t3
  call i32 @putchar(i32 %t18)
  %t19 = alloca i8
  %t20 = alloca i8*
  %t21 = getelementptr inbounds [11 x i8], [11 x i8]* @.str21 , i32 0, i32 0
  store i8* %t21, i8** %t20
  %t22 = getelementptr inbounds [3 x i8], [3 x i8]* @.str22 , i32 0, i32 0
  call i32 @puts(i8* %t22)
  %t23 = load i8*, i8** %t20
  call i32 @puts(i8* %t23)
; TODO return
  ret i32 0
}

@.str21 = private unnamed_addr constant [11 x i8] c"uma string\00"
@.str22 = private unnamed_addr constant [3 x i8] c" 
\00"
