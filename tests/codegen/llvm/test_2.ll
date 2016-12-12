target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

@nl = global i8 0
define void @test_basic_if() {
  %t1 = getelementptr [11 x i8], [11 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t1)
  %t2 = add i32 1, 0
  %t3 = icmp ne i32 %t2, 0
  br i1 %t3, label %l1, label %l2
l1:
  %t4 = getelementptr [14 x i8], [14 x i8]* @.str1 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t4)
  br label %l2
l2:
  %t5 = getelementptr [13 x i8], [13 x i8]* @.str2 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t5)
  %t6 = getelementptr [11 x i8], [11 x i8]* @.str3 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t6)
  %t7 = add i32 0, 0
  %t8 = icmp ne i32 %t7, 0
  br i1 %t8, label %l3, label %l4
l3:
  %t9 = getelementptr [15 x i8], [15 x i8]* @.str4 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t9)
  br label %l4
l4:
  %t10 = getelementptr [13 x i8], [13 x i8]* @.str5 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t10)
  ret void
}
@.str0 = private unnamed_addr constant [11 x i8] c"Ok Pre-If
\00"
@.str1 = private unnamed_addr constant [14 x i8] c"Ok Inside-If
\00"
@.str2 = private unnamed_addr constant [13 x i8] c"Ok After-If
\00"
@.str3 = private unnamed_addr constant [11 x i8] c"Ok Pre-If
\00"
@.str4 = private unnamed_addr constant [15 x i8] c"Error False-If\00"
@.str5 = private unnamed_addr constant [13 x i8] c"Ok After-If
\00"

define void @test_basic_ifelse() {
  %t1 = getelementptr [15 x i8], [15 x i8]* @.str6 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t1)
  %t2 = add i32 1, 0
  %t3 = icmp ne i32 %t2, 0
  br i1 %t3, label %l1, label %l2
l1:
  %t4 = getelementptr [18 x i8], [18 x i8]* @.str7 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t4)
  br label %l3
l2:
  %t5 = getelementptr [26 x i8], [26 x i8]* @.str8 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t5)
  br label %l3
l3:
  %t6 = getelementptr [17 x i8], [17 x i8]* @.str9 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t6)
  %t7 = getelementptr [15 x i8], [15 x i8]* @.str10 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t7)
  %t8 = add i32 0, 0
  %t9 = icmp ne i32 %t8, 0
  br i1 %t9, label %l4, label %l5
l4:
  %t10 = getelementptr [27 x i8], [27 x i8]* @.str11 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t10)
  br label %l6
l5:
  %t11 = getelementptr [18 x i8], [18 x i8]* @.str12 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t11)
  br label %l6
l6:
  %t12 = getelementptr [17 x i8], [17 x i8]* @.str13 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t12)
  ret void
}
@.str6 = private unnamed_addr constant [15 x i8] c"Ok Pre-IfElse
\00"
@.str7 = private unnamed_addr constant [18 x i8] c"Ok Inside-IfElse
\00"
@.str8 = private unnamed_addr constant [26 x i8] c"Error True-Inside-IfElse
\00"
@.str9 = private unnamed_addr constant [17 x i8] c"Ok After-IfElse
\00"
@.str10 = private unnamed_addr constant [15 x i8] c"Ok Pre-IfElse
\00"
@.str11 = private unnamed_addr constant [27 x i8] c"Error False-Inside-IfElse
\00"
@.str12 = private unnamed_addr constant [18 x i8] c"Ok Inside-IfElse
\00"
@.str13 = private unnamed_addr constant [17 x i8] c"Ok After-IfElse
\00"

define void @test_basic_while() {
  %t1 = alloca i32
  %t2 = add i32 10, 0
  store i32 %t2, i32* %t1
  br label %l1
l1:
  %t3 = load i32, i32* %t1
  %t4 = add i32 10, 0
  %t5 = icmp slt i32 %t3, %t4
  %t6 = zext i1 %t5 to i32
  %t7 = icmp ne i32 %t6, 0
  br i1 %t7, label %l2, label %l3
l2:
  %t8 = load i32, i32* %t1
  %t9 = add i32 1, 0
  %t10 = add i32 %t8, %t9
  store i32 %t10, i32* %t1
  br label %l1
l3:
  %t11 = load i32, i32* %t1
  %t12 = add i32 10, 0
  %t13 = icmp eq i32 %t11, %t12
  %t14 = zext i1 %t13 to i32
  %t15 = icmp ne i32 %t14, 0
  br i1 %t15, label %l4, label %l5
l4:
  %t16 = getelementptr [10 x i8], [10 x i8]* @.str14 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t16)
  br label %l6
