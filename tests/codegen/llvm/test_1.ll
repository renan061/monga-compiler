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
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t11)
  %t12 = fadd double 0x4016000000000000, 0x0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t12)
  %t13 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t13)
  %t14 = getelementptr [8 x i8], [8 x i8]* @.str1 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t14)
  %t15 = add i32 2, 0
  store i32 %t15, i32* %t2
  %t16 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t16)
  %t17 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t17)
  %t18 = add i32 1, 0
  %t19 = sext i32 %t18 to i64
  %t20 = mul i64 %t19, 1
  %t21 = call i8* @malloc(i64 %t20)
  store i8* %t21, i8** %t6
  %t22 = load i8*, i8** %t6
  %t23 = add i32 0, 0
  %t24 = getelementptr i8, i8* %t22, i32 %t23
  %t25 = add i32 65, 0
  %t26 = trunc i32 %t25 to i8
  store i8 %t26, i8* %t24
  %t27 = load i8*, i8** %t6
  %t28 = add i32 0, 0
  %t29 = getelementptr i8, i8* %t27, i32 %t28
  %t30 = load i8, i8* %t29
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t30)
  %t31 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t31)
  %t32 = fadd double 0x4018000000000000, 0x0
  %t33 = fadd double 0x4008000000000000, 0x0
  %t34 = call double @foo(double %t32, double %t33)
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t34)
  %t35 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t35)
  %t36 = call i32 @noreturn()
  %t37 = add i32 3, 0
  %t38 = sext i32 %t37 to i64
  %t39 = mul i64 %t38, 4
  %t40 = call i8* @malloc(i64 %t39)
  %t41 = bitcast i8* %t40 to i32*
  store i32* %t41, i32** %t7
  %t42 = load i32*, i32** %t7
  %t43 = add i32 0, 0
  %t44 = getelementptr i32, i32* %t42, i32 %t43
  %t45 = add i32 10, 0
  store i32 %t45, i32* %t44
  %t46 = load i32*, i32** %t7
  %t47 = add i32 1, 0
  %t48 = getelementptr i32, i32* %t46, i32 %t47
  %t49 = add i32 20, 0
  store i32 %t49, i32* %t48
  %t50 = load i32*, i32** %t7
  %t51 = add i32 2, 0
  %t52 = getelementptr i32, i32* %t50, i32 %t51
  %t53 = add i32 30, 0
  store i32 %t53, i32* %t52
  %t54 = load i32*, i32** %t7
  %t55 = add i32 0, 0
  %t56 = getelementptr i32, i32* %t54, i32 %t55
  %t57 = load i32, i32* %t56
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t57)
  %t58 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t58)
  %t59 = load i32*, i32** %t7
  %t60 = add i32 1, 0
  %t61 = getelementptr i32, i32* %t59, i32 %t60
  %t62 = load i32, i32* %t61
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t62)
  %t63 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t63)
  %t64 = load i32*, i32** %t7
  %t65 = add i32 2, 0
  %t66 = getelementptr i32, i32* %t64, i32 %t65
  %t67 = load i32, i32* %t66
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t67)
  %t68 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t68)
  %t69 = add i32 10, 0
  %t70 = sitofp i32 %t69 to double
  %t71 = add i32 2, 0
  %t72 = sitofp i32 %t71 to double
  %t73 = call double @foo(double %t70, double %t72)
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t73)
  %t74 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t74)
  %t75 = load i8*, i8** %t6
  %t76 = add i32 0, 0
  %t77 = getelementptr i8, i8* %t75, i32 %t76
  %t78 = load i8, i8* %t77
  %t79 = sext i8 %t78 to i32
  store i32 %t79, i32* %t2
  %t80 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t80)
  %t81 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t81)
  %t82 = add i32 66, 0
  %t83 = trunc i32 %t82 to i8
  store i8 %t83, i8* %t4
  %t84 = load i8, i8* %t4
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t84)
  %t85 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t85)
  %t86 = add i32 10, 0
  %t87 = sub i32 0, %t86
  store i32 %t87, i32* %t2
  %t88 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t88)
  %t89 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t89)
  %t90 = fadd double 0x4025fae140000000, 0x0
  %t91 = fsub double 0x0, %t90
  store double %t91, double* %t5
  %t92 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t92)
  %t93 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t93)
  %t94 = load i32, i32* %t2
  %t95 = add i32 10, 0
  %t96 = add i32 %t94, %t95
  store i32 %t96, i32* %t2
  %t97 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t97)
  %t98 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t98)
  %t99 = fadd double 0x4002666660000000, 0x0
  %t100 = fadd double 0x3fd3333340000000, 0x0
  %t101 = fsub double %t99, %t100
  %t102 = load i32, i32* %t2
  %t103 = sitofp i32 %t102 to double
  %t104 = fsub double %t101, %t103
  store double %t104, double* %t5
  %t105 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t105)
  %t106 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t106)
  %t107 = add i32 2, 0
  %t108 = add i32 750, 0
  %t109 = sub i32 0, %t108
  %t110 = mul i32 %t107, %t109
  store i32 %t110, i32* %t2
  %t111 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t111)
  %t112 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t112)
  %t113 = add i32 2, 0
  %t114 = sitofp i32 %t113 to double
  %t115 = add i32 2, 0
  %t116 = sitofp i32 %t115 to double
  %t117 = call double @foo(double %t114, double %t116)
  %t118 = fadd double 0x4008000000000000, 0x0
  %t119 = fdiv double %t117, %t118
  store double %t119, double* %t5
  %t120 = load double, double* %t5
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t120)
  %t121 = load i8, i8* %t1
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t121)
  %t122 = add i32 0, 0
  ret i32 %t122
  ret i32 0
}
@.str1 = private unnamed_addr constant [8 x i8] c"string
\00"

