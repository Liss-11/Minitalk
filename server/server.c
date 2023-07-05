/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/29 00:13:57 by afrolova          #+#    #+#             */
/*   Updated: 2023/07/06 00:43:22 by alissiafrolov    ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "../INC/minitalk.h"
#include "../libft/INC/ft_printf.h
	"
void	ft_sigin(int signal)
{
	static int				bit = 0;
	static unsigned char	c = '\0';

	c = c << 1;
	if (signal == SIGUSR1)
	{
	}
	else
		c = c | 1;
	bit++;

	/*
	c = c << 1;
	if (signal != SIGUAR1)
		c = c | 1;
	bit++;
	*/

	if (bit == 8)
	{
		ft_putchar((unsigned char ) c);
		bit = 0;
		c = '\0';
	}
}

void	ft_error(char *error)
{
	ft_printf(error);
	exit(-1);
}

int	main(int argc, char **argv)
{
	int	pid;

	pid = getpid();
	argv = NULL;
	if (argc != 1)
		ft_error("Error\nToo many arguments");
	ft_printf("PID: %d\n", pid);
	signal(SIGUSR1, &ft_sigin);
	signal(SIGUSR2, &ft_sigin);
	while (1)
		pause();
	return (0);
}
