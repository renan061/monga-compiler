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
  br i1 %t5, label %l2, label %l3
l2:
  %t6 = load i32, i32* %t1
  %t7 = add i32 1, 0
  %t8 = add i32 %t6, %t7
  store i32 %t8, i32* %t1
  br label %l1
l3:
  %t9 = load i32, i32* %t1
  %t10 = add i32 10, 0
  %t11 = icmp eq i32 %t9, %t10
  br i1 %t11, label %l4, label %l5
l4:
  %t12 = getelementptr [10 x i8], [10 x i8]* @.str14 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t12)
  br label %l6
l5:
  %t13 = getelementptr [13 x i8], [13 x i8]* @.str15 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t13)
  br label %l6
l6:
  br label %l7
l7:
  %t14 = add i32 0, 0
  %t15 = icmp ne i32 %t14, 0
  br i1 %t15, label %l8, label %l9
l8:
  %t16 = getelementptr [12 x i8], [12 x i8]* @.str16 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t16)
  br label %l7
l9:
  ret void
}
@.str14 = private unnamed_addr constant [10 x i8] c"Ok While
\00"
@.str15 = private unnamed_addr constant [13 x i8] c"Error While
\00"
@.str16 = private unnamed_addr constant [12 x i8] c"Error While\00"

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
  %t15 = getelementptr [9 x i8], [9 x i8]* @.str17 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t15)
  br label %l2
l2:
  %t16 = add i32 0, 0
  %t17 = icmp ne i32 %t16, 0
  br i1 %t17, label %l3, label %l4
l3:
  %t18 = getelementptr [12 x i8], [12 x i8]* @.str18 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t18)
  br label %l4
l4:
  %t19 = load i8, i8* %t1
  %t20 = icmp ne i8 %t19, 0
  br i1 %t20, label %l5, label %l6
l5:
  %t21 = getelementptr [12 x i8], [12 x i8]* @.str19 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t21)
  br label %l6
l6:
  %t22 = load i8, i8* %t2
  %t23 = icmp ne i8 %t22, 0
  br i1 %t23, label %l7, label %l8
l7:
  %t24 = getelementptr [15 x i8], [15 x i8]* @.str20 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t24)
  br label %l8
l8:
  %t25 = load i32, i32* %t3
  %t26 = icmp ne i32 %t25, 0
  br i1 %t26, label %l9, label %l10
l9:
  %t27 = getelementptr [11 x i8], [11 x i8]* @.str21 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t27)
  br label %l10
l10:
  %t28 = load i32, i32* %t4
  %t29 = icmp ne i32 %t28, 0
  br i1 %t29, label %l11, label %l12
l11:
  %t30 = getelementptr [14 x i8], [14 x i8]* @.str22 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t30)
  br label %l12
l12:
  %t31 = call i32 @true_func()
  %t32 = icmp ne i32 %t31, 0
  br i1 %t32, label %l13, label %l14
l13:
  %t33 = getelementptr [9 x i8], [9 x i8]* @.str23 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t33)
  br label %l14
l14:
  %t34 = call i32 @false_func()
  %t35 = icmp ne i32 %t34, 0
  br i1 %t35, label %l15, label %l16
l15:
  %t36 = getelementptr [12 x i8], [12 x i8]* @.str24 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t36)
  br label %l16
l16:
  %t37 = load i32, i32* %t3
  %t38 = sub i32 0, %t37
  %t39 = icmp ne i32 %t38, 0
  br i1 %t39, label %l17, label %l18
l17:
  %t40 = getelementptr [10 x i8], [10 x i8]* @.str25 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t40)
  br label %l18
l18:
  %t41 = load i32, i32* %t4
  %t42 = sub i32 0, %t41
  %t43 = icmp ne i32 %t42, 0
  br i1 %t43, label %l19, label %l20
l19:
  %t44 = getelementptr [13 x i8], [13 x i8]* @.str26 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t44)
  br label %l20
l20:
  %t45 = load i32, i32* %t3
  %t46 = icmp ne i32 %t45, 0
  br i1 %t46, label %l22, label %l21
l21:
  %t47 = getelementptr [11 x i8], [11 x i8]* @.str27 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t47)
  br label %l22
l22:
  %t48 = load i32, i32* %t4
  %t49 = icmp ne i32 %t48, 0
  br i1 %t49, label %l24, label %l23
l23:
  %t50 = getelementptr [8 x i8], [8 x i8]* @.str28 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t50)
  br label %l24
l24:
  %t51 = add i32 0, 0
  %t52 = add i32 0, 0
  %t53 = icmp eq i32 %t51, %t52
  br i1 %t53, label %l25, label %l26
l25:
  %t54 = getelementptr [10 x i8], [10 x i8]* @.str29 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t54)
  br label %l26
l26:
  %t55 = add i32 0, 0
  %t56 = add i32 1, 0
  %t57 = icmp eq i32 %t55, %t56
  br i1 %t57, label %l27, label %l28
l27:
  %t58 = getelementptr [13 x i8], [13 x i8]* @.str30 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t58)
  br label %l28
l28:
  %t59 = add i32 0, 0
  %t60 = icmp ne i32 %t59, 0
  br i1 %t60, label %l31, label %l30
l31:
  %t61 = add i32 0, 0
  %t62 = icmp ne i32 %t61, 0
  br i1 %t62, label %l29, label %l30
l29:
  %t63 = getelementptr [11 x i8], [11 x i8]* @.str31 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t63)
  br label %l30
