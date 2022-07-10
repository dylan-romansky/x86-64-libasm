section .text
global ft_memset, _ft_memset

ft_memset:
_ft_memset:
	mov rax, rdi
	cmp rdx, 0
	jz return
increment:
	dec rdx
setter:
	mov byte[rax + rdx], sil
	cmp rdx, 0
	jnz increment
return:
	ret