l5:
  %t17 = getelementptr [13 x i8], [13 x i8]* @.str15 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t17)
  br label %l6
l6:
  ret void
}
@.str14 = private unnamed_addr constant [10 x i8] c"Ok While
\00"
@.str15 = private unnamed_addr constant [13 x i8] c"Error While
\00"

define i32 @true_func() {
  %t1 = add i32 1, 0
  ret i32 %t1
  ret i32 0
}
define i32 @false_func() {
  %t1 = add i32 0, 0
  ret i32 %t1
  ret i32 0
}
define void @test_basic_conds() {
  %t1 = alloca i8
  %t2 = alloca i8
  %t3 = alloca i32
  %t4 = alloca i32
  %t5 = add i32 1, 0
  %t6 = trunc i32 %t5 to i8
  store i8 %t6, i8* %t1
  %t7 = add i32 0, 0
  %t8 = trunc i32 %t7 to i8
  store i8 %t8, i8* %t2
  %t9 = load i8, i8* %t1
  %t10 = sext i8 %t9 to i32
  store i32 %t10, i32* %t3
  %t11 = load i8, i8* %t2
  %t12 = sext i8 %t11 to i32
  store i32 %t12, i32* %t4
  %t13 = add i32 1, 0
  %t14 = icmp ne i32 %t13, 0
  br i1 %t14, label %l1, label %l2
l1:
  %t15 = getelementptr [9 x i8], [9 x i8]* @.str16 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t15)
  br label %l2
l2:
  %t16 = add i32 0, 0
  %t17 = icmp ne i32 %t16, 0
  br i1 %t17, label %l3, label %l4
l3:
  %t18 = getelementptr [12 x i8], [12 x i8]* @.str17 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t18)
  br label %l4
l4:
  %t19 = load i8, i8* %t1
  %t20 = sext i8 %t19 to i32
  %t21 = icmp ne i32 %t20, 0
  br i1 %t21, label %l5, label %l6
l5:
  %t22 = getelementptr [12 x i8], [12 x i8]* @.str18 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t22)
  br label %l6
l6:
  %t23 = load i8, i8* %t2
  %t24 = sext i8 %t23 to i32
  %t25 = icmp ne i32 %t24, 0
  br i1 %t25, label %l7, label %l8
l7:
  %t26 = getelementptr [15 x i8], [15 x i8]* @.str19 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t26)
  br label %l8
l8:
  %t27 = load i32, i32* %t3
  %t28 = icmp ne i32 %t27, 0
  br i1 %t28, label %l9, label %l10
l9:
  %t29 = getelementptr [11 x i8], [11 x i8]* @.str20 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t29)
  br label %l10
l10:
  %t30 = load i32, i32* %t4
  %t31 = icmp ne i32 %t30, 0
  br i1 %t31, label %l11, label %l12
l11:
  %t32 = getelementptr [14 x i8], [14 x i8]* @.str21 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t32)
  br label %l12
l12:
  %t33 = call i32 @true_func()
  %t34 = icmp ne i32 %t33, 0
  br i1 %t34, label %l13, label %l14
l13:
  %t35 = getelementptr [9 x i8], [9 x i8]* @.str22 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t35)
  br label %l14
l14:
  %t36 = call i32 @false_func()
  %t37 = icmp ne i32 %t36, 0
  br i1 %t37, label %l15, label %l16
l15:
  %t38 = getelementptr [12 x i8], [12 x i8]* @.str23 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t38)
  br label %l16
l16:
  %t39 = load i32, i32* %t3
  %t40 = sub i32 0, %t39
  %t41 = icmp ne i32 %t40, 0
  br i1 %t41, label %l17, label %l18
