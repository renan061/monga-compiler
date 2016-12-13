declare i32 @putchar(i32)
declare i32 @printf(i8*, ...)
declare i8* @malloc(i64)
@.pchar = private unnamed_addr constant [3 x i8] c"%c\00"
@.pint = private unnamed_addr constant [3 x i8] c"%d\00"
@.pfloat = private unnamed_addr constant [3 x i8] c"%f\00"
@.pstr = private unnamed_addr constant [3 x i8] c"%s\00"
@.paddress = private unnamed_addr constant [3 x i8] c"%p\00"

define i32 @main() {
  %t1 = getelementptr [5 x i8], [5 x i8]* @.str0 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t1)
  %t2 = getelementptr [5 x i8], [5 x i8]* @.str1 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t2)
  %t3 = getelementptr [5 x i8], [5 x i8]* @.str2 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t3)
  %t4 = getelementptr [5 x i8], [5 x i8]* @.str3 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t4)
  %t5 = getelementptr [5 x i8], [5 x i8]* @.str4 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t5)
  %t6 = getelementptr [5 x i8], [5 x i8]* @.str5 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t6)
  %t7 = getelementptr [5 x i8], [5 x i8]* @.str6 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t7)
  %t8 = getelementptr [5 x i8], [5 x i8]* @.str7 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t8)
  %t9 = getelementptr [5 x i8], [5 x i8]* @.str8 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t9)
  %t10 = getelementptr [5 x i8], [5 x i8]* @.str9 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t10)
  %t11 = getelementptr [5 x i8], [5 x i8]* @.str10 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t11)
  %t12 = getelementptr [5 x i8], [5 x i8]* @.str11 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t12)
  %t13 = getelementptr [5 x i8], [5 x i8]* @.str12 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t13)
  %t14 = getelementptr [5 x i8], [5 x i8]* @.str13 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t14)
  %t15 = getelementptr [5 x i8], [5 x i8]* @.str14 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t15)
  %t16 = getelementptr [5 x i8], [5 x i8]* @.str15 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t16)
  %t17 = getelementptr [5 x i8], [5 x i8]* @.str16 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t17)
  %t18 = getelementptr [5 x i8], [5 x i8]* @.str17 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t18)
  %t19 = getelementptr [5 x i8], [5 x i8]* @.str18 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t19)
  %t20 = getelementptr [5 x i8], [5 x i8]* @.str19 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t20)
  %t21 = getelementptr [5 x i8], [5 x i8]* @.str20 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t21)
  %t22 = getelementptr [5 x i8], [5 x i8]* @.str21 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t22)
  %t23 = getelementptr [5 x i8], [5 x i8]* @.str22 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t23)
  %t24 = getelementptr [5 x i8], [5 x i8]* @.str23 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t24)
  %t25 = getelementptr [5 x i8], [5 x i8]* @.str24 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t25)
  %t26 = getelementptr [5 x i8], [5 x i8]* @.str25 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t26)
  %t27 = getelementptr [5 x i8], [5 x i8]* @.str26 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t27)
  %t28 = getelementptr [5 x i8], [5 x i8]* @.str27 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t28)
  %t29 = getelementptr [5 x i8], [5 x i8]* @.str28 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t29)
  %t30 = getelementptr [5 x i8], [5 x i8]* @.str29 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t30)
  %t31 = getelementptr [5 x i8], [5 x i8]* @.str30 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t31)
  %t32 = getelementptr [5 x i8], [5 x i8]* @.str31 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t32)
  %t33 = getelementptr [5 x i8], [5 x i8]* @.str32 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t33)
  %t34 = getelementptr [5 x i8], [5 x i8]* @.str33 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t34)
  %t35 = getelementptr [5 x i8], [5 x i8]* @.str34 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t35)
  %t36 = getelementptr [5 x i8], [5 x i8]* @.str35 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t36)
  %t37 = getelementptr [5 x i8], [5 x i8]* @.str36 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t37)
  %t38 = getelementptr [5 x i8], [5 x i8]* @.str37 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t38)
  %t39 = getelementptr [5 x i8], [5 x i8]* @.str38 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t39)
  %t40 = getelementptr [5 x i8], [5 x i8]* @.str39 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t40)
  %t41 = getelementptr [5 x i8], [5 x i8]* @.str40 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t41)
  %t42 = getelementptr [5 x i8], [5 x i8]* @.str41 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t42)
  %t43 = getelementptr [5 x i8], [5 x i8]* @.str42 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t43)
  %t44 = getelementptr [5 x i8], [5 x i8]* @.str43 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t44)
  %t45 = getelementptr [5 x i8], [5 x i8]* @.str44 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t45)
  %t46 = getelementptr [5 x i8], [5 x i8]* @.str45 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t46)
  %t47 = getelementptr [5 x i8], [5 x i8]* @.str46 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t47)
  %t48 = getelementptr [5 x i8], [5 x i8]* @.str47 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t48)
  %t49 = getelementptr [5 x i8], [5 x i8]* @.str48 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t49)
  %t50 = getelementptr [5 x i8], [5 x i8]* @.str49 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t50)
  %t51 = getelementptr [5 x i8], [5 x i8]* @.str50 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t51)
  %t52 = getelementptr [5 x i8], [5 x i8]* @.str51 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t52)
  %t53 = getelementptr [5 x i8], [5 x i8]* @.str52 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t53)
  %t54 = getelementptr [5 x i8], [5 x i8]* @.str53 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t54)
  %t55 = getelementptr [5 x i8], [5 x i8]* @.str54 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t55)
  %t56 = getelementptr [5 x i8], [5 x i8]* @.str55 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t56)
  %t57 = getelementptr [5 x i8], [5 x i8]* @.str56 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t57)
  %t58 = getelementptr [5 x i8], [5 x i8]* @.str57 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t58)
  %t59 = getelementptr [5 x i8], [5 x i8]* @.str58 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t59)
  %t60 = getelementptr [5 x i8], [5 x i8]* @.str59 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t60)
  %t61 = getelementptr [5 x i8], [5 x i8]* @.str60 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t61)
  %t62 = getelementptr [5 x i8], [5 x i8]* @.str61 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t62)
  %t63 = getelementptr [5 x i8], [5 x i8]* @.str62 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t63)
  %t64 = getelementptr [5 x i8], [5 x i8]* @.str63 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t64)
  %t65 = getelementptr [5 x i8], [5 x i8]* @.str64 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t65)
  %t66 = getelementptr [5 x i8], [5 x i8]* @.str65 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t66)
  %t67 = getelementptr [5 x i8], [5 x i8]* @.str66 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t67)
  %t68 = getelementptr [5 x i8], [5 x i8]* @.str67 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t68)
  %t69 = getelementptr [5 x i8], [5 x i8]* @.str68 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t69)
  %t70 = getelementptr [5 x i8], [5 x i8]* @.str69 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t70)
  %t71 = getelementptr [5 x i8], [5 x i8]* @.str70 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t71)
  %t72 = getelementptr [5 x i8], [5 x i8]* @.str71 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t72)
  %t73 = getelementptr [5 x i8], [5 x i8]* @.str72 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t73)
  %t74 = getelementptr [5 x i8], [5 x i8]* @.str73 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t74)
  %t75 = getelementptr [5 x i8], [5 x i8]* @.str74 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t75)
  %t76 = getelementptr [5 x i8], [5 x i8]* @.str75 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t76)
  %t77 = getelementptr [5 x i8], [5 x i8]* @.str76 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t77)
  %t78 = getelementptr [5 x i8], [5 x i8]* @.str77 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t78)
  %t79 = getelementptr [5 x i8], [5 x i8]* @.str78 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t79)
  %t80 = getelementptr [5 x i8], [5 x i8]* @.str79 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t80)
  %t81 = getelementptr [5 x i8], [5 x i8]* @.str80 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t81)
  %t82 = getelementptr [5 x i8], [5 x i8]* @.str81 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t82)
  %t83 = getelementptr [5 x i8], [5 x i8]* @.str82 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t83)
  %t84 = getelementptr [5 x i8], [5 x i8]* @.str83 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t84)
  %t85 = getelementptr [5 x i8], [5 x i8]* @.str84 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t85)
  %t86 = getelementptr [5 x i8], [5 x i8]* @.str85 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t86)
  %t87 = getelementptr [5 x i8], [5 x i8]* @.str86 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t87)
  %t88 = getelementptr [5 x i8], [5 x i8]* @.str87 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t88)
  %t89 = getelementptr [5 x i8], [5 x i8]* @.str88 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t89)
  %t90 = getelementptr [5 x i8], [5 x i8]* @.str89 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t90)
  %t91 = getelementptr [5 x i8], [5 x i8]* @.str90 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t91)
  %t92 = getelementptr [5 x i8], [5 x i8]* @.str91 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t92)
  %t93 = getelementptr [5 x i8], [5 x i8]* @.str92 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t93)
  %t94 = getelementptr [5 x i8], [5 x i8]* @.str93 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t94)
  %t95 = getelementptr [5 x i8], [5 x i8]* @.str94 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t95)
  %t96 = getelementptr [5 x i8], [5 x i8]* @.str95 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t96)
  %t97 = getelementptr [5 x i8], [5 x i8]* @.str96 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t97)
  %t98 = getelementptr [5 x i8], [5 x i8]* @.str97 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t98)
  %t99 = getelementptr [5 x i8], [5 x i8]* @.str98 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t99)
  %t100 = getelementptr [5 x i8], [5 x i8]* @.str99 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t100)
  %t101 = getelementptr [5 x i8], [5 x i8]* @.str100 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t101)
  %t102 = getelementptr [5 x i8], [5 x i8]* @.str101 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t102)
  %t103 = getelementptr [5 x i8], [5 x i8]* @.str102 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t103)
  %t104 = getelementptr [5 x i8], [5 x i8]* @.str103 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t104)
  %t105 = getelementptr [5 x i8], [5 x i8]* @.str104 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t105)
  %t106 = getelementptr [5 x i8], [5 x i8]* @.str105 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t106)
  %t107 = getelementptr [5 x i8], [5 x i8]* @.str106 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t107)
  %t108 = getelementptr [5 x i8], [5 x i8]* @.str107 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t108)
  %t109 = getelementptr [5 x i8], [5 x i8]* @.str108 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t109)
  %t110 = getelementptr [5 x i8], [5 x i8]* @.str109 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t110)
  %t111 = getelementptr [5 x i8], [5 x i8]* @.str110 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t111)
  %t112 = getelementptr [5 x i8], [5 x i8]* @.str111 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t112)
  %t113 = getelementptr [5 x i8], [5 x i8]* @.str112 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t113)
  %t114 = getelementptr [5 x i8], [5 x i8]* @.str113 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t114)
  %t115 = getelementptr [5 x i8], [5 x i8]* @.str114 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t115)
  %t116 = getelementptr [5 x i8], [5 x i8]* @.str115 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t116)
  %t117 = getelementptr [5 x i8], [5 x i8]* @.str116 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t117)
  %t118 = getelementptr [5 x i8], [5 x i8]* @.str117 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t118)
  %t119 = getelementptr [5 x i8], [5 x i8]* @.str118 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t119)
  %t120 = getelementptr [5 x i8], [5 x i8]* @.str119 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t120)
  %t121 = getelementptr [5 x i8], [5 x i8]* @.str120 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t121)
  %t122 = getelementptr [5 x i8], [5 x i8]* @.str121 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t122)
  %t123 = getelementptr [5 x i8], [5 x i8]* @.str122 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t123)
  %t124 = getelementptr [5 x i8], [5 x i8]* @.str123 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t124)
  %t125 = getelementptr [5 x i8], [5 x i8]* @.str124 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t125)
  %t126 = getelementptr [5 x i8], [5 x i8]* @.str125 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t126)
  %t127 = getelementptr [5 x i8], [5 x i8]* @.str126 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t127)
  %t128 = getelementptr [5 x i8], [5 x i8]* @.str127 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t128)
  %t129 = getelementptr [5 x i8], [5 x i8]* @.str128 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t129)
  %t130 = getelementptr [5 x i8], [5 x i8]* @.str129 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t130)
  %t131 = getelementptr [5 x i8], [5 x i8]* @.str130 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t131)
  %t132 = getelementptr [5 x i8], [5 x i8]* @.str131 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t132)
  %t133 = getelementptr [5 x i8], [5 x i8]* @.str132 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t133)
  %t134 = getelementptr [5 x i8], [5 x i8]* @.str133 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t134)
  %t135 = getelementptr [5 x i8], [5 x i8]* @.str134 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t135)
  %t136 = getelementptr [5 x i8], [5 x i8]* @.str135 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t136)
  %t137 = getelementptr [5 x i8], [5 x i8]* @.str136 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t137)
  %t138 = getelementptr [5 x i8], [5 x i8]* @.str137 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t138)
  %t139 = getelementptr [5 x i8], [5 x i8]* @.str138 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t139)
  %t140 = getelementptr [5 x i8], [5 x i8]* @.str139 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t140)
  %t141 = getelementptr [5 x i8], [5 x i8]* @.str140 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t141)
  %t142 = getelementptr [5 x i8], [5 x i8]* @.str141 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t142)
  %t143 = getelementptr [5 x i8], [5 x i8]* @.str142 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t143)
  %t144 = getelementptr [5 x i8], [5 x i8]* @.str143 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t144)
  %t145 = getelementptr [5 x i8], [5 x i8]* @.str144 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t145)
  %t146 = getelementptr [5 x i8], [5 x i8]* @.str145 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t146)
  %t147 = getelementptr [5 x i8], [5 x i8]* @.str146 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t147)
  %t148 = getelementptr [5 x i8], [5 x i8]* @.str147 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t148)
  %t149 = getelementptr [5 x i8], [5 x i8]* @.str148 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t149)
  %t150 = getelementptr [5 x i8], [5 x i8]* @.str149 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t150)
  %t151 = getelementptr [5 x i8], [5 x i8]* @.str150 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t151)
  %t152 = getelementptr [5 x i8], [5 x i8]* @.str151 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t152)
  %t153 = getelementptr [5 x i8], [5 x i8]* @.str152 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t153)
  %t154 = getelementptr [5 x i8], [5 x i8]* @.str153 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t154)
  %t155 = getelementptr [5 x i8], [5 x i8]* @.str154 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t155)
  %t156 = getelementptr [5 x i8], [5 x i8]* @.str155 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t156)
  %t157 = getelementptr [5 x i8], [5 x i8]* @.str156 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t157)
  %t158 = getelementptr [5 x i8], [5 x i8]* @.str157 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t158)
  %t159 = getelementptr [5 x i8], [5 x i8]* @.str158 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t159)
  %t160 = getelementptr [5 x i8], [5 x i8]* @.str159 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t160)
  %t161 = getelementptr [5 x i8], [5 x i8]* @.str160 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t161)
  %t162 = getelementptr [5 x i8], [5 x i8]* @.str161 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t162)
  %t163 = getelementptr [5 x i8], [5 x i8]* @.str162 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t163)
  %t164 = getelementptr [5 x i8], [5 x i8]* @.str163 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t164)
  %t165 = getelementptr [5 x i8], [5 x i8]* @.str164 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t165)
  %t166 = getelementptr [5 x i8], [5 x i8]* @.str165 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t166)
  %t167 = getelementptr [5 x i8], [5 x i8]* @.str166 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t167)
  %t168 = getelementptr [5 x i8], [5 x i8]* @.str167 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t168)
  %t169 = getelementptr [5 x i8], [5 x i8]* @.str168 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t169)
  %t170 = getelementptr [5 x i8], [5 x i8]* @.str169 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t170)
  %t171 = getelementptr [5 x i8], [5 x i8]* @.str170 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t171)
  %t172 = getelementptr [5 x i8], [5 x i8]* @.str171 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t172)
  %t173 = getelementptr [5 x i8], [5 x i8]* @.str172 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t173)
  %t174 = getelementptr [5 x i8], [5 x i8]* @.str173 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t174)
  %t175 = getelementptr [5 x i8], [5 x i8]* @.str174 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t175)
  %t176 = getelementptr [5 x i8], [5 x i8]* @.str175 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t176)
  %t177 = getelementptr [5 x i8], [5 x i8]* @.str176 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t177)
  %t178 = getelementptr [5 x i8], [5 x i8]* @.str177 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t178)
  %t179 = getelementptr [5 x i8], [5 x i8]* @.str178 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t179)
  %t180 = getelementptr [5 x i8], [5 x i8]* @.str179 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t180)
  %t181 = getelementptr [5 x i8], [5 x i8]* @.str180 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t181)
  %t182 = getelementptr [5 x i8], [5 x i8]* @.str181 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t182)
  %t183 = getelementptr [5 x i8], [5 x i8]* @.str182 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t183)
  %t184 = getelementptr [5 x i8], [5 x i8]* @.str183 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t184)
  %t185 = getelementptr [5 x i8], [5 x i8]* @.str184 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t185)
  %t186 = getelementptr [5 x i8], [5 x i8]* @.str185 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t186)
  %t187 = getelementptr [5 x i8], [5 x i8]* @.str186 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t187)
  %t188 = getelementptr [5 x i8], [5 x i8]* @.str187 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t188)
  %t189 = getelementptr [5 x i8], [5 x i8]* @.str188 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t189)
  %t190 = getelementptr [5 x i8], [5 x i8]* @.str189 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t190)
  %t191 = getelementptr [5 x i8], [5 x i8]* @.str190 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t191)
  %t192 = getelementptr [5 x i8], [5 x i8]* @.str191 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t192)
  %t193 = getelementptr [5 x i8], [5 x i8]* @.str192 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t193)
  %t194 = getelementptr [5 x i8], [5 x i8]* @.str193 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t194)
  %t195 = getelementptr [5 x i8], [5 x i8]* @.str194 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t195)
  %t196 = getelementptr [5 x i8], [5 x i8]* @.str195 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t196)
  %t197 = getelementptr [5 x i8], [5 x i8]* @.str196 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t197)
  %t198 = getelementptr [5 x i8], [5 x i8]* @.str197 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t198)
  %t199 = getelementptr [5 x i8], [5 x i8]* @.str198 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t199)
  %t200 = getelementptr [5 x i8], [5 x i8]* @.str199 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t200)
  %t201 = getelementptr [5 x i8], [5 x i8]* @.str200 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t201)
  %t202 = getelementptr [5 x i8], [5 x i8]* @.str201 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t202)
  %t203 = getelementptr [5 x i8], [5 x i8]* @.str202 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t203)
  %t204 = getelementptr [5 x i8], [5 x i8]* @.str203 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t204)
  %t205 = getelementptr [5 x i8], [5 x i8]* @.str204 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t205)
  %t206 = getelementptr [5 x i8], [5 x i8]* @.str205 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t206)
  %t207 = getelementptr [5 x i8], [5 x i8]* @.str206 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t207)
  %t208 = getelementptr [5 x i8], [5 x i8]* @.str207 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t208)
  %t209 = getelementptr [5 x i8], [5 x i8]* @.str208 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t209)
  %t210 = getelementptr [5 x i8], [5 x i8]* @.str209 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t210)
  %t211 = getelementptr [5 x i8], [5 x i8]* @.str210 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t211)
  %t212 = getelementptr [5 x i8], [5 x i8]* @.str211 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t212)
  %t213 = getelementptr [5 x i8], [5 x i8]* @.str212 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t213)
  %t214 = getelementptr [5 x i8], [5 x i8]* @.str213 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t214)
  %t215 = getelementptr [5 x i8], [5 x i8]* @.str214 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t215)
  %t216 = getelementptr [5 x i8], [5 x i8]* @.str215 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t216)
  %t217 = getelementptr [5 x i8], [5 x i8]* @.str216 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t217)
  %t218 = getelementptr [5 x i8], [5 x i8]* @.str217 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t218)
  %t219 = getelementptr [5 x i8], [5 x i8]* @.str218 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t219)
  %t220 = getelementptr [5 x i8], [5 x i8]* @.str219 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t220)
  %t221 = getelementptr [5 x i8], [5 x i8]* @.str220 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t221)
  %t222 = getelementptr [5 x i8], [5 x i8]* @.str221 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t222)
  %t223 = getelementptr [5 x i8], [5 x i8]* @.str222 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t223)
  %t224 = getelementptr [5 x i8], [5 x i8]* @.str223 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t224)
  %t225 = getelementptr [5 x i8], [5 x i8]* @.str224 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t225)
  %t226 = getelementptr [5 x i8], [5 x i8]* @.str225 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t226)
  %t227 = getelementptr [5 x i8], [5 x i8]* @.str226 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t227)
  %t228 = getelementptr [5 x i8], [5 x i8]* @.str227 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t228)
  %t229 = getelementptr [5 x i8], [5 x i8]* @.str228 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t229)
  %t230 = getelementptr [5 x i8], [5 x i8]* @.str229 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t230)
  %t231 = getelementptr [5 x i8], [5 x i8]* @.str230 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t231)
  %t232 = getelementptr [5 x i8], [5 x i8]* @.str231 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t232)
  %t233 = getelementptr [5 x i8], [5 x i8]* @.str232 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t233)
  %t234 = getelementptr [5 x i8], [5 x i8]* @.str233 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t234)
  %t235 = getelementptr [5 x i8], [5 x i8]* @.str234 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t235)
  %t236 = getelementptr [5 x i8], [5 x i8]* @.str235 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t236)
  %t237 = getelementptr [5 x i8], [5 x i8]* @.str236 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t237)
  %t238 = getelementptr [5 x i8], [5 x i8]* @.str237 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t238)
  %t239 = getelementptr [5 x i8], [5 x i8]* @.str238 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t239)
  %t240 = getelementptr [5 x i8], [5 x i8]* @.str239 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t240)
  %t241 = getelementptr [5 x i8], [5 x i8]* @.str240 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t241)
  %t242 = getelementptr [5 x i8], [5 x i8]* @.str241 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t242)
  %t243 = getelementptr [5 x i8], [5 x i8]* @.str242 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t243)
  %t244 = getelementptr [5 x i8], [5 x i8]* @.str243 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t244)
  %t245 = getelementptr [5 x i8], [5 x i8]* @.str244 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t245)
  %t246 = getelementptr [5 x i8], [5 x i8]* @.str245 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t246)
  %t247 = getelementptr [5 x i8], [5 x i8]* @.str246 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t247)
  %t248 = getelementptr [5 x i8], [5 x i8]* @.str247 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t248)
  %t249 = getelementptr [5 x i8], [5 x i8]* @.str248 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t249)
  %t250 = getelementptr [5 x i8], [5 x i8]* @.str249 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t250)
  %t251 = getelementptr [5 x i8], [5 x i8]* @.str250 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t251)
  %t252 = getelementptr [5 x i8], [5 x i8]* @.str251 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t252)
  %t253 = getelementptr [5 x i8], [5 x i8]* @.str252 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t253)
  %t254 = getelementptr [5 x i8], [5 x i8]* @.str253 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t254)
  %t255 = getelementptr [5 x i8], [5 x i8]* @.str254 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t255)
  %t256 = getelementptr [5 x i8], [5 x i8]* @.str255 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t256)
  %t257 = getelementptr [5 x i8], [5 x i8]* @.str256 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t257)
  %t258 = getelementptr [5 x i8], [5 x i8]* @.str257 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t258)
  %t259 = getelementptr [5 x i8], [5 x i8]* @.str258 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t259)
  %t260 = getelementptr [5 x i8], [5 x i8]* @.str259 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t260)
  %t261 = getelementptr [5 x i8], [5 x i8]* @.str260 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t261)
  %t262 = getelementptr [5 x i8], [5 x i8]* @.str261 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t262)
  %t263 = getelementptr [5 x i8], [5 x i8]* @.str262 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t263)
  %t264 = getelementptr [5 x i8], [5 x i8]* @.str263 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t264)
  %t265 = getelementptr [5 x i8], [5 x i8]* @.str264 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t265)
  %t266 = getelementptr [5 x i8], [5 x i8]* @.str265 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t266)
  %t267 = getelementptr [5 x i8], [5 x i8]* @.str266 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t267)
  %t268 = getelementptr [5 x i8], [5 x i8]* @.str267 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t268)
  %t269 = getelementptr [5 x i8], [5 x i8]* @.str268 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t269)
  %t270 = getelementptr [5 x i8], [5 x i8]* @.str269 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t270)
  %t271 = getelementptr [5 x i8], [5 x i8]* @.str270 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t271)
  %t272 = getelementptr [5 x i8], [5 x i8]* @.str271 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t272)
  %t273 = getelementptr [5 x i8], [5 x i8]* @.str272 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t273)
  %t274 = getelementptr [5 x i8], [5 x i8]* @.str273 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t274)
  %t275 = getelementptr [5 x i8], [5 x i8]* @.str274 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t275)
  %t276 = getelementptr [5 x i8], [5 x i8]* @.str275 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t276)
  %t277 = getelementptr [5 x i8], [5 x i8]* @.str276 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t277)
  %t278 = getelementptr [5 x i8], [5 x i8]* @.str277 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t278)
  %t279 = getelementptr [5 x i8], [5 x i8]* @.str278 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t279)
  %t280 = getelementptr [5 x i8], [5 x i8]* @.str279 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t280)
  %t281 = getelementptr [5 x i8], [5 x i8]* @.str280 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t281)
  %t282 = getelementptr [5 x i8], [5 x i8]* @.str281 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t282)
  %t283 = getelementptr [5 x i8], [5 x i8]* @.str282 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t283)
  %t284 = getelementptr [5 x i8], [5 x i8]* @.str283 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t284)
  %t285 = getelementptr [5 x i8], [5 x i8]* @.str284 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t285)
  %t286 = getelementptr [5 x i8], [5 x i8]* @.str285 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t286)
  %t287 = getelementptr [5 x i8], [5 x i8]* @.str286 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t287)
  %t288 = getelementptr [5 x i8], [5 x i8]* @.str287 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t288)
  %t289 = getelementptr [5 x i8], [5 x i8]* @.str288 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t289)
  %t290 = getelementptr [5 x i8], [5 x i8]* @.str289 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t290)
  %t291 = getelementptr [5 x i8], [5 x i8]* @.str290 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t291)
  %t292 = getelementptr [5 x i8], [5 x i8]* @.str291 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t292)
  %t293 = getelementptr [5 x i8], [5 x i8]* @.str292 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t293)
  %t294 = getelementptr [5 x i8], [5 x i8]* @.str293 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t294)
  %t295 = getelementptr [5 x i8], [5 x i8]* @.str294 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t295)
  %t296 = getelementptr [5 x i8], [5 x i8]* @.str295 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t296)
  %t297 = getelementptr [5 x i8], [5 x i8]* @.str296 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t297)
  %t298 = getelementptr [5 x i8], [5 x i8]* @.str297 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t298)
  %t299 = getelementptr [5 x i8], [5 x i8]* @.str298 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t299)
  %t300 = getelementptr [5 x i8], [5 x i8]* @.str299 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t300)
  %t301 = getelementptr [5 x i8], [5 x i8]* @.str300 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t301)
  %t302 = getelementptr [5 x i8], [5 x i8]* @.str301 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t302)
  %t303 = getelementptr [5 x i8], [5 x i8]* @.str302 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t303)
  %t304 = getelementptr [5 x i8], [5 x i8]* @.str303 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t304)
  %t305 = getelementptr [5 x i8], [5 x i8]* @.str304 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t305)
  %t306 = getelementptr [5 x i8], [5 x i8]* @.str305 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t306)
  %t307 = getelementptr [5 x i8], [5 x i8]* @.str306 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t307)
  %t308 = getelementptr [5 x i8], [5 x i8]* @.str307 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t308)
  %t309 = getelementptr [5 x i8], [5 x i8]* @.str308 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t309)
  %t310 = getelementptr [5 x i8], [5 x i8]* @.str309 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t310)
  %t311 = getelementptr [5 x i8], [5 x i8]* @.str310 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t311)
  %t312 = getelementptr [5 x i8], [5 x i8]* @.str311 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t312)
  %t313 = getelementptr [5 x i8], [5 x i8]* @.str312 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t313)
  %t314 = getelementptr [5 x i8], [5 x i8]* @.str313 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t314)
  %t315 = getelementptr [5 x i8], [5 x i8]* @.str314 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t315)
  %t316 = getelementptr [5 x i8], [5 x i8]* @.str315 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t316)
  %t317 = getelementptr [5 x i8], [5 x i8]* @.str316 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t317)
  %t318 = getelementptr [5 x i8], [5 x i8]* @.str317 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t318)
  %t319 = getelementptr [5 x i8], [5 x i8]* @.str318 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t319)
  %t320 = getelementptr [5 x i8], [5 x i8]* @.str319 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t320)
  %t321 = getelementptr [5 x i8], [5 x i8]* @.str320 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t321)
  %t322 = getelementptr [5 x i8], [5 x i8]* @.str321 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t322)
  %t323 = getelementptr [5 x i8], [5 x i8]* @.str322 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t323)
  %t324 = getelementptr [5 x i8], [5 x i8]* @.str323 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t324)
  %t325 = getelementptr [5 x i8], [5 x i8]* @.str324 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t325)
  %t326 = getelementptr [5 x i8], [5 x i8]* @.str325 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t326)
  %t327 = getelementptr [5 x i8], [5 x i8]* @.str326 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t327)
  %t328 = getelementptr [5 x i8], [5 x i8]* @.str327 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t328)
  %t329 = getelementptr [5 x i8], [5 x i8]* @.str328 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t329)
  %t330 = getelementptr [5 x i8], [5 x i8]* @.str329 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t330)
  %t331 = getelementptr [5 x i8], [5 x i8]* @.str330 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t331)
  %t332 = getelementptr [5 x i8], [5 x i8]* @.str331 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t332)
  %t333 = getelementptr [5 x i8], [5 x i8]* @.str332 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t333)
  %t334 = getelementptr [5 x i8], [5 x i8]* @.str333 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t334)
  %t335 = getelementptr [5 x i8], [5 x i8]* @.str334 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t335)
  %t336 = getelementptr [5 x i8], [5 x i8]* @.str335 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t336)
  %t337 = getelementptr [5 x i8], [5 x i8]* @.str336 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t337)
  %t338 = getelementptr [5 x i8], [5 x i8]* @.str337 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t338)
  %t339 = getelementptr [5 x i8], [5 x i8]* @.str338 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t339)
  %t340 = getelementptr [5 x i8], [5 x i8]* @.str339 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t340)
  %t341 = getelementptr [5 x i8], [5 x i8]* @.str340 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t341)
  %t342 = getelementptr [5 x i8], [5 x i8]* @.str341 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t342)
  %t343 = getelementptr [5 x i8], [5 x i8]* @.str342 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t343)
  %t344 = getelementptr [5 x i8], [5 x i8]* @.str343 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t344)
  %t345 = getelementptr [5 x i8], [5 x i8]* @.str344 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t345)
  %t346 = getelementptr [5 x i8], [5 x i8]* @.str345 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t346)
  %t347 = getelementptr [5 x i8], [5 x i8]* @.str346 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t347)
  %t348 = getelementptr [5 x i8], [5 x i8]* @.str347 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t348)
  %t349 = getelementptr [5 x i8], [5 x i8]* @.str348 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t349)
  %t350 = getelementptr [5 x i8], [5 x i8]* @.str349 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t350)
  %t351 = getelementptr [5 x i8], [5 x i8]* @.str350 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t351)
  %t352 = getelementptr [5 x i8], [5 x i8]* @.str351 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t352)
  %t353 = getelementptr [5 x i8], [5 x i8]* @.str352 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t353)
  %t354 = getelementptr [5 x i8], [5 x i8]* @.str353 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t354)
  %t355 = getelementptr [5 x i8], [5 x i8]* @.str354 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t355)
  %t356 = getelementptr [5 x i8], [5 x i8]* @.str355 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t356)
  %t357 = getelementptr [5 x i8], [5 x i8]* @.str356 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t357)
  %t358 = getelementptr [5 x i8], [5 x i8]* @.str357 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t358)
  %t359 = getelementptr [5 x i8], [5 x i8]* @.str358 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t359)
  %t360 = getelementptr [5 x i8], [5 x i8]* @.str359 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t360)
  %t361 = getelementptr [5 x i8], [5 x i8]* @.str360 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t361)
  %t362 = getelementptr [5 x i8], [5 x i8]* @.str361 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t362)
  %t363 = getelementptr [5 x i8], [5 x i8]* @.str362 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t363)
  %t364 = getelementptr [5 x i8], [5 x i8]* @.str363 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t364)
  %t365 = getelementptr [5 x i8], [5 x i8]* @.str364 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t365)
  %t366 = getelementptr [5 x i8], [5 x i8]* @.str365 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t366)
  %t367 = getelementptr [5 x i8], [5 x i8]* @.str366 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t367)
  %t368 = getelementptr [5 x i8], [5 x i8]* @.str367 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t368)
  %t369 = getelementptr [5 x i8], [5 x i8]* @.str368 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t369)
  %t370 = getelementptr [5 x i8], [5 x i8]* @.str369 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t370)
  %t371 = getelementptr [5 x i8], [5 x i8]* @.str370 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t371)
  %t372 = getelementptr [5 x i8], [5 x i8]* @.str371 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t372)
  %t373 = getelementptr [5 x i8], [5 x i8]* @.str372 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t373)
  %t374 = getelementptr [5 x i8], [5 x i8]* @.str373 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t374)
  %t375 = getelementptr [5 x i8], [5 x i8]* @.str374 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t375)
  %t376 = getelementptr [5 x i8], [5 x i8]* @.str375 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t376)
  %t377 = getelementptr [5 x i8], [5 x i8]* @.str376 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t377)
  %t378 = getelementptr [5 x i8], [5 x i8]* @.str377 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t378)
  %t379 = getelementptr [5 x i8], [5 x i8]* @.str378 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t379)
  %t380 = getelementptr [5 x i8], [5 x i8]* @.str379 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t380)
  %t381 = getelementptr [5 x i8], [5 x i8]* @.str380 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t381)
  %t382 = getelementptr [5 x i8], [5 x i8]* @.str381 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t382)
  %t383 = getelementptr [5 x i8], [5 x i8]* @.str382 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t383)
  %t384 = getelementptr [5 x i8], [5 x i8]* @.str383 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t384)
  %t385 = getelementptr [5 x i8], [5 x i8]* @.str384 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t385)
  %t386 = getelementptr [5 x i8], [5 x i8]* @.str385 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t386)
  %t387 = getelementptr [5 x i8], [5 x i8]* @.str386 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t387)
  %t388 = getelementptr [5 x i8], [5 x i8]* @.str387 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t388)
  %t389 = getelementptr [5 x i8], [5 x i8]* @.str388 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t389)
  %t390 = getelementptr [5 x i8], [5 x i8]* @.str389 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t390)
  %t391 = getelementptr [5 x i8], [5 x i8]* @.str390 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t391)
  %t392 = getelementptr [5 x i8], [5 x i8]* @.str391 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t392)
  %t393 = getelementptr [5 x i8], [5 x i8]* @.str392 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t393)
  %t394 = getelementptr [5 x i8], [5 x i8]* @.str393 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t394)
  %t395 = getelementptr [5 x i8], [5 x i8]* @.str394 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t395)
  %t396 = getelementptr [5 x i8], [5 x i8]* @.str395 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t396)
  %t397 = getelementptr [5 x i8], [5 x i8]* @.str396 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t397)
  %t398 = getelementptr [5 x i8], [5 x i8]* @.str397 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t398)
  %t399 = getelementptr [5 x i8], [5 x i8]* @.str398 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t399)
  %t400 = getelementptr [5 x i8], [5 x i8]* @.str399 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t400)
  %t401 = getelementptr [5 x i8], [5 x i8]* @.str400 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t401)
  %t402 = getelementptr [5 x i8], [5 x i8]* @.str401 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t402)
  %t403 = getelementptr [5 x i8], [5 x i8]* @.str402 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t403)
  %t404 = getelementptr [5 x i8], [5 x i8]* @.str403 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t404)
  %t405 = getelementptr [5 x i8], [5 x i8]* @.str404 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t405)
  %t406 = getelementptr [5 x i8], [5 x i8]* @.str405 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t406)
  %t407 = getelementptr [5 x i8], [5 x i8]* @.str406 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t407)
  %t408 = getelementptr [5 x i8], [5 x i8]* @.str407 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t408)
  %t409 = getelementptr [5 x i8], [5 x i8]* @.str408 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t409)
  %t410 = getelementptr [5 x i8], [5 x i8]* @.str409 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t410)
  %t411 = getelementptr [5 x i8], [5 x i8]* @.str410 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t411)
  %t412 = getelementptr [5 x i8], [5 x i8]* @.str411 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t412)
  %t413 = getelementptr [5 x i8], [5 x i8]* @.str412 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t413)
  %t414 = getelementptr [5 x i8], [5 x i8]* @.str413 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t414)
  %t415 = getelementptr [5 x i8], [5 x i8]* @.str414 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t415)
  %t416 = getelementptr [5 x i8], [5 x i8]* @.str415 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t416)
  %t417 = getelementptr [5 x i8], [5 x i8]* @.str416 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t417)
  %t418 = getelementptr [5 x i8], [5 x i8]* @.str417 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t418)
  %t419 = getelementptr [5 x i8], [5 x i8]* @.str418 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t419)
  %t420 = getelementptr [5 x i8], [5 x i8]* @.str419 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t420)
  %t421 = getelementptr [5 x i8], [5 x i8]* @.str420 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t421)
  %t422 = getelementptr [5 x i8], [5 x i8]* @.str421 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t422)
  %t423 = getelementptr [5 x i8], [5 x i8]* @.str422 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t423)
  %t424 = getelementptr [5 x i8], [5 x i8]* @.str423 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t424)
  %t425 = getelementptr [5 x i8], [5 x i8]* @.str424 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t425)
  %t426 = getelementptr [5 x i8], [5 x i8]* @.str425 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t426)
  %t427 = getelementptr [5 x i8], [5 x i8]* @.str426 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t427)
  %t428 = getelementptr [5 x i8], [5 x i8]* @.str427 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t428)
  %t429 = getelementptr [5 x i8], [5 x i8]* @.str428 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t429)
  %t430 = getelementptr [5 x i8], [5 x i8]* @.str429 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t430)
  %t431 = getelementptr [5 x i8], [5 x i8]* @.str430 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t431)
  %t432 = getelementptr [5 x i8], [5 x i8]* @.str431 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t432)
  %t433 = getelementptr [5 x i8], [5 x i8]* @.str432 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t433)
  %t434 = getelementptr [5 x i8], [5 x i8]* @.str433 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t434)
  %t435 = getelementptr [5 x i8], [5 x i8]* @.str434 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t435)
  %t436 = getelementptr [5 x i8], [5 x i8]* @.str435 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t436)
  %t437 = getelementptr [5 x i8], [5 x i8]* @.str436 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t437)
  %t438 = getelementptr [5 x i8], [5 x i8]* @.str437 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t438)
  %t439 = getelementptr [5 x i8], [5 x i8]* @.str438 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t439)
  %t440 = getelementptr [5 x i8], [5 x i8]* @.str439 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t440)
  %t441 = getelementptr [5 x i8], [5 x i8]* @.str440 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t441)
  %t442 = getelementptr [5 x i8], [5 x i8]* @.str441 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t442)
  %t443 = getelementptr [5 x i8], [5 x i8]* @.str442 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t443)
  %t444 = getelementptr [5 x i8], [5 x i8]* @.str443 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t444)
  %t445 = getelementptr [5 x i8], [5 x i8]* @.str444 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t445)
  %t446 = getelementptr [5 x i8], [5 x i8]* @.str445 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t446)
  %t447 = getelementptr [5 x i8], [5 x i8]* @.str446 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t447)
  %t448 = getelementptr [5 x i8], [5 x i8]* @.str447 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t448)
  %t449 = getelementptr [5 x i8], [5 x i8]* @.str448 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t449)
  %t450 = getelementptr [5 x i8], [5 x i8]* @.str449 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t450)
  %t451 = getelementptr [5 x i8], [5 x i8]* @.str450 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t451)
  %t452 = getelementptr [5 x i8], [5 x i8]* @.str451 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t452)
  %t453 = getelementptr [5 x i8], [5 x i8]* @.str452 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t453)
  %t454 = getelementptr [5 x i8], [5 x i8]* @.str453 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t454)
  %t455 = getelementptr [5 x i8], [5 x i8]* @.str454 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t455)
  %t456 = getelementptr [5 x i8], [5 x i8]* @.str455 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t456)
  %t457 = getelementptr [5 x i8], [5 x i8]* @.str456 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t457)
  %t458 = getelementptr [5 x i8], [5 x i8]* @.str457 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t458)
  %t459 = getelementptr [5 x i8], [5 x i8]* @.str458 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t459)
  %t460 = getelementptr [5 x i8], [5 x i8]* @.str459 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t460)
  %t461 = getelementptr [5 x i8], [5 x i8]* @.str460 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t461)
  %t462 = getelementptr [5 x i8], [5 x i8]* @.str461 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t462)
  %t463 = getelementptr [5 x i8], [5 x i8]* @.str462 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t463)
  %t464 = getelementptr [5 x i8], [5 x i8]* @.str463 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t464)
  %t465 = getelementptr [5 x i8], [5 x i8]* @.str464 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t465)
  %t466 = getelementptr [5 x i8], [5 x i8]* @.str465 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t466)
  %t467 = getelementptr [5 x i8], [5 x i8]* @.str466 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t467)
  %t468 = getelementptr [5 x i8], [5 x i8]* @.str467 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t468)
  %t469 = getelementptr [5 x i8], [5 x i8]* @.str468 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t469)
  %t470 = getelementptr [5 x i8], [5 x i8]* @.str469 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t470)
  %t471 = getelementptr [5 x i8], [5 x i8]* @.str470 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t471)
  %t472 = getelementptr [5 x i8], [5 x i8]* @.str471 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t472)
  %t473 = getelementptr [5 x i8], [5 x i8]* @.str472 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t473)
  %t474 = getelementptr [5 x i8], [5 x i8]* @.str473 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t474)
  %t475 = getelementptr [5 x i8], [5 x i8]* @.str474 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t475)
  %t476 = getelementptr [5 x i8], [5 x i8]* @.str475 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t476)
  %t477 = getelementptr [5 x i8], [5 x i8]* @.str476 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t477)
  %t478 = getelementptr [5 x i8], [5 x i8]* @.str477 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t478)
  %t479 = getelementptr [5 x i8], [5 x i8]* @.str478 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t479)
  %t480 = getelementptr [5 x i8], [5 x i8]* @.str479 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t480)
  %t481 = getelementptr [5 x i8], [5 x i8]* @.str480 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t481)
  %t482 = getelementptr [5 x i8], [5 x i8]* @.str481 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t482)
  %t483 = getelementptr [5 x i8], [5 x i8]* @.str482 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t483)
  %t484 = getelementptr [5 x i8], [5 x i8]* @.str483 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t484)
  %t485 = getelementptr [5 x i8], [5 x i8]* @.str484 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t485)
  %t486 = getelementptr [5 x i8], [5 x i8]* @.str485 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t486)
  %t487 = getelementptr [5 x i8], [5 x i8]* @.str486 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t487)
  %t488 = getelementptr [5 x i8], [5 x i8]* @.str487 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t488)
  %t489 = getelementptr [5 x i8], [5 x i8]* @.str488 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t489)
  %t490 = getelementptr [5 x i8], [5 x i8]* @.str489 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t490)
  %t491 = getelementptr [5 x i8], [5 x i8]* @.str490 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t491)
  %t492 = getelementptr [5 x i8], [5 x i8]* @.str491 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t492)
  %t493 = getelementptr [5 x i8], [5 x i8]* @.str492 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t493)
  %t494 = getelementptr [5 x i8], [5 x i8]* @.str493 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t494)
  %t495 = getelementptr [5 x i8], [5 x i8]* @.str494 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t495)
  %t496 = getelementptr [5 x i8], [5 x i8]* @.str495 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t496)
  %t497 = getelementptr [5 x i8], [5 x i8]* @.str496 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t497)
  %t498 = getelementptr [5 x i8], [5 x i8]* @.str497 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t498)
  %t499 = getelementptr [5 x i8], [5 x i8]* @.str498 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t499)
  %t500 = getelementptr [5 x i8], [5 x i8]* @.str499 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t500)
  %t501 = getelementptr [5 x i8], [5 x i8]* @.str500 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t501)
  %t502 = getelementptr [5 x i8], [5 x i8]* @.str501 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t502)
  %t503 = getelementptr [5 x i8], [5 x i8]* @.str502 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t503)
  %t504 = getelementptr [5 x i8], [5 x i8]* @.str503 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t504)
  %t505 = getelementptr [5 x i8], [5 x i8]* @.str504 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t505)
  %t506 = getelementptr [5 x i8], [5 x i8]* @.str505 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t506)
  %t507 = getelementptr [5 x i8], [5 x i8]* @.str506 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t507)
  %t508 = getelementptr [5 x i8], [5 x i8]* @.str507 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t508)
  %t509 = getelementptr [5 x i8], [5 x i8]* @.str508 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t509)
  %t510 = getelementptr [5 x i8], [5 x i8]* @.str509 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t510)
  %t511 = getelementptr [5 x i8], [5 x i8]* @.str510 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t511)
  %t512 = getelementptr [5 x i8], [5 x i8]* @.str511 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t512)
  %t513 = getelementptr [5 x i8], [5 x i8]* @.str512 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t513)
  %t514 = getelementptr [5 x i8], [5 x i8]* @.str513 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t514)
  %t515 = getelementptr [5 x i8], [5 x i8]* @.str514 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t515)
  %t516 = getelementptr [5 x i8], [5 x i8]* @.str515 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t516)
  %t517 = getelementptr [5 x i8], [5 x i8]* @.str516 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t517)
  %t518 = getelementptr [5 x i8], [5 x i8]* @.str517 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t518)
  %t519 = getelementptr [5 x i8], [5 x i8]* @.str518 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t519)
  %t520 = getelementptr [5 x i8], [5 x i8]* @.str519 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t520)
  %t521 = getelementptr [5 x i8], [5 x i8]* @.str520 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t521)
  %t522 = getelementptr [5 x i8], [5 x i8]* @.str521 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t522)
  %t523 = getelementptr [5 x i8], [5 x i8]* @.str522 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t523)
  %t524 = getelementptr [5 x i8], [5 x i8]* @.str523 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t524)
  %t525 = getelementptr [5 x i8], [5 x i8]* @.str524 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t525)
  %t526 = getelementptr [5 x i8], [5 x i8]* @.str525 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t526)
  %t527 = getelementptr [5 x i8], [5 x i8]* @.str526 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t527)
  %t528 = getelementptr [5 x i8], [5 x i8]* @.str527 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t528)
  %t529 = getelementptr [5 x i8], [5 x i8]* @.str528 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t529)
  %t530 = getelementptr [5 x i8], [5 x i8]* @.str529 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t530)
  %t531 = getelementptr [5 x i8], [5 x i8]* @.str530 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t531)
  %t532 = getelementptr [5 x i8], [5 x i8]* @.str531 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t532)
  %t533 = getelementptr [5 x i8], [5 x i8]* @.str532 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t533)
  %t534 = getelementptr [5 x i8], [5 x i8]* @.str533 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t534)
  %t535 = getelementptr [5 x i8], [5 x i8]* @.str534 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t535)
  %t536 = getelementptr [5 x i8], [5 x i8]* @.str535 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t536)
  %t537 = getelementptr [5 x i8], [5 x i8]* @.str536 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t537)
  %t538 = getelementptr [5 x i8], [5 x i8]* @.str537 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t538)
  %t539 = getelementptr [5 x i8], [5 x i8]* @.str538 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t539)
  %t540 = getelementptr [5 x i8], [5 x i8]* @.str539 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t540)
  %t541 = getelementptr [5 x i8], [5 x i8]* @.str540 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t541)
  %t542 = getelementptr [5 x i8], [5 x i8]* @.str541 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t542)
  %t543 = getelementptr [5 x i8], [5 x i8]* @.str542 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t543)
  %t544 = getelementptr [5 x i8], [5 x i8]* @.str543 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t544)
  %t545 = getelementptr [5 x i8], [5 x i8]* @.str544 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t545)
  %t546 = getelementptr [5 x i8], [5 x i8]* @.str545 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t546)
  %t547 = getelementptr [5 x i8], [5 x i8]* @.str546 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t547)
  %t548 = getelementptr [5 x i8], [5 x i8]* @.str547 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t548)
  %t549 = getelementptr [5 x i8], [5 x i8]* @.str548 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t549)
  %t550 = getelementptr [5 x i8], [5 x i8]* @.str549 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t550)
  %t551 = getelementptr [5 x i8], [5 x i8]* @.str550 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t551)
  %t552 = getelementptr [5 x i8], [5 x i8]* @.str551 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t552)
  %t553 = getelementptr [5 x i8], [5 x i8]* @.str552 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t553)
  %t554 = getelementptr [5 x i8], [5 x i8]* @.str553 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t554)
  %t555 = getelementptr [5 x i8], [5 x i8]* @.str554 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t555)
  %t556 = getelementptr [5 x i8], [5 x i8]* @.str555 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t556)
  %t557 = getelementptr [5 x i8], [5 x i8]* @.str556 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t557)
  %t558 = getelementptr [5 x i8], [5 x i8]* @.str557 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t558)
  %t559 = getelementptr [5 x i8], [5 x i8]* @.str558 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t559)
  %t560 = getelementptr [5 x i8], [5 x i8]* @.str559 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t560)
  %t561 = getelementptr [5 x i8], [5 x i8]* @.str560 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t561)
  %t562 = getelementptr [5 x i8], [5 x i8]* @.str561 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t562)
  %t563 = getelementptr [5 x i8], [5 x i8]* @.str562 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t563)
  %t564 = getelementptr [5 x i8], [5 x i8]* @.str563 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t564)
  %t565 = getelementptr [5 x i8], [5 x i8]* @.str564 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t565)
  %t566 = getelementptr [5 x i8], [5 x i8]* @.str565 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t566)
  %t567 = getelementptr [5 x i8], [5 x i8]* @.str566 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t567)
  %t568 = getelementptr [5 x i8], [5 x i8]* @.str567 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t568)
  %t569 = getelementptr [5 x i8], [5 x i8]* @.str568 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t569)
  %t570 = getelementptr [5 x i8], [5 x i8]* @.str569 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t570)
  %t571 = getelementptr [5 x i8], [5 x i8]* @.str570 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t571)
  %t572 = getelementptr [5 x i8], [5 x i8]* @.str571 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t572)
  %t573 = getelementptr [5 x i8], [5 x i8]* @.str572 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t573)
  %t574 = getelementptr [5 x i8], [5 x i8]* @.str573 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t574)
  %t575 = getelementptr [5 x i8], [5 x i8]* @.str574 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t575)
  %t576 = getelementptr [5 x i8], [5 x i8]* @.str575 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t576)
  %t577 = getelementptr [5 x i8], [5 x i8]* @.str576 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t577)
  %t578 = getelementptr [5 x i8], [5 x i8]* @.str577 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t578)
  %t579 = getelementptr [5 x i8], [5 x i8]* @.str578 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t579)
  %t580 = getelementptr [5 x i8], [5 x i8]* @.str579 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t580)
  %t581 = getelementptr [5 x i8], [5 x i8]* @.str580 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t581)
  %t582 = getelementptr [5 x i8], [5 x i8]* @.str581 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t582)
  %t583 = getelementptr [5 x i8], [5 x i8]* @.str582 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t583)
  %t584 = getelementptr [5 x i8], [5 x i8]* @.str583 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t584)
  %t585 = getelementptr [5 x i8], [5 x i8]* @.str584 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t585)
  %t586 = getelementptr [5 x i8], [5 x i8]* @.str585 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t586)
  %t587 = getelementptr [5 x i8], [5 x i8]* @.str586 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t587)
  %t588 = getelementptr [5 x i8], [5 x i8]* @.str587 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t588)
  %t589 = getelementptr [5 x i8], [5 x i8]* @.str588 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t589)
  %t590 = getelementptr [5 x i8], [5 x i8]* @.str589 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t590)
  %t591 = getelementptr [5 x i8], [5 x i8]* @.str590 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t591)
  %t592 = getelementptr [5 x i8], [5 x i8]* @.str591 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t592)
  %t593 = getelementptr [5 x i8], [5 x i8]* @.str592 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t593)
  %t594 = getelementptr [5 x i8], [5 x i8]* @.str593 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t594)
  %t595 = getelementptr [5 x i8], [5 x i8]* @.str594 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t595)
  %t596 = getelementptr [5 x i8], [5 x i8]* @.str595 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t596)
  %t597 = getelementptr [5 x i8], [5 x i8]* @.str596 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t597)
  %t598 = getelementptr [5 x i8], [5 x i8]* @.str597 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t598)
  %t599 = getelementptr [5 x i8], [5 x i8]* @.str598 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t599)
  %t600 = getelementptr [5 x i8], [5 x i8]* @.str599 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t600)
  %t601 = getelementptr [5 x i8], [5 x i8]* @.str600 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t601)
  %t602 = getelementptr [5 x i8], [5 x i8]* @.str601 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t602)
  %t603 = getelementptr [5 x i8], [5 x i8]* @.str602 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t603)
  %t604 = getelementptr [5 x i8], [5 x i8]* @.str603 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t604)
  %t605 = getelementptr [5 x i8], [5 x i8]* @.str604 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t605)
  %t606 = getelementptr [5 x i8], [5 x i8]* @.str605 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t606)
  %t607 = getelementptr [5 x i8], [5 x i8]* @.str606 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t607)
  %t608 = getelementptr [5 x i8], [5 x i8]* @.str607 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t608)
  %t609 = getelementptr [5 x i8], [5 x i8]* @.str608 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t609)
  %t610 = getelementptr [5 x i8], [5 x i8]* @.str609 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t610)
  %t611 = getelementptr [5 x i8], [5 x i8]* @.str610 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t611)
  %t612 = getelementptr [5 x i8], [5 x i8]* @.str611 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t612)
  %t613 = getelementptr [5 x i8], [5 x i8]* @.str612 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t613)
  %t614 = getelementptr [5 x i8], [5 x i8]* @.str613 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t614)
  %t615 = getelementptr [5 x i8], [5 x i8]* @.str614 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t615)
  %t616 = getelementptr [5 x i8], [5 x i8]* @.str615 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t616)
  %t617 = getelementptr [5 x i8], [5 x i8]* @.str616 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t617)
  %t618 = getelementptr [5 x i8], [5 x i8]* @.str617 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t618)
  %t619 = getelementptr [5 x i8], [5 x i8]* @.str618 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t619)
  %t620 = getelementptr [5 x i8], [5 x i8]* @.str619 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t620)
  %t621 = getelementptr [5 x i8], [5 x i8]* @.str620 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t621)
  %t622 = getelementptr [5 x i8], [5 x i8]* @.str621 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t622)
  %t623 = getelementptr [5 x i8], [5 x i8]* @.str622 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t623)
  %t624 = getelementptr [5 x i8], [5 x i8]* @.str623 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t624)
  %t625 = getelementptr [5 x i8], [5 x i8]* @.str624 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t625)
  %t626 = getelementptr [5 x i8], [5 x i8]* @.str625 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t626)
  %t627 = getelementptr [5 x i8], [5 x i8]* @.str626 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t627)
  %t628 = getelementptr [5 x i8], [5 x i8]* @.str627 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t628)
  %t629 = getelementptr [5 x i8], [5 x i8]* @.str628 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t629)
  %t630 = getelementptr [5 x i8], [5 x i8]* @.str629 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t630)
  %t631 = getelementptr [5 x i8], [5 x i8]* @.str630 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t631)
  %t632 = getelementptr [5 x i8], [5 x i8]* @.str631 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t632)
  %t633 = getelementptr [5 x i8], [5 x i8]* @.str632 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t633)
  %t634 = getelementptr [5 x i8], [5 x i8]* @.str633 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t634)
  %t635 = getelementptr [5 x i8], [5 x i8]* @.str634 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t635)
  %t636 = getelementptr [5 x i8], [5 x i8]* @.str635 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t636)
  %t637 = getelementptr [5 x i8], [5 x i8]* @.str636 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t637)
  %t638 = getelementptr [5 x i8], [5 x i8]* @.str637 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t638)
  %t639 = getelementptr [5 x i8], [5 x i8]* @.str638 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t639)
  %t640 = getelementptr [5 x i8], [5 x i8]* @.str639 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t640)
  %t641 = getelementptr [5 x i8], [5 x i8]* @.str640 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t641)
  %t642 = getelementptr [5 x i8], [5 x i8]* @.str641 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t642)
  %t643 = getelementptr [5 x i8], [5 x i8]* @.str642 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t643)
  %t644 = getelementptr [5 x i8], [5 x i8]* @.str643 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t644)
  %t645 = getelementptr [5 x i8], [5 x i8]* @.str644 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t645)
  %t646 = getelementptr [5 x i8], [5 x i8]* @.str645 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t646)
  %t647 = getelementptr [5 x i8], [5 x i8]* @.str646 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t647)
  %t648 = getelementptr [5 x i8], [5 x i8]* @.str647 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t648)
  %t649 = getelementptr [5 x i8], [5 x i8]* @.str648 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t649)
  %t650 = getelementptr [5 x i8], [5 x i8]* @.str649 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t650)
  %t651 = getelementptr [5 x i8], [5 x i8]* @.str650 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t651)
  %t652 = getelementptr [5 x i8], [5 x i8]* @.str651 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t652)
  %t653 = getelementptr [5 x i8], [5 x i8]* @.str652 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t653)
  %t654 = getelementptr [5 x i8], [5 x i8]* @.str653 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t654)
  %t655 = getelementptr [5 x i8], [5 x i8]* @.str654 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t655)
  %t656 = getelementptr [5 x i8], [5 x i8]* @.str655 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t656)
  %t657 = getelementptr [5 x i8], [5 x i8]* @.str656 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t657)
  %t658 = getelementptr [5 x i8], [5 x i8]* @.str657 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t658)
  %t659 = getelementptr [5 x i8], [5 x i8]* @.str658 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t659)
  %t660 = getelementptr [5 x i8], [5 x i8]* @.str659 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t660)
  %t661 = getelementptr [5 x i8], [5 x i8]* @.str660 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t661)
  %t662 = getelementptr [5 x i8], [5 x i8]* @.str661 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t662)
  %t663 = getelementptr [5 x i8], [5 x i8]* @.str662 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t663)
  %t664 = getelementptr [5 x i8], [5 x i8]* @.str663 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t664)
  %t665 = getelementptr [5 x i8], [5 x i8]* @.str664 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t665)
  %t666 = getelementptr [5 x i8], [5 x i8]* @.str665 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t666)
  %t667 = getelementptr [5 x i8], [5 x i8]* @.str666 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t667)
  %t668 = getelementptr [5 x i8], [5 x i8]* @.str667 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t668)
  %t669 = getelementptr [5 x i8], [5 x i8]* @.str668 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t669)
  %t670 = getelementptr [5 x i8], [5 x i8]* @.str669 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t670)
  %t671 = getelementptr [5 x i8], [5 x i8]* @.str670 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t671)
  %t672 = getelementptr [5 x i8], [5 x i8]* @.str671 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t672)
  %t673 = getelementptr [5 x i8], [5 x i8]* @.str672 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t673)
  %t674 = getelementptr [5 x i8], [5 x i8]* @.str673 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t674)
  %t675 = getelementptr [5 x i8], [5 x i8]* @.str674 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t675)
  %t676 = getelementptr [5 x i8], [5 x i8]* @.str675 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t676)
  %t677 = getelementptr [5 x i8], [5 x i8]* @.str676 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t677)
  %t678 = getelementptr [5 x i8], [5 x i8]* @.str677 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t678)
  %t679 = getelementptr [5 x i8], [5 x i8]* @.str678 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t679)
  %t680 = getelementptr [5 x i8], [5 x i8]* @.str679 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t680)
  %t681 = getelementptr [5 x i8], [5 x i8]* @.str680 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t681)
  %t682 = getelementptr [5 x i8], [5 x i8]* @.str681 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t682)
  %t683 = getelementptr [5 x i8], [5 x i8]* @.str682 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t683)
  %t684 = getelementptr [5 x i8], [5 x i8]* @.str683 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t684)
  %t685 = getelementptr [5 x i8], [5 x i8]* @.str684 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t685)
  %t686 = getelementptr [5 x i8], [5 x i8]* @.str685 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t686)
  %t687 = getelementptr [5 x i8], [5 x i8]* @.str686 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t687)
  %t688 = getelementptr [5 x i8], [5 x i8]* @.str687 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t688)
  %t689 = getelementptr [5 x i8], [5 x i8]* @.str688 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t689)
  %t690 = getelementptr [5 x i8], [5 x i8]* @.str689 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t690)
  %t691 = getelementptr [5 x i8], [5 x i8]* @.str690 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t691)
  %t692 = getelementptr [5 x i8], [5 x i8]* @.str691 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t692)
  %t693 = getelementptr [5 x i8], [5 x i8]* @.str692 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t693)
  %t694 = getelementptr [5 x i8], [5 x i8]* @.str693 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t694)
  %t695 = getelementptr [5 x i8], [5 x i8]* @.str694 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t695)
  %t696 = getelementptr [5 x i8], [5 x i8]* @.str695 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t696)
  %t697 = getelementptr [5 x i8], [5 x i8]* @.str696 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t697)
  %t698 = getelementptr [5 x i8], [5 x i8]* @.str697 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t698)
  %t699 = getelementptr [5 x i8], [5 x i8]* @.str698 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t699)
  %t700 = getelementptr [5 x i8], [5 x i8]* @.str699 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t700)
  %t701 = getelementptr [5 x i8], [5 x i8]* @.str700 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t701)
  %t702 = getelementptr [5 x i8], [5 x i8]* @.str701 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t702)
  %t703 = getelementptr [5 x i8], [5 x i8]* @.str702 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t703)
  %t704 = getelementptr [5 x i8], [5 x i8]* @.str703 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t704)
  %t705 = getelementptr [5 x i8], [5 x i8]* @.str704 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t705)
  %t706 = getelementptr [5 x i8], [5 x i8]* @.str705 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t706)
  %t707 = getelementptr [5 x i8], [5 x i8]* @.str706 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t707)
  %t708 = getelementptr [5 x i8], [5 x i8]* @.str707 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t708)
  %t709 = getelementptr [5 x i8], [5 x i8]* @.str708 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t709)
  %t710 = getelementptr [5 x i8], [5 x i8]* @.str709 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t710)
  %t711 = getelementptr [5 x i8], [5 x i8]* @.str710 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t711)
  %t712 = getelementptr [5 x i8], [5 x i8]* @.str711 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t712)
  %t713 = getelementptr [5 x i8], [5 x i8]* @.str712 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t713)
  %t714 = getelementptr [5 x i8], [5 x i8]* @.str713 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t714)
  %t715 = getelementptr [5 x i8], [5 x i8]* @.str714 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t715)
  %t716 = getelementptr [5 x i8], [5 x i8]* @.str715 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t716)
  %t717 = getelementptr [5 x i8], [5 x i8]* @.str716 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t717)
  %t718 = getelementptr [5 x i8], [5 x i8]* @.str717 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t718)
  %t719 = getelementptr [5 x i8], [5 x i8]* @.str718 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t719)
  %t720 = getelementptr [5 x i8], [5 x i8]* @.str719 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t720)
  %t721 = getelementptr [5 x i8], [5 x i8]* @.str720 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t721)
  %t722 = getelementptr [5 x i8], [5 x i8]* @.str721 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t722)
  %t723 = getelementptr [5 x i8], [5 x i8]* @.str722 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t723)
  %t724 = getelementptr [5 x i8], [5 x i8]* @.str723 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t724)
  %t725 = getelementptr [5 x i8], [5 x i8]* @.str724 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t725)
  %t726 = getelementptr [5 x i8], [5 x i8]* @.str725 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t726)
  %t727 = getelementptr [5 x i8], [5 x i8]* @.str726 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t727)
  %t728 = getelementptr [5 x i8], [5 x i8]* @.str727 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t728)
  %t729 = getelementptr [5 x i8], [5 x i8]* @.str728 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t729)
  %t730 = getelementptr [5 x i8], [5 x i8]* @.str729 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t730)
  %t731 = getelementptr [5 x i8], [5 x i8]* @.str730 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t731)
  %t732 = getelementptr [5 x i8], [5 x i8]* @.str731 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t732)
  %t733 = getelementptr [5 x i8], [5 x i8]* @.str732 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t733)
  %t734 = getelementptr [5 x i8], [5 x i8]* @.str733 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t734)
  %t735 = getelementptr [5 x i8], [5 x i8]* @.str734 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t735)
  %t736 = getelementptr [5 x i8], [5 x i8]* @.str735 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t736)
  %t737 = getelementptr [5 x i8], [5 x i8]* @.str736 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t737)
  %t738 = getelementptr [5 x i8], [5 x i8]* @.str737 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t738)
  %t739 = getelementptr [5 x i8], [5 x i8]* @.str738 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t739)
  %t740 = getelementptr [5 x i8], [5 x i8]* @.str739 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t740)
  %t741 = getelementptr [5 x i8], [5 x i8]* @.str740 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t741)
  %t742 = getelementptr [5 x i8], [5 x i8]* @.str741 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t742)
  %t743 = getelementptr [5 x i8], [5 x i8]* @.str742 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t743)
  %t744 = getelementptr [5 x i8], [5 x i8]* @.str743 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t744)
  %t745 = getelementptr [5 x i8], [5 x i8]* @.str744 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t745)
  %t746 = getelementptr [5 x i8], [5 x i8]* @.str745 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t746)
  %t747 = getelementptr [5 x i8], [5 x i8]* @.str746 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t747)
  %t748 = getelementptr [5 x i8], [5 x i8]* @.str747 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t748)
  %t749 = getelementptr [5 x i8], [5 x i8]* @.str748 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t749)
  %t750 = getelementptr [5 x i8], [5 x i8]* @.str749 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t750)
  %t751 = getelementptr [5 x i8], [5 x i8]* @.str750 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t751)
  %t752 = getelementptr [5 x i8], [5 x i8]* @.str751 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t752)
  %t753 = getelementptr [5 x i8], [5 x i8]* @.str752 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t753)
  %t754 = getelementptr [5 x i8], [5 x i8]* @.str753 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t754)
  %t755 = getelementptr [5 x i8], [5 x i8]* @.str754 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t755)
  %t756 = getelementptr [5 x i8], [5 x i8]* @.str755 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t756)
  %t757 = getelementptr [5 x i8], [5 x i8]* @.str756 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t757)
  %t758 = getelementptr [5 x i8], [5 x i8]* @.str757 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t758)
  %t759 = getelementptr [5 x i8], [5 x i8]* @.str758 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t759)
  %t760 = getelementptr [5 x i8], [5 x i8]* @.str759 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t760)
  %t761 = getelementptr [5 x i8], [5 x i8]* @.str760 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t761)
  %t762 = getelementptr [5 x i8], [5 x i8]* @.str761 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t762)
  %t763 = getelementptr [5 x i8], [5 x i8]* @.str762 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t763)
  %t764 = getelementptr [5 x i8], [5 x i8]* @.str763 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t764)
  %t765 = getelementptr [5 x i8], [5 x i8]* @.str764 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t765)
  %t766 = getelementptr [5 x i8], [5 x i8]* @.str765 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t766)
  %t767 = getelementptr [5 x i8], [5 x i8]* @.str766 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t767)
  %t768 = getelementptr [5 x i8], [5 x i8]* @.str767 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t768)
  %t769 = getelementptr [5 x i8], [5 x i8]* @.str768 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t769)
  %t770 = getelementptr [5 x i8], [5 x i8]* @.str769 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t770)
  %t771 = getelementptr [5 x i8], [5 x i8]* @.str770 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t771)
  %t772 = getelementptr [5 x i8], [5 x i8]* @.str771 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t772)
  %t773 = getelementptr [5 x i8], [5 x i8]* @.str772 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t773)
  %t774 = getelementptr [5 x i8], [5 x i8]* @.str773 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t774)
  %t775 = getelementptr [5 x i8], [5 x i8]* @.str774 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t775)
  %t776 = getelementptr [5 x i8], [5 x i8]* @.str775 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t776)
  %t777 = getelementptr [5 x i8], [5 x i8]* @.str776 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t777)
  %t778 = getelementptr [5 x i8], [5 x i8]* @.str777 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t778)
  %t779 = getelementptr [5 x i8], [5 x i8]* @.str778 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t779)
  %t780 = getelementptr [5 x i8], [5 x i8]* @.str779 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t780)
  %t781 = getelementptr [5 x i8], [5 x i8]* @.str780 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t781)
  %t782 = getelementptr [5 x i8], [5 x i8]* @.str781 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t782)
  %t783 = getelementptr [5 x i8], [5 x i8]* @.str782 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t783)
  %t784 = getelementptr [5 x i8], [5 x i8]* @.str783 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t784)
  %t785 = getelementptr [5 x i8], [5 x i8]* @.str784 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t785)
  %t786 = getelementptr [5 x i8], [5 x i8]* @.str785 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t786)
  %t787 = getelementptr [5 x i8], [5 x i8]* @.str786 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t787)
  %t788 = getelementptr [5 x i8], [5 x i8]* @.str787 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t788)
  %t789 = getelementptr [5 x i8], [5 x i8]* @.str788 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t789)
  %t790 = getelementptr [5 x i8], [5 x i8]* @.str789 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t790)
  %t791 = getelementptr [5 x i8], [5 x i8]* @.str790 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t791)
  %t792 = getelementptr [5 x i8], [5 x i8]* @.str791 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t792)
  %t793 = getelementptr [5 x i8], [5 x i8]* @.str792 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t793)
  %t794 = getelementptr [5 x i8], [5 x i8]* @.str793 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t794)
  %t795 = getelementptr [5 x i8], [5 x i8]* @.str794 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t795)
  %t796 = getelementptr [5 x i8], [5 x i8]* @.str795 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t796)
  %t797 = getelementptr [5 x i8], [5 x i8]* @.str796 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t797)
  %t798 = getelementptr [5 x i8], [5 x i8]* @.str797 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t798)
  %t799 = getelementptr [5 x i8], [5 x i8]* @.str798 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t799)
  %t800 = getelementptr [5 x i8], [5 x i8]* @.str799 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t800)
  %t801 = getelementptr [5 x i8], [5 x i8]* @.str800 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t801)
  %t802 = getelementptr [5 x i8], [5 x i8]* @.str801 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t802)
  %t803 = getelementptr [5 x i8], [5 x i8]* @.str802 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t803)
  %t804 = getelementptr [5 x i8], [5 x i8]* @.str803 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t804)
  %t805 = getelementptr [5 x i8], [5 x i8]* @.str804 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t805)
  %t806 = getelementptr [5 x i8], [5 x i8]* @.str805 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t806)
  %t807 = getelementptr [5 x i8], [5 x i8]* @.str806 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t807)
  %t808 = getelementptr [5 x i8], [5 x i8]* @.str807 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t808)
  %t809 = getelementptr [5 x i8], [5 x i8]* @.str808 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t809)
  %t810 = getelementptr [5 x i8], [5 x i8]* @.str809 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t810)
  %t811 = getelementptr [5 x i8], [5 x i8]* @.str810 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t811)
  %t812 = getelementptr [5 x i8], [5 x i8]* @.str811 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t812)
  %t813 = getelementptr [5 x i8], [5 x i8]* @.str812 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t813)
  %t814 = getelementptr [5 x i8], [5 x i8]* @.str813 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t814)
  %t815 = getelementptr [5 x i8], [5 x i8]* @.str814 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t815)
  %t816 = getelementptr [5 x i8], [5 x i8]* @.str815 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t816)
  %t817 = getelementptr [5 x i8], [5 x i8]* @.str816 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t817)
  %t818 = getelementptr [5 x i8], [5 x i8]* @.str817 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t818)
  %t819 = getelementptr [5 x i8], [5 x i8]* @.str818 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t819)
  %t820 = getelementptr [5 x i8], [5 x i8]* @.str819 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t820)
  %t821 = getelementptr [5 x i8], [5 x i8]* @.str820 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t821)
  %t822 = getelementptr [5 x i8], [5 x i8]* @.str821 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t822)
  %t823 = getelementptr [5 x i8], [5 x i8]* @.str822 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t823)
  %t824 = getelementptr [5 x i8], [5 x i8]* @.str823 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t824)
  %t825 = getelementptr [5 x i8], [5 x i8]* @.str824 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t825)
  %t826 = getelementptr [5 x i8], [5 x i8]* @.str825 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t826)
  %t827 = getelementptr [5 x i8], [5 x i8]* @.str826 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t827)
  %t828 = getelementptr [5 x i8], [5 x i8]* @.str827 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t828)
  %t829 = getelementptr [5 x i8], [5 x i8]* @.str828 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t829)
  %t830 = getelementptr [5 x i8], [5 x i8]* @.str829 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t830)
  %t831 = getelementptr [5 x i8], [5 x i8]* @.str830 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t831)
  %t832 = getelementptr [5 x i8], [5 x i8]* @.str831 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t832)
  %t833 = getelementptr [5 x i8], [5 x i8]* @.str832 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t833)
  %t834 = getelementptr [5 x i8], [5 x i8]* @.str833 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t834)
  %t835 = getelementptr [5 x i8], [5 x i8]* @.str834 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t835)
  %t836 = getelementptr [5 x i8], [5 x i8]* @.str835 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t836)
  %t837 = getelementptr [5 x i8], [5 x i8]* @.str836 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t837)
  %t838 = getelementptr [5 x i8], [5 x i8]* @.str837 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t838)
  %t839 = getelementptr [5 x i8], [5 x i8]* @.str838 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t839)
  %t840 = getelementptr [5 x i8], [5 x i8]* @.str839 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t840)
  %t841 = getelementptr [5 x i8], [5 x i8]* @.str840 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t841)
  %t842 = getelementptr [5 x i8], [5 x i8]* @.str841 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t842)
  %t843 = getelementptr [5 x i8], [5 x i8]* @.str842 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t843)
  %t844 = getelementptr [5 x i8], [5 x i8]* @.str843 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t844)
  %t845 = getelementptr [5 x i8], [5 x i8]* @.str844 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t845)
  %t846 = getelementptr [5 x i8], [5 x i8]* @.str845 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t846)
  %t847 = getelementptr [5 x i8], [5 x i8]* @.str846 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t847)
  %t848 = getelementptr [5 x i8], [5 x i8]* @.str847 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t848)
  %t849 = getelementptr [5 x i8], [5 x i8]* @.str848 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t849)
  %t850 = getelementptr [5 x i8], [5 x i8]* @.str849 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t850)
  %t851 = getelementptr [5 x i8], [5 x i8]* @.str850 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t851)
  %t852 = getelementptr [5 x i8], [5 x i8]* @.str851 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t852)
  %t853 = getelementptr [5 x i8], [5 x i8]* @.str852 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t853)
  %t854 = getelementptr [5 x i8], [5 x i8]* @.str853 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t854)
  %t855 = getelementptr [5 x i8], [5 x i8]* @.str854 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t855)
  %t856 = getelementptr [5 x i8], [5 x i8]* @.str855 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t856)
  %t857 = getelementptr [5 x i8], [5 x i8]* @.str856 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t857)
  %t858 = getelementptr [5 x i8], [5 x i8]* @.str857 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t858)
  %t859 = getelementptr [5 x i8], [5 x i8]* @.str858 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t859)
  %t860 = getelementptr [5 x i8], [5 x i8]* @.str859 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t860)
  %t861 = getelementptr [5 x i8], [5 x i8]* @.str860 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t861)
  %t862 = getelementptr [5 x i8], [5 x i8]* @.str861 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t862)
  %t863 = getelementptr [5 x i8], [5 x i8]* @.str862 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t863)
  %t864 = getelementptr [5 x i8], [5 x i8]* @.str863 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t864)
  %t865 = getelementptr [5 x i8], [5 x i8]* @.str864 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t865)
  %t866 = getelementptr [5 x i8], [5 x i8]* @.str865 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t866)
  %t867 = getelementptr [5 x i8], [5 x i8]* @.str866 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t867)
  %t868 = getelementptr [5 x i8], [5 x i8]* @.str867 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t868)
  %t869 = getelementptr [5 x i8], [5 x i8]* @.str868 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t869)
  %t870 = getelementptr [5 x i8], [5 x i8]* @.str869 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t870)
  %t871 = getelementptr [5 x i8], [5 x i8]* @.str870 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t871)
  %t872 = getelementptr [5 x i8], [5 x i8]* @.str871 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t872)
  %t873 = getelementptr [5 x i8], [5 x i8]* @.str872 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t873)
  %t874 = getelementptr [5 x i8], [5 x i8]* @.str873 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t874)
  %t875 = getelementptr [5 x i8], [5 x i8]* @.str874 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t875)
  %t876 = getelementptr [5 x i8], [5 x i8]* @.str875 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t876)
  %t877 = getelementptr [5 x i8], [5 x i8]* @.str876 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t877)
  %t878 = getelementptr [5 x i8], [5 x i8]* @.str877 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t878)
  %t879 = getelementptr [5 x i8], [5 x i8]* @.str878 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t879)
  %t880 = getelementptr [5 x i8], [5 x i8]* @.str879 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t880)
  %t881 = getelementptr [5 x i8], [5 x i8]* @.str880 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t881)
  %t882 = getelementptr [5 x i8], [5 x i8]* @.str881 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t882)
  %t883 = getelementptr [5 x i8], [5 x i8]* @.str882 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t883)
  %t884 = getelementptr [5 x i8], [5 x i8]* @.str883 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t884)
  %t885 = getelementptr [5 x i8], [5 x i8]* @.str884 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t885)
  %t886 = getelementptr [5 x i8], [5 x i8]* @.str885 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t886)
  %t887 = getelementptr [5 x i8], [5 x i8]* @.str886 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t887)
  %t888 = getelementptr [5 x i8], [5 x i8]* @.str887 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t888)
  %t889 = getelementptr [5 x i8], [5 x i8]* @.str888 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t889)
  %t890 = getelementptr [5 x i8], [5 x i8]* @.str889 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t890)
  %t891 = getelementptr [5 x i8], [5 x i8]* @.str890 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t891)
  %t892 = getelementptr [5 x i8], [5 x i8]* @.str891 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t892)
  %t893 = getelementptr [5 x i8], [5 x i8]* @.str892 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t893)
  %t894 = getelementptr [5 x i8], [5 x i8]* @.str893 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t894)
  %t895 = getelementptr [5 x i8], [5 x i8]* @.str894 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t895)
  %t896 = getelementptr [5 x i8], [5 x i8]* @.str895 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t896)
  %t897 = getelementptr [5 x i8], [5 x i8]* @.str896 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t897)
  %t898 = getelementptr [5 x i8], [5 x i8]* @.str897 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t898)
  %t899 = getelementptr [5 x i8], [5 x i8]* @.str898 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t899)
  %t900 = getelementptr [5 x i8], [5 x i8]* @.str899 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t900)
  %t901 = getelementptr [5 x i8], [5 x i8]* @.str900 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t901)
  %t902 = getelementptr [5 x i8], [5 x i8]* @.str901 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t902)
  %t903 = getelementptr [5 x i8], [5 x i8]* @.str902 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t903)
  %t904 = getelementptr [5 x i8], [5 x i8]* @.str903 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t904)
  %t905 = getelementptr [5 x i8], [5 x i8]* @.str904 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t905)
  %t906 = getelementptr [5 x i8], [5 x i8]* @.str905 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t906)
  %t907 = getelementptr [5 x i8], [5 x i8]* @.str906 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t907)
  %t908 = getelementptr [5 x i8], [5 x i8]* @.str907 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t908)
  %t909 = getelementptr [5 x i8], [5 x i8]* @.str908 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t909)
  %t910 = getelementptr [5 x i8], [5 x i8]* @.str909 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t910)
  %t911 = getelementptr [5 x i8], [5 x i8]* @.str910 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t911)
  %t912 = getelementptr [5 x i8], [5 x i8]* @.str911 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t912)
  %t913 = getelementptr [5 x i8], [5 x i8]* @.str912 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t913)
  %t914 = getelementptr [5 x i8], [5 x i8]* @.str913 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t914)
  %t915 = getelementptr [5 x i8], [5 x i8]* @.str914 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t915)
  %t916 = getelementptr [5 x i8], [5 x i8]* @.str915 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t916)
  %t917 = getelementptr [5 x i8], [5 x i8]* @.str916 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t917)
  %t918 = getelementptr [5 x i8], [5 x i8]* @.str917 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t918)
  %t919 = getelementptr [5 x i8], [5 x i8]* @.str918 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t919)
  %t920 = getelementptr [5 x i8], [5 x i8]* @.str919 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t920)
  %t921 = getelementptr [5 x i8], [5 x i8]* @.str920 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t921)
  %t922 = getelementptr [5 x i8], [5 x i8]* @.str921 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t922)
  %t923 = getelementptr [5 x i8], [5 x i8]* @.str922 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t923)
  %t924 = getelementptr [5 x i8], [5 x i8]* @.str923 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t924)
  %t925 = getelementptr [5 x i8], [5 x i8]* @.str924 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t925)
  %t926 = getelementptr [5 x i8], [5 x i8]* @.str925 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t926)
  %t927 = getelementptr [5 x i8], [5 x i8]* @.str926 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t927)
  %t928 = getelementptr [5 x i8], [5 x i8]* @.str927 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t928)
  %t929 = getelementptr [5 x i8], [5 x i8]* @.str928 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t929)
  %t930 = getelementptr [5 x i8], [5 x i8]* @.str929 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t930)
  %t931 = getelementptr [5 x i8], [5 x i8]* @.str930 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t931)
  %t932 = getelementptr [5 x i8], [5 x i8]* @.str931 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t932)
  %t933 = getelementptr [5 x i8], [5 x i8]* @.str932 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t933)
  %t934 = getelementptr [5 x i8], [5 x i8]* @.str933 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t934)
  %t935 = getelementptr [5 x i8], [5 x i8]* @.str934 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t935)
  %t936 = getelementptr [5 x i8], [5 x i8]* @.str935 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t936)
  %t937 = getelementptr [5 x i8], [5 x i8]* @.str936 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t937)
  %t938 = getelementptr [5 x i8], [5 x i8]* @.str937 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t938)
  %t939 = getelementptr [5 x i8], [5 x i8]* @.str938 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t939)
  %t940 = getelementptr [5 x i8], [5 x i8]* @.str939 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t940)
  %t941 = getelementptr [5 x i8], [5 x i8]* @.str940 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t941)
  %t942 = getelementptr [5 x i8], [5 x i8]* @.str941 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t942)
  %t943 = getelementptr [5 x i8], [5 x i8]* @.str942 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t943)
  %t944 = getelementptr [5 x i8], [5 x i8]* @.str943 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t944)
  %t945 = getelementptr [5 x i8], [5 x i8]* @.str944 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t945)
  %t946 = getelementptr [5 x i8], [5 x i8]* @.str945 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t946)
  %t947 = getelementptr [5 x i8], [5 x i8]* @.str946 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t947)
  %t948 = getelementptr [5 x i8], [5 x i8]* @.str947 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t948)
  %t949 = getelementptr [5 x i8], [5 x i8]* @.str948 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t949)
  %t950 = getelementptr [5 x i8], [5 x i8]* @.str949 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t950)
  %t951 = getelementptr [5 x i8], [5 x i8]* @.str950 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t951)
  %t952 = getelementptr [5 x i8], [5 x i8]* @.str951 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t952)
  %t953 = getelementptr [5 x i8], [5 x i8]* @.str952 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t953)
  %t954 = getelementptr [5 x i8], [5 x i8]* @.str953 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t954)
  %t955 = getelementptr [5 x i8], [5 x i8]* @.str954 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t955)
  %t956 = getelementptr [5 x i8], [5 x i8]* @.str955 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t956)
  %t957 = getelementptr [5 x i8], [5 x i8]* @.str956 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t957)
  %t958 = getelementptr [5 x i8], [5 x i8]* @.str957 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t958)
  %t959 = getelementptr [5 x i8], [5 x i8]* @.str958 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t959)
  %t960 = getelementptr [5 x i8], [5 x i8]* @.str959 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t960)
  %t961 = getelementptr [5 x i8], [5 x i8]* @.str960 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t961)
  %t962 = getelementptr [5 x i8], [5 x i8]* @.str961 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t962)
  %t963 = getelementptr [5 x i8], [5 x i8]* @.str962 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t963)
  %t964 = getelementptr [5 x i8], [5 x i8]* @.str963 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t964)
  %t965 = getelementptr [5 x i8], [5 x i8]* @.str964 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t965)
  %t966 = getelementptr [5 x i8], [5 x i8]* @.str965 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t966)
  %t967 = getelementptr [5 x i8], [5 x i8]* @.str966 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t967)
  %t968 = getelementptr [5 x i8], [5 x i8]* @.str967 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t968)
  %t969 = getelementptr [5 x i8], [5 x i8]* @.str968 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t969)
  %t970 = getelementptr [5 x i8], [5 x i8]* @.str969 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t970)
  %t971 = getelementptr [5 x i8], [5 x i8]* @.str970 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t971)
  %t972 = getelementptr [5 x i8], [5 x i8]* @.str971 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t972)
  %t973 = getelementptr [5 x i8], [5 x i8]* @.str972 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t973)
  %t974 = getelementptr [5 x i8], [5 x i8]* @.str973 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t974)
  %t975 = getelementptr [5 x i8], [5 x i8]* @.str974 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t975)
  %t976 = getelementptr [5 x i8], [5 x i8]* @.str975 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t976)
  %t977 = getelementptr [5 x i8], [5 x i8]* @.str976 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t977)
  %t978 = getelementptr [5 x i8], [5 x i8]* @.str977 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t978)
  %t979 = getelementptr [5 x i8], [5 x i8]* @.str978 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t979)
  %t980 = getelementptr [5 x i8], [5 x i8]* @.str979 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t980)
  %t981 = getelementptr [5 x i8], [5 x i8]* @.str980 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t981)
  %t982 = getelementptr [5 x i8], [5 x i8]* @.str981 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr error: too many strings
