#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <inttypes.h>

int	ft_strlen(char const *s);
char *ft_strcpy(char *restrict dst, const char *src);
int ft_strcmp(char const *s1, char const *s2);
size_t ft_write(int fd, const void *buf, size_t count);
size_t ft_read(int fd, const void *buf, size_t count);
char *ft_strdup(const char *s);

int main(void)
{
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
}
