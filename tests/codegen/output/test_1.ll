target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i32 @puts(i8*)
declare i8* @malloc(i64)
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"

define i32 @main(i32 %t1, i32 %t2) {
  %t3 = alloca i32
  store i32 %t1, i32* %t3
  %t4 = alloca i32
  store i32 %t2, i32* %t4
  %t5 = alloca i32*
  %t6 = add i32 10, 0
;ExpNew
  %t7 = sext i32 %t6 to i64
  %t8 = mul i64 %t7, 4
  %t9 = call i8* @malloc(i64 %t8)
  %t10 = bitcast i8* %t9 to i32*
;
  store i32* %t10, i32** %t5
  %t11 = load i32*, i32** %t5
  %t12 = add i32 0, 0
  %t13 = getelementptr inbounds i32, i32* %t11, i32 %t12
  %t14 = add i32 10, 0
  store i32 %t14, i32* %t13
  %t15 = load i32*, i32** %t5
  %t16 = add i32 0, 0
  %t17 = getelementptr inbounds i32, i32* %t15, i32 %t16
  %t18 = load i32, i32* %t17
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t18)
  %t19 = getelementptr inbounds [1 x i8], [1 x i8]* @.str0 , i32 0, i32 0
  call i32 @puts(i8* %t19)
  %t20 = add i32 0, 0
  ret i32 %t20
}
@.str0 = private unnamed_addr constant [1 x i8] c"\00"

