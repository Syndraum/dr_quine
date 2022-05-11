%macro S_PRINT 3
  sub rsp, 8
  mov rdi, %1
  mov rsi, %2
  mov rdx, %3
  call sprintf
  add rsp, 8
%endmacro

%macro EXEC 1
  mov rdi, %1
  sub rsp, 8
  call system
  add rsp, 8
  cmp rax, 0
  jne fail
%endmacro

  global main
  section .text
extern sprintf
extern dprintf
extern system
main:
  mov r14, 5
  cmp r14, 0
  jle exit
%ifdef DEC
  dec r14
%endif
  S_PRINT s2, ns, r14
  S_PRINT s3, no, r14
  S_PRINT s4, np, r14
  S_PRINT com, nasm, s2
  S_PRINT lin, clang, r14
  mov rdi, s2
  mov rsi, 577
  mov rdx, 436
  mov rax, 2
  syscall
  mov r15, rax
  mov rdi, r15
  mov rsi, s1
  mov rdx, 10
  mov rcx, 34
  mov r8, s1
  mov r9, 59
  push r14
  call dprintf
  pop r14
  mov rdi, r15
  mov rax, 3
  syscall
  EXEC com
  EXEC lin
  mov rdi, s3
  mov rax, 87
  syscall
  EXEC s4

exit:
  xor rax, rax
  ret

fail:
  mov rax, 1
  ret

  section .data
s1: db "%%macro S_PRINT 3%1$c  sub rsp, 8%1$c  mov rdi, %%1%1$c  mov rsi, %%2%1$c  mov rdx, %%3%1$c  call sprintf%1$c  add rsp, 8%1$c%%endmacro%1$c%1$c%%macro EXEC 1%1$c  mov rdi, %%1%1$c  sub rsp, 8%1$c  call system%1$c  add rsp, 8%1$c  cmp rax, 0%1$c  jne fail%1$c%%endmacro%1$c%1$c  global main%1$c  section .text%1$cextern sprintf%1$cextern dprintf%1$cextern system%1$cmain:%1$c  mov r14, %5$d%1$c  cmp r14, 0%1$c  jle exit%1$c%%ifdef DEC%1$c  dec r14%1$c%%endif%1$c  S_PRINT s2, ns, r14%1$c  S_PRINT s3, no, r14%1$c  S_PRINT s4, np, r14%1$c  S_PRINT com, nasm, s2%1$c  S_PRINT lin, clang, r14%1$c  mov rdi, s2%1$c  mov rsi, 577%1$c  mov rdx, 436%1$c  mov rax, 2%1$c  syscall%1$c  mov r15, rax%1$c  mov rdi, r15%1$c  mov rsi, s1%1$c  mov rdx, 10%1$c  mov rcx, 34%1$c  mov r8, s1%1$c  mov r9, 59%1$c  push r14%1$c  call dprintf%1$c  pop r14%1$c  mov rdi, r15%1$c  mov rax, 3%1$c  syscall%1$c  EXEC com%1$c  EXEC lin%1$c  mov rdi, s3%1$c  mov rax, 87%1$c  syscall%1$c  EXEC s4%1$c%1$cexit:%1$c  xor rax, rax%1$c  ret%1$c%1$cfail:%1$c  mov rax, 1%1$c  ret%1$c%1$c  section .data%1$cs1: db %2$c%3$s%2$c, 0%1$cs2: TIMES 42 db 0%1$cs3: TIMES 42 db 0%1$cs4: TIMES 42 db 0%1$ccom: TIMES 126 db 0%1$clin: TIMES 126 db 0%1$cns: db %2$cSully_%%d.s%2$c, 0%1$cno: db %2$cSully_%%d.o%2$c, 0%1$cnp: db %2$c./Sully_%%d%2$c, 0%1$cclang: db %2$c/usr/bin/clang -Wall -Werror -Wextra Sully_%%1$d.o -o Sully_%%1$d -D DEC=1%2$c, 0%1$cnasm: db %2$c/usr/bin/nasm -felf64 -D DEC=1 %%s%2$c, 0", 0
s2: TIMES 42 db 0
s3: TIMES 42 db 0
s4: TIMES 42 db 0
com: TIMES 126 db 0
lin: TIMES 126 db 0
ns: db "Sully_%d.s", 0
no: db "Sully_%d.o", 0
np: db "./Sully_%d", 0
clang: db "/usr/bin/clang -Wall -Werror -Wextra Sully_%1$d.o -o Sully_%1$d -D DEC=1", 0
nasm: db "/usr/bin/nasm -felf64 -D DEC=1 %s", 0