CC = gcc
CFLAGS = -Wall -g

ficha8: Deque.o Listas.o Queue.o Stack.o ficha8.o
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

Deque.o: Deque.h
Queue.o: Queue.h
Stack.o: Stack.h
ficha8.o: Deque.h Queue.h Stack.h

clean:
	rm -f ficha8 *.o
