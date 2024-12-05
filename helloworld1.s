BITS 64
call mark_below
db "Hello, world!", 0x0a, 0x0d
mark_below:
; ce n'est pas une fonction qu'on invoque ici, parce qu'il n'y a pas de ret
; on va simplement récupérer l'adresse de retour comme rsi 
    pop rsi
    mov rax, 1
    mov rdi, 1
    mov rdx, 15
    syscall
    mov rax, 0x3c
    mov rdi, 0
    syscall
; En utilisant nasm, on traduit code assembleur en code machine
; et avec ndisasm -b64, on fait l'inverse

; nasm -f elf64 peut générer le fichier objet, qui peut être lié par ld pour un exécutable
; pourtant le shellcode ici n'est pas exécutable, il est assemblé par nasm directement, le format est data