l30:
  %t64 = add i32 0, 0
  %t65 = icmp ne i32 %t64, 0
  br i1 %t65, label %l34, label %l33
l34:
  %t66 = add i32 1, 0
  %t67 = icmp ne i32 %t66, 0
  br i1 %t67, label %l32, label %l33
l32:
  %t68 = getelementptr [11 x i8], [11 x i8]* @.str32 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t68)
  br label %l33
l33:
  %t69 = add i32 1, 0
  %t70 = icmp ne i32 %t69, 0
  br i1 %t70, label %l37, label %l36
l37:
  %t71 = add i32 0, 0
  %t72 = icmp ne i32 %t71, 0
  br i1 %t72, label %l35, label %l36
l35:
  %t73 = getelementptr [11 x i8], [11 x i8]* @.str33 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t73)
  br label %l36
l36:
  %t74 = add i32 1, 0
  %t75 = icmp ne i32 %t74, 0
  br i1 %t75, label %l40, label %l39
l40:
  %t76 = add i32 1, 0
  %t77 = icmp ne i32 %t76, 0
  br i1 %t77, label %l38, label %l39
l38:
  %t78 = getelementptr [8 x i8], [8 x i8]* @.str34 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t78)
  br label %l39
l39:
  %t79 = add i32 0, 0
  %t80 = icmp ne i32 %t79, 0
  br i1 %t80, label %l41, label %l43
l43:
  %t81 = add i32 0, 0
  %t82 = icmp ne i32 %t81, 0
  br i1 %t82, label %l41, label %l42
l41:
  %t83 = getelementptr [10 x i8], [10 x i8]* @.str35 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t83)
  br label %l42
l42:
  %t84 = add i32 0, 0
  %t85 = icmp ne i32 %t84, 0
  br i1 %t85, label %l44, label %l46
l46:
  %t86 = add i32 1, 0
  %t87 = icmp ne i32 %t86, 0
  br i1 %t87, label %l44, label %l45
l44:
  %t88 = getelementptr [7 x i8], [7 x i8]* @.str36 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t88)
  br label %l45
l45:
  %t89 = add i32 1, 0
  %t90 = icmp ne i32 %t89, 0
  br i1 %t90, label %l47, label %l49
l49:
  %t91 = add i32 0, 0
  %t92 = icmp ne i32 %t91, 0
  br i1 %t92, label %l47, label %l48
l47:
  %t93 = getelementptr [7 x i8], [7 x i8]* @.str37 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t93)
  br label %l48
l48:
  %t94 = add i32 1, 0
  %t95 = icmp ne i32 %t94, 0
  br i1 %t95, label %l50, label %l52
l52:
  %t96 = add i32 1, 0
  %t97 = icmp ne i32 %t96, 0
  br i1 %t97, label %l50, label %l51
l50:
  %t98 = getelementptr [7 x i8], [7 x i8]* @.str38 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t98)
  br label %l51
l51:
  %t99 = add i32 1, 0
  %t100 = add i32 1, 0
  %t101 = sub i32 0, %t100
  %t102 = add i32 %t99, %t101
  %t103 = icmp ne i32 %t102, 0
  br i1 %t103, label %l53, label %l54
l53:
  %t104 = getelementptr [11 x i8], [11 x i8]* @.str39 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t104)
  br label %l54
l54:
  %t105 = add i32 1, 0
  %t106 = add i32 1, 0
  %t107 = add i32 %t105, %t106
  %t108 = icmp ne i32 %t107, 0
  br i1 %t108, label %l55, label %l56
l55:
  %t109 = getelementptr [8 x i8], [8 x i8]* @.str40 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t109)
  br label %l56
l56:
  %t110 = add i32 1, 0
  %t111 = add i32 1, 0
  %t112 = sub i32 %t110, %t111
  %t113 = icmp ne i32 %t112, 0
  br i1 %t113, label %l57, label %l58
l57:
  %t114 = getelementptr [11 x i8], [11 x i8]* @.str41 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t114)
  br label %l58
l58:
  %t115 = add i32 1, 0
  %t116 = add i32 2, 0
  %t117 = sub i32 %t115, %t116
  %t118 = icmp ne i32 %t117, 0
  br i1 %t118, label %l59, label %l60
l59:
  %t119 = getelementptr [8 x i8], [8 x i8]* @.str42 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t119)
  br label %l60
l60:
  %t120 = add i32 1, 0
  %t121 = add i32 0, 0
  %t122 = mul i32 %t120, %t121
  %t123 = icmp ne i32 %t122, 0
  br i1 %t123, label %l61, label %l62
l61:
  %t124 = getelementptr [11 x i8], [11 x i8]* @.str43 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t124)
  br label %l62
l62:
  %t125 = add i32 1, 0
  %t126 = add i32 1, 0
  %t127 = mul i32 %t125, %t126
  %t128 = icmp ne i32 %t127, 0
  br i1 %t128, label %l63, label %l64
l63:
  %t129 = getelementptr [8 x i8], [8 x i8]* @.str44 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t129)
  br label %l64
l64:
  %t130 = add i32 1, 0
  %t131 = add i32 1, 0
  %t132 = sdiv i32 %t130, %t131
  %t133 = icmp ne i32 %t132, 0
  br i1 %t133, label %l65, label %l66
l65:
  %t134 = getelementptr [8 x i8], [8 x i8]* @.str45 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t134)
  br label %l66
l66:
  %t135 = add i32 0, 0
  %t136 = add i32 0, 0
  %t137 = icmp sgt i32 %t135, %t136
  br i1 %t137, label %l67, label %l68
