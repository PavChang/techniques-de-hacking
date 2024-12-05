BITS 64

jmp short one; jmp au maximum 128 octets

two:
    pop rsi
    mov rax, 1
    mov rdi, 1
    mov rdx, 15
    syscall
    mov rax, 1
    mov rdi, 0
    syscall

one:
    call two
    db "Hello, world!", 0x0a, 0x0d