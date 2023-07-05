/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/29 00:13:47 by afrolova          #+#    #+#             */
/*   Updated: 2023/07/06 00:42:29 by alissiafrolov    ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "../INC/minitalk.h"
#include "../libft/INC/ft_printf.h"

void	ft_isbit(unsigned char str, int pid)
{
	int	bit;

	bit = 0;
	while (bit < 8)
	{
		if ((str & (1 << (7 - bit))) == 0)
		{
			if (kill(pid, SIGUSR1) == -1)
				ft_error("Error\n");
		}
		else
		{
			if (kill(pid, SIGUSR2) == -1)
				ft_error("Error\n");
		}
		bit++;
		usleep(400);
	}
}

void	ft_send_sig(int pid, char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		ft_isbit(str[i], pid);
		i++;
	}
}

int	main(int argc, char **argv)
{
	int	pid;

	if (argc != 3)
		ft_error("Error\nIncorrect numbers of args\n");
	pid = ft_atoi(argv[1]);
	ft_printf("PID value: %d\n", pid);
	ft_send_sig(pid, argv[2]);
	return (0);
}
