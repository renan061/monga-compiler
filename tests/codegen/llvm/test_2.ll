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
  br label %l7
l7:
  %t18 = add i32 0, 0
  %t19 = icmp ne i32 %t18, 0
  br i1 %t19, label %l8, label %l9
l8:
  %t20 = getelementptr [12 x i8], [12 x i8]* @.str16 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t20)
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
  %t54 = zext i1 %t53 to i32
  %t55 = icmp ne i32 %t54, 0
  br i1 %t55, label %l25, label %l26
l25:
  %t56 = getelementptr [10 x i8], [10 x i8]* @.str29 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t56)
  br label %l26
l26:
  %t57 = add i32 0, 0
  %t58 = add i32 1, 0
  %t59 = icmp eq i32 %t57, %t58
  %t60 = zext i1 %t59 to i32
  %t61 = icmp ne i32 %t60, 0
  br i1 %t61, label %l27, label %l28
l27:
  %t62 = getelementptr [13 x i8], [13 x i8]* @.str30 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t62)
  br label %l28
l28:
  %t63 = add i32 0, 0
  %t64 = icmp ne i32 %t63, 0
  br i1 %t64, label %l31, label %l30
l31:
  %t65 = add i32 0, 0
  %t66 = icmp ne i32 %t65, 0
  br i1 %t66, label %l29, label %l30
l29:
  %t67 = getelementptr [11 x i8], [11 x i8]* @.str31 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t67)
  br label %l30
l30:
  %t68 = add i32 0, 0
  %t69 = icmp ne i32 %t68, 0
  br i1 %t69, label %l34, label %l33
l34:
  %t70 = add i32 1, 0
  %t71 = icmp ne i32 %t70, 0
  br i1 %t71, label %l32, label %l33
l32:
  %t72 = getelementptr [11 x i8], [11 x i8]* @.str32 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t72)
  br label %l33
l33:
  %t73 = add i32 1, 0
  %t74 = icmp ne i32 %t73, 0
  br i1 %t74, label %l37, label %l36
l37:
  %t75 = add i32 0, 0
  %t76 = icmp ne i32 %t75, 0
  br i1 %t76, label %l35, label %l36
l35:
  %t77 = getelementptr [11 x i8], [11 x i8]* @.str33 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t77)
  br label %l36
l36:
  %t78 = add i32 1, 0
  %t79 = icmp ne i32 %t78, 0
  br i1 %t79, label %l40, label %l39
l40:
  %t80 = add i32 1, 0
  %t81 = icmp ne i32 %t80, 0
  br i1 %t81, label %l38, label %l39
l38:
  %t82 = getelementptr [8 x i8], [8 x i8]* @.str34 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t82)
  br label %l39
l39:
  %t83 = add i32 0, 0
  %t84 = icmp ne i32 %t83, 0
  br i1 %t84, label %l41, label %l43
l43:
  %t85 = add i32 0, 0
  %t86 = icmp ne i32 %t85, 0
  br i1 %t86, label %l41, label %l42
l41:
  %t87 = getelementptr [10 x i8], [10 x i8]* @.str35 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t87)
  br label %l42
l42:
  %t88 = add i32 0, 0
  %t89 = icmp ne i32 %t88, 0
  br i1 %t89, label %l44, label %l46
l46:
  %t90 = add i32 1, 0
  %t91 = icmp ne i32 %t90, 0
  br i1 %t91, label %l44, label %l45
l44:
  %t92 = getelementptr [7 x i8], [7 x i8]* @.str36 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t92)
  br label %l45
l45:
  %t93 = add i32 1, 0
  %t94 = icmp ne i32 %t93, 0
  br i1 %t94, label %l47, label %l49
l49:
  %t95 = add i32 0, 0
  %t96 = icmp ne i32 %t95, 0
  br i1 %t96, label %l47, label %l48
l47:
  %t97 = getelementptr [7 x i8], [7 x i8]* @.str37 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t97)
  br label %l48
l48:
  %t98 = add i32 1, 0
  %t99 = icmp ne i32 %t98, 0
  br i1 %t99, label %l50, label %l52
