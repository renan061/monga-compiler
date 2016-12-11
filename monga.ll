target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define i32 @main() {
  %t1 = fadd double 0x3ff0000000000000, 0x0
  %t2 = fadd double 0x4004000000000000, 0x0
  %t3 = fcmp olt double %t1, %t2
  %t4 = zext i1 %t3 to i32
  %t5 = icmp ne i32 %t4, 0
  br i1 %t5, label %l1, label %l2
l1:
  br label %l3
l2:
  br label %l3
l3:
  %t6 = phi i32 [1, %l1], [0, %l2]
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t6)
  %t7 = getelementptr inbounds [2 x i8], [2 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t7)
  %t8 = add i32 0, 0
  ret i32 %t8
}
@.str0 = private unnamed_addr constant [2 x i8] c"
\00"

