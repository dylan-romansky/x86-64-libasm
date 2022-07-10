section .text
global ft_strncmp, _ft_strncmp
extern ft_memcmp

ft_strncmp:
_ft_strncmp:
	dec rdx
	call ft_memcmp
	ret
