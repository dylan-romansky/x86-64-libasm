section .text
global ft_strndup, _ft_strndup
extern malloc, ft_strlen

; I might put the null protection back but I kind of
; want it to accurately emulate the libc behaviour
; on my machine, which doesn't handle the NULL cases
; for you

; I briefly considered calling strcpy to fill the
; new string, but I didn't really like the idea of
; the extra call/return sequence on top of
; the wasted machine cycles from effectively calling
; ft_strlen twice
ft_strndup:
_ft_strndup:
;	cmp rdi, 0	;protection from null input
;	jz return
	push rdi		;put s on the stack
	inc rsi
	mov rdi, rsi	;move the length to the first argument register
	call malloc
	mov rdi, rsi
	dec rsi
	pop rdi			;retrieve the length
	xor r8, r8
	jmp copy
increment:
	inc r8
copy:
	mov cl, BYTE[rdi + r8]
	mov BYTE[rax + r8], cl
	cmp cl, 0
	jz return
	cmp rdi, r8
	jnz increment
	inc r8
	mov BYTE[rax + r8], 0
return:
	ret
