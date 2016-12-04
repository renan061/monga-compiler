declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i32 @puts(i8*)
declare i8* @malloc(i64)
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"

define i32 @main() {
  %t1 = alloca i32
  %t2 = alloca i32
  %t3 = alloca i8*
  %t4 = add i32 1, 0
;ExpNew
  %t5 = sext i32 %t4 to i64
  %t6 = mul i64 %t5, 1
  %t7 = call i8* @malloc(i64 %t6)
;
  store i8* %t7, i8** %t3
  %t8 = load i8*, i8** %t3
  %t9 = add i32 0, 0
  %t10 = getelementptr inbounds i8, i8* %t8, i32 %t9
  %t11 = add i32 65, 0
  %t12 = sitofp i32 %t11 to i8
  store i8 %t12, i8* %t10
  %t13 = load i8*, i8** %t3
  %t14 = add i32 0, 0
  %t15 = getelementptr inbounds i8, i8* %t13, i32 %t14
  %t16 = load i8, i8* %t15
  call i32 @putchar(i32 %t16)
  %t17 = getelementptr inbounds [1 x i8], [1 x i8]* @.str0 , i32 0, i32 0
  call i32 @puts(i8* %t17)
  %t18 = add i32 0, 0
  ret i32 %t18
}
@.str0 = private unnamed_addr constant [1 x i8] c"\00"

