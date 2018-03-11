NAME=Colleen

all: $(NAME)

SRC=Colleen.c

BIN=$(SRC:.c=.o)

%.o: %.c
	gcc $(FLAGS) -c -o $@ $<

$(NAME): $(BIN)
	gcc $(FLAGS) -o $(NAME) $(BIN)

clean:
	rm -f $(BIN)

fclean: clean
	rm -f $(NAME)

TMP_FILE=tmp_file

test:
	./Colleen > $(TMP_FILE)
	@echo "tmp file:"
	cat tmp_file
	diff $(SRC) tmp_file
	rm -f tmp_file
