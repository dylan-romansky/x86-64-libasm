section .text
global ft_bzero, _ft_bzero

ft_bzero:
_ft_bzero:
	xor rdx, rdx
	jmp zero
increment:
	inc rdx
zero:
	mov BYTE[rdi + rdx], 0
	cmp rsi, rdx
	jnz increment
	ret
