; rdi, rsi, rdx, rcx, r8, r9
	extern dprintf
	extern snprintf
	extern open
	extern close
	extern execve
	SECTION .data
fmt: db "%c%c%c%c%c%c%c%c%s%c", 0
file_fmt: db "Sully_%d.S", 0
fmt_no_exec: db "nasm -f elf64 %s -o tmp.o; gcc -m64 tmp.o -o Sully_%d", 0
fmt_with_exec: db "nasm -f elf64 %s -o tmp.o; gcc -m64 tmp.o -o Sully_%d; ./Sully_%d", 0
	SECTION .text
	global main
main:
	push rbp
	mov rbp, rsp

	sub rsp, 528 ; 256 for name[256], 256 for command[256] and 16 for int num, fd
	lea rax, [rbp-272] ; char name[256];
	mov DWORD [rbp-4], 5 ; int num

	mov rcx, [rbp-4]
	sub rcx, 1
	mov rdx, file_fmt
	mov rsi, 256
	mov rdi, rax
	mov rax, 0
	call snprintf WRT ..plt

	mov rdx, 0o644
	mov rsi, 577
	lea rax, [rbp-272]
	mov rdi, rax
	mov rax, 0
	call open WRT ..plt
	mov DWORD [rbp-8], eax ; int fd

	push 34
	mov r10, fmt
	push r10
	push 34
	push 10
	push 10
	push 10
	mov r9, 10
	mov r8, 10
	mov rcx, 10
	mov rdx, 10
	mov rsi, fmt
	mov edi, DWORD [rbp-8]
	mov rax, 0
	call dprintf WRT ..plt
	add rsp, (6 + 0) * 8

	cmp DWORD [rbp-4], 0
	jge command_with_exec

	mov r8d, DWORD [rbp-4]
	dec r8d
	lea rax, [rbp-272]
	mov rcx, rax
	mov rdx, fmt_no_exec
	mov rsi, 256
	lea rax, [rbp-528]
	mov rdi, rax
	mov rax, 0
	call snprintf WRT ..plt
	jmp running_prepared_command
command_with_exec:
	mov r9d, DWORD [rbp-4]
	dec r9d
	mov r8d, DWORD [rbp-4]
	dec r8d
	lea rax, [rbp-272]
	mov rcx, rax
	mov rdx, fmt_with_exec
	mov rsi, 256
	lea rax, [rbp-528]
	mov rdi, rax
	mov rax, 0
	call snprintf WRT ..plt

running_prepared_command:
	mov edi, DWORD [rbp-8]
	mov rax, 0
	call close WRT ..plt

	mov rsp, rbp
	pop rbp
	mov rax, 0
	ret
