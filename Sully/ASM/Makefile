NAME	= Sully

SRCS	= Sully.s
OBJS	= ${SRCS:.s=.o}

CC		= clang
CFLAGS	= -Wall -Wextra -Werror

OUTPUT		= Sully_*
OUTPUT_BIN	= ${OUTPUT:.s=.o}

%.o : ./%.s
	nasm -felf64 $<

all:		${NAME}

${NAME}:	${OBJS}
	${CC} ${CFLAGS} -o ${NAME} ${OBJS}
clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${OUTPUT_BIN}
	rm -rf ${NAME}

re: fclean all

run: all
	./${NAME}

.PHONY: all clean fclean re