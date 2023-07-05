# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/26 10:44:37 by afrolova          #+#    #+#              #
#    Updated: 2023/07/06 00:11:48 by alissiafrolov    ###   ########.fr        #
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

LIBFT = libft/libftprintf.a

#FOLDERS

CLIENT = client
SERVER = server


LIB_INC = libft/INC
HEADER = INC/minitalk.h


#VARIABLES

NAME = minitalk
C_NAME = client
S_NAME = server
RM = rm -rf
CC = gcc
FLAGS = -Wall -Werror -Wextra

SRC_CLIENT = CLIENT/client.c

OBJ_CLIENT =  CLIENT/client.o
#OBJ_SERVER = SRCS_SERVER/server.o

all:
						$(MAKE) -C LIBFT
						$(MAKE) $(NAME)

$(NAME)::				
						$(MAKE) $(C_NAME)
#						$(MAKE) $(S_NAME)

$(NAME)::
						@echo "$(GREEN)\t\t\t\t\t Minitalk is compiled! $(END_COLOR)"

$(CLIENT)/%.o:			$(CLIENT)/%.c Makefile $(LIBFT)
						@$(CC) $(FLAGS) -IINC -I $(LIB_INC) -c $< -o $@



$(C_NAME)::				$(CLIENT) $(LIBFT) $(HEADER) $(OBJ_CLIENT)
						$(CC) $(FLAGS) $(LIBFT) $(SRC_CLIENT) -o $(C_NAME)
						@echo "$(YELLOW) \t\t\t\t\t Compiling Client......$(END_COLOR)"

$(C_NAME)::
						@echo "$(GRENN) \t\t\t\t\t Client Compiled! $(END_COLOR)"
					


#$(S_NAME)::				$(DIR_OBJS_SERVR) $(OBJ_SERVER) $(LIBFTPRINTF)
#						@$(CC) $(FLAGS) $(LIBFTPRINTF) SRCS_SERVER/server.c -o $(S_NAME)
#						@echo "$(YELLOW) \t\t\t\t Compiling Servert......$(END_COLOR)"

#$(S_NAME)::
#						@echo "$(GRENN) \t\t\t\t\t Servert Compiled! $(END_COLOR)"
	

clean:
						@$(RM) $(OBJ_CLIENT)
#						@$(RM) $(OBJS_SERVER)
						@$(MAKE) clean -C LIBFT
						@echo "$(CYAN)\t\t\t\t\t All object files are cleaned $(END_COLOR)"

fclean:					
						@$(MAKE) clean
						@$(RM) $(NAME_SERVER)
						@$(RM) $(NAME_CLIENT)
						@$(MAKE) fclean -C LIBFT
						@echo "$(CYAN)\t\t\t\t\t All cleaned! $(NED_COLOR)"

re:						
						@$(MAKE) fclean
						@$(MAKE)
						@echo "$(CYAN)\t\t\t\t  All cleaned and Rebuild! $(NED_COLOR)"

.PHONY: all clean fclean re

						
