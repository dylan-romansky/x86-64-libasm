section .text
global ft_strlcat, _ft_strlcat
extern ft_strlen

ft_strlcat:
_ft_strlcat:
	call ft_strlen
	mov rcx, rax
	mov r8, rdi
	mov rdi, rsi
	call ft_strlen
	add rax, rcx
	mov rdi, r8
	xor r8, r8
	xor r9, r9
	jmp catlad
increment:
	inc rcx
	inc r8
catlad:
	cmp rcx, rdx
	jz return
	mov r9b, BYTE[rsi + r8]
	mov BYTE[rdi + rcx], r9b
	cmp r9b, 0
	jz return
	jmp increment
return:
	ret