l67:
  %t138 = getelementptr [19 x i8], [19 x i8]* @.str46 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t138)
  br label %l68
l68:
  %t139 = add i32 0, 0
  %t140 = add i32 1, 0
  %t141 = icmp sgt i32 %t139, %t140
  br i1 %t141, label %l69, label %l70
l69:
  %t142 = getelementptr [19 x i8], [19 x i8]* @.str47 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t142)
  br label %l70
l70:
  %t143 = add i32 1, 0
  %t144 = add i32 0, 0
  %t145 = icmp sgt i32 %t143, %t144
  br i1 %t145, label %l71, label %l72
l71:
  %t146 = getelementptr [16 x i8], [16 x i8]* @.str48 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t146)
  br label %l72
l72:
  %t147 = add i32 0, 0
  %t148 = add i32 0, 0
  %t149 = icmp slt i32 %t147, %t148
  br i1 %t149, label %l73, label %l74
l73:
  %t150 = getelementptr [16 x i8], [16 x i8]* @.str49 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t150)
  br label %l74
l74:
  %t151 = add i32 1, 0
  %t152 = add i32 0, 0
  %t153 = icmp slt i32 %t151, %t152
  br i1 %t153, label %l75, label %l76
l75:
  %t154 = getelementptr [16 x i8], [16 x i8]* @.str50 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t154)
  br label %l76
l76:
  %t155 = add i32 0, 0
  %t156 = add i32 1, 0
  %t157 = icmp slt i32 %t155, %t156
  br i1 %t157, label %l77, label %l78
l77:
  %t158 = getelementptr [13 x i8], [13 x i8]* @.str51 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t158)
  br label %l78
l78:
  %t159 = add i32 0, 0
  %t160 = add i32 1, 0
  %t161 = icmp sge i32 %t159, %t160
  br i1 %t161, label %l79, label %l80
l79:
  %t162 = getelementptr [20 x i8], [20 x i8]* @.str52 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t162)
  br label %l80
l80:
  %t163 = add i32 0, 0
  %t164 = add i32 0, 0
  %t165 = icmp sge i32 %t163, %t164
  br i1 %t165, label %l81, label %l82
l81:
  %t166 = getelementptr [17 x i8], [17 x i8]* @.str53 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t166)
  br label %l82
l82:
  %t167 = add i32 1, 0
  %t168 = add i32 0, 0
  %t169 = icmp sge i32 %t167, %t168
  br i1 %t169, label %l83, label %l84
l83:
  %t170 = getelementptr [17 x i8], [17 x i8]* @.str54 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t170)
  br label %l84
l84:
  %t171 = add i32 1, 0
  %t172 = add i32 0, 0
  %t173 = icmp sle i32 %t171, %t172
  br i1 %t173, label %l85, label %l86
l85:
  %t174 = getelementptr [17 x i8], [17 x i8]* @.str55 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t174)
  br label %l86
l86:
  %t175 = add i32 0, 0
  %t176 = add i32 0, 0
  %t177 = icmp sle i32 %t175, %t176
  br i1 %t177, label %l87, label %l88
l87:
  %t178 = getelementptr [14 x i8], [14 x i8]* @.str56 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t178)
  br label %l88
l88:
  %t179 = add i32 0, 0
  %t180 = add i32 1, 0
  %t181 = icmp sle i32 %t179, %t180
  br i1 %t181, label %l89, label %l90
l89:
  %t182 = getelementptr [14 x i8], [14 x i8]* @.str57 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t182)
  br label %l90
l90:
  ret void
}
@.str17 = private unnamed_addr constant [9 x i8] c"Ok KInt
\00"
@.str18 = private unnamed_addr constant [12 x i8] c"Error KInt
\00"
@.str19 = private unnamed_addr constant [12 x i8] c"Ok VarChar
\00"
@.str20 = private unnamed_addr constant [15 x i8] c"Error VarChar
\00"
@.str21 = private unnamed_addr constant [11 x i8] c"Ok VarInt
\00"
@.str22 = private unnamed_addr constant [14 x i8] c"Error VarInt
\00"
@.str23 = private unnamed_addr constant [9 x i8] c"Ok Call
\00"
@.str24 = private unnamed_addr constant [12 x i8] c"Error Call
\00"
@.str25 = private unnamed_addr constant [10 x i8] c"Ok Minus
\00"
@.str26 = private unnamed_addr constant [13 x i8] c"Error Minus
\00"
@.str27 = private unnamed_addr constant [11 x i8] c"Error Not
\00"
@.str28 = private unnamed_addr constant [8 x i8] c"Ok Not
\00"
@.str29 = private unnamed_addr constant [10 x i8] c"Ok Equal
\00"
@.str30 = private unnamed_addr constant [13 x i8] c"Error Equal
\00"
@.str31 = private unnamed_addr constant [11 x i8] c"Error And
\00"
@.str32 = private unnamed_addr constant [11 x i8] c"Error And
\00"
@.str33 = private unnamed_addr constant [11 x i8] c"Error And
\00"
@.str34 = private unnamed_addr constant [8 x i8] c"Ok And
\00"
@.str35 = private unnamed_addr constant [10 x i8] c"Error Or
\00"
@.str36 = private unnamed_addr constant [7 x i8] c"Ok Or
\00"
@.str37 = private unnamed_addr constant [7 x i8] c"Ok Or
\00"
@.str38 = private unnamed_addr constant [7 x i8] c"Ok Or
\00"
@.str39 = private unnamed_addr constant [11 x i8] c"Error Add
\00"
@.str40 = private unnamed_addr constant [8 x i8] c"Ok Add
\00"
@.str41 = private unnamed_addr constant [11 x i8] c"Error Sub
\00"
@.str42 = private unnamed_addr constant [8 x i8] c"Ok Sub
\00"
@.str43 = private unnamed_addr constant [11 x i8] c"Error Mul
\00"
@.str44 = private unnamed_addr constant [8 x i8] c"Ok Mul
\00"
@.str45 = private unnamed_addr constant [8 x i8] c"Ok Div
\00"
@.str46 = private unnamed_addr constant [19 x i8] c"Error GreaterThan
\00"
@.str47 = private unnamed_addr constant [19 x i8] c"Error GreaterThan
\00"
@.str48 = private unnamed_addr constant [16 x i8] c"Ok GreaterThan
\00"
@.str49 = private unnamed_addr constant [16 x i8] c"Error LessThan
\00"
@.str50 = private unnamed_addr constant [16 x i8] c"Error LessThan
\00"
@.str51 = private unnamed_addr constant [13 x i8] c"Ok LessThan
\00"
@.str52 = private unnamed_addr constant [20 x i8] c"Error GreaterEqual
\00"
@.str53 = private unnamed_addr constant [17 x i8] c"Ok GreaterEqual
\00"
@.str54 = private unnamed_addr constant [17 x i8] c"Ok GreaterEqual
\00"
@.str55 = private unnamed_addr constant [17 x i8] c"Error LessEqual
\00"
@.str56 = private unnamed_addr constant [14 x i8] c"Ok LessEqual
\00"
@.str57 = private unnamed_addr constant [14 x i8] c"Ok LessEqual
\00"