l17:
  %t42 = getelementptr [10 x i8], [10 x i8]* @.str24 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t42)
  br label %l18
l18:
  %t43 = load i32, i32* %t4
  %t44 = sub i32 0, %t43
  %t45 = icmp ne i32 %t44, 0
  br i1 %t45, label %l19, label %l20
l19:
  %t46 = getelementptr [13 x i8], [13 x i8]* @.str25 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t46)
  br label %l20
l20:
  %t47 = load i32, i32* %t3
  %t48 = icmp ne i32 %t47, 0
  br i1 %t48, label %l22, label %l21
l21:
  %t49 = getelementptr [11 x i8], [11 x i8]* @.str26 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t49)
  br label %l22
l22:
  %t50 = load i32, i32* %t4
  %t51 = icmp ne i32 %t50, 0
  br i1 %t51, label %l24, label %l23
l23:
  %t52 = getelementptr [8 x i8], [8 x i8]* @.str27 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t52)
  br label %l24
l24:
  %t53 = add i32 0, 0
  %t54 = add i32 0, 0
  %t55 = icmp eq i32 %t53, %t54
  %t56 = zext i1 %t55 to i32
  %t57 = icmp ne i32 %t56, 0
  br i1 %t57, label %l25, label %l26
l25:
  %t58 = getelementptr [10 x i8], [10 x i8]* @.str28 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t58)
  br label %l26
l26:
  %t59 = add i32 0, 0
  %t60 = add i32 1, 0
  %t61 = icmp eq i32 %t59, %t60
  %t62 = zext i1 %t61 to i32
  %t63 = icmp ne i32 %t62, 0
  br i1 %t63, label %l27, label %l28
l27:
  %t64 = getelementptr [13 x i8], [13 x i8]* @.str29 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t64)
  br label %l28
l28:
  %t65 = add i32 0, 0
  %t66 = icmp ne i32 %t65, 0
  br i1 %t66, label %l31, label %l30
l31:
  %t67 = add i32 0, 0
  %t68 = icmp ne i32 %t67, 0
  br i1 %t68, label %l29, label %l30
l29:
  %t69 = getelementptr [11 x i8], [11 x i8]* @.str30 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t69)
  br label %l30
l30:
  %t70 = add i32 0, 0
  %t71 = icmp ne i32 %t70, 0
  br i1 %t71, label %l34, label %l33
l34:
  %t72 = add i32 1, 0
  %t73 = icmp ne i32 %t72, 0
  br i1 %t73, label %l32, label %l33
l32:
  %t74 = getelementptr [11 x i8], [11 x i8]* @.str31 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t74)
  br label %l33
l33:
  %t75 = add i32 1, 0
  %t76 = icmp ne i32 %t75, 0
  br i1 %t76, label %l37, label %l36
l37:
  %t77 = add i32 0, 0
  %t78 = icmp ne i32 %t77, 0
  br i1 %t78, label %l35, label %l36
l35:
  %t79 = getelementptr [11 x i8], [11 x i8]* @.str32 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t79)
  br label %l36
l36:
  %t80 = add i32 1, 0
  %t81 = icmp ne i32 %t80, 0
  br i1 %t81, label %l40, label %l39
l40:
  %t82 = add i32 1, 0
  %t83 = icmp ne i32 %t82, 0
  br i1 %t83, label %l38, label %l39
l38:
  %t84 = getelementptr [8 x i8], [8 x i8]* @.str33 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t84)
  br label %l39
l39:
  %t85 = add i32 0, 0
  %t86 = icmp ne i32 %t85, 0
  br i1 %t86, label %l41, label %l43
l43:
  %t87 = add i32 0, 0
  %t88 = icmp ne i32 %t87, 0
  br i1 %t88, label %l41, label %l42
l41:
  %t89 = getelementptr [10 x i8], [10 x i8]* @.str34 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t89)
  br label %l42
l42:
  %t90 = add i32 0, 0
  %t91 = icmp ne i32 %t90, 0
  br i1 %t91, label %l44, label %l46
