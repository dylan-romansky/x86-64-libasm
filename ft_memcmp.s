section .text
global ft_memcmp, _ft_memcmp

ft_memcmp:
_ft_memcmp:
	xor rcx, rcx
	xor r8, r8
	jmp compare
increment:
	inc rcx
compare:
	mov r8b, BYTE[rdi + rcx]
	sub r8b, BYTE[rsi + rcx]
	jnz return
	cmp rcx, rdx
	jnz increment
return:
	mov rax, r8
	ret