l52:
  %t100 = add i32 1, 0
  %t101 = icmp ne i32 %t100, 0
  br i1 %t101, label %l50, label %l51
l50:
  %t102 = getelementptr [7 x i8], [7 x i8]* @.str38 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t102)
  br label %l51
l51:
  %t103 = add i32 1, 0
  %t104 = add i32 1, 0
  %t105 = sub i32 0, %t104
  %t106 = add i32 %t103, %t105
  %t107 = icmp ne i32 %t106, 0
  br i1 %t107, label %l53, label %l54
l53:
  %t108 = getelementptr [11 x i8], [11 x i8]* @.str39 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t108)
  br label %l54
l54:
  %t109 = add i32 1, 0
  %t110 = add i32 1, 0
  %t111 = add i32 %t109, %t110
  %t112 = icmp ne i32 %t111, 0
  br i1 %t112, label %l55, label %l56
l55:
  %t113 = getelementptr [8 x i8], [8 x i8]* @.str40 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t113)
  br label %l56
l56:
  %t114 = add i32 1, 0
  %t115 = add i32 1, 0
  %t116 = sub i32 %t114, %t115
  %t117 = icmp ne i32 %t116, 0
  br i1 %t117, label %l57, label %l58
l57:
  %t118 = getelementptr [11 x i8], [11 x i8]* @.str41 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t118)
  br label %l58
l58:
  %t119 = add i32 1, 0
  %t120 = add i32 2, 0
  %t121 = sub i32 %t119, %t120
  %t122 = icmp ne i32 %t121, 0
  br i1 %t122, label %l59, label %l60
l59:
  %t123 = getelementptr [8 x i8], [8 x i8]* @.str42 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t123)
  br label %l60
l60:
  %t124 = add i32 1, 0
  %t125 = add i32 0, 0
  %t126 = mul i32 %t124, %t125
  %t127 = icmp ne i32 %t126, 0
  br i1 %t127, label %l61, label %l62
l61:
  %t128 = getelementptr [11 x i8], [11 x i8]* @.str43 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t128)
  br label %l62
l62:
  %t129 = add i32 1, 0
  %t130 = add i32 1, 0
  %t131 = mul i32 %t129, %t130
  %t132 = icmp ne i32 %t131, 0
  br i1 %t132, label %l63, label %l64
l63:
  %t133 = getelementptr [8 x i8], [8 x i8]* @.str44 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t133)
  br label %l64
l64:
  %t134 = add i32 1, 0
  %t135 = add i32 1, 0
  %t136 = sdiv i32 %t134, %t135
  %t137 = icmp ne i32 %t136, 0
  br i1 %t137, label %l65, label %l66
l65:
  %t138 = getelementptr [8 x i8], [8 x i8]* @.str45 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t138)
  br label %l66
l66:
  %t139 = add i32 0, 0
  %t140 = add i32 0, 0
  %t141 = icmp sgt i32 %t139, %t140
  %t142 = zext i1 %t141 to i32
  %t143 = icmp ne i32 %t142, 0
  br i1 %t143, label %l67, label %l68
l67:
  %t144 = getelementptr [19 x i8], [19 x i8]* @.str46 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t144)
  br label %l68
l68:
  %t145 = add i32 0, 0
  %t146 = add i32 1, 0
  %t147 = icmp sgt i32 %t145, %t146
  %t148 = zext i1 %t147 to i32
  %t149 = icmp ne i32 %t148, 0
  br i1 %t149, label %l69, label %l70
l69:
  %t150 = getelementptr [19 x i8], [19 x i8]* @.str47 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t150)
  br label %l70
l70:
  %t151 = add i32 1, 0
  %t152 = add i32 0, 0
  %t153 = icmp sgt i32 %t151, %t152
  %t154 = zext i1 %t153 to i32
  %t155 = icmp ne i32 %t154, 0
  br i1 %t155, label %l71, label %l72
l71:
  %t156 = getelementptr [16 x i8], [16 x i8]* @.str48 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t156)
  br label %l72
