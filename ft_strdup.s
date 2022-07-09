section .text
global ft_strdup, _ft_strdup
extern malloc, ft_strlen

; I might put the null protection back but I kind of
; want it to accurately emulate the libc behaviour
; on my machine, which doesn't handle the NULL cases
; for you
ft_strdup:
_ft_strdup:
;	cmp rdi, 0	;protection from null input
;	jz return
	call ft_strlen	;get length of char *s
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
