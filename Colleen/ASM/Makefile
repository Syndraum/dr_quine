NAME	= Colleen

SRCS	= Colleen.s
OBJS	= ${SRCS:.s=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror -no-pie

TMP		= tmp_colleen

%.o : ./%.s
	nasm -felf64 $<


all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} -o ${NAME} ${OBJS}
clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${NAME}
	rm -rf ${TMP}

re: fclean all

run: all
	./${NAME}

test: re
	rm -rf ${TMP}
	./${NAME} > ${TMP}
	diff ${SRCS} ${TMP}

.PHONY: all clean fclean re test