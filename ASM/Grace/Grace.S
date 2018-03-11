; rdi, rsi, rdx, rcx, r8, r9
	extern dprintf
	extern open
	extern close
	SECTION .data
fmt: db "; rdi, rsi, rdx, rcx, r8, r9%c	extern dprintf%c	extern open%c	extern close%c	SECTION .data%cfmt: db %c%s%c, 0%cfilename: db 0x47, 0x72, 0x61, 0x63, 0x65, 0x5f, 0x6b, 0x69, 0x64, 0x2e, 0x53, 0%c	SECTION .text%c%%macro save_reg 1%c	push %%1%c%%endmacro%c%%macro restore_to_reg 1%c	pop %%1%c%%endmacro%c%%macro no_actually_main 1%c	global main%cmain:%c	push rbp%c%c	mov rdi, filename%c	mov rsi, 1102o%c	mov rdx, 644o%c	mov rax, 0%c	call open WRT ..plt%c%c	save_reg rax%c	mov r10, 50%cloop1: push 10%c	dec r10%c	jne loop1%c	push 34%c	mov r10, fmt%c	push r10%c	push 34%c	push 10%c	mov r9, 10%c	mov r8, 10%c	mov rcx, 10%c	mov rdx, 10%c	mov rsi, fmt%c	mov rdi, rax%c	mov eax, 0%c	call dprintf WRT ..plt%c	add rsp, (4 + 50) * 8%c%c	restore_to_reg rdi%c	mov rax, 0%c	call close WRT ..plt%c%c	pop rbp%c	mov rax, 0%c	ret%c%%endmacro%c%cno_actually_main fmt%c", 0
filename: db 0x47, 0x72, 0x61, 0x63, 0x65, 0x5f, 0x6b, 0x69, 0x64, 0x2e, 0x53, 0
	SECTION .text
%macro save_reg 1
	push %1
%endmacro
%macro restore_to_reg 1
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

	save_reg rax
	mov r10, 50
loop1: push 10
	dec r10
	jne loop1
	push 34
	mov r10, fmt
	push r10
	push 34
	push 10
	mov r9, 10
	mov r8, 10
	mov rcx, 10
	mov rdx, 10
	mov rsi, fmt
	mov rdi, rax
	mov eax, 0
	call dprintf WRT ..plt
	add rsp, (4 + 50) * 8

	restore_to_reg rdi
	mov rax, 0
	call close WRT ..plt

	pop rbp
	mov rax, 0
	ret
%endmacro

no_actually_main fmt