l46:
  %t92 = add i32 1, 0
  %t93 = icmp ne i32 %t92, 0
  br i1 %t93, label %l44, label %l45
l44:
  %t94 = getelementptr [7 x i8], [7 x i8]* @.str35 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t94)
  br label %l45
l45:
  %t95 = add i32 1, 0
  %t96 = icmp ne i32 %t95, 0
  br i1 %t96, label %l47, label %l49
l49:
  %t97 = add i32 0, 0
  %t98 = icmp ne i32 %t97, 0
  br i1 %t98, label %l47, label %l48
l47:
  %t99 = getelementptr [7 x i8], [7 x i8]* @.str36 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t99)
  br label %l48
l48:
  %t100 = add i32 1, 0
  %t101 = icmp ne i32 %t100, 0
  br i1 %t101, label %l50, label %l52
l52:
  %t102 = add i32 1, 0
  %t103 = icmp ne i32 %t102, 0
  br i1 %t103, label %l50, label %l51
l50:
  %t104 = getelementptr [7 x i8], [7 x i8]* @.str37 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t104)
  br label %l51
l51:
  %t105 = add i32 1, 0
  %t106 = add i32 1, 0
  %t107 = sub i32 0, %t106
  %t108 = add i32 %t105, %t107
  %t109 = icmp ne i32 %t108, 0
  br i1 %t109, label %l53, label %l54
l53:
  %t110 = getelementptr [11 x i8], [11 x i8]* @.str38 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t110)
  br label %l54
l54:
  %t111 = add i32 1, 0
  %t112 = add i32 1, 0
  %t113 = add i32 %t111, %t112
  %t114 = icmp ne i32 %t113, 0
  br i1 %t114, label %l55, label %l56
l55:
  %t115 = getelementptr [8 x i8], [8 x i8]* @.str39 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t115)
  br label %l56
l56:
  %t116 = add i32 1, 0
  %t117 = add i32 1, 0
  %t118 = sub i32 %t116, %t117
  %t119 = icmp ne i32 %t118, 0
  br i1 %t119, label %l57, label %l58
l57:
  %t120 = getelementptr [11 x i8], [11 x i8]* @.str40 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t120)
  br label %l58
l58:
  %t121 = add i32 1, 0
  %t122 = add i32 2, 0
  %t123 = sub i32 %t121, %t122
  %t124 = icmp ne i32 %t123, 0
  br i1 %t124, label %l59, label %l60
l59:
  %t125 = getelementptr [8 x i8], [8 x i8]* @.str41 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t125)
  br label %l60
l60:
  %t126 = add i32 1, 0
  %t127 = add i32 0, 0
  %t128 = mul i32 %t126, %t127
  %t129 = icmp ne i32 %t128, 0
  br i1 %t129, label %l61, label %l62
l61:
  %t130 = getelementptr [11 x i8], [11 x i8]* @.str42 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t130)
  br label %l62
l62:
  %t131 = add i32 1, 0
  %t132 = add i32 1, 0
  %t133 = mul i32 %t131, %t132
  %t134 = icmp ne i32 %t133, 0
  br i1 %t134, label %l63, label %l64
l63:
  %t135 = getelementptr [8 x i8], [8 x i8]* @.str43 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t135)
  br label %l64
l64:
  %t136 = add i32 1, 0
  %t137 = add i32 1, 0
  %t138 = sdiv i32 %t136, %t137
  %t139 = icmp ne i32 %t138, 0
  br i1 %t139, label %l65, label %l66
l65:
  %t140 = getelementptr [8 x i8], [8 x i8]* @.str44 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t140)
  br label %l66
l66:
  %t141 = add i32 0, 0
  %t142 = add i32 0, 0
  %t143 = icmp sgt i32 %t141, %t142
  %t144 = zext i1 %t143 to i32
  %t145 = icmp ne i32 %t144, 0
  br i1 %t145, label %l67, label %l68
l67:
  %t146 = getelementptr [19 x i8], [19 x i8]* @.str45 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t146)
  br label %l68
l68:
  %t147 = add i32 0, 0
  %t148 = add i32 1, 0
  %t149 = icmp sgt i32 %t147, %t148
  %t150 = zext i1 %t149 to i32
  %t151 = icmp ne i32 %t150, 0
  br i1 %t151, label %l69, label %l70
