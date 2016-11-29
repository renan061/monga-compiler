target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)

define i32 @main() {
;DefVar
  %t1 = alloca i32
;VarId
;ExpKInt
  %t2 = add i32 65, 0
;CmdAsg
  store i32 %t2, i32* %t1
;VarId
;ExpVar
  %t3 = load i32, i32* %t1
;CmdPrint
  call i32 @putchar(i32 %t3)
  ret i32 0
}
