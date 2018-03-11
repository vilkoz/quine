; rdi, rsi, rdx, rcx, r8, r9
	extern dprintf
	extern open
	extern close
	SECTION .data
fmt: db "gopa", 0
filename: db 0x47, 0x72, 0x61, 0x63, 0x65, 0x5f, 0x6b, 0x69, 0x64, 0x2e, 0x53, 0
	SECTION .text
%macro save_reg 1
	push %1
	sub rsp, 8
%endmacro
%macro restore_to_reg 1
	add rsp, 8
	pop %1
%endmacro
%macro no_actually_main 1
	global main
main:
	push rbp

	mov rdi, filename
	mov rsi, 1102o
	mov rdx, 644o
	mov rax, 0
	call open WRT ..plt

	mov rsi, fmt
	mov rdi, rax
	save_reg rdi
	mov rax, 2
	call dprintf WRT ..plt

	restore_to_reg rdi
	mov rax, 0
	call close WRT ..plt

	pop rbp
	mov rax, 0
	ret
%endmacro

no_actually_main fmt
