section .text
global ft_atoi, _ft_atoi

ft_atoi:
_ft_atoi:
	mov rdx, 6
	xor rsi, rsi
	jmp filter
incrementfilter:
	inc rdi
filter:			;filter through leading whitespace
	mov sil, BYTE[rdi]
	cmp sil, ' '
	jz incrementfilter
	sub sil, 9	;other than ' ', the whitespace lives between ascii values 9-13
	cmp sil, 4
	ja sign
	jmp incrementfilter
sign:
	add sil, 9	;undo the subtraction for the whitespace comparison
	xor rax, rax
	cmp sil, '-'
	jz setneg
	jmp getnum
setneg:			;thought about using cmovz but I still need to increment
	xor r8, r8	;if I find a '-' where I don't if I don't find one
	mov r8, '-'
incnums:
	inc rdi
	mov sil, BYTE[rdi]
getnum:
	cmp sil, 0
	jz return
	sub sil, '0'
	cmp sil, 9
	ja return
	mov rdx, 10
	mul rdx
	add rax, rsi
	jmp incnums
return:
	cmp r8, '-'
	jz negafy
	ret
negafy:
	neg rax
	ret
