NAME	= Colleen

SRCS	= colleen.c
OBJS	= ${SRCS:.c=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror

TMP		= tmp_collen

%.o : ./%.c
	${CC} ${CFLAGS} -c -o $@ $<


all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}

clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${NAME}

re: fclean all

run: all
	./${NAME}

test: re
	./${NAME} > ${TMP}
	diff ${SRCS} ${TMP}

.PHONY: all clean fclean re test