l69:
  %t152 = getelementptr [19 x i8], [19 x i8]* @.str46 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t152)
  br label %l70
l70:
  %t153 = add i32 1, 0
  %t154 = add i32 0, 0
  %t155 = icmp sgt i32 %t153, %t154
  %t156 = zext i1 %t155 to i32
  %t157 = icmp ne i32 %t156, 0
  br i1 %t157, label %l71, label %l72
l71:
  %t158 = getelementptr [16 x i8], [16 x i8]* @.str47 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t158)
  br label %l72
l72:
  %t159 = add i32 0, 0
  %t160 = add i32 0, 0
  %t161 = icmp slt i32 %t159, %t160
  %t162 = zext i1 %t161 to i32
  %t163 = icmp ne i32 %t162, 0
  br i1 %t163, label %l73, label %l74
l73:
  %t164 = getelementptr [16 x i8], [16 x i8]* @.str48 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t164)
  br label %l74
l74:
  %t165 = add i32 1, 0
  %t166 = add i32 0, 0
  %t167 = icmp slt i32 %t165, %t166
  %t168 = zext i1 %t167 to i32
  %t169 = icmp ne i32 %t168, 0
  br i1 %t169, label %l75, label %l76
l75:
  %t170 = getelementptr [16 x i8], [16 x i8]* @.str49 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t170)
  br label %l76
l76:
  %t171 = add i32 0, 0
  %t172 = add i32 1, 0
  %t173 = icmp slt i32 %t171, %t172
  %t174 = zext i1 %t173 to i32
  %t175 = icmp ne i32 %t174, 0
  br i1 %t175, label %l77, label %l78
l77:
  %t176 = getelementptr [13 x i8], [13 x i8]* @.str50 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t176)
  br label %l78
l78:
  %t177 = add i32 0, 0
  %t178 = add i32 1, 0
  %t179 = icmp sge i32 %t177, %t178
  %t180 = zext i1 %t179 to i32
  %t181 = icmp ne i32 %t180, 0
  br i1 %t181, label %l79, label %l80
l79:
  %t182 = getelementptr [20 x i8], [20 x i8]* @.str51 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t182)
  br label %l80
l80:
  %t183 = add i32 0, 0
  %t184 = add i32 0, 0
  %t185 = icmp sge i32 %t183, %t184
  %t186 = zext i1 %t185 to i32
  %t187 = icmp ne i32 %t186, 0
  br i1 %t187, label %l81, label %l82
l81:
  %t188 = getelementptr [17 x i8], [17 x i8]* @.str52 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t188)
  br label %l82
l82:
  %t189 = add i32 1, 0
  %t190 = add i32 0, 0
  %t191 = icmp sge i32 %t189, %t190
  %t192 = zext i1 %t191 to i32
  %t193 = icmp ne i32 %t192, 0
  br i1 %t193, label %l83, label %l84
l83:
  %t194 = getelementptr [17 x i8], [17 x i8]* @.str53 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t194)
  br label %l84
l84:
  %t195 = add i32 1, 0
  %t196 = add i32 0, 0
  %t197 = icmp sle i32 %t195, %t196
  %t198 = zext i1 %t197 to i32
  %t199 = icmp ne i32 %t198, 0
  br i1 %t199, label %l85, label %l86
l85:
  %t200 = getelementptr [17 x i8], [17 x i8]* @.str54 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t200)
  br label %l86
l86:
  %t201 = add i32 0, 0
  %t202 = add i32 0, 0
  %t203 = icmp sle i32 %t201, %t202
  %t204 = zext i1 %t203 to i32
  %t205 = icmp ne i32 %t204, 0
  br i1 %t205, label %l87, label %l88
l87:
  %t206 = getelementptr [14 x i8], [14 x i8]* @.str55 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t206)
  br label %l88
l88:
  %t207 = add i32 0, 0
  %t208 = add i32 1, 0
  %t209 = icmp sle i32 %t207, %t208
  %t210 = zext i1 %t209 to i32
  %t211 = icmp ne i32 %t210, 0
  br i1 %t211, label %l89, label %l90
