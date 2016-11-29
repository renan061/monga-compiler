target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)

define i32 @main() {
  %t1 = alloca i32
  %t2 = alloca double
  %t3 = add i32 2, 0
store i32 2, i32* %t1
  %t4 = fadd double 1.100000, 0.0
store double 1.100000, double* %t2
ret i32 0
}
