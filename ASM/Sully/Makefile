NAME=Sully

all: $(NAME)

SRC=Sully.S

BIN=$(SRC:.S=.o)

%.o: %.S
	nasm -f elf64 -o $@ $<

$(NAME): $(BIN)
	gcc -m64 -fPIC -o $(NAME) $(BIN)

clean:
	rm -f $(BIN)

fclean: clean
	rm -f $(NAME)

test:
	mkdir test
	cd test; nasm -f elf64 ../Sully.S -o Sully.o; gcc -m64 -fPIC -o Sully Sully.o; rm -f Sully.o
	cd test; ./Sully
	-diff $(SRC) test/Sully_4.S
	ls -la test | grep Sully
	ls -la test | grep Sully | wc -l
	rm -rf test