l72:
  %t157 = add i32 0, 0
  %t158 = add i32 0, 0
  %t159 = icmp slt i32 %t157, %t158
  %t160 = zext i1 %t159 to i32
  %t161 = icmp ne i32 %t160, 0
  br i1 %t161, label %l73, label %l74
l73:
  %t162 = getelementptr [16 x i8], [16 x i8]* @.str49 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t162)
  br label %l74
l74:
  %t163 = add i32 1, 0
  %t164 = add i32 0, 0
  %t165 = icmp slt i32 %t163, %t164
  %t166 = zext i1 %t165 to i32
  %t167 = icmp ne i32 %t166, 0
  br i1 %t167, label %l75, label %l76
l75:
  %t168 = getelementptr [16 x i8], [16 x i8]* @.str50 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t168)
  br label %l76
l76:
  %t169 = add i32 0, 0
  %t170 = add i32 1, 0
  %t171 = icmp slt i32 %t169, %t170
  %t172 = zext i1 %t171 to i32
  %t173 = icmp ne i32 %t172, 0
  br i1 %t173, label %l77, label %l78
l77:
  %t174 = getelementptr [13 x i8], [13 x i8]* @.str51 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t174)
  br label %l78
l78:
  %t175 = add i32 0, 0
  %t176 = add i32 1, 0
  %t177 = icmp sge i32 %t175, %t176
  %t178 = zext i1 %t177 to i32
  %t179 = icmp ne i32 %t178, 0
  br i1 %t179, label %l79, label %l80
l79:
  %t180 = getelementptr [20 x i8], [20 x i8]* @.str52 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t180)
  br label %l80
l80:
  %t181 = add i32 0, 0
  %t182 = add i32 0, 0
  %t183 = icmp sge i32 %t181, %t182
  %t184 = zext i1 %t183 to i32
  %t185 = icmp ne i32 %t184, 0
  br i1 %t185, label %l81, label %l82
l81:
  %t186 = getelementptr [17 x i8], [17 x i8]* @.str53 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t186)
  br label %l82
l82:
  %t187 = add i32 1, 0
  %t188 = add i32 0, 0
  %t189 = icmp sge i32 %t187, %t188
  %t190 = zext i1 %t189 to i32
  %t191 = icmp ne i32 %t190, 0
  br i1 %t191, label %l83, label %l84
l83:
  %t192 = getelementptr [17 x i8], [17 x i8]* @.str54 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t192)
  br label %l84
l84:
  %t193 = add i32 1, 0
  %t194 = add i32 0, 0
  %t195 = icmp sle i32 %t193, %t194
  %t196 = zext i1 %t195 to i32
  %t197 = icmp ne i32 %t196, 0
  br i1 %t197, label %l85, label %l86
l85:
  %t198 = getelementptr [17 x i8], [17 x i8]* @.str55 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t198)
  br label %l86
l86:
  %t199 = add i32 0, 0
  %t200 = add i32 0, 0
  %t201 = icmp sle i32 %t199, %t200
  %t202 = zext i1 %t201 to i32
  %t203 = icmp ne i32 %t202, 0
  br i1 %t203, label %l87, label %l88
l87:
  %t204 = getelementptr [14 x i8], [14 x i8]* @.str56 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t204)
  br label %l88
l88:
  %t205 = add i32 0, 0
  %t206 = add i32 1, 0
  %t207 = icmp sle i32 %t205, %t206
  %t208 = zext i1 %t207 to i32
  %t209 = icmp ne i32 %t208, 0
  br i1 %t209, label %l89, label %l90
l89:
  %t210 = getelementptr [14 x i8], [14 x i8]* @.str57 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t210)
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
  %t9 = sext i8 %t8 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t9)
  %t10 = alloca i8
  %t11 = add i32 65, 0
  %t12 = trunc i32 %t11 to i8
  store i8 %t12, i8* %t10
  %t13 = load i8, i8* %t10
  %t14 = icmp ne i8 %t13, 0
  br i1 %t14, label %l3, label %l4
