NAME	= Grace

SRCS	= Grace.s
OBJS	= ${SRCS:.s=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror

OUTPUT	= Grace_kid.s

%.o : ./%.s
	nasm -felf64 $<


all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} -o ${NAME} ${OBJS}
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
	./${NAME}
	diff ${SRCS} ${OUTPUT}

.PHONY: all clean fclean re test