define void @test_cond_types() {
  %t1 = getelementptr [17 x i8], [17 x i8]* @.str58 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t1)
  %t2 = alloca i32
  %t3 = add i32 10, 0
  store i32 %t3, i32* %t2
  %t4 = load i32, i32* %t2
  %t5 = icmp ne i32 %t4, 0
  br i1 %t5, label %l1, label %l2
l1:
  %t6 = load i32, i32* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t6)
  br label %l2
l2:
  %t7 = getelementptr i8, i8* @nl, i32 0
  %t8 = load i8, i8* %t7
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t8)
  %t9 = alloca i8
  %t10 = add i32 65, 0
  %t11 = trunc i32 %t10 to i8
  store i8 %t11, i8* %t9
  %t12 = load i8, i8* %t9
  %t13 = icmp ne i8 %t12, 0
  br i1 %t13, label %l3, label %l4
l3:
  %t14 = load i8, i8* %t9
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t14)
  br label %l4
l4:
  %t15 = getelementptr i8, i8* @nl, i32 0
  %t16 = load i8, i8* %t15
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t16)
  %t17 = alloca double
  %t18 = fadd double 0x3fb99999a0000000, 0x0
  store double %t18, double* %t17
  %t19 = load double, double* %t17
  %t20 = fcmp one double %t19, 0x0
  br i1 %t20, label %l5, label %l6
l5:
  %t21 = load double, double* %t17
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t21)
  br label %l6
l6:
  %t22 = getelementptr i8, i8* @nl, i32 0
  %t23 = load i8, i8* %t22
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t23)
  ret void
}
@.str58 = private unnamed_addr constant [17 x i8] c"Condition types
\00"

@short_circuit_var = global i32 0
define i32 @increment_and_return_true() {
  %t1 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t2 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t3 = load i32, i32* %t2
  %t4 = add i32 3, 0
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
  %t4 = add i32 5, 0
  %t5 = sub i32 %t3, %t4
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
  br i1 %t4, label %l4, label %l2
l4:
  %t5 = call i32 @increment_and_return_false()
  %t6 = icmp ne i32 %t5, 0
  br i1 %t6, label %l1, label %l2
l1:
  %t7 = getelementptr [6 x i8], [6 x i8]* @.str59 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t7)
  br label %l3
l2:
  %t8 = getelementptr [3 x i8], [3 x i8]* @.str60 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t8)
  br label %l3
l3:
  %t9 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t10 = load i32, i32* %t9
  %t11 = add i32 5, 0
  %t12 = sub i32 0, %t11
  %t13 = icmp eq i32 %t10, %t12
  br i1 %t13, label %l5, label %l6
l5:
  %t14 = getelementptr [26 x i8], [26 x i8]* @.str61 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t14)
  br label %l7
l6:
  %t15 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t16 = load i32, i32* %t15
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t16)
  %t17 = getelementptr [28 x i8], [28 x i8]* @.str62 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t17)
  br label %l7
l7:
  %t18 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t19 = add i32 0, 0
  store i32 %t19, i32* %t18
  %t20 = call i32 @increment_and_return_true()
  %t21 = icmp ne i32 %t20, 0
  br i1 %t21, label %l11, label %l9
l11:
  %t22 = call i32 @increment_and_return_true()
  %t23 = icmp ne i32 %t22, 0
  br i1 %t23, label %l8, label %l9
l8:
  %t24 = getelementptr [3 x i8], [3 x i8]* @.str63 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t24)
  br label %l10
l9:
  %t25 = getelementptr [6 x i8], [6 x i8]* @.str64 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t25)
  br label %l10
