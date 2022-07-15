section .text

global ft_itoa_base, _ft_itoa_base
extern malloc

;this is disgusting and horrible and I need to know why the div doesn't wanna
;truncate to zero. and also why malloc is putting the return value in rax and
;also rcx. and why r8 ends up with the value from rdi

ft_itoa_base:
_ft_itoa_base:
	xor rax, rax
	cmp rsi, 16		;if (base > 16)
	jge return
	mov rax, rdi	;setting up for number length count
	xor rcx, rcx
	inc rcx			;i = 1
count:
	inc rcx
	div rsi			;while (num >= 0) {
	cmp rax, rsi	;	num /= base;
	jg count		;	i++;
	inc rcx			;}
	cmp rsi, 10		;if (base != 10 || num > 0) { makePos() }
	jne makePos
	cmp rdi, 0
	jg makePos
	inc rcx
makePos:
	push rdi
	mov rdi, rcx
	call malloc
	pop rdi
	mov r8, rax
	dec rcx
	cmp rdi, 0
	jge addem
	mov BYTE[rcx], '-'
addem:
	mov BYTE[r8 + rcx], 0
	mov rax, rdi
decrement:
	dec rcx
	cmp rax, rsi
	jle movem
	jmp divem
movem:
	mov rdx, rax
	jmp docon
divem:
	div rsi
	jmp docon
docon:
	cmp rdx, 10
	jge conhex
	add rdx, '0'
	mov BYTE[r8 + rcx], dl
	cmp rcx, 0
	jz return
	jmp decrement
conhex:
	add rdx, 'a'
	mov BYTE[r8 + rcx], dl
	jmp decrement
return:
	mov rax, rcx
	ret
