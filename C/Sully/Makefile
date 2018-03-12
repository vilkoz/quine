NAME=Sully

all: $(NAME)

SRC=Sully.c

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
	mkdir test
	cd test; gcc ../Sully.c -o Sully
	cd test; ./Sully
	-diff $(SRC) test/Sully_4.c
	ls -la test | grep Sully
	ls -la test | grep Sully | wc -l
	rm -rf test
