# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: trolland <trolland@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/30 12:40:59 by trolland          #+#    #+#              #
#    Updated: 2024/04/02 11:50:50 by trolland         ###   ########.fr        #
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
	ft_printf.c putnbr_base.c ft_putchar.c ft_putnbr.c ft_putnbr.c ft_putstr.c \
	\
	ft_swap.c get_next_line.c ft_max.c ft_min.c ft_split_multi.c ft_free_tab.c \
	ft_atoll.c ft_islower.c ft_isupper.c ft_ceasar.c ft_int_xor_swap.c \
	check_last_characters.c count_words.c count_words_sep.c ft_round.c \
	is_in_string.c 

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
	rm -rf $(OBJ)

fclean : clean
	rm -rf $(NAME)

re : fclean all

norm:
	@echo 'Checking header files...'
	@output_header=$$(norminette -R CheckDefine *.h); \
	echo "$$output_header" | awk '/Error/ {print "\033[0;31m" $$0 "\033[0m"}'; \
	echo 'Checking source files...'; \
	output_source=$$(norminette -R CheckForbiddenSourceHeader *.c); \
	echo "$$output_source" | awk '/Error/ {print "\033[0;31m" $$0 "\033[0m"}'; \
	total_errors=$$(echo "$$output_header $$output_source" | grep -c 'Error:'); \
	if [ $$total_errors -gt 0 ]; then \
	    echo "\033[0;31m$$total_errors errors found\033[0m"; \
	else \
	    echo "\033[0;32mNo norminette error in Libft\033[0m"; \
	fi




.PHONY: all clean fclean re norm so
