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

test: re
	rm -rf ${OUTPUT}
	./${NAME}
	# diff ${SRCS} ${OUTPUT}

child: $(addsuffix .o, $(addprefix Sully_, ${N}))
	${CC} ${CFLAGS} Sully_${N}.o -o ${NAME}
	./${NAME}

echo:
	echo "TEST"

.PHONY: all clean fclean re test
