section .text
global _ft_strcmp, ft_strcmp

;zero out the registers we're gonna use. it's
;important to do the whole thing so we don't get
;unexpected trash data messing with our results.
_ft_strcmp:
ft_strcmp:
	xor r8, r8
	xor rdx, rdx
	xor rcx, rcx
	jmp compare
increment:
	inc r8
;if at any point the resulting value after
;subtracting rcx from rdx is not 0 or the value in
;rcx is in fact 0 we move to our return statement
;as we know we are either at a mismatch or our
;strings are equal
compare:
	mov dl, BYTE [rdi + r8]
	mov cl, BYTE [rsi + r8]
	sub rdx, rcx
	jnz return
	cmp cl, 0
	jz return
	jmp increment
return:
	mov rax, rdx
	ret
