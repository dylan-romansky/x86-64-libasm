#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdbool.h>
#include <inttypes.h>

int	ft_strlen(char const *s);
char *ft_strcpy(char *restrict dst, const char *src);
char *ft_strncpy(char *restrict dest, const char *restrict src, size_t n);
int ft_strcmp(char const *s1, char const *s2);
int ft_strncmp(char const *s1, char const *s2, size_t n);
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
char *ft_strncat(char *restrict dest, const char *restrict src, size_t n);
size_t ft_strlcat(char *dst, const char *src, size_t size);
char *ft_strchr(const char *s, int c);
char *ft_strrchr(const char *s, int c);
char *ft_strstr(const char *haystack, const char *needle);
int ft_atoi(const char *nptr);

char *ft_itoa_base(int i, int base);


char *tests[] = { "test", "this is a test", "", NULL };

void	strlenTest()	{
	bool pass = true;
	printf("strlen test:\n");
	for (int i = 0; tests[i] != NULL; i++)
		if (ft_strlen(tests[i]) != strlen(tests[i]))	{
			printf("fail: %s\n", tests[i]);
			pass = false;
		}
	printf(pass ? "Passed!\n\n" : "Failed...\n\n");
}

void	writeTest()	{
	bool pass = true;
	int fd = open("/dev/null", O_RDWR);
	printf("write test:\n");
	for (int i = 0; tests[i] != NULL; i++)	{
		int len = strlen(tests[i]);
		if (ft_write(fd, tests[i], len) != write(fd, tests[i], len))	{
			printf("fail: %s\n", tests[i]);
			pass = false;
		}
	}
	printf(pass ? "Passed!\n\n" : "Failed...\n\n");
}

void	itoaTest()	{	//add a check for intmax
	char *test;
	int checks[] = { 16, -16, 0, 16439634 };
	char *against[] = { "16", "-16", "0", "16439634" };
	for (int i = 0; i < 4; i++)	{
		test = ft_itoa_base(checks[i], 10);
		if (strcmp(test, against[i]))
			printf("Fail %s != %s\n", test, against[i]);
		else
			printf("Pass: %s\n", against[i]);
		free(test);
	}
}

int main(void)
{
	strlenTest();
	writeTest();
	itoaTest();
	printf("tests complete\n");
}
