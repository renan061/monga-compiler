target triple = "x86_64-apple-macosx10.11.0"
declare i32 @putchar(i32)

define i32 @main() {
  call i32 @putchar(i32 99)
  call i32 @putchar(i32 10)
  call i32 @putchar(i32 49)
  call i32 @putchar(i32 55)
  call i32 @putchar(i32 54)
  call i32 @putchar(i32 57)
  call i32 @putchar(i32 10)
  call i32 @putchar(i32 49)
  call i32 @putchar(i32 50)
  call i32 @putchar(i32 51)
  call i32 @putchar(i32 10)
  call i32 @putchar(i32 117)
  call i32 @putchar(i32 109)
  call i32 @putchar(i32 97)
  call i32 @putchar(i32 32)
  call i32 @putchar(i32 115)
  call i32 @putchar(i32 116)
  call i32 @putchar(i32 114)
  call i32 @putchar(i32 105)
  call i32 @putchar(i32 110)
  call i32 @putchar(i32 103)
  call i32 @putchar(i32 10)
ret i32 0
}