l10:
  %t26 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t27 = load i32, i32* %t26
  %t28 = add i32 6, 0
  %t29 = icmp eq i32 %t27, %t28
  br i1 %t29, label %l12, label %l13
l12:
  %t30 = getelementptr [26 x i8], [26 x i8]* @.str65 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t30)
  br label %l14
l13:
  %t31 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t32 = load i32, i32* %t31
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t32)
  %t33 = getelementptr [28 x i8], [28 x i8]* @.str66 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t33)
  br label %l14
l14:
  %t34 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t35 = add i32 0, 0
  store i32 %t35, i32* %t34
  %t36 = call i32 @increment_and_return_true()
  %t37 = icmp ne i32 %t36, 0
  br i1 %t37, label %l18, label %l16
l18:
  %t38 = call i32 @increment_and_return_false()
  %t39 = icmp ne i32 %t38, 0
  br i1 %t39, label %l15, label %l16
l15:
  %t40 = getelementptr [6 x i8], [6 x i8]* @.str67 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t40)
  br label %l17
l16:
  %t41 = getelementptr [3 x i8], [3 x i8]* @.str68 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t41)
  br label %l17
l17:
  %t42 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t43 = load i32, i32* %t42
  %t44 = add i32 2, 0
  %t45 = sub i32 0, %t44
  %t46 = icmp eq i32 %t43, %t45
  br i1 %t46, label %l19, label %l20
l19:
  %t47 = getelementptr [26 x i8], [26 x i8]* @.str69 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t47)
  br label %l21
l20:
  %t48 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t49 = load i32, i32* %t48
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t49)
  %t50 = getelementptr [28 x i8], [28 x i8]* @.str70 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t50)
  br label %l21
l21:
  %t51 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t52 = add i32 0, 0
  store i32 %t52, i32* %t51
  %t53 = call i32 @increment_and_return_false()
  %t54 = icmp ne i32 %t53, 0
  br i1 %t54, label %l25, label %l23
l25:
  %t55 = call i32 @increment_and_return_true()
  %t56 = icmp ne i32 %t55, 0
  br i1 %t56, label %l22, label %l23
l22:
  %t57 = getelementptr [6 x i8], [6 x i8]* @.str71 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t57)
  br label %l24
l23:
  %t58 = getelementptr [3 x i8], [3 x i8]* @.str72 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t58)
  br label %l24
l24:
  %t59 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t60 = load i32, i32* %t59
  %t61 = add i32 5, 0
  %t62 = sub i32 0, %t61
  %t63 = icmp eq i32 %t60, %t62
  br i1 %t63, label %l26, label %l27
l26:
  %t64 = getelementptr [26 x i8], [26 x i8]* @.str73 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t64)
  br label %l28
l27:
  %t65 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t66 = load i32, i32* %t65
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t66)
  %t67 = getelementptr [28 x i8], [28 x i8]* @.str74 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t67)
  br label %l28
l28:
  %t68 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t69 = add i32 0, 0
  store i32 %t69, i32* %t68
  %t70 = call i32 @increment_and_return_true()
  %t71 = icmp ne i32 %t70, 0
  br i1 %t71, label %l29, label %l32
l32:
  %t72 = call i32 @increment_and_return_true()
  %t73 = icmp ne i32 %t72, 0
  br i1 %t73, label %l29, label %l30
l29:
  %t74 = getelementptr [3 x i8], [3 x i8]* @.str75 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t74)
  br label %l31
l30:
  %t75 = getelementptr [6 x i8], [6 x i8]* @.str76 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t75)
  br label %l31
l31:
  %t76 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t77 = load i32, i32* %t76
  %t78 = add i32 3, 0
  %t79 = icmp eq i32 %t77, %t78
  br i1 %t79, label %l33, label %l34
l33:
  %t80 = getelementptr [25 x i8], [25 x i8]* @.str77 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t80)
  br label %l35
l34:
  %t81 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t82 = load i32, i32* %t81
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t82)
  %t83 = getelementptr [27 x i8], [27 x i8]* @.str78 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t83)
  br label %l35
l35:
  %t84 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t85 = add i32 0, 0
  store i32 %t85, i32* %t84
  %t86 = call i32 @increment_and_return_false()
  %t87 = icmp ne i32 %t86, 0
  br i1 %t87, label %l36, label %l39
l39:
  %t88 = call i32 @increment_and_return_false()
  %t89 = icmp ne i32 %t88, 0
  br i1 %t89, label %l36, label %l37
l36:
  %t90 = getelementptr [6 x i8], [6 x i8]* @.str79 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t90)
  br label %l38
l37:
  %t91 = getelementptr [3 x i8], [3 x i8]* @.str80 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t91)
  br label %l38
l38:
  %t92 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t93 = load i32, i32* %t92
  %t94 = add i32 10, 0
  %t95 = sub i32 0, %t94
  %t96 = icmp eq i32 %t93, %t95
  br i1 %t96, label %l40, label %l41
l40:
  %t97 = getelementptr [25 x i8], [25 x i8]* @.str81 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t97)
  br label %l42
l41:
  %t98 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t99 = load i32, i32* %t98
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t99)
  %t100 = getelementptr [27 x i8], [27 x i8]* @.str82 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t100)
  br label %l42
l42:
  %t101 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t102 = add i32 0, 0
  store i32 %t102, i32* %t101
  %t103 = call i32 @increment_and_return_true()
  %t104 = icmp ne i32 %t103, 0
  br i1 %t104, label %l43, label %l46
