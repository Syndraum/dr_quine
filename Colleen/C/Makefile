NAME	= Colleen

SRCS	= Colleen.c
OBJS	= ${SRCS:.c=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror

OUTPUT		= copy_colleen.c

%.o : ./%.c
	${CC} ${CFLAGS} -c $< -o $@


all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}

clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${NAME}
	rm -rf ${OUTPUT}

re: fclean all

run: all
	./${NAME}

test: all
	rm -rf ${OUTPUT}
	./${NAME} > ${OUTPUT}
	diff ${SRCS} ${OUTPUT}

.PHONY: all clean fclean re test