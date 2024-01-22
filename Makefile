# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: trolland <trolland@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/30 12:40:59 by trolland          #+#    #+#              #
#    Updated: 2024/01/12 17:24:10 by trolland         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME= libft.a
CC=cc
CFLAGS= -Wall -Wextra -Werror 

# ---------------------------------------------------------------------------- #
# ----------------------------------- SRCS ----------------------------------- #
# ---------------------------------------------------------------------------- #
SRC= ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c \
	ft_isdigit.c ft_isprint.c ft_itoa.c ft_memchr.c ft_memcmp.c ft_memcpy.c \
	ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
	ft_putstr_fd.c ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c \
	ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c \
	ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c \
	ft_tolower.c ft_toupper.c \
	\
	ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c \
	ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c \
	\
	ft_swap.c get_next_line.c ft_max.c ft_min.c ft_split_multi.c ft_free_tab.c \
	ft_atoll.c ft_islower.c ft_isupper.c ft_ceasar.c ft_int_xor_swap.c \
	ft_check_last_characters.c ft_count_words.c

OBJ= $(SRC:.c=.o)
HEADER= ./


all : $(NAME)

%.o : %.c
	@$(CC) -I $(HEADER) -c $^ $(CFLAGS) -o $@

$(NAME) : $(OBJ)
	@ar rc $(NAME) $(OBJ)

so:
	@$(CC) -fPIC $(CFLAGS) $(SRC) -shared -o libft.so

clean :
	@rm -rf $(OBJ)

fclean : clean
	@rm -rf $(NAME)

re : fclean all

.PHONY: all clean fclean re
