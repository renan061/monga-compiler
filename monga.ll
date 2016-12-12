target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

@a = global i32 0
define void @foo() {
  %t1 = getelementptr i32, i32* @a, i32 0
  %t2 = add i32 10, 0
  store i32 %t2, i32* %t1
  ret void
}
define i32 @main() {
  %t1 = getelementptr i32, i32* @a, i32 0
  %t2 = add i32 5, 0
  store i32 %t2, i32* %t1
  ret i32 0
}
