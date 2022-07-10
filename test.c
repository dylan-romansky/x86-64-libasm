#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <inttypes.h>

int	ft_strlen(char const *s);
char *ft_strcpy(char *restrict dst, const char *src);
char *ft_strncpy(char *restrict dest, const char *restrict src, size_t n);
int ft_strcmp(char const *s1, char const *s2);
size_t ft_write(int fd, const void *buf, size_t count);
size_t ft_read(int fd, const void *buf, size_t count);
char *ft_strdup(const char *s);
char *ft_strndup(const char *s, size_t n);
void ft_bzero(void *s, size_t n);

void *ft_memccpy(void *restrict dest, const void *restrict src, int c, size_t n);
void *ft_memchr(const void *s, int c, size_t n);
int ft_memcmp(const void *s1, const void *s2, size_t n);
void *ft_memcpy(void *restrict dest, const void *restrict src, size_t n);
void *ft_memmove(void *restrict dest, const void *restrict src, size_t n);
void *ft_memset(void *s, int c, size_t n);

char *ft_strcat(char *restrict dest, const char *restrict src);

int main(void)
{
/*
	int j = ft_strlen("ligma");
	char beans[5];
	char peans[5];
	printf("%d\n", j);
	printf("%s\n", beans);
	ft_strcpy(beans, "benas");
	printf("%s\n", beans);

	char *strset[] = {"jgdisaojg4390jS)Dsg()ET$(#)JT$RIO", "8HGDU8(*uyD78Y0F7ES&&fD8fg&g8HFujfioj#(@io3?>:f:s))", ")(udsFEKFOE3WQ90J8FERFJH)h&8H&88H07h08(JH*$#)", "10294", "?!@#$90i2r$(I), jsaidjoidsgji", NULL};
	for (int i = 0; strset[i + 1]; i++)
	{
		int b = ft_strcmp(strset[i], strset[i + 1]);
		int c = strcmp(strset[i], strset[i + 1]);
		printf ("%d == %d ?\n", b, c);
		if (b != c)
			printf("Error:\n\t%s\n\t%s\n", b, c, strset[i], strset[i + 1]);
	}
*/
	ft_write(1, "test\n", 5);
	int fd = open("test.txt", O_RDONLY);
	char buf[5];
	ft_read(fd, buf, 5);
	ft_write(1, buf, 5);
	close(fd);
	fd = open("test.txt", O_RDONLY);
	read(fd, buf, 5);
	write(1, buf, 5);

	char *s = ft_strdup("boonanana\n");
	ft_write(1, s, ft_strlen(s));
	free(s);
	char *st = "benas\n";
	char su[7] = "buttzz\n";
	char *trip = ft_memmove(su, st, 3);
	ft_write(1, trip, ft_strlen(trip));
	ft_memset(trip, '\0', 7);
	ft_memset(trip, 'f', 6);
	ft_write(1, trip, 7);
	ft_write(1, su, 3);
	ft_write(1, "\n", 1);
	s = ft_strndup(st, 4);
	ft_write(1, s, ft_strlen(s));
	free(s);
	s = ft_strndup(st, 9);
	ft_write(1, s, ft_strlen(s));
	free(s);
	char hsdgu[4] = "test";
//	printf("%s\n", hsdgu);
//	ft_bzero(hsdgu, 4);
//	for (int i = 0; i < 4; i++)
//		printf("%hhd\n", hsdgu[i]);

	char *ay = ft_memchr(st, 'n', 5);
//	printf("%s\n%lp\n%p\n", st, st, ay);

	char *st2 = "benaz\n";
//	printf("%d\n", ft_memcmp(st, st2, 3));
//	printf("%d\n", ft_memcmp(st, st2, 4));
	ft_strcpy(su, "but");
	ft_strcat(su, "nut");
	ft_write(1, "this\n", 5);
	ft_write(1, su, 6);
	ft_write(1, "\n", 1);
/*	s = strdup(NULL);
	if (s)	{
		free(s);
		printf("success 1\n");
	}
	else
		printf("wait");
	s = strdup("");
	printf("%s\n", s);
	free(s);
	printf("%d\n", strlen(NULL));
	printf("success 2\n");
	printf("%d\n", strcmp("test", NULL));
	printf("%d\n", strcmp(NULL, "test"));
*/
}
