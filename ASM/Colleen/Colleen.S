; rdi, rsi, rdx, rcx, r8, r9
	extern printf
	SECTION .data
fun_fmt: db "; rdi, rsi, rdx, rcx, r8, r9%c	extern printf%c	SECTION .data%cfun_fmt: db %c%s%c, 0%c	SECTION .text%cfunc:%c	push rbp%c	mov r11, 29%cloop1: dec r11%c	push 10%c	jne loop1%c	push 34%c	mov r9, fun_fmt%c	mov r8, 34%c	mov rcx, 10%c	mov rdx, 10%c	mov rsi, 10%c	mov rdi, fun_fmt%c	xor rax, rax%c	mov rax, 35%c	call printf WRT ..plt ; WRT bla bla is for -fPIC issue%c	add rsp, 29 * 8 ; restore stack after printf call it is CDECL%c	pop rbp%c	ret	%c	global main%cmain:%c	push rbp%c	call func%c	pop rbp%c	mov rax, 0%c	ret%c", 0
	SECTION .text
func:
	push rbp
	mov r11, 29
loop1: dec r11
	push 10
	jne loop1
	push 34
	mov r9, fun_fmt
	mov r8, 34
	mov rcx, 10
	mov rdx, 10
	mov rsi, 10
	mov rdi, fun_fmt
	xor rax, rax
	mov rax, 35
	call printf WRT ..plt ; WRT bla bla is for -fPIC issue
	add rsp, 29 * 8 ; restore stack after printf call it is CDECL
	pop rbp
	ret	
	global main
main:
	push rbp
	call func
	pop rbp
	mov rax, 0
	ret
