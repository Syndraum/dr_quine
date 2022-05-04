global main
section .text
extern printf
main:
  mov  rdi, s1
  mov  rsi, 10
  mov  rdx, 34
  mov  rcx, s1
  mov  eax, 0
  call printf
  xor  rax, rax
  ret
section .data
s1: db "global main%1$csection .text%1$cextern printf%1$cmain:%1$c  mov  rdi, s1%1$c  mov  rsi, 10%1$c  mov  rdx, 34%1$c  mov  rcx, s1%1$c  mov  eax, 0%1$c  call printf%1$c  xor  rax, rax%1$c  ret%1$csection .data%1$cs1: db %2$c%3$s%2$c"