l3:
  %t15 = load i8, i8* %t10
  %t16 = sext i8 %t15 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t16)
  br label %l4
l4:
  %t17 = getelementptr i8, i8* @nl, i32 0
  %t18 = load i8, i8* %t17
  %t19 = sext i8 %t18 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t19)
  %t20 = alloca double
  %t21 = fadd double 0x3fb99999a0000000, 0x0
  store double %t21, double* %t20
  %t22 = load double, double* %t20
  %t23 = fcmp one double %t22, 0x0
  br i1 %t23, label %l5, label %l6
l5:
  %t24 = load double, double* %t20
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t24)
  br label %l6
l6:
  %t25 = getelementptr i8, i8* @nl, i32 0
  %t26 = load i8, i8* %t25
  %t27 = sext i8 %t26 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t27)
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
  %t14 = zext i1 %t13 to i32
  %t15 = icmp ne i32 %t14, 0
  br i1 %t15, label %l5, label %l6
l5:
  %t16 = getelementptr [26 x i8], [26 x i8]* @.str61 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t16)
  br label %l7
l6:
  %t17 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t18 = load i32, i32* %t17
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t18)
  %t19 = getelementptr [28 x i8], [28 x i8]* @.str62 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t19)
  br label %l7
l7:
  %t20 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t21 = add i32 0, 0
  store i32 %t21, i32* %t20
  %t22 = call i32 @increment_and_return_true()
  %t23 = icmp ne i32 %t22, 0
  br i1 %t23, label %l11, label %l9
l11:
  %t24 = call i32 @increment_and_return_true()
  %t25 = icmp ne i32 %t24, 0
  br i1 %t25, label %l8, label %l9
l8:
  %t26 = getelementptr [3 x i8], [3 x i8]* @.str63 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t26)
  br label %l10
l9:
  %t27 = getelementptr [6 x i8], [6 x i8]* @.str64 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t27)
  br label %l10
l10:
  %t28 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t29 = load i32, i32* %t28
  %t30 = add i32 6, 0
  %t31 = icmp eq i32 %t29, %t30
  %t32 = zext i1 %t31 to i32
  %t33 = icmp ne i32 %t32, 0
  br i1 %t33, label %l12, label %l13
l12:
  %t34 = getelementptr [26 x i8], [26 x i8]* @.str65 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t34)
  br label %l14
l13:
  %t35 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t36 = load i32, i32* %t35
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t36)
  %t37 = getelementptr [28 x i8], [28 x i8]* @.str66 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t37)
  br label %l14
l14:
  %t38 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t39 = add i32 0, 0
  store i32 %t39, i32* %t38
  %t40 = call i32 @increment_and_return_true()
  %t41 = icmp ne i32 %t40, 0
  br i1 %t41, label %l18, label %l16
l18:
  %t42 = call i32 @increment_and_return_false()
  %t43 = icmp ne i32 %t42, 0
  br i1 %t43, label %l15, label %l16
l15:
  %t44 = getelementptr [6 x i8], [6 x i8]* @.str67 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t44)
  br label %l17
l16:
  %t45 = getelementptr [3 x i8], [3 x i8]* @.str68 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t45)
  br label %l17
l17:
  %t46 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t47 = load i32, i32* %t46
  %t48 = add i32 2, 0
  %t49 = sub i32 0, %t48
  %t50 = icmp eq i32 %t47, %t49
  %t51 = zext i1 %t50 to i32
  %t52 = icmp ne i32 %t51, 0
  br i1 %t52, label %l19, label %l20
l19:
  %t53 = getelementptr [26 x i8], [26 x i8]* @.str69 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t53)
  br label %l21
l20:
  %t54 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t55 = load i32, i32* %t54
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t55)
  %t56 = getelementptr [28 x i8], [28 x i8]* @.str70 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t56)
  br label %l21
l21:
  %t57 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t58 = add i32 0, 0
  store i32 %t58, i32* %t57
  %t59 = call i32 @increment_and_return_false()
  %t60 = icmp ne i32 %t59, 0
  br i1 %t60, label %l25, label %l23
