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
s1: db "%%macro S_PRINT 2%1$csub rsp, 8%1$cmov rdi, %%1%1$cmov rsi, %%2%1$cmov rdx, r14%1$ccall sprintf%1$cadd rsp, 8%1$c%%endmacro%1$cglobal main%1$csection .text%1$cextern sprintf%1$cextern dprintf%1$cmain:%1$cmov r14, %5$d%1$ccmp r14, 0%1$cjle exit%1$cdec r14%1$cS_PRINT s2, ns%1$cS_PRINT s3, no%1$cmov rdi, s2%1$cmov rsi, 577%1$cmov rdx, 436%1$cmov rax, 2%1$csyscall%1$cmov r15, rax%1$cmov rdi, r15%1$cmov rsi, s1%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, s1%1$cmov r9, 59%1$cpush r14%1$ccall dprintf%1$cpop r14%1$cmov rdi, r15%1$cmov rax, 5%1$csyscall%1$cexit:%1$cxor rax, rax%1$cret%1$csection .data%1$cs1: db %2$c%3$s%2$c, 0%1$cs2: TIMES 255 db 0%1$cs3: TIMES 255 db 0%1$cns: db %2$cSully_%%d.s%2$c, 0%1$cno: db %2$cSully_%%d.o%2$c, 0", 0
s2: TIMES 255 db 0
s3: TIMES 255 db 0
ns: db "Sully_%d.s", 0
no: db "Sully_%d.o", 0
clang: db "/usr/bin/clang", 0
nasm: db "/home/roalvare/sgoinfre/.brew/bin/nasm", 0
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