declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define i32* @arrayfy(i32 %t1, i32 %t2, i32 %t3) {
  %t4 = alloca i32
  store i32 %t1, i32* %t4
  %t5 = alloca i32
  store i32 %t2, i32* %t5
  %t6 = alloca i32
  store i32 %t3, i32* %t6
  %t7 = alloca i32*
  %t8 = add i32 3, 0
  %t9 = sext i32 %t8 to i64
  %t10 = mul i64 %t9, 4
  %t11 = call i8* @malloc(i64 %t10)
  %t12 = bitcast i8* %t11 to i32*
  store i32* %t12, i32** %t7
  %t13 = load i32*, i32** %t7
  %t14 = add i32 0, 0
  %t15 = getelementptr i32, i32* %t13, i32 %t14
  %t16 = load i32, i32* %t4
  store i32 %t16, i32* %t15
  %t17 = load i32*, i32** %t7
  %t18 = add i32 1, 0
  %t19 = getelementptr i32, i32* %t17, i32 %t18
  %t20 = load i32, i32* %t5
  store i32 %t20, i32* %t19
  %t21 = load i32*, i32** %t7
  %t22 = add i32 2, 0
  %t23 = getelementptr i32, i32* %t21, i32 %t22
  %t24 = load i32, i32* %t6
  store i32 %t24, i32* %t23
  %t25 = load i32*, i32** %t7
  ret i32* %t25
  ret i32* null
}
define void @main() {
  %t1 = alloca i32*
  %t2 = alloca i32
  %t3 = alloca i32
  %t4 = alloca i32
  %t5 = alloca i8
  %t6 = add i32 45, 0
  %t7 = trunc i32 %t6 to i8
  store i8 %t7, i8* %t5
  %t8 = add i32 2, 0
  store i32 %t8, i32* %t2
  %t9 = load i32, i32* %t2
  %t10 = add i32 1, 0
  %t11 = add i32 %t9, %t10
  store i32 %t11, i32* %t3
  %t12 = load i32, i32* %t3
  %t13 = add i32 3, 0
  %t14 = sdiv i32 %t12, %t13
  %t15 = add i32 3, 0
  %t16 = add i32 %t14, %t15
  store i32 %t16, i32* %t4
  %t17 = load i32, i32* %t2
  %t18 = load i32, i32* %t3
  %t19 = load i32, i32* %t4
  %t20 = call i32* @arrayfy(i32 %t17, i32 %t18, i32 %t19)
  store i32* %t20, i32** %t1
  %t21 = load i32*, i32** %t1
  %t22 = add i32 0, 0
  %t23 = getelementptr i32, i32* %t21, i32 %t22
  %t24 = load i32, i32* %t23
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t24)
  %t25 = load i8, i8* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t25)
  %t26 = load i32*, i32** %t1
  %t27 = add i32 1, 0
  %t28 = getelementptr i32, i32* %t26, i32 %t27
  %t29 = load i32, i32* %t28
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t29)
  %t30 = load i8, i8* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t30)
  %t31 = load i32*, i32** %t1
  %t32 = add i32 2, 0
  %t33 = getelementptr i32, i32* %t31, i32 %t32
  %t34 = load i32, i32* %t33
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t34)
  ret void
  ret void
}
