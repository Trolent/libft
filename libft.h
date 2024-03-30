/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: trolland <trolland@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/08/30 12:40:53 by trolland          #+#    #+#             */
/*   Updated: 2024/03/30 19:15:54 by trolland         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H

//****************************************************************************//
// -------------------------- NECESSARY LIBRARIES --------------------------- //
//****************************************************************************//

# include <fcntl.h>
# include <stdarg.h>
# include <stdlib.h>
# include <unistd.h>

//****************************************************************************//
// ------------------------- SYSTEM'S SPECIFICATION ------------------------- //
//****************************************************************************//

# if defined(__linux__)
#  define PTRNULL "(nil)"
# elif defined(__APPLE__)
#  define PTRNULL "(0x0)"
# endif

//****************************************************************************//
// --------------------------- 42'S LIBFT PROJECT --------------------------- //
//****************************************************************************//

int					ft_isalpha(int c);
int					ft_isdigit(int c);
int					ft_isalnum(int c);
int					ft_isascii(int c);
int					ft_isprint(int c);
size_t				ft_strlen(const char *str);
void				*ft_memset(void *b, int c, size_t len);
void				ft_bzero(void *s, size_t n);
void				*ft_memcpy(void *dst, const void *src, size_t n);
void				*ft_memmove(void *dst, const void *src, size_t len);
size_t				ft_strlcpy(char *dst, const char *src, size_t dstsize);
size_t				ft_strlcat(char *dst, const char *src, size_t dstsize);
int					ft_toupper(int c);
int					ft_tolower(int c);
char				*ft_strchr(const char *s, int c);
char				*ft_strrchr(const char *s, int c);
int					ft_strncmp(const char *s1, const char *s2, size_t n);
void				*ft_memchr(const void *s, int c, size_t n);
int					ft_memcmp(const void *s1, const void *s2, size_t n);
char				*ft_strnstr(const char *haystack, const char *needle,
						size_t len);
int					ft_atoi(const char *str);
long long			ft_atoll(const char *str);
void				*ft_calloc(size_t count, size_t size);
char				*ft_strdup(const char *s1);
char				*ft_substr(char const *s, unsigned int start, size_t len);
char				*ft_strjoin(char const *s1, char const *s2);
char				*ft_strtrim(char const *s1, char const *set);
char				**ft_split(char const *s, char c);
char				*ft_itoa(int n);
char				*ft_strmapi(char const *s, char (*f)(unsigned int, char));
void				ft_striteri(char *s, void (*f)(unsigned int, char *));
int					ft_putchar_fd(char c, int fd);
int					ft_putchar(char c);
int					ft_putstr_fd(char *s, int fd);
int					ft_putstr(char *s);
int					ft_putendl_fd(char *s, int fd);
int					ft_putnbr_fd(int n, int fd);
int					ft_putnbr(int n);

//****************************************************************************//
// ------------------------------ LINKED LIST ------------------------------- //
//****************************************************************************//

typedef struct s_list
{
	void			*content;
	struct s_list	*next;
}					t_list;

t_list				*ft_lstnew(void *content);
void				ft_lstadd_front(t_list **alst, t_list *new);
int					ft_lstsize(t_list *lst);
t_list				*ft_lstlast(t_list *lst);
void				ft_lstadd_back(t_list **alst, t_list *new);
void				ft_lstdelone(t_list *lst, void (*del)(void *));
void				ft_lstclear(t_list **lst, void (*del)(void *));
void				ft_lstiter(t_list *lst, void (*f)(void *));
t_list				*ft_lstmap(t_list *lst, void *(*f)(void *),
						void (*del)(void *));

//****************************************************************************//
// ------------------------------- FT_PRINTF -------------------------------- //
//****************************************************************************//

int					ft_printf(const char *str, ...);
int					write_str(char *str);
int					write_unsigned(unsigned int n);
int					write_hex(unsigned int n, char c);
int					ft_putnbr_base(unsigned long long nbr, char *base);

//****************************************************************************//
// --------------------------- MY OWN FUNCTIONS ----------------------------- //
//****************************************************************************//

// # define MAX(nb, nb2) ((nb > nb2) ? nb : nb2)
// # define MIN(nb, nb2) ((nb < nb2) ? nb : nb2)

# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 42
# endif

void				ft_swap(void *a, void *b, size_t size);
int					ft_round(float num);
char				*get_next_line(int fd);
int					ft_max(int nb1, int nb2);
int					ft_min(int nb1, int nb2);
char				**ft_split_multi(char const *s, char *c);
void				ft_free_tab(char **tab, int i);
int					ft_islower(int c);
int					ft_isupper(int c);
char				*ft_ceasar(char *input, int num);
void				ft_int_xor_swap(int *a, int *b);
int					check_last_characters(char *str, char *last);
int					count_words(char const *str, char *charset);
int					count_words_sep(char const *str, char *charset);

#endif
