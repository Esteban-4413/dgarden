
CC = gcc
CFLAGS = -Wall -g

ficha9: abin.o ficha9.c
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

abin.o: abin.h

clean:
	rm -f ficha9 *.o
