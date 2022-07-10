section .text
global ft_memccpy, _ft_memccpy

ft_memccpy:
_ft_memccpy:
	xor r8, r8
	xor r9, r9
	jmp copy
increment:
	inc r8
copy:
	cmp rcx, r8
	jz notfound
	mov r9b, BYTE[rsi + r8]
	cmp rdx, r9
	jz found
	mov BYTE[rdi + r8], r9b
	jmp increment
found:
	inc r8
	mov rax, rdi
	add rax, r8
	jmp return
notfound:
	mov rax, 0
return:
	ret
