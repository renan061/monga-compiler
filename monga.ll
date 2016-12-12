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
  %t3 = getelementptr i32, i32* @a, i32 0
  %t4 = load i32, i32* %t3
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t4)
  %t5 = getelementptr [2 x i8], [2 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t5)
  %t6 = getelementptr i32, i32* @a, i32 0
  %t7 = add i32 6, 0
  store i32 %t7, i32* %t6
  call void @foo()
  %t8 = getelementptr i32, i32* @a, i32 0
  %t9 = load i32, i32* %t8
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t9)
  %t10 = getelementptr [2 x i8], [2 x i8]* @.str1 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t10)
  ret i32 0
}
@.str0 = private unnamed_addr constant [2 x i8] c"
\00"
@.str1 = private unnamed_addr constant [2 x i8] c"
\00"

