CC = gcc

CFLAGS = -Wall -g

ficha10: abin.o ficha10.o
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@


abin.o ficha10.o: abin.h

clean:
	rm -f ficha10 *.o
