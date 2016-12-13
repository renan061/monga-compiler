declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define i32 @noreturn() {
  %t1 = getelementptr [10 x i8], [10 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t1)
  ret i32 0
}
@.str0 = private unnamed_addr constant [10 x i8] c"noreturn
\00"

define double @foo(double %t1, double %t2) {
  %t3 = alloca double
  store double %t1, double* %t3
  %t4 = alloca double
  store double %t2, double* %t4
  %t5 = load double, double* %t3
  %t6 = load double, double* %t4
  %t7 = fdiv double %t5, %t6
  ret double %t7
  ret double 0x0
}
define i32 @main() {
  %t1 = alloca i8
  %t2 = alloca i32
  %t3 = alloca i32
  %t4 = alloca i8
  %t5 = alloca double
  %t6 = alloca i8*
  %t7 = alloca i32*
  %t8 = add i32 10, 0
  %t9 = trunc i32 %t8 to i8
  store i8 %t9, i8* %t1
  %t10 = add i32 10, 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t10)
  %t11 = load i8, i8* %t1
  %t12 = sext i8 %t11 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t12)
  %t13 = fadd double 0x4016000000000000, 0x0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t13)
  %t14 = load i8, i8* %t1
  %t15 = sext i8 %t14 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t15)
  %t16 = getelementptr [8 x i8], [8 x i8]* @.str1 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t16)
  %t17 = add i32 2, 0
  store i32 %t17, i32* %t2
  %t18 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t18)
  %t19 = load i8, i8* %t1
  %t20 = sext i8 %t19 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t20)
  %t21 = add i32 1, 0
  %t22 = sext i32 %t21 to i64
  %t23 = mul i64 %t22, 1
  %t24 = call i8* @malloc(i64 %t23)
  store i8* %t24, i8** %t6
  %t25 = load i8*, i8** %t6
  %t26 = add i32 0, 0
  %t27 = getelementptr i8, i8* %t25, i32 %t26
  %t28 = add i32 65, 0
  %t29 = trunc i32 %t28 to i8
  store i8 %t29, i8* %t27
  %t30 = load i8*, i8** %t6
  %t31 = add i32 0, 0
  %t32 = getelementptr i8, i8* %t30, i32 %t31
  %t33 = load i8, i8* %t32
  %t34 = sext i8 %t33 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t34)
  %t35 = load i8, i8* %t1
  %t36 = sext i8 %t35 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t36)
  %t37 = fadd double 0x4018000000000000, 0x0
  %t38 = fadd double 0x4008000000000000, 0x0
  %t39 = call double @foo(double %t37, double %t38)
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t39)
  %t40 = load i8, i8* %t1
  %t41 = sext i8 %t40 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t41)
  %t42 = call i32 @noreturn()
  %t43 = add i32 3, 0
  %t44 = sext i32 %t43 to i64
  %t45 = mul i64 %t44, 4
  %t46 = call i8* @malloc(i64 %t45)
  %t47 = bitcast i8* %t46 to i32*
  store i32* %t47, i32** %t7
  %t48 = load i32*, i32** %t7
  %t49 = add i32 0, 0
  %t50 = getelementptr i32, i32* %t48, i32 %t49
  %t51 = add i32 10, 0
  store i32 %t51, i32* %t50
  %t52 = load i32*, i32** %t7
  %t53 = add i32 1, 0
  %t54 = getelementptr i32, i32* %t52, i32 %t53
  %t55 = add i32 20, 0
  store i32 %t55, i32* %t54
  %t56 = load i32*, i32** %t7
  %t57 = add i32 2, 0
  %t58 = getelementptr i32, i32* %t56, i32 %t57
  %t59 = add i32 30, 0
  store i32 %t59, i32* %t58
  %t60 = load i32*, i32** %t7
  %t61 = add i32 0, 0
  %t62 = getelementptr i32, i32* %t60, i32 %t61
  %t63 = load i32, i32* %t62
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t63)
  %t64 = load i8, i8* %t1
  %t65 = sext i8 %t64 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t65)
  %t66 = load i32*, i32** %t7
  %t67 = add i32 1, 0
  %t68 = getelementptr i32, i32* %t66, i32 %t67
  %t69 = load i32, i32* %t68
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t69)
  %t70 = load i8, i8* %t1
  %t71 = sext i8 %t70 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t71)
  %t72 = load i32*, i32** %t7
  %t73 = add i32 2, 0
  %t74 = getelementptr i32, i32* %t72, i32 %t73
  %t75 = load i32, i32* %t74
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t75)
  %t76 = load i8, i8* %t1
  %t77 = sext i8 %t76 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t77)
  %t78 = add i32 10, 0
  %t79 = sitofp i32 %t78 to double
  %t80 = add i32 2, 0
  %t81 = sitofp i32 %t80 to double
  %t82 = call double @foo(double %t79, double %t81)
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t82)
  %t83 = load i8, i8* %t1
  %t84 = sext i8 %t83 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t84)
  %t85 = load i8*, i8** %t6
  %t86 = add i32 0, 0
  %t87 = getelementptr i8, i8* %t85, i32 %t86
  %t88 = load i8, i8* %t87
  %t89 = sext i8 %t88 to i32
  store i32 %t89, i32* %t2
  %t90 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t90)
  %t91 = load i8, i8* %t1
  %t92 = sext i8 %t91 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t92)
  %t93 = add i32 66, 0
  %t94 = trunc i32 %t93 to i8
  store i8 %t94, i8* %t4
  %t95 = load i8, i8* %t4
  %t96 = sext i8 %t95 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t96)
  %t97 = load i8, i8* %t1
  %t98 = sext i8 %t97 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t98)
  %t99 = add i32 10, 0
  %t100 = sub i32 0, %t99
  store i32 %t100, i32* %t2
  %t101 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t101)
  %t102 = load i8, i8* %t1
  %t103 = sext i8 %t102 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t103)
  %t104 = fadd double 0x4025fae140000000, 0x0
  %t105 = fsub double 0x0, %t104
  store double %t105, double* %t5
  %t106 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t106)
  %t107 = load i8, i8* %t1
  %t108 = sext i8 %t107 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t108)
  %t109 = load i32, i32* %t2
  %t110 = add i32 10, 0
  %t111 = add i32 %t109, %t110
  store i32 %t111, i32* %t2
  %t112 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t112)
  %t113 = load i8, i8* %t1
  %t114 = sext i8 %t113 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t114)
  %t115 = fadd double 0x4002666660000000, 0x0
  %t116 = fadd double 0x3fd3333340000000, 0x0
  %t117 = fsub double %t115, %t116
  %t118 = load i32, i32* %t2
  %t119 = sitofp i32 %t118 to double
  %t120 = fsub double %t117, %t119
  store double %t120, double* %t5
  %t121 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t121)
  %t122 = load i8, i8* %t1
  %t123 = sext i8 %t122 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t123)
  %t124 = add i32 2, 0
  %t125 = add i32 750, 0
  %t126 = sub i32 0, %t125
  %t127 = mul i32 %t124, %t126
  store i32 %t127, i32* %t2
  %t128 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t128)
  %t129 = load i8, i8* %t1
  %t130 = sext i8 %t129 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t130)
  %t131 = add i32 2, 0
  %t132 = sitofp i32 %t131 to double
  %t133 = add i32 2, 0
  %t134 = sitofp i32 %t133 to double
  %t135 = call double @foo(double %t132, double %t134)
  %t136 = fadd double 0x4008000000000000, 0x0
  %t137 = fdiv double %t135, %t136
  store double %t137, double* %t5
  %t138 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t138)
  %t139 = load i8, i8* %t1
  %t140 = sext i8 %t139 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t140)
  %t141 = add i32 0, 0
  ret i32 %t141
  ret i32 0
}
@.str1 = private unnamed_addr constant [8 x i8] c"string
\00"

