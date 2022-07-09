section .text
global	_ft_strcpy, ft_strcpy

_ft_strcpy:
ft_strcpy:
	xor rcx, rcx	; i=0
	xor rdx, rdx	; j=0
	cmp	rsi, 0
	jz	return
	jmp move
increment:
	inc rcx
move:
	mov dl, BYTE [rsi + rcx]
	mov BYTE [rdi + rcx], dl
	cmp dl, 0
	jne increment
return:
	mov rax, rdi
	ret
