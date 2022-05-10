%macro FNAME 0
name: db "Grace_kid.s", 0
%endmacro
%macro CODE 0
s1: db "%%macro FNAME 0%1$cname: db %2$cGrace_kid.s%2$c, 0%1$c%%endmacro%1$c%%macro CODE 0%1$cs1: db %2$c%3$s%2$c, 0%1$c%%endmacro%1$c%%macro FT 0%1$c  global main%1$c  section .rodata%1$c  FNAME%1$c  CODE%1$c  section .text%1$c  extern dprintf%1$c  %4$c This program will print its own source when run.%1$c  main:%1$c  mov rax, 2%1$c  mov rdi, name%1$c  mov rsi, 577%1$c  mov rdx, 436%1$c  syscall%1$c  mov r14, rax%1$c  sub rsp, 8%1$c  mov rdi, r14%1$c  mov rsi, s1%1$c  mov rdx, 10%1$c  mov rcx, 34%1$c  mov r8, s1%1$c  mov r9, 59%1$c  call dprintf%1$c  add rsp, 8%1$c  mov rdi, r14%1$c  mov rax, 3%1$c  syscall%1$c  ret%1$c%%endmacro%1$c%1$cFT", 0
%endmacro
%macro FT 0
  global main
  section .rodata
  FNAME
  CODE
  section .text
  extern dprintf
  ; This program will print its own source when run.
  main:
  mov rax, 2
  mov rdi, name
  mov rsi, 577
  mov rdx, 436
  syscall
  mov r14, rax
  sub rsp, 8
  mov rdi, r14
  mov rsi, s1
  mov rdx, 10
  mov rcx, 34
  mov r8, s1
  mov r9, 59
  call dprintf
  add rsp, 8
  mov rdi, r14
  mov rax, 3
  syscall
  ret
%endmacro

FT