declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define i32 @main() {
  %t1 = alloca i32
  %t2 = alloca i32
  %t3 = alloca i32
  %t4 = add i32 5, 0
  store i32 %t4, i32* %t2
  %t5 = add i32 0, 0
  store i32 %t5, i32* %t3
  %t6 = load i32, i32* %t2
  %t7 = load i32, i32* %t3
  %t8 = icmp sgt i32 %t6, %t7
  br i1 %t8, label %l2, label %l1
l1:
  br label %l3
l2:
  br label %l3
l3:
  %t9 = phi i32 [1, %l1], [0, %l2]
  store i32 %t9, i32* %t1
  %t10 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t10)
  %t11 = getelementptr [2 x i8], [2 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t11)
  %t12 = load i32, i32* %t3
  %t13 = load i32, i32* %t2
  %t14 = icmp sgt i32 %t12, %t13
  br i1 %t14, label %l5, label %l4
l4:
  br label %l6
l5:
  br label %l6
l6:
  %t15 = phi i32 [1, %l4], [0, %l5]
  store i32 %t15, i32* %t1
  %t16 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t16)
  %t17 = add i32 0, 0
  ret i32 %t17
  ret i32 0
}
@.str0 = private unnamed_addr constant [2 x i8] c"
\00"

