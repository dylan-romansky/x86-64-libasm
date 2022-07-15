NAME = libasm.a

SRCS = ft_atoi.s ft_memmove.s ft_strcpy.s ft_strncpy.s ft_bzero.s ft_memset.s ft_strdup.s ft_strndup.s ft_memccpy.s ft_read.s ft_strlcat.s ft_strrchr.s ft_memchr.s ft_strcat.s ft_strlen.s ft_strstr.s ft_memcmp.s ft_strchr.s ft_strncat.s ft_write.s ft_memcpy.s ft_strcmp.s ft_strncmp.s ft_itoa_base.s

OBJS = $(SRCS:.s=.o)

all: $(NAME)

%.o:	%.s
	nasm -g -f elf64 $<

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)
	ranlib $(NAME)

clean:
	rm -rf *.o

fclean: clean
	rm -rf $(NAME)

re: fclean $(NAME)

test: re
	make clean
	gcc -no-pie -g test.c -L. -lasm -o tester
	./tester
