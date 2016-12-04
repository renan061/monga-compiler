declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i32 @puts(i8*)
declare i8* @malloc(i64)
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"

define double @foo(double %t1, double %t2) {
  %t3 = alloca double
  store double %t1, double* %t3
  %t4 = alloca double
  store double %t2, double* %t4
  %t5 = load double, double* %t3
  %t6 = load double, double* %t4
  %t7 = fdiv double %t5, %t6
  ret double %t7
}
define i32 @main() {
  %t1 = alloca i32
  %t2 = alloca i32
  %t3 = alloca i8
  %t4 = alloca double
  %t5 = alloca i8*
  %t6 = alloca i32*
  %t7 = add i32 10, 0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t7)
  %t8 = getelementptr inbounds [1 x i8], [1 x i8]* @.str0 , i32 0, i32 0
  call i32 @puts(i8* %t8)
  %t9 = fadd double 0x4016000000000000, 0.0
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t9)
  %t10 = getelementptr inbounds [1 x i8], [1 x i8]* @.str1 , i32 0, i32 0
  call i32 @puts(i8* %t10)
  %t11 = getelementptr inbounds [7 x i8], [7 x i8]* @.str2 , i32 0, i32 0
  call i32 @puts(i8* %t11)
  %t12 = add i32 2, 0
  store i32 %t12, i32* %t1
  %t13 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t13)
  %t14 = getelementptr inbounds [1 x i8], [1 x i8]* @.str3 , i32 0, i32 0
  call i32 @puts(i8* %t14)
  %t15 = add i32 1, 0
  %t16 = sext i32 %t15 to i64
  %t17 = mul i64 %t16, 1
  %t18 = call i8* @malloc(i64 %t17)
  store i8* %t18, i8** %t5
  %t19 = load i8*, i8** %t5
  %t20 = add i32 0, 0
  %t21 = getelementptr inbounds i8, i8* %t19, i32 %t20
  %t22 = add i32 65, 0
  %t23 = trunc i32 %t22 to i8
  store i8 %t23, i8* %t21
  %t24 = load i8*, i8** %t5
  %t25 = add i32 0, 0
  %t26 = getelementptr inbounds i8, i8* %t24, i32 %t25
  %t27 = load i8, i8* %t26
    %t28 = sext i8 %t27 to i32
  call i32 @putchar(i32 %t28)
  %t29 = getelementptr inbounds [1 x i8], [1 x i8]* @.str4 , i32 0, i32 0
  call i32 @puts(i8* %t29)
  %t30 = fadd double 0x4018000000000000, 0.0
  %t31 = fadd double 0x4008000000000000, 0.0
  %t32 = call double @foo(double %t30, double %t31)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t32)
  %t33 = getelementptr inbounds [1 x i8], [1 x i8]* @.str5 , i32 0, i32 0
  call i32 @puts(i8* %t33)
  %t34 = add i32 3, 0
  %t35 = sext i32 %t34 to i64
  %t36 = mul i64 %t35, 4
  %t37 = call i8* @malloc(i64 %t36)
  %t38 = bitcast i8* %t37 to i32*
  store i32* %t38, i32** %t6
  %t39 = load i32*, i32** %t6
  %t40 = add i32 0, 0
  %t41 = getelementptr inbounds i32, i32* %t39, i32 %t40
  %t42 = add i32 10, 0
  store i32 %t42, i32* %t41
  %t43 = load i32*, i32** %t6
  %t44 = add i32 1, 0
  %t45 = getelementptr inbounds i32, i32* %t43, i32 %t44
  %t46 = add i32 20, 0
  store i32 %t46, i32* %t45
  %t47 = load i32*, i32** %t6
  %t48 = add i32 2, 0
  %t49 = getelementptr inbounds i32, i32* %t47, i32 %t48
  %t50 = add i32 30, 0
  store i32 %t50, i32* %t49
  %t51 = load i32*, i32** %t6
  %t52 = add i32 0, 0
  %t53 = getelementptr inbounds i32, i32* %t51, i32 %t52
  %t54 = load i32, i32* %t53
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t54)
  %t55 = getelementptr inbounds [1 x i8], [1 x i8]* @.str6 , i32 0, i32 0
  call i32 @puts(i8* %t55)
  %t56 = load i32*, i32** %t6
  %t57 = add i32 1, 0
  %t58 = getelementptr inbounds i32, i32* %t56, i32 %t57
  %t59 = load i32, i32* %t58
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t59)
  %t60 = getelementptr inbounds [1 x i8], [1 x i8]* @.str7 , i32 0, i32 0
  call i32 @puts(i8* %t60)
  %t61 = load i32*, i32** %t6
  %t62 = add i32 2, 0
  %t63 = getelementptr inbounds i32, i32* %t61, i32 %t62
  %t64 = load i32, i32* %t63
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t64)
  %t65 = getelementptr inbounds [1 x i8], [1 x i8]* @.str8 , i32 0, i32 0
  call i32 @puts(i8* %t65)
  %t66 = add i32 10, 0
  %t67 = sitofp i32 %t66 to double
  %t68 = add i32 2, 0
  %t69 = sitofp i32 %t68 to double
  %t70 = call double @foo(double %t67, double %t69)
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t70)
  %t71 = getelementptr inbounds [1 x i8], [1 x i8]* @.str9 , i32 0, i32 0
  call i32 @puts(i8* %t71)
  %t72 = load i8*, i8** %t5
  %t73 = add i32 0, 0
  %t74 = getelementptr inbounds i8, i8* %t72, i32 %t73
  %t75 = load i8, i8* %t74
  %t76 = sext i8 %t75 to i32
  store i32 %t76, i32* %t1
  %t77 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t77)
  %t78 = getelementptr inbounds [1 x i8], [1 x i8]* @.str10 , i32 0, i32 0
  call i32 @puts(i8* %t78)
  %t79 = add i32 66, 0
  %t80 = trunc i32 %t79 to i8
  store i8 %t80, i8* %t3
  %t81 = load i8, i8* %t3
    %t82 = sext i8 %t81 to i32
  call i32 @putchar(i32 %t82)
  %t83 = getelementptr inbounds [1 x i8], [1 x i8]* @.str11 , i32 0, i32 0
  call i32 @puts(i8* %t83)
  %t84 = add i32 10, 0
  %t85 = sub i32 0, %t84
  store i32 %t85, i32* %t1
  %t86 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t86)
  %t87 = getelementptr inbounds [1 x i8], [1 x i8]* @.str12 , i32 0, i32 0
  call i32 @puts(i8* %t87)
  %t88 = load i32, i32* %t1
  %t89 = add i32 10, 0
  %t90 = add i32 %t88, %t89
  store i32 %t90, i32* %t1
  %t91 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t91)
  %t92 = getelementptr inbounds [1 x i8], [1 x i8]* @.str13 , i32 0, i32 0
  call i32 @puts(i8* %t92)
  %t93 = fadd double 0x4002666660000000, 0.0
  %t94 = fadd double 0x3fd3333340000000, 0.0
  %t95 = fsub double %t93, %t94
  %t96 = load i32, i32* %t1
  %t97 = sitofp i32 %t96 to double
  %t98 = fsub double %t95, %t97
  store double %t98, double* %t4
  %t99 = load double, double* %t4
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t99)
  %t100 = getelementptr inbounds [1 x i8], [1 x i8]* @.str14 , i32 0, i32 0
  call i32 @puts(i8* %t100)
  %t101 = add i32 2, 0
  %t102 = add i32 750, 0
  %t103 = sub i32 0, %t102
  %t104 = mul i32 %t101, %t103
  store i32 %t104, i32* %t1
  %t105 = load i32, i32* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t105)
  %t106 = getelementptr inbounds [1 x i8], [1 x i8]* @.str15 , i32 0, i32 0
  call i32 @puts(i8* %t106)
  %t107 = add i32 2, 0
  %t108 = sitofp i32 %t107 to double
  %t109 = add i32 2, 0
  %t110 = sitofp i32 %t109 to double
  %t111 = call double @foo(double %t108, double %t110)
  %t112 = fadd double 0x4008000000000000, 0.0
  %t113 = fdiv double %t111, %t112
  store double %t113, double* %t4
  %t114 = load double, double* %t4
  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t114)
  %t115 = getelementptr inbounds [1 x i8], [1 x i8]* @.str16 , i32 0, i32 0
  call i32 @puts(i8* %t115)
  %t116 = add i32 0, 0
  ret i32 %t116
}
@.str0 = private unnamed_addr constant [1 x i8] c"\00"
@.str1 = private unnamed_addr constant [1 x i8] c"\00"
@.str2 = private unnamed_addr constant [7 x i8] c"string\00"
@.str3 = private unnamed_addr constant [1 x i8] c"\00"
@.str4 = private unnamed_addr constant [1 x i8] c"\00"
@.str5 = private unnamed_addr constant [1 x i8] c"\00"
@.str6 = private unnamed_addr constant [1 x i8] c"\00"
@.str7 = private unnamed_addr constant [1 x i8] c"\00"
@.str8 = private unnamed_addr constant [1 x i8] c"\00"
@.str9 = private unnamed_addr constant [1 x i8] c"\00"
@.str10 = private unnamed_addr constant [1 x i8] c"\00"
@.str11 = private unnamed_addr constant [1 x i8] c"\00"
@.str12 = private unnamed_addr constant [1 x i8] c"\00"
@.str13 = private unnamed_addr constant [1 x i8] c"\00"
@.str14 = private unnamed_addr constant [1 x i8] c"\00"
@.str15 = private unnamed_addr constant [1 x i8] c"\00"
@.str16 = private unnamed_addr constant [1 x i8] c"\00"

