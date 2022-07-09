section .text
global _ft_strlen, ft_strlen	; _ for compatibility

_ft_strlen:
ft_strlen:
			xor	rax, rax		; i=0
			jmp	compare
increment:
			inc	rax
compare:
			cmp	BYTE[rdi + rax], 0
			jne	increment
			ret
