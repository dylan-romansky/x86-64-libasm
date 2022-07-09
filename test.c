#include <stdio.h>
#include <inttypes.h>

int	ft_strlen(char const *s);
char *ft_strcpy(char *restrict dst, const char *src);
int ft_strcmp(char const *s1, char const *s2);

int main(void)
{
	int j = ft_strlen("ligma");
	char beans[5];
	char peans[5];
	printf("%d\n", j);
	printf("%s\n", beans);
	ft_strcpy(beans, "peans");
	printf("%s\n", beans);
	printf("%d\n", ft_strcmp("beans", "benas"));
}
