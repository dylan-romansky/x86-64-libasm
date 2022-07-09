section .text
global _ft_strcmp, ft_strcmp

_ft_strcmp:
ft_strcmp:
	jmp compare
	xor rcx, rcx
	jmp compare
;add checks for null
increment:
	inc rcx
compare:
	mov dl, BYTE [rdi + rcx]
	sub dl, BYTE [rsi + rcx]
	jnz	return
	cmp dl, 0
	jz	return
	jmp increment
return:
	ret