l89:
  %t212 = getelementptr [14 x i8], [14 x i8]* @.str56 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t212)
  br label %l90
l90:
  ret void
}
@.str16 = private unnamed_addr constant [9 x i8] c"Ok KInt
\00"
@.str17 = private unnamed_addr constant [12 x i8] c"Error KInt
\00"
@.str18 = private unnamed_addr constant [12 x i8] c"Ok VarChar
\00"
@.str19 = private unnamed_addr constant [15 x i8] c"Error VarChar
\00"
@.str20 = private unnamed_addr constant [11 x i8] c"Ok VarInt
\00"
@.str21 = private unnamed_addr constant [14 x i8] c"Error VarInt
\00"
@.str22 = private unnamed_addr constant [9 x i8] c"Ok Call
\00"
@.str23 = private unnamed_addr constant [12 x i8] c"Error Call
\00"
@.str24 = private unnamed_addr constant [10 x i8] c"Ok Minus
\00"
@.str25 = private unnamed_addr constant [13 x i8] c"Error Minus
\00"
@.str26 = private unnamed_addr constant [11 x i8] c"Error Not
\00"
@.str27 = private unnamed_addr constant [8 x i8] c"Ok Not
\00"
@.str28 = private unnamed_addr constant [10 x i8] c"Ok Equal
\00"
@.str29 = private unnamed_addr constant [13 x i8] c"Error Equal
\00"
@.str30 = private unnamed_addr constant [11 x i8] c"Error And
\00"
@.str31 = private unnamed_addr constant [11 x i8] c"Error And
\00"
@.str32 = private unnamed_addr constant [11 x i8] c"Error And
\00"
@.str33 = private unnamed_addr constant [8 x i8] c"Ok And
\00"
@.str34 = private unnamed_addr constant [10 x i8] c"Error Or
\00"
@.str35 = private unnamed_addr constant [7 x i8] c"Ok Or
\00"
@.str36 = private unnamed_addr constant [7 x i8] c"Ok Or
\00"
@.str37 = private unnamed_addr constant [7 x i8] c"Ok Or
\00"
@.str38 = private unnamed_addr constant [11 x i8] c"Error Add
\00"
@.str39 = private unnamed_addr constant [8 x i8] c"Ok Add
\00"
@.str40 = private unnamed_addr constant [11 x i8] c"Error Sub
\00"
@.str41 = private unnamed_addr constant [8 x i8] c"Ok Sub
\00"
@.str42 = private unnamed_addr constant [11 x i8] c"Error Mul
\00"
@.str43 = private unnamed_addr constant [8 x i8] c"Ok Mul
\00"
@.str44 = private unnamed_addr constant [8 x i8] c"Ok Div
\00"
@.str45 = private unnamed_addr constant [19 x i8] c"Error GreaterThan
\00"
@.str46 = private unnamed_addr constant [19 x i8] c"Error GreaterThan
\00"
@.str47 = private unnamed_addr constant [16 x i8] c"Ok GreaterThan
\00"
@.str48 = private unnamed_addr constant [16 x i8] c"Error LessThan
\00"
@.str49 = private unnamed_addr constant [16 x i8] c"Error LessThan
\00"
@.str50 = private unnamed_addr constant [13 x i8] c"Ok LessThan
\00"
@.str51 = private unnamed_addr constant [20 x i8] c"Error GreaterEqual
\00"
@.str52 = private unnamed_addr constant [17 x i8] c"Ok GreaterEqual
\00"
@.str53 = private unnamed_addr constant [17 x i8] c"Ok GreaterEqual
\00"
@.str54 = private unnamed_addr constant [17 x i8] c"Error LessEqual
\00"
@.str55 = private unnamed_addr constant [14 x i8] c"Ok LessEqual
\00"
@.str56 = private unnamed_addr constant [14 x i8] c"Ok LessEqual
\00"