([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t982)
  %t983 = getelementptr [5 x i8], [5 x i8]* @.str982 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t983)
  %t984 = getelementptr [5 x i8], [5 x i8]* @.str983 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t984)
  %t985 = getelementptr [5 x i8], [5 x i8]* @.str984 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t985)
  %t986 = getelementptr [5 x i8], [5 x i8]* @.str985 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t986)
  %t987 = getelementptr [5 x i8], [5 x i8]* @.str986 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t987)
  %t988 = getelementptr [5 x i8], [5 x i8]* @.str987 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t988)
  %t989 = getelementptr [5 x i8], [5 x i8]* @.str988 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t989)
  %t990 = getelementptr [5 x i8], [5 x i8]* @.str989 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t990)
  %t991 = getelementptr [5 x i8], [5 x i8]* @.str990 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t991)
  %t992 = getelementptr [5 x i8], [5 x i8]* @.str991 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t992)
  %t993 = getelementptr [5 x i8], [5 x i8]* @.str992 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t993)
  %t994 = getelementptr [5 x i8], [5 x i8]* @.str993 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t994)
  %t995 = getelementptr [5 x i8], [5 x i8]* @.str994 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t995)
  %t996 = getelementptr [5 x i8], [5 x i8]* @.str995 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t996)
  %t997 = getelementptr [5 x i8], [5 x i8]* @.str996 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t997)
  %t998 = getelementptr [5 x i8], [5 x i8]* @.str997 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t998)
  %t999 = getelementptr [5 x i8], [5 x i8]* @.str998 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t999)
  %t1000 = getelementptr [5 x i8], [5 x i8]* @.str999 , i32 0, i32 0
  call i32 (i8*, ...) @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.pstr, i32 0, i32 0), i8* %t1000)
  %t1001 = getelementptr [18 x i8], [18 x i8]* @.str1000 , i32 0, i32 0