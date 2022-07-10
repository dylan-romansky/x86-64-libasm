section .text
global ft_strcat, _ft_strcat
extern ft_strlen

ft_strcat:
_ft_strcat:
	call ft_strlen
	mov rdx, rax
	xor rcx, rcx
	xor r8, r8
	jmp catlad
increment:
	inc rcx
	inc rdx
catlad:
	mov r8b, BYTE[rsi + rcx]
	mov BYTE[rdi + rdx], r8b
	cmp r8b, 0
	jz return
	jmp increment
return:
	mov rax, rdi
	ret
