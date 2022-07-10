section .text
global ft_memchr, _ft_memchr

ft_memchr:
_ft_memchr:
	xor rcx, rcx
	xor r8, r8
	jmp search
increment:
	inc rcx
search:
	mov r8b, BYTE[rdi + rcx]
	cmp r8, rsi
	jz setres
	cmp rcx, rdx
	jz setnull
	jmp increment
setnull:
	mov rax, 0
	jmp return
setres:
	mov rax, rdi
	add rax, rcx
return:
	ret
