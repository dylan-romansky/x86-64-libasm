section .text
global ft_write, _ft_write

ft_write:
_ft_write:
	mov rax, 1 ;syscall for write
	syscall
	ret