@short_circuit_var = global i32 0
define i32 @increment_and_return_true() {
  %t1 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t2 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t3 = load i32, i32* %t2
  %t4 = add i32 1, 0
  %t5 = add i32 %t3, %t4
  store i32 %t5, i32* %t1
  %t6 = add i32 1, 0
  ret i32 %t6
  ret i32 0
}
define i32 @increment_and_return_false() {
  %t1 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t2 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t3 = load i32, i32* %t2
  %t4 = add i32 1, 0
  %t5 = add i32 %t3, %t4
  store i32 %t5, i32* %t1
  %t6 = add i32 0, 0
  ret i32 %t6
  ret i32 0
}
define void @test_short_circuit() {
  %t1 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t2 = add i32 0, 0
  store i32 %t2, i32* %t1
  %t3 = call i32 @increment_and_return_false()
  %t4 = icmp ne i32 %t3, 0
  br i1 %t4, label %l3, label %l2
l3:
  %t5 = call i32 @increment_and_return_false()
  %t6 = icmp ne i32 %t5, 0
  br i1 %t6, label %l1, label %l2
l1:
  br label %l2
l2:
  %t7 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t8 = load i32, i32* %t7
  %t9 = add i32 1, 0
  %t10 = icmp eq i32 %t8, %t9
  %t11 = zext i1 %t10 to i32
  %t12 = icmp ne i32 %t11, 0
  br i1 %t12, label %l4, label %l5
l4:
  %t13 = getelementptr [22 x i8], [22 x i8]* @.str57 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t13)
  br label %l6
l5:
  %t14 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t15 = load i32, i32* %t14
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t15)
  %t16 = getelementptr [28 x i8], [28 x i8]* @.str58 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t16)
  br label %l6
l6:
  %t17 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t18 = add i32 0, 0
  store i32 %t18, i32* %t17
  %t19 = call i32 @increment_and_return_true()
  %t20 = icmp ne i32 %t19, 0
  br i1 %t20, label %l7, label %l9
l9:
  %t21 = call i32 @increment_and_return_true()
  %t22 = icmp ne i32 %t21, 0
  br i1 %t22, label %l7, label %l8
l7:
  br label %l8
l8:
  %t23 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t24 = load i32, i32* %t23
  %t25 = add i32 1, 0
  %t26 = icmp eq i32 %t24, %t25
  %t27 = zext i1 %t26 to i32
  %t28 = icmp ne i32 %t27, 0
  br i1 %t28, label %l10, label %l11
l10:
  %t29 = getelementptr [21 x i8], [21 x i8]* @.str59 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t29)
  br label %l12
l11:
  %t30 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t31 = load i32, i32* %t30
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t31)
  %t32 = getelementptr [27 x i8], [27 x i8]* @.str60 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t32)
  br label %l12
l12:
  ret void
}
@.str57 = private unnamed_addr constant [22 x i8] c"Ok And short-circuit
\00"
@.str58 = private unnamed_addr constant [28 x i8] c" - Error And short-circuit
\00"
@.str59 = private unnamed_addr constant [21 x i8] c"Ok Or short-circuit
\00"
@.str60 = private unnamed_addr constant [27 x i8] c" - Error Or short-circuit
\00"

define i32 @main() {
  %t1 = getelementptr i8, i8* @nl, i32 0
  %t2 = add i32 10, 0
  %t3 = trunc i32 %t2 to i8
  store i8 %t3, i8* %t1
  call void @test_basic_if()
  %t4 = getelementptr i8, i8* @nl, i32 0
  %t5 = load i8, i8* %t4
  %t6 = sext i8 %t5 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t6)
  call void @test_basic_ifelse()
  %t7 = getelementptr i8, i8* @nl, i32 0
  %t8 = load i8, i8* %t7
  %t9 = sext i8 %t8 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t9)
  call void @test_basic_while()
  %t10 = getelementptr i8, i8* @nl, i32 0
  %t11 = load i8, i8* %t10
  %t12 = sext i8 %t11 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t12)
  call void @test_basic_conds()
  %t13 = getelementptr i8, i8* @nl, i32 0
  %t14 = load i8, i8* %t13
  %t15 = sext i8 %t14 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t15)
  call void @test_short_circuit()
  %t16 = add i32 0, 0
  ret i32 %t16
  ret i32 0
}
