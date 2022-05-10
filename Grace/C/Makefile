NAME	= Grace

SRCS	= Grace.c
OBJS	= ${SRCS:.c=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror

OUTPUT		= Grace_kid.c

%.o : ./%.c
	${CC} ${CFLAGS} -c $< -o $@


all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}

clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${NAME}
	rm -rf ${TMP}

re: fclean all

run: all
	./${NAME}

test: all
	rm -rf ${OUTPUT}
	./${NAME}
	diff ${SRCS} ${OUTPUT}

.PHONY: all clean fclean re test
