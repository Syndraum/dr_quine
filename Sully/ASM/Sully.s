%macro S_PRINT 2
sub rsp, 8
mov rdi, %1
mov rsi, %2
mov rdx, r14
call sprintf
add rsp, 8
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
sub rsp, 8
mov rdi, r15
mov rsi, s1
mov rdx, 10
mov rcx, 34
mov r8, s1
mov r9, 59
call dprintf
add rsp, 8
mov rdi, r15
mov rax, 5
syscall
exit:
xor rax, rax
ret
section .data
s1: db "%%macro S_PRINT 2%1$csub rsp, 8%1$cmov rdi, %%1%1$cmov rsi, %%2%1$cmov rdx, r14%1$ccall sprintf%1$cadd rsp, 8%1$c%%endmacro%1$cglobal main%1$c", 0
s2: TIMES 255 db 0
s3: TIMES 255 db 0
ns: db "Sully_%d.s", 0
no: db "Sully_%d.o", 0