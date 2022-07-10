section .text
global ft_memmove, _ft_memmove

;I decided to implement two completely separate paths
;that have similar code instead of littering the
;function with extra checks as I wanted this function
;to be fast
ft_memmove:
_ft_memmove:
	xor rcx, rcx
	xor r8, r8
	cmp rdi, rsi
	jle normcop
	dec rdx
	jmp weirdcop
norminc:
	inc rcx
normcop:
	cmp rcx, rdx
	jz return
	mov r8b, BYTE[rsi + rcx]
	mov BYTE[rdi + rcx], r8b
	jmp norminc
weirdinc:
	dec rdx
weirdcop:
	cmp rdx, 0
	jle return
	mov r8b, BYTE[rsi + rdx]
	mov BYTE[rdi + rdx], r8b
	jmp weirdinc
return:
	mov rax, rdi
	ret
