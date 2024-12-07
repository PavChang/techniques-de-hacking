BITS 64
xor rax, rax
push rax
push 0x68732f2f; push 4 octets chaque fois
push 0x6e69622f
mov rdi, rsp
push rax
mov rsi, rsp
push rdi
mov rdx, rsp
mov al, 0x3b
syscall