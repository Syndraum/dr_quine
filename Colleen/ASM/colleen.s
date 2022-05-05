global main
section .text
extern printf
main:
  sub  rsp, 8
  mov  rdi, s1
  mov  rsi, 10
  mov  rdx, 34
  mov  rcx, s1
  xor  rax, rax
  call printf
  xor  rax, rax
  add  rsp, 8
  ret
section .rodata
s1: db "global main%1$csection .text%1$cextern printf%1$cmain:%1$c  sub  rsp, 8%1$c  mov  rdi, s1%1$c  mov  rsi, 10%1$c  mov  rdx, 34%1$c  mov  rcx, s1%1$c  xor  rax, rax%1$c  call printf%1$c  xor  rax, rax%1$c  add  rsp, 8%1$c  ret%1$csection .rodata%1$cs1: db %2$c%3$s%2$c"