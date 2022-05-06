%macro FT 0
global main
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
section .rodata
name: db "Grace_kid.s", 0
s1: db "%%macro FT 0%1$cglobal main%1$csection .text%1$cextern dprintf%1$c%4$c This program will print its own source when run.%1$cmain:%1$cmov rax, 2%1$cmov rdi, name%1$cmov rsi, 577%1$cmov rdx, 436%1$csyscall%1$cmov r14, rax%1$csub rsp, 8%1$cmov rdi, r14%1$cmov rsi, s1%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, s1%1$cmov r9, 59%1$ccall dprintf%1$cadd rsp, 8%1$cmov rdi, r14%1$cmov rax, 3%1$csyscall%1$cret%1$csection .rodata%1$cname: db %2$cGrace_kid.s%2$c, 0%1$cs1: db %2$c%3$s%2$c, 0%1$c%%endmacro%1$c%1$cFT", 0
%endmacro

FT