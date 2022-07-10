section .text
global ft_strncat, _ft_strncat
extern ft_strlen

ft_strncat:
_ft_strncat:
	call ft_strlen
	mov rcx, rax
	xor r8, r8
	xor r9, r9
	jmp catlad
increment:
	inc rcx
	inc r8
catlad:
	mov r9b, BYTE[rsi + r8]
	cmp r9b, 0
	jz return
	mov BYTE[rdi + rcx], r9b
	cmp r8, rdx
	jnz increment
	inc rcx
return:
	mov BYTE[rdi + rcx], 0
	mov rax, rdi
	ret
