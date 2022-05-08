%macro S_PRINT 2
  sub rsp, 8
  mov rdi, %1
  mov rsi, %2
  mov rdx, r14
  call sprintf
  add rsp, 8
%endmacro

%macro EXEC 1
  mov rdi, [%1]
  mov rsi, %1
  mov rdx, 0
  mov rax, 59
  syscall
  ret
%endmacro

%macro FORK 0
  mov rax, 57
  syscall
  mov r13, rax
  cmp r13, 0
  jl fail
  cmp r13, 0
%endmacro

%macro WAIT 0
  mov rdi, r13
  mov rsi, r12
  mov rdx, 0
  mov rcx, 0
  mov rax, 61
  syscall
%endmacro

  global main
  section .text
extern sprintf
extern dprintf
main:
  mov r14, 5
  cmp r14, 0
  jle exit
  dec r14
  S_PRINT s2, ns
  S_PRINT s3, no
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
  FORK
  je enasm
  WAIT
  FORK
  je eclang
  WAIT
  EXEC earr

fail:
  xor rax, 1
  ret

exit:
  xor rax, rax
  ret

enasm:
  EXEC carr

eclang:
  EXEC larr

  section .data
s1: db "%%macro S_PRINT 2%1$c  sub rsp, 8%1$c  mov rdi, %%1%1$c  mov rsi, %%2%1$c  mov rdx, r14%1$c  call sprintf%1$c  add rsp, 8%1$c%%endmacro%1$c%1$c%%macro EXEC 1%1$c  mov rdi, [%%1]%1$c  mov rsi, %%1%1$c  mov rdx, 0%1$c  mov rax, 59%1$c  syscall%1$c  ret%1$c%%endmacro%1$c%1$c%%macro FORK 0%1$c  mov rax, 57%1$c  syscall%1$c  mov r13, rax%1$c  cmp r13, 0%1$c  jl fail%1$c  cmp r13, 0%1$c%%endmacro%1$c%1$c%%macro WAIT 0%1$c  mov rdi, r13%1$c  mov rsi, r12%1$c  mov rdx, 0%1$c  mov rcx, 0%1$c  mov rax, 61%1$c  syscall%1$c%%endmacro%1$c%1$c  global main%1$c  section .text%1$cextern sprintf%1$cextern dprintf%1$cmain:%1$c  mov r14, %5$d%1$c  cmp r14, 0%1$c  jle exit%1$c  dec r14%1$c  S_PRINT s2, ns%1$c  S_PRINT s3, no%1$c  mov rdi, s2%1$c  mov rsi, 577%1$c  mov rdx, 436%1$c  mov rax, 2%1$c  syscall%1$c  mov r15, rax%1$c  mov rdi, r15%1$c  mov rsi, s1%1$c  mov rdx, 10%1$c  mov rcx, 34%1$c  mov r8, s1%1$c  mov r9, 59%1$c  push r14%1$c  call dprintf%1$c  pop r14%1$c  mov rdi, r15%1$c  mov rax, 3%1$c  syscall%1$c  FORK%1$c  je enasm%1$c  WAIT%1$c  FORK%1$c  je eclang%1$c  WAIT%1$c  EXEC earr%1$c%1$cfail:%1$c  xor rax, 1%1$c  ret%1$c%1$cexit:%1$c  xor rax, rax%1$c  ret%1$c%1$cenasm:%1$c  EXEC carr%1$c%1$ceclang:%1$c  EXEC larr%1$c%1$c  section .data%1$cs1: db %2$c%3$s%2$c, 0%1$cs2: TIMES 255 db 0%1$cs3: TIMES 255 db 0%1$cns: db %2$cSully_%%d.s%2$c, 0%1$cno: db %2$cSully_%%d.o%2$c, 0%1$cclang: db %2$c/usr/bin/clang%2$c, 0%1$cnasm: db %2$c/usr/bin/nasm%2$c, 0%1$call: db %2$c-Wall%2$c, 0%1$cerror: db %2$c-Werror%2$c, 0%1$cextra: db %2$c-Wextra%2$c, 0%1$cout: db %2$c-o%2$c, 0%1$celf: db %2$c-felf64%2$c, 0%1$cnpie: db %2$c-no-pie%2$c, 0%1$cname: db %2$cSully%2$c, 0%1$cexec: db %2$c./Sully%2$c, 0%1$ccarr: dq nasm, elf, s2, 0%1$clarr: dq clang, all, error, extra, npie, s3, out, name, 0%1$cearr: dq exec, 0", 0
s2: TIMES 255 db 0
s3: TIMES 255 db 0
ns: db "Sully_%d.s", 0
no: db "Sully_%d.o", 0
clang: db "/usr/bin/clang", 0
nasm: db "/usr/bin/nasm", 0
all: db "-Wall", 0
error: db "-Werror", 0
extra: db "-Wextra", 0
out: db "-o", 0
elf: db "-felf64", 0
npie: db "-no-pie", 0
name: db "Sully", 0
exec: db "./Sully", 0
carr: dq nasm, elf, s2, 0
larr: dq clang, all, error, extra, npie, s3, out, name, 0
earr: dq exec, 0