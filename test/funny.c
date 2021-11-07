#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h> 

int	main(int argc, char **argv)
{
	int		i;
	int		pos;
	int		loops;
	bool	choose;

	loops = 0;
	choose = true;
	if (argv[1])
	{
		while (loops < 1000)
		{
			printf("\n\n\n\n");
			i = 0;
			while (i < 20)
			{
				if (choose == true)
					printf("%s", argv[1]);
				else
				{
					pos = 0;
					while (argv[1][pos] != '\0')
					{
						printf("%c  ", argv[1][pos]);
						pos++;
					}
				}
				printf("\n");
				i++;
			}
			system ("sleep 0.5");
			system ("clear");
			loops++;
			if (choose == true)
				choose = false;
			else
				choose = true;
		}
	}
	return (0);
}