l25:
  %t61 = call i32 @increment_and_return_true()
  %t62 = icmp ne i32 %t61, 0
  br i1 %t62, label %l22, label %l23
l22:
  %t63 = getelementptr [6 x i8], [6 x i8]* @.str71 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t63)
  br label %l24
l23:
  %t64 = getelementptr [3 x i8], [3 x i8]* @.str72 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t64)
  br label %l24
l24:
  %t65 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t66 = load i32, i32* %t65
  %t67 = add i32 5, 0
  %t68 = sub i32 0, %t67
  %t69 = icmp eq i32 %t66, %t68
  %t70 = zext i1 %t69 to i32
  %t71 = icmp ne i32 %t70, 0
  br i1 %t71, label %l26, label %l27
l26:
  %t72 = getelementptr [26 x i8], [26 x i8]* @.str73 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t72)
  br label %l28
l27:
  %t73 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t74 = load i32, i32* %t73
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t74)
  %t75 = getelementptr [28 x i8], [28 x i8]* @.str74 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t75)
  br label %l28
l28:
  %t76 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t77 = add i32 0, 0
  store i32 %t77, i32* %t76
  %t78 = call i32 @increment_and_return_true()
  %t79 = icmp ne i32 %t78, 0
  br i1 %t79, label %l29, label %l32
l32:
  %t80 = call i32 @increment_and_return_true()
  %t81 = icmp ne i32 %t80, 0
  br i1 %t81, label %l29, label %l30
l29:
  %t82 = getelementptr [3 x i8], [3 x i8]* @.str75 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t82)
  br label %l31
l30:
  %t83 = getelementptr [6 x i8], [6 x i8]* @.str76 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t83)
  br label %l31
l31:
  %t84 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t85 = load i32, i32* %t84
  %t86 = add i32 3, 0
  %t87 = icmp eq i32 %t85, %t86
  %t88 = zext i1 %t87 to i32
  %t89 = icmp ne i32 %t88, 0
  br i1 %t89, label %l33, label %l34
l33:
  %t90 = getelementptr [25 x i8], [25 x i8]* @.str77 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t90)
  br label %l35
l34:
  %t91 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t92 = load i32, i32* %t91
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t92)
  %t93 = getelementptr [27 x i8], [27 x i8]* @.str78 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t93)
  br label %l35
l35:
  %t94 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t95 = add i32 0, 0
  store i32 %t95, i32* %t94
  %t96 = call i32 @increment_and_return_false()
  %t97 = icmp ne i32 %t96, 0
  br i1 %t97, label %l36, label %l39
l39:
  %t98 = call i32 @increment_and_return_false()
  %t99 = icmp ne i32 %t98, 0
  br i1 %t99, label %l36, label %l37
l36:
  %t100 = getelementptr [6 x i8], [6 x i8]* @.str79 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t100)
  br label %l38
l37:
  %t101 = getelementptr [3 x i8], [3 x i8]* @.str80 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t101)
  br label %l38
l38:
  %t102 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t103 = load i32, i32* %t102
  %t104 = add i32 10, 0
  %t105 = sub i32 0, %t104
  %t106 = icmp eq i32 %t103, %t105
  %t107 = zext i1 %t106 to i32
  %t108 = icmp ne i32 %t107, 0
  br i1 %t108, label %l40, label %l41
l40:
  %t109 = getelementptr [25 x i8], [25 x i8]* @.str81 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t109)
  br label %l42
l41:
  %t110 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t111 = load i32, i32* %t110
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t111)
  %t112 = getelementptr [27 x i8], [27 x i8]* @.str82 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t112)
  br label %l42
l42:
  %t113 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t114 = add i32 0, 0
  store i32 %t114, i32* %t113
  %t115 = call i32 @increment_and_return_true()
  %t116 = icmp ne i32 %t115, 0
  br i1 %t116, label %l43, label %l46
l46:
  %t117 = call i32 @increment_and_return_false()
  %t118 = icmp ne i32 %t117, 0
  br i1 %t118, label %l43, label %l44
