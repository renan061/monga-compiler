target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i32 @puts(i8*)
declare i8* @malloc(i64)
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"

define i32 @main() {
  %t1 = alloca i32
  %t2 = add i32 0, 0
  store i32 %t2, i32* %t1
  br label %l1
l1:
  %t3 = load i32, i32* %t1
  %t4 = add i32 10, 0
  %t5 = icmp slt i32 %t3, %t4
  %t6 = zext i1 %t5 to i32
  %t7 = icmp ne i32 %t6, 0
  br i1 %t7, label %l2, label %l3
l2:
  %t8 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t8)
  %t9 = load i32, i32* %t1
  %t10 = add i32 1, 0
  %t11 = add i32 %t9, %t10
  store i32 %t11, i32* %t1
  br label %l1
l3:
  %t12 = getelementptr inbounds [1 x i8], [1 x i8]* @.str0 , i32 0, i32 0
  call i32 @puts(i8* %t12)
  %t13 = add i32 0, 0
  ret i32 %t13
}
@.str0 = private unnamed_addr constant [1 x i8] c"\00"

