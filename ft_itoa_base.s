section .text

global ft_itoa_base, _ft_itoa_base
extern malloc

;explore the differences between div and idiv
ft_itoa_base:
_ft_itoa_base:
	xor rax, rax
	cmp rsi, 16		;if (base > 16)
	jg return
	mov rax, rdi	;setting up for number length count
	mov rcx, 1
count:
	inc rcx
	cmp rax, rsi
	jl make
	div rsi
	jmp count
make:
	cmp rsi, 10		;if (base != 10 || num > 0) { makePos() }
	jnz makePos
	cmp rdi, 0
	jnz makePos
	inc rcx
makePos:
	push rdi
	push rsi
	mov rdi, rcx
	call malloc
	pop rsi
	pop rax			;our given number needs to get here anyway so why not
	dec r8
	cmp rax, 0
	jge terminate
	mov BYTE[rdi], '-'
terminate:
	mov BYTE[rdi + r8], 0
decrement:
	dec r8
	cmp rax, rsi
	jl movem
	jmp divem
movem:
	mov rdx, rax
	jmp makem
divem:
	div rsi
makem:
	cmp rdx, 10
	jge conhex
	add rdx, '0'
	mov BYTE[rdi + r8], dl
	cmp r8, 0
	jz return
	jmp decrement
conhex:
	add rdx, 'a'
	mov BYTE[rdi + r8], dl
	cmp r8, 0
	jz return
	jmp decrement
return:
	mov rax, rdi
	ret