l43:
  %t119 = getelementptr [3 x i8], [3 x i8]* @.str83 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t119)
  br label %l45
l44:
  %t120 = getelementptr [6 x i8], [6 x i8]* @.str84 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t120)
  br label %l45
l45:
  %t121 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t122 = load i32, i32* %t121
  %t123 = add i32 3, 0
  %t124 = icmp eq i32 %t122, %t123
  %t125 = zext i1 %t124 to i32
  %t126 = icmp ne i32 %t125, 0
  br i1 %t126, label %l47, label %l48
l47:
  %t127 = getelementptr [25 x i8], [25 x i8]* @.str85 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t127)
  br label %l49
l48:
  %t128 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t129 = load i32, i32* %t128
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t129)
  %t130 = getelementptr [27 x i8], [27 x i8]* @.str86 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t130)
  br label %l49
l49:
  %t131 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t132 = add i32 0, 0
  store i32 %t132, i32* %t131
  %t133 = call i32 @increment_and_return_false()
  %t134 = icmp ne i32 %t133, 0
  br i1 %t134, label %l50, label %l53
l53:
  %t135 = call i32 @increment_and_return_true()
  %t136 = icmp ne i32 %t135, 0
  br i1 %t136, label %l50, label %l51
l50:
  %t137 = getelementptr [3 x i8], [3 x i8]* @.str87 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t137)
  br label %l52
l51:
  %t138 = getelementptr [6 x i8], [6 x i8]* @.str88 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t138)
  br label %l52
l52:
  %t139 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t140 = load i32, i32* %t139
  %t141 = add i32 2, 0
  %t142 = sub i32 0, %t141
  %t143 = icmp eq i32 %t140, %t142
  %t144 = zext i1 %t143 to i32
  %t145 = icmp ne i32 %t144, 0
  br i1 %t145, label %l54, label %l55
l54:
  %t146 = getelementptr [25 x i8], [25 x i8]* @.str89 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t146)
  br label %l56
l55:
  %t147 = getelementptr i32, i32* @short_circuit_var, i32 0
  %t148 = load i32, i32* %t147
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t148)
  %t149 = getelementptr [27 x i8], [27 x i8]* @.str90 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t149)
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
  %t6 = zext i1 %t5 to i32
  %t7 = icmp ne i32 %t6, 0
  br i1 %t7, label %l1, label %l2
l1:
  %t8 = add i32 1, 0
  ret i32 %t8
  br label %l2
l2:
  %t9 = load i32, i32* %t2
  %t10 = load i32, i32* %t2
  %t11 = add i32 1, 0
  %t12 = sub i32 %t10, %t11
  %t13 = call i32 @factorial(i32 %t12)
  %t14 = mul i32 %t9, %t13
  ret i32 %t14
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
  %t15 = zext i1 %t14 to i32
  %t16 = icmp ne i32 %t15, 0
  br i1 %t16, label %l2, label %l3
l2:
  %t17 = add i32 0, 0
  store i32 %t17, i32* %t4
  %t18 = load i32**, i32*** %t5
  %t19 = load i32, i32* %t3
  %t20 = getelementptr i32*, i32** %t18, i32 %t19
  %t21 = load i32, i32* %t2
  %t22 = sext i32 %t21 to i64
  %t23 = mul i64 %t22, 4
  %t24 = call i8* @malloc(i64 %t23)
  %t25 = bitcast i8* %t24 to i32*
  store i32* %t25, i32** %t20
  br label %l4
l4:
  %t26 = load i32, i32* %t4
  %t27 = load i32, i32* %t2
  %t28 = icmp slt i32 %t26, %t27
  %t29 = zext i1 %t28 to i32
  %t30 = icmp ne i32 %t29, 0
  br i1 %t30, label %l5, label %l6
