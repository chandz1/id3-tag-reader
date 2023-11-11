CC = clang
CFLAGS = -Wall -g

all: main

main: main.c read.o
	$(CC) $(CFLAGS) $^ -o $@

read.o: read.c read.h
	$(CC) $(CFLAGS) -c $< -o $@ 

clean:
	-@rm -f main read