l46:
  %t105 = call i32 @increment_and_return_false()
  %t106 = icmp ne i32 %t105, 0
  br i1 %t106, label %l43, label %l44
l43:
  %t107 = getelementptr [3 x i8], [3 x i8]* @.str83 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t107)
  br label %l45
l44:
  %t108 = getelementptr [6 x i8], [6 x i8]* @.str84 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t108)
  br label %l45
l45:
  %t109 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t110 = load i32, i32* %t109
  %t111 = add i32 3, 0
  %t112 = icmp eq i32 %t110, %t111
  br i1 %t112, label %l47, label %l48
l47:
  %t113 = getelementptr [25 x i8], [25 x i8]* @.str85 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t113)
  br label %l49
l48:
  %t114 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t115 = load i32, i32* %t114
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t115)
  %t116 = getelementptr [27 x i8], [27 x i8]* @.str86 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t116)
  br label %l49
l49:
  %t117 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t118 = add i32 0, 0
  store i32 %t118, i32* %t117
  %t119 = call i32 @increment_and_return_false()
  %t120 = icmp ne i32 %t119, 0
  br i1 %t120, label %l50, label %l53
l53:
  %t121 = call i32 @increment_and_return_true()
  %t122 = icmp ne i32 %t121, 0
  br i1 %t122, label %l50, label %l51
l50:
  %t123 = getelementptr [3 x i8], [3 x i8]* @.str87 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t123)
  br label %l52
l51:
  %t124 = getelementptr [6 x i8], [6 x i8]* @.str88 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t124)
  br label %l52
l52:
  %t125 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t126 = load i32, i32* %t125
  %t127 = add i32 2, 0
  %t128 = sub i32 0, %t127
  %t129 = icmp eq i32 %t126, %t128
  br i1 %t129, label %l54, label %l55
l54:
  %t130 = getelementptr [25 x i8], [25 x i8]* @.str89 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t130)
  br label %l56
l55:
  %t131 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t132 = load i32, i32* %t131
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t132)
  %t133 = getelementptr [27 x i8], [27 x i8]* @.str90 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t133)
  br label %l56
l56:
  ret void
}
@.str59 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str60 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str61 = private unnamed_addr constant [26 x i8] c" And F X F short-circuit
\00"
@.str62 = private unnamed_addr constant [28 x i8] c" - Error And short-circuit
\00"
@.str63 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str64 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str65 = private unnamed_addr constant [26 x i8] c" And T X T short-circuit
\00"
@.str66 = private unnamed_addr constant [28 x i8] c" - Error And short-circuit
\00"
@.str67 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str68 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str69 = private unnamed_addr constant [26 x i8] c" And T X F short-circuit
\00"
@.str70 = private unnamed_addr constant [28 x i8] c" - Error And short-circuit
\00"
@.str71 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str72 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str73 = private unnamed_addr constant [26 x i8] c" And F X T short-circuit
\00"
@.str74 = private unnamed_addr constant [28 x i8] c" - Error And short-circuit
\00"
@.str75 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str76 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str77 = private unnamed_addr constant [25 x i8] c" Or T X T short-circuit
\00"
@.str78 = private unnamed_addr constant [27 x i8] c" - Error Or short-circuit
\00"
@.str79 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str80 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str81 = private unnamed_addr constant [25 x i8] c" Or F X F short-circuit
\00"
@.str82 = private unnamed_addr constant [27 x i8] c" - Error Or short-circuit
\00"
@.str83 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str84 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str85 = private unnamed_addr constant [25 x i8] c" Or T X F short-circuit
\00"
@.str86 = private unnamed_addr constant [27 x i8] c" - Error Or short-circuit
\00"
@.str87 = private unnamed_addr constant [3 x i8] c"Ok\00"
@.str88 = private unnamed_addr constant [6 x i8] c"Error\00"
@.str89 = private unnamed_addr constant [25 x i8] c" Or F X T short-circuit
\00"
@.str90 = private unnamed_addr constant [27 x i8] c" - Error Or short-circuit
\00"