l5:
  %t31 = load i32**, i32*** %t5
  %t32 = load i32, i32* %t3
  %t33 = getelementptr i32*, i32** %t31, i32 %t32
  %t34 = load i32*, i32** %t33
  %t35 = load i32, i32* %t4
  %t36 = getelementptr i32, i32* %t34, i32 %t35
  %t37 = load i32, i32* %t3
  %t38 = load i32, i32* %t4
  %t39 = icmp sge i32 %t37, %t38
  %t40 = zext i1 %t39 to i32
  %t41 = icmp ne i32 %t40, 0
  br i1 %t41, label %l7, label %l8
l7:
  br label %l9
l8:
  br label %l9
l9:
  %t42 = phi i32 [1, %l7], [0, %l8]
  store i32 %t42, i32* %t36
  %t43 = load i32, i32* %t4
  %t44 = add i32 1, 0
  %t45 = add i32 %t43, %t44
  store i32 %t45, i32* %t4
  br label %l4
l6:
  %t46 = load i32, i32* %t3
  %t47 = add i32 1, 0
  %t48 = add i32 %t46, %t47
  store i32 %t48, i32* %t3
  br label %l1
l3:
  %t49 = load i32**, i32*** %t5
  ret i32** %t49
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
  %t11 = zext i1 %t10 to i32
  %t12 = icmp ne i32 %t11, 0
  br i1 %t12, label %l2, label %l3
l2:
  %t13 = add i32 0, 0
  store i32 %t13, i32* %t6
  br label %l4
l4:
  %t14 = load i32, i32* %t6
  %t15 = load i32, i32* %t4
  %t16 = icmp slt i32 %t14, %t15
  %t17 = zext i1 %t16 to i32
  %t18 = icmp ne i32 %t17, 0
  br i1 %t18, label %l5, label %l6
l5:
  %t19 = getelementptr [2 x i8], [2 x i8]* @.str91 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t19)
  %t20 = load i32**, i32*** %t3
  %t21 = load i32, i32* %t5
  %t22 = getelementptr i32*, i32** %t20, i32 %t21
  %t23 = load i32*, i32** %t22
  %t24 = load i32, i32* %t6
  %t25 = getelementptr i32, i32* %t23, i32 %t24
  %t26 = load i32, i32* %t25
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t26)
  %t27 = getelementptr [3 x i8], [3 x i8]* @.str92 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t27)
  %t28 = load i32, i32* %t6
  %t29 = add i32 1, 0
  %t30 = add i32 %t28, %t29
  store i32 %t30, i32* %t6
  br label %l4
l6:
  %t31 = getelementptr i8, i8* @nl, i32 0
  %t32 = load i8, i8* %t31
  %t33 = sext i8 %t32 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t33)
  %t34 = load i32, i32* %t5
  %t35 = add i32 1, 0
  %t36 = add i32 %t34, %t35
  store i32 %t36, i32* %t5
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
  %t10 = zext i1 %t9 to i32
  %t11 = icmp ne i32 %t10, 0
  br i1 %t11, label %l4, label %l1
l4:
  %t12 = add i32 3, 0
  %t13 = sitofp i32 %t12 to double
  %t14 = load double, double* %t2
  %t15 = fcmp oeq double %t13, %t14
  %t16 = zext i1 %t15 to i32
  %t17 = icmp ne i32 %t16, 0
  br i1 %t17, label %l2, label %l1
l1:
  br label %l3
l2:
  br label %l3
l3:
  %t18 = phi i32 [1, %l1], [0, %l2]
  %t19 = sitofp i32 %t18 to double
  store double %t19, double* %t2
  %t20 = load double, double* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t20)
  %t21 = getelementptr i8, i8* @nl, i32 0
  %t22 = load i8, i8* %t21
  %t23 = sext i8 %t22 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t23)
  %t24 = fadd double 0x3f1a36e2e0000000, 0x0
  %t25 = fsub double 0x0, %t24
  store double %t25, double* %t2
  %t26 = load double, double* %t2
  %t27 = add i32 0, 0
  %t28 = sitofp i32 %t27 to double
  %t29 = fcmp ole double %t26, %t28
  %t30 = zext i1 %t29 to i32
  %t31 = icmp ne i32 %t30, 0
  br i1 %t31, label %l5, label %l8
