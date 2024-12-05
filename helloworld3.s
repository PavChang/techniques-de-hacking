BITS 64

jmp short one
; annuler 0 généré par mov
two:
    pop rsi
    xor rax, rax
    mov al, 1
    xor rdi, rdi
    inc rdi
    xor rsi, rsi
    mov sil, 15
    syscall
    mov al, 0x3c
    dec rdi
    syscall

one:
    call two
    db "Hello, world!", 0x0a, 0x0d