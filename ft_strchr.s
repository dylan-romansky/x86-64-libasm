section .text
global ft_strchr, _ft_strchr

ft_strchr:
_ft_strchr:
	xor rdx, rdx
	mov rax, rdi
	jmp search
increment:
	inc rax
search:
	mov dl, BYTE[rax]
	cmp dl, 0
	jz nullset
	cmp dl, sil
	jnz increment
	jmp return
nullset:
	mov rax, 0
return:
	ret
