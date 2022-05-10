NAME	= Sully

SRCS	= Sully.c
OBJS	= ${SRCS:.c=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror

OUTPUT		= Sully_*.c
OUTPUT_OBJS	= ${OUTPUT:.c=.o}

%.o : ./%.c
	${CC} ${CFLAGS} -c $< -o $@


all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}

clean:
	rm -rf ${OBJS}
	rm -rf ${OUTPUT_OBJS}

fclean: clean
	rm -rf ${OUTPUT}
	rm -rf ${NAME}

re: fclean all

run: all
	./${NAME}

test: all
	rm -rf ${OUTPUT}
	./${NAME}
	# diff ${SRCS} ${OUTPUT}

.PHONY: all clean fclean re test
