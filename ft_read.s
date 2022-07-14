section .text
global ft_read, _ft_read

ft_read:
_ft_read:
	xor rax, rax
	syscall
	ret
