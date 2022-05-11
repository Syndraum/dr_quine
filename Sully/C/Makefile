NAME	= Sully

SRCS	= Sully.c
OBJS	= ${SRCS:.c=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror

OUTPUT		= Sully_*.c
OUTPUT_BIN	= ${OUTPUT:.c=}

%.o : ./%.c
	${CC} ${CFLAGS} -c $< -o $@


all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}

clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${OUTPUT_BIN}
	rm -rf ${NAME}

re: fclean all

run: all
	./${NAME}

.PHONY: all clean fclean re                                                                                                                                                                                                                                                                                                                                                                                                       
