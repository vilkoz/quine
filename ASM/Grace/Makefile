NAME=Grace

all: $(NAME)

SRC=Grace.S

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

test: $(NAME)
	./Grace
	@echo "Grace_kid.S:"
	cat Grace_kid.S
	-diff $(SRC) Grace_kid.S
	rm -f Grace_kid.S
