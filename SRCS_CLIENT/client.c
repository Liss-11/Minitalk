/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/29 00:13:47 by afrolova          #+#    #+#             */
/*   Updated: 2023/05/29 01:39:12 by afrolova         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */
#include "../INC/minitalk.h"
#include "../LIBFT_PRINTF/INC/ft_printf.h"

int main(void)
{
	pid_t	process_id;
	pid_t	parent_process_id;

	process_id = getpid();
	parent_process_id = getppid();

	//ft_printf("hola");

	printf("Process id: %d\n", process_id);
	printf("Paretn process id: %d \n", parent_process_id);

	return (0);
}
