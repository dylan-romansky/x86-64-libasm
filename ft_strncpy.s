section .text
global	_ft_strncpy, ft_strncpy

_ft_strncpy:
ft_strncpy:
	cmp	rsi, 0
	jz	return
	xor r8, r8	; i=0
	xor r9, r9	; j=0
	jmp move
increment:
	inc r8
	cmp r8, rdx
	je return
	cmp r9b, 0
	jz nullfill
move:
	mov r9b, BYTE [rsi + r8]	;i = s2[j]
	mov BYTE [rdi + r8], r9b	;s1[j] = i
	jmp increment
nullfill:
	mov BYTE [rdi + r8], 0
	jmp increment
return:
	mov rax, rdi
	ret
