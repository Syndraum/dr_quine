global main
global m_echo
section .text
extern printf
; This program will print its own source when run.
main:
  ; Begin program
  call m_echo
  xor  rax, rax
  ret
m_echo:
  mov  rdi, s1
  mov  rsi, 10
  mov  rdx, 34
  mov  rcx, s1
  mov  r8, 59
  xor  rax, rax
  call printf
  xor  rax, rax
  ret
section .rodata
s1: db "global main%1$cglobal m_echo%1$csection .text%1$cextern printf%1$c%4$c This program will print its own source when run.%1$cmain:%1$c  %4$c Begin program%1$c  call m_echo%1$c  xor  rax, rax%1$c  ret%1$cm_echo:%1$c  mov  rdi, s1%1$c  mov  rsi, 10%1$c  mov  rdx, 34%1$c  mov  rcx, s1%1$c  mov  r8, 59%1$c  xor  rax, rax%1$c  call printf%1$c  xor  rax, rax%1$c  ret%1$csection .rodata%1$cs1: db %2$c%3$s%2$c"