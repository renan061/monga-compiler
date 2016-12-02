target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @puts(i8*)

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
  %t6 = add i32 32, 0
  %t7 = add i32 33, 0
  %t8 = call i32 @foo(i32 %t6, i32 %t7)
  call i32 @putchar(i32 %t8)
  %t9 = add i32 10, 0
  call i32 @putchar(i32 %t9)
  %t10 = call i32 @zero()
  %t11 = add i32 65, 0
  %t12 = add i32 %t10, %t11
  call i32 @putchar(i32 %t12)
  %t13 = getelementptr inbounds [2 x i8], [2 x i8]* @.str1 , i32 0, i32 0
  call i32 @puts(i8* %t13)
  call void @testprint()
  %t14 = add i32 0, 0
  store i32 %t14, i32* %t5
  %t15 = load i32, i32* %t5
  ret i32 %t15
}
@.str1 = private unnamed_addr constant [2 x i8] c"
\00"

