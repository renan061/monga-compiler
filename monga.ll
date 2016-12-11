target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i32 @puts(i8*)
declare i8* @malloc(i64)
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"

define i32 @main() {
  %t1 = add i32 1, 0
  %t2 = icmp ne i32 %t1, 0
  br i1 %t2, label %l1, label %l2
l1:
  %t3 = getelementptr inbounds [4 x i8], [4 x i8]* @.str0 , i32 0, i32 0
  call i32 @puts(i8* %t3)
  %t4 = add i32 0, 0
  ret i32 %t4
  br label %l3
l2:
  %t5 = getelementptr inbounds [3 x i8], [3 x i8]* @.str1 , i32 0, i32 0
  call i32 @puts(i8* %t5)
  br label %l3
l3:
  %t6 = add i32 0, 0
  ret i32 %t6
}
@.str0 = private unnamed_addr constant [4 x i8] c"Yes\00"
@.str1 = private unnamed_addr constant [3 x i8] c"No\00"

