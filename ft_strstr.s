section .text
global ft_strstr, _ft_strstr
extern ft_strlen, ft_memcmp

ft_strstr:
_ft_strstr:
	push rdi		;put rdi on the stack and
	mov rdi, rsi	;move rsi to rdi so we can
	call ft_strlen	;take the length of needle,
	cmp rax, 0		;if it's 0 we just return
	jz loadmatch	; haystack, otherwise we
	mov rdx, rax	;store that length for future
	dec rdx			;use, put needle and haystack
	mov rsi, rdi	;back so we can use ft_memcmp
	pop rdi			;to do our search
	xor rcx, rcx
	jmp search
increment:
	inc rdi
search:
	mov cl, BYTE[rdi]
	cmp cl, 0
	jz nullret
	call ft_memcmp
	cmp rax, 0
	jz loadmatch
	jmp increment
nullret:
	mov rax, 0
	ret
loadmatch:
	mov rax, rdi
	ret
