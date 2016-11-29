target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)

define i32 @main() {
;DefVar
  %t1 = alloca i32
  %t2 = add i32 65, 0
  %t3 = add i32 10, 0
;ExpUnary
  %t4 = mul i32 %t3, -1
  %t5 = add i32 %t2, %t4
  %t6 = add i32 10, 0
  %t7 = add i32 %t5, %t6
  %t8 = add i32 10, 0
  %t9 = sub i32 %t7, %t8
  %t10 = add i32 10, 0
  %t11 = add i32 %t9, %t10
  %t12 = add i32 2, 0
  %t13 = mul i32 %t11, %t12
  %t14 = add i32 2, 0
  %t15 = sdiv i32 %t13, %t14
;CmdAsg
  store i32 %t15, i32* %t1
  %t16 = load i32, i32* %t1
;CmdPrint
  call i32 @putchar(i32 %t16)
;DefVar
  %t17 = alloca i8
;DefVar
  %t18 = alloca i8*
  ret i32 0
}
