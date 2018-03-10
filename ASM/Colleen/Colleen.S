
;http://www.nasm.us/doc/nasmdoc3.html
; https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI
; https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html
; https://www.csee.umbc.edu/portal/help/nasm/sample_64.shtml
; nasm -g -f macho64 Colleen.S; gcc -m64 -o a.out Colleen.o -Wl,-no_pie
; nasm -f elf64 Colleen.S -l Colleen.lst; gcc -m64 -fPIC -o a.out Colleen.o
	extern printf

	SECTION .data
fmt: db 'gopa = |%s|', 10, 0

msg: db '123456', 0

number: db 126

	SECTION .text

	global main
main:
	push rbp

	mov rdi, fmt
	mov rsi, msg
	xor rax, rax
	call printf WRT ..plt

	pop rbp

	mov rax, 0
	ret
