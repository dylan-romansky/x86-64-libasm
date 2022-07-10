section .text
global ft_strrchr, _ft_strrchr
extern ft_strlen

ft_strrchr:
_ft_strrchr:
	call ft_strlen
	mov rdx, rax
	mov rax, rdi
	add rax, rdx
increment:
	dec rax
search:
	cmp rax, rdi
	jz nullset
	mov dl, BYTE[rax]
	cmp dl, sil
	jnz increment
	jmp return
nullset:
	mov rax, 0
return:
	ret
