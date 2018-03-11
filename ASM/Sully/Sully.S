; rdi, rsi, rdx, rcx, r8, r9
	extern dprintf
	extern snprintf
	extern open
	extern close
	SECTION .data
fmt: db "", 0
file_fmt: db "Sully_%d.S", 0
num: db 0x00000005
	SECTION .text
	global main
main:
	push rbp
	mov rbp, rsp

	sub rsp, 272
	lea rax, [rbp-272] ; char name[256];
	mov DWORD [rbp-1], 5

	mov rcx, [rbp-1]
	sub rcx, 1
	mov rdx, file_fmt
	mov rsi, 256
	mov rdi, rax
	mov rax, 0
	call snprintf WRT ..plt

	mov rsp, rbp
	pop rbp
	mov rax, 0
	ret
