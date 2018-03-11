NAME=Grace

all: $(NAME)

SRC=Grace.c

BIN=$(SRC:.c=.o)

%.o: %.c
	gcc $(FLAGS) -c -o $@ $<

$(NAME): $(BIN)
	gcc $(FLAGS) -o $(NAME) $(BIN)

clean:
	rm -f $(BIN)

fclean: clean
	rm -f $(NAME)

test:
	./Grace
	@echo "Grace_kid.c:"
	cat Grace_kid.c
	diff Grace_kid.c Grace.c