l8:
  %t32 = load double, double* %t2
  %t33 = fcmp one double %t32, 0x0
  br i1 %t33, label %l6, label %l5
l5:
  br label %l7
l6:
  br label %l7
l7:
  %t34 = phi i32 [1, %l5], [0, %l6]
  %t35 = sitofp i32 %t34 to double
  store double %t35, double* %t2
  %t36 = load double, double* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t36)
  %t37 = getelementptr i8, i8* @nl, i32 0
  %t38 = load i8, i8* %t37
  %t39 = sext i8 %t38 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t39)
  %t40 = add i32 0, 0
  %t41 = trunc i32 %t40 to i8
  store i8 %t41, i8* %t1
  %t42 = fadd double 0x4032800000000000, 0x0
  store double %t42, double* %t2
  %t43 = fadd double 0x4033800000000000, 0x0
  %t44 = load double, double* %t2
  %t45 = fsub double %t43, %t44
  %t46 = add i32 2, 0
  %t47 = sitofp i32 %t46 to double
  %t48 = fdiv double %t45, %t47
  %t49 = add i32 0, 0
  %t50 = sitofp i32 %t49 to double
  %t51 = fcmp ogt double %t48, %t50
  %t52 = zext i1 %t51 to i32
  %t53 = icmp ne i32 %t52, 0
  br i1 %t53, label %l12, label %l10
l12:
  %t54 = load i8, i8* %t1
  %t55 = icmp ne i8 %t54, 0
  br i1 %t55, label %l10, label %l9
l9:
  br label %l11
l10:
  br label %l11
l11:
  %t56 = phi i32 [1, %l9], [0, %l10]
  %t57 = sitofp i32 %t56 to double
  %t58 = fadd double 0x3fc0000000000000, 0x0
  %t59 = fmul double %t57, %t58
  store double %t59, double* %t2
  %t60 = load double, double* %t2
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pfloat, i32 0, i32 0), double %t60)
  %t61 = getelementptr i8, i8* @nl, i32 0
  %t62 = load i8, i8* %t61
  %t63 = sext i8 %t62 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t63)
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
  call void @test_cond_types()
  %t16 = getelementptr i8, i8* @nl, i32 0
  %t17 = load i8, i8* %t16
  %t18 = sext i8 %t17 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t18)
  call void @test_short_circuit()
  %t19 = getelementptr i8, i8* @nl, i32 0
  %t20 = load i8, i8* %t19
  %t21 = sext i8 %t20 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t21)
  call void @test_nested_conditions()
  %t22 = getelementptr i8, i8* @nl, i32 0
  %t23 = load i8, i8* %t22
  %t24 = sext i8 %t23 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t24)
  %t25 = getelementptr [11 x i8], [11 x i8]* @.str94 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t25)
  %t26 = add i32 10, 0
  %t27 = call i32 @factorial(i32 %t26)
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pint, i32 0, i32 0), i32 %t27)
  %t28 = getelementptr i8, i8* @nl, i32 0
  %t29 = load i8, i8* %t28
  %t30 = sext i8 %t29 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t30)
  %t31 = getelementptr i8, i8* @nl, i32 0
  %t32 = load i8, i8* %t31
  %t33 = sext i8 %t32 to i32
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pchar, i32 0, i32 0), i32 %t33)
  %t34 = alloca i32
  %t35 = add i32 5, 0
  store i32 %t35, i32* %t34
  %t36 = getelementptr [32 x i8], [32 x i8]* @.str95 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t36)
  %t37 = load i32, i32* %t34
  %t38 = call i32** @new_matrix(i32 %t37)
  %t39 = load i32, i32* %t34
  call void @print_matrix(i32** %t38, i32 %t39)
  %t40 = add i32 0, 0
  ret i32 %t40
  ret i32 0
}
@.str94 = private unnamed_addr constant [11 x i8] c"Factorial
\00"
@.str95 = private unnamed_addr constant [32 x i8] c"Print matrix a(ij) = (i >= j) 
\00"

