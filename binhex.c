#include <stdio.h>

/*
** Used for when I need the hex or binary value of a given ascii character.
** Takes an arbitrary number of strings of arbitrary length and converts them
** one byte at a time to binary and outputs it alongside its hex and dec values
*/

void	binprint(char c)	{
	char buf[12];
	buf[0] = c;
	buf[1] = ':';
	buf[2] = ' ';
	buf[12] = '\0';
	for (int i = 0; i < 8; i++)
		buf[i + 3] = ((c >> i) & 1) + '0';
	printf("%s %d 0x%02hhx\n", buf, c, c);
}

int main(int ac, char **av)	{
	for (int i = 1; i < ac; i++)
		for (int j = 0; av[i][j]; j++)
			binprint(av[i][j]);
}