define i32 @factorial(i32 %t1) {
  %t2 = alloca i32
  store i32 %t1, i32* %t2
  %t3 = load i32, i32* %t2
  %t4 = add i32 0, 0
  %t5 = icmp eq i32 %t3, %t4
  br i1 %t5, label %l1, label %l2
l1:
  %t6 = add i32 1, 0
  ret i32 %t6
  br label %l2
l2:
  %t7 = load i32, i32* %t2
  %t8 = load i32, i32* %t2
  %t9 = add i32 1, 0
  %t10 = sub i32 %t8, %t9
  %t11 = call i32 @factorial(i32 %t10)
  %t12 = mul i32 %t7, %t11
  ret i32 %t12
  ret i32 0
}
define i32** @new_matrix(i32 %t1) {
  %t2 = alloca i32
  store i32 %t1, i32* %t2
  %t3 = alloca i32
  %t4 = alloca i32
  %t5 = alloca i32**
  %t6 = load i32, i32* %t2
  %t7 = sext i32 %t6 to i64
  %t8 = mul i64 %t7, 8
  %t9 = call i8* @malloc(i64 %t8)
  %t10 = bitcast i8* %t9 to i32**
  store i32** %t10, i32*** %t5
  %t11 = add i32 0, 0
  store i32 %t11, i32* %t3
  br label %l1
l1:
  %t12 = load i32, i32* %t3
  %t13 = load i32, i32* %t2
  %t14 = icmp slt i32 %t12, %t13
  br i1 %t14, label %l2, label %l3
l2:
  %t15 = add i32 0, 0
  store i32 %t15, i32* %t4
  %t16 = load i32**, i32*** %t5
  %t17 = load i32, i32* %t3
  %t18 = getelementptr i32*, i32** %t16, i32 %t17
  %t19 = load i32, i32* %t2
  %t20 = sext i32 %t19 to i64
  %t21 = mul i64 %t20, 4
  %t22 = call i8* @malloc(i64 %t21)
  %t23 = bitcast i8* %t22 to i32*
  store i32* %t23, i32** %t18
  br label %l4
l4:
  %t24 = load i32, i32* %t4
  %t25 = load i32, i32* %t2
  %t26 = icmp slt i32 %t24, %t25
  br i1 %t26, label %l5, label %l6
l5:
  %t27 = load i32**, i32*** %t5
  %t28 = load i32, i32* %t3
  %t29 = getelementptr i32*, i32** %t27, i32 %t28
  %t30 = load i32*, i32** %t29
  %t31 = load i32, i32* %t4
  %t32 = getelementptr i32, i32* %t30, i32 %t31
  %t33 = load i32, i32* %t3
  %t34 = load i32, i32* %t4
  %t35 = icmp sge i32 %t33, %t34
  br i1 %t35, label %l7, label %l8
l7:
  br label %l9
l8:
  br label %l9
l9:
  %t36 = phi i32 [1, %l7], [0, %l8]
  store i32 %t36, i32* %t32
  %t37 = load i32, i32* %t4
  %t38 = add i32 1, 0
  %t39 = add i32 %t37, %t38
  store i32 %t39, i32* %t4
  br label %l4
l6:
  %t40 = load i32, i32* %t3
  %t41 = add i32 1, 0
  %t42 = add i32 %t40, %t41
  store i32 %t42, i32* %t3
  br label %l1
l3:
  %t43 = load i32**, i32*** %t5
  ret i32** %t43
  ret i32** null
}
define void @print_matrix(i32** %t1, i32 %t2) {
  %t3 = alloca i32**
  store i32** %t1, i32*** %t3
  %t4 = alloca i32
  store i32 %t2, i32* %t4
  %t5 = alloca i32
  %t6 = alloca i32
  %t7 = add i32 0, 0
  store i32 %t7, i32* %t5
  br label %l1
l1:
  %t8 = load i32, i32* %t5
  %t9 = load i32, i32* %t4
  %t10 = icmp slt i32 %t8, %t9
  br i1 %t10, label %l2, label %l3
l2:
  %t11 = add i32 0, 0
  store i32 %t11, i32* %t6
  br label %l4
l4:
  %t12 = load i32, i32* %t6
  %t13 = load i32, i32* %t4
  %t14 = icmp slt i32 %t12, %t13
  br i1 %t14, label %l5, label %l6
l5:
  %t15 = getelementptr [2 x i8], [2 x i8]* @.str91 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t15)
  %t16 = load i32**, i32*** %t3
  %t17 = load i32, i32* %t5
  %t18 = getelementptr i32*, i32** %t16, i32 %t17
  %t19 = load i32*, i32** %t18
  %t20 = load i32, i32* %t6
  %t21 = getelementptr i32, i32* %t19, i32 %t20
  %t22 = load i32, i32* %t21
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t22)
  %t23 = getelementptr [3 x i8], [3 x i8]* @.str92 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t23)
  %t24 = load i32, i32* %t6
  %t25 = add i32 1, 0
  %t26 = add i32 %t24, %t25
  store i32 %t26, i32* %t6
  br label %l4
l6:
  %t27 = getelementptr i8, i8* @nl, i32 0
  %t28 = load i8, i8* %t27
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t28)
  %t29 = load i32, i32* %t5
  %t30 = add i32 1, 0
  %t31 = add i32 %t29, %t30
  store i32 %t31, i32* %t5
  br label %l1
l3:
  ret void
}
@.str91 = private unnamed_addr constant [2 x i8] c"[\00"
@.str92 = private unnamed_addr constant [3 x i8] c"] \00"

define void @test_nested_conditions() {
  %t1 = alloca i8
  %t2 = alloca double
  %t3 = alloca i32*
  %t4 = getelementptr [19 x i8], [19 x i8]* @.str93 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t4)
  %t5 = add i32 5, 0
  %t6 = sitofp i32 %t5 to double
  store double %t6, double* %t2
  %t7 = load double, double* %t2
  %t8 = fadd double 0x40139999a0000000, 0x0
  %t9 = fcmp ogt double %t7, %t8
  br i1 %t9, label %l4, label %l1
l4:
  %t10 = add i32 3, 0
  %t11 = sitofp i32 %t10 to double
  %t12 = load double, double* %t2
  %t13 = fcmp oeq double %t11, %t12
  br i1 %t13, label %l2, label %l1
l1:
  br label %l3
l2:
  br label %l3
l3:
  %t14 = phi i32 [1, %l1], [0, %l2]
  %t15 = sitofp i32 %t14 to double
  store double %t15, double* %t2
  %t16 = load double, double* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t16)
  %t17 = getelementptr i8, i8* @nl, i32 0
  %t18 = load i8, i8* %t17
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t18)
  %t19 = fadd double 0x3f1a36e2e0000000, 0x0
  %t20 = fsub double 0x0, %t19
  store double %t20, double* %t2
  %t21 = load double, double* %t2
  %t22 = add i32 0, 0
  %t23 = sitofp i32 %t22 to double
  %t24 = fcmp ole double %t21, %t23
  br i1 %t24, label %l5, label %l8
