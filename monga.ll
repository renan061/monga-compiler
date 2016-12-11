target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i32 @puts(i8*)
declare i8* @malloc(i64)
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"

define i32 @main() {
  %t1 = alloca i8
  %t2 = add i32 65, 0
  %t3 = trunc i32 %t2 to i8
  store i8 %t3, i8* %t1
;if
  %t4 = add i32 1, 0
  %t5 = add i32 2, 0
  %t6 = icmp sgt i32 %t4, %t5
  %t7 = icmp ne i1 %t6, 0
  br i1 %t7, label %l1, label %l2
l1:
  %t8 = load i8, i8* %t1
  %t9 = sext i8 %t8 to i32
  call i32 @putchar(i32 %t9)
  br label %l2
l2:
;endif
  %t10 = add i32 0, 0
  ret i32 %t10
}
