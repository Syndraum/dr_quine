NAME	= Sully

SRCS	= Sully.s
OBJS	= ${SRCS:.s=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror -g

OUTPUT		= Sully_*
OUTPUT_OBJS	= ${OUTPUT:.s=.o}

%.o : ./%.s
	nasm -felf64 -g $<

all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} -o ${NAME} ${OBJS}
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
	diff ${SRCS} ${OUTPUT}

.PHONY: all clean fclean re test