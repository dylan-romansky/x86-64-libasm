section .text
global ft_strdup, _ft_strdup
extern malloc, ft_strlen

ft_strdup:
_ft_strdup:
	call ft_strlen	;get length of char *s
	cmp rdi, 0
	jz return
	push rdi		;put s on the stack
	mov rdi, rax	;move the length to the first argument register
	push rax		;save the length for later
	call malloc
	pop rdx			;retrieve the length
	pop rsi			;put s in rsi
	xor rdi, rdi		;i = 0
	jmp copy
increment:
	inc rdi
copy:
	mov cl, BYTE[rsi + rdi]
	mov BYTE[rax + rdi], cl
	cmp rdi, rdx
	jnz increment
return:
	ret
