# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 10:44:37 by afrolova          #+#    #+#              #
#    Updated: 2023/05/26 13:18:51 by afrolova         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#COLORS

END_COLOR = \033[0;0m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

#LIBRARY

LIBFTPRINTF = LIBFT_PRINTF/libftprintf.a

#FOLDERS

DIR_OBJS_CLIENT = OBJS_CLIENT
DIR_OBJS_SERVER = OBJS_SERVER 

LIB_INC = LIBFT_PRINTF/INC


#VARIABLES

NAME = minitalk
C_NAME = client
S_NAME = server
RM = rm -rf
CC = gcc
FLAGS = -Wall -Werror -Wextra

OBJS_CLIENT = $(addprefix $(DIR_OBJS_CLIENT)/,$(SRCS_CLIENT: .c=.o))
OBJS_SERVER = $(addprefix $(DIR_OBJS_SERVER)/, $(SRCS_SERVER: .c=.o))

all:
						$(MAKE) -C LIBFT_PRINTF
						$(MAKE) $(NAME)

$(NAME)::		
						$(MAKE) $(C_NAME)
						$(MAKE) $(S_NAME)

$(NAME)::
						@echo "$(GREEN)\t\t\t\t\t Minitalk is compiled! $(END_COLOR)"

%.o:					%.c Makefile $(LIBFTPRINTF)
						@$(CC) $(FLAGS) -IINC -I $(LIB_INC) -c $< -o $@

$(C_NAME)::				$(DIR_OBJS_CLIENT) $(OBJS_CLIENT) $(LIBFTPRINTF)
						$(CC) $(FLAGS) $^ -o $@
						@echo "$(YELLOW) \t\t\t\t Compiling Client......$(END_COLOR)"

$(C_NAME)::
						@echo "$(GRENN) \t\t\t\t\t Client Compiled! $(END_COLOR)"
					

$(S_NAME)::				$(DIR_OBJS_SERVER) $(OBJS_SERVER) $(LIBFTPRINTF)
						@$(CC) $(FLAGS) -IINC -I $(LIB_INC) -c $< -o $@
						@echo "$(YELLOW) \t\t\t\t Compiling Servert......$(END_COLOR)"

$(S_NAME)::
						@echo "$(GRENN) \t\t\t\t\t Servert Compiled! $(END_COLOR)"
	
$(DIR_OBJS_CLIENT):
						@-mkdir $(DIR_OBJS_CLIENT)
		

$(DIR_OBJS_SERVER):
						@-mkdir $(DIR_OBJS_SERVER)

clean:
						@$(RM) $(OBJS_CLIENT)
						@$(RM) $(OBJS_SERVER)
						@$(MAKE) clean -C LIBFT_PRINTF
						@$(RM) $(DIR_OBJS_CLIENT)
						@$(RM) $(DIR_OBJS_SERVER)
						@echo "$(CYAN)\t\t\t\t\t All object files are cleaned $(END_COLOR)"

fclean:					@$(MAKE) clean
						@$(RM) $(NAME_SERVER)
						@$(RM) $(NAME_CLIENT)
						@$(MAKE) fclean -C LIBFT_PRINTF
						@echo "$(CYAN)\t\t\t\t\t All cleaned! $(NED_COLOR)"

re:						@$(MAKE) fclean
						@$(MAKE)
						@echo "$(CYAN)\t\t\t\t  All cleaned and Rebuild! $(NED_COLOR)"

						