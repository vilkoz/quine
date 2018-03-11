NAME=Colleen

all: $(NAME)

SRC=Colleen.S

BIN=$(SRC:.S=.o)

%.o: %.S
	nasm -f elf64 -o $@ $<

$(NAME): $(BIN)
	gcc -m64 -fPIC -o $(NAME) $(BIN)

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
