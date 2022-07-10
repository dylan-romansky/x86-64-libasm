section .text
global ft_atoi, _ft_atoi

ft_atoi:
_ft_atoi:
	mov rdx, 6
	xor rsi, rsi
	jmp filter
incrementfilter:
	inc rdi
filter:
	mov sil, BYTE[rdi]
	cmp sil, ' '
	jz incrementfilter
	sub sil, 9
	cmp sil, 4
	ja sign
	jmp incrementfilter
sign:
	add sil, 9
	xor rax, rax
	cmp sil, '-'
	jz setneg
	jmp getnum
setneg:
	xor r8, r8
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
	mov rdx, -1
	imul rdx
	ret