l8:
  %t25 = load double, double* %t2
  %t26 = fcmp one double %t25, 0x0
  br i1 %t26, label %l6, label %l5
l5:
  br label %l7
l6:
  br label %l7
l7:
  %t27 = phi i32 [1, %l5], [0, %l6]
  %t28 = sitofp i32 %t27 to double
  store double %t28, double* %t2
  %t29 = load double, double* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t29)
  %t30 = getelementptr i8, i8* @nl, i32 0
  %t31 = load i8, i8* %t30
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t31)
  %t32 = add i32 0, 0
  %t33 = trunc i32 %t32 to i8
  store i8 %t33, i8* %t1
  %t34 = fadd double 0x4032800000000000, 0x0
  store double %t34, double* %t2
  %t35 = fadd double 0x4033800000000000, 0x0
  %t36 = load double, double* %t2
  %t37 = fsub double %t35, %t36
  %t38 = add i32 2, 0
  %t39 = sitofp i32 %t38 to double
  %t40 = fdiv double %t37, %t39
  %t41 = add i32 0, 0
  %t42 = sitofp i32 %t41 to double
  %t43 = fcmp ogt double %t40, %t42
  br i1 %t43, label %l12, label %l10
l12:
  %t44 = load i8, i8* %t1
  %t45 = icmp ne i8 %t44, 0
  br i1 %t45, label %l10, label %l9
l9:
  br label %l11
l10:
  br label %l11
l11:
  %t46 = phi i32 [1, %l9], [0, %l10]
  %t47 = sitofp i32 %t46 to double
  %t48 = fadd double 0x3fc0000000000000, 0x0
  %t49 = fmul double %t47, %t48
  store double %t49, double* %t2
  %t50 = load double, double* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t50)
  %t51 = getelementptr i8, i8* @nl, i32 0
  %t52 = load i8, i8* %t51
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t52)
  ret void
}
@.str93 = private unnamed_addr constant [19 x i8] c"Nested conditions
\00"

define i32 @main() {
  %t1 = getelementptr i8, i8* @nl, i32 0
  %t2 = add i32 10, 0
  %t3 = trunc i32 %t2 to i8
  store i8 %t3, i8* %t1
  call void @test_basic_if()
  %t4 = getelementptr i8, i8* @nl, i32 0
  %t5 = load i8, i8* %t4
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t5)
  call void @test_basic_ifelse()
  %t6 = getelementptr i8, i8* @nl, i32 0
  %t7 = load i8, i8* %t6
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t7)
  call void @test_basic_while()
  %t8 = getelementptr i8, i8* @nl, i32 0
  %t9 = load i8, i8* %t8
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t9)
  call void @test_basic_conds()
  %t10 = getelementptr i8, i8* @nl, i32 0
  %t11 = load i8, i8* %t10
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t11)
  call void @test_cond_types()
  %t12 = getelementptr i8, i8* @nl, i32 0
  %t13 = load i8, i8* %t12
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t13)
  call void @test_short_circuit()
  %t14 = getelementptr i8, i8* @nl, i32 0
  %t15 = load i8, i8* %t14
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t15)
  call void @test_nested_conditions()
  %t16 = getelementptr i8, i8* @nl, i32 0
  %t17 = load i8, i8* %t16
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t17)
  %t18 = getelementptr [11 x i8], [11 x i8]* @.str94 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t18)
  %t19 = add i32 10, 0
  %t20 = call i32 @factorial(i32 %t19)
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t20)
  %t21 = getelementptr i8, i8* @nl, i32 0
  %t22 = load i8, i8* %t21
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t22)
  %t23 = getelementptr i8, i8* @nl, i32 0
  %t24 = load i8, i8* %t23
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t24)
  %t25 = alloca i32
  %t26 = add i32 5, 0
  store i32 %t26, i32* %t25
  %t27 = getelementptr [32 x i8], [32 x i8]* @.str95 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t27)
  %t28 = load i32, i32* %t25
  %t29 = call i32** @new_matrix(i32 %t28)
  %t30 = load i32, i32* %t25
  call void @print_matrix(i32** %t29, i32 %t30)
  %t31 = getelementptr i8, i8* @nl, i32 0
  %t32 = load i8, i8* %t31
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t32)
  %t33 = alloca i8
  %t34 = alloca i32
  %t35 = alloca double
  %t36 = add i32 65, 0
  %t37 = trunc i32 %t36 to i8
  store i8 %t37, i8* %t33
  %t38 = add i32 125, 0
  store i32 %t38, i32* %t34
  %t39 = fadd double 0x4039e66660000000, 0x0
  store double %t39, double* %t35
  %t40 = load i8, i8* %t33
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t40)
  %t41 = getelementptr i8, i8* @nl, i32 0
  %t42 = load i8, i8* %t41
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t42)
  %t43 = load i32, i32* %t34
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t43)
  %t44 = getelementptr i8, i8* @nl, i32 0
  %t45 = load i8, i8* %t44
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t45)
  %t46 = load double, double* %t35
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t46)
  %t47 = getelementptr i8, i8* @nl, i32 0
  %t48 = load i8, i8* %t47
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i8 %t48)
  %t49 = add i32 0, 0
  ret i32 %t49
  ret i32 0
}
@.str94 = private unnamed_addr constant [11 x i8] c"Factorial
\00"
@.str95 = private unnamed_addr constant [32 x i8] c"Print matrix a(ij) = (i >= j) 
\00"

