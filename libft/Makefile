# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afrolova <afrolova@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/05/26 22:56:47 by afrolova          #+#    #+#              #
#    Updated: 2023/05/29 01:23:19 by afrolova         ###   ########.fr        #
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

         #CARPETAS

DIR_OBJ = OBJ
DIR_SRCS = SRCS
SRCS = ft_printf.c ft_write.c ft_numbers.c ft_hexadecimales.c 

#convierte los archivos que le paso en SRCS de .c a .o. y los ubica en la carpeta OBJ

OBJS = $(addprefix $(DIR_OBJ)/,$(SRCS:.c=.o))
EXEC_NAME = printf
NAME = libftprintf.a
CC = gcc
RM = rm -rf
AR += -rcs
CFLAGS += -Wall -Werror -Wextra

#Estoy incluyendo mi libft.h dentro del libftprintf.h, si hago la copia... hace falta??

HEADER = INC/ft_printf.h
HEADER_LIBFT = Libft/INC/libft.h

#Nombre y ubicacion de la libreria libft al compilarse con el make que le mando desde aqui
LIBFT = Libft/libft.a

#all: 				OBJ/ libft_make $(NAME)
all: 				OBJ/ $(NAME)

#Lo quito de ejecucion dentro de NAME, hace falta hacer copia cada vez?? - cp $(LIBFT) $(NAME)

$(NAME):			$(OBJS) $(LIBFT)
					@-cp $(LIBFT) $(NAME)
					@$(AR) $@ $(OBJS)
					@echo "${GREEN}libftprintf.a is compiled successfully!${END_COLOR}"

$(DIR_OBJ)/%.o: 	$(DIR_SRCS)/%.c $(HEADER)
					@$(CC) -IINC -ILibft $(CFLAGS) -c $< -o $@
					@$(CC) -IINC $(CFLAGS) -c $< -o $@

OBJ/:
			-mkdir OBJ

exec:		$(OBJS) $(LIBFT) 
			@$(CC) $(OBJS) $(LIBFT) -o $(EXEC_NAME)
			@echo "${MAGENTA}NOW, you can execute your programm whit "./printf"${END_COLOR}"


$(LIBFT):	$(HEADER_LIBFT)
			@${MAKE} -C Libft

clean:
			@$(RM) $(OBJS)
			@${MAKE} clean -C Libft
			@$(RM) OBJ/
			@echo "${BLUE}LibftPrintf object files cleaned!${END_COLOR}"

fclean:		clean
			@$(RM) $(NAME)
			@${MAKE} fclean -C Libft
			@$(RM) $(EXEC_NAME)
			@echo "${CYAN}ALL CLEANED !${END-COLOR}"
			
re:			fclean all
			@echo "${YELLOW}Cleaned und rebuilt everything for LibftPrintf${END_COLOR}"

dev: CFLAGS = -Wall -Wextra -Wpedantic -fsanitize=address,undefined
dev: re

.PHONY: all clean fclean re dev exec 
