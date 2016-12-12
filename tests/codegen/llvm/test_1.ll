target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define void @noreturn() {
  %t1 = getelementptr [10 x i8], [10 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t1)
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
  call void @noreturn()
  %t42 = add i32 3, 0
  %t43 = sext i32 %t42 to i64
  %t44 = mul i64 %t43, 4
  %t45 = call i8* @malloc(i64 %t44)
  %t46 = bitcast i8* %t45 to i32*
  store i32* %t46, i32** %t7
  %t47 = load i32*, i32** %t7
  %t48 = add i32 0, 0
  %t49 = getelementptr i32, i32* %t47, i32 %t48
  %t50 = add i32 10, 0
  store i32 %t50, i32* %t49
  %t51 = load i32*, i32** %t7
  %t52 = add i32 1, 0
  %t53 = getelementptr i32, i32* %t51, i32 %t52
  %t54 = add i32 20, 0
  store i32 %t54, i32* %t53
  %t55 = load i32*, i32** %t7
  %t56 = add i32 2, 0
  %t57 = getelementptr i32, i32* %t55, i32 %t56
  %t58 = add i32 30, 0
  store i32 %t58, i32* %t57
  %t59 = load i32*, i32** %t7
  %t60 = add i32 0, 0
  %t61 = getelementptr i32, i32* %t59, i32 %t60
  %t62 = load i32, i32* %t61
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t62)
  %t63 = load i8, i8* %t1
  %t64 = sext i8 %t63 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t64)
  %t65 = load i32*, i32** %t7
  %t66 = add i32 1, 0
  %t67 = getelementptr i32, i32* %t65, i32 %t66
  %t68 = load i32, i32* %t67
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t68)
  %t69 = load i8, i8* %t1
  %t70 = sext i8 %t69 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t70)
  %t71 = load i32*, i32** %t7
  %t72 = add i32 2, 0
  %t73 = getelementptr i32, i32* %t71, i32 %t72
  %t74 = load i32, i32* %t73
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t74)
  %t75 = load i8, i8* %t1
  %t76 = sext i8 %t75 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t76)
  %t77 = add i32 10, 0
  %t78 = sitofp i32 %t77 to double
  %t79 = add i32 2, 0
  %t80 = sitofp i32 %t79 to double
  %t81 = call double @foo(double %t78, double %t80)
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t81)
  %t82 = load i8, i8* %t1
  %t83 = sext i8 %t82 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t83)
  %t84 = load i8*, i8** %t6
  %t85 = add i32 0, 0
  %t86 = getelementptr i8, i8* %t84, i32 %t85
  %t87 = load i8, i8* %t86
  %t88 = sext i8 %t87 to i32
  store i32 %t88, i32* %t2
  %t89 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t89)
  %t90 = load i8, i8* %t1
  %t91 = sext i8 %t90 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t91)
  %t92 = add i32 66, 0
  %t93 = trunc i32 %t92 to i8
  store i8 %t93, i8* %t4
  %t94 = load i8, i8* %t4
  %t95 = sext i8 %t94 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t95)
  %t96 = load i8, i8* %t1
  %t97 = sext i8 %t96 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t97)
  %t98 = add i32 10, 0
  %t99 = sub i32 0, %t98
  store i32 %t99, i32* %t2
  %t100 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t100)
  %t101 = load i8, i8* %t1
  %t102 = sext i8 %t101 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t102)
  %t103 = fadd double 0x4025fae140000000, 0x0
  %t104 = fsub double 0x0, %t103
  store double %t104, double* %t5
  %t105 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t105)
  %t106 = load i8, i8* %t1
  %t107 = sext i8 %t106 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t107)
  %t108 = load i32, i32* %t2
  %t109 = add i32 10, 0
  %t110 = add i32 %t108, %t109
  store i32 %t110, i32* %t2
  %t111 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t111)
  %t112 = load i8, i8* %t1
  %t113 = sext i8 %t112 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t113)
  %t114 = fadd double 0x4002666660000000, 0x0
  %t115 = fadd double 0x3fd3333340000000, 0x0
  %t116 = fsub double %t114, %t115
  %t117 = load i32, i32* %t2
  %t118 = sitofp i32 %t117 to double
  %t119 = fsub double %t116, %t118
  store double %t119, double* %t5
  %t120 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t120)
  %t121 = load i8, i8* %t1
  %t122 = sext i8 %t121 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t122)
  %t123 = add i32 2, 0
  %t124 = add i32 750, 0
  %t125 = sub i32 0, %t124
  %t126 = mul i32 %t123, %t125
  store i32 %t126, i32* %t2
  %t127 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t127)
  %t128 = load i8, i8* %t1
  %t129 = sext i8 %t128 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t129)
  %t130 = add i32 2, 0
  %t131 = sitofp i32 %t130 to double
  %t132 = add i32 2, 0
  %t133 = sitofp i32 %t132 to double
  %t134 = call double @foo(double %t131, double %t133)
  %t135 = fadd double 0x4008000000000000, 0x0
  %t136 = fdiv double %t134, %t135
  store double %t136, double* %t5
  %t137 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t137)
  %t138 = load i8, i8* %t1
  %t139 = sext i8 %t138 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t139)
  %t140 = add i32 0, 0
  ret i32 %t140
}
@.str1 = private unnamed_addr constant [8 x i8] c"string
\00"

