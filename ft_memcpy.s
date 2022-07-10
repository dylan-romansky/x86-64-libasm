section .text
global ft_memcpy, _ft_memcpy

ft_memcpy:
_ft_memcpy:
	xor rcx, rcx
	xor r8, r8
	jmp copy
increment:
	inc rcx
copy:
	cmp rcx, rdx
	jz return
	mov r8b, BYTE[rsi + rcx]
	mov BYTE[rdi + rcx], r8b
	jmp increment
return:
	mov rax, rdi
	ret
