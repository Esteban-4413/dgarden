
#include <stdio.h>
#include <stdlib.h>
#include "Queue.h"

// Static queues 

void SinitQueue (SQueue q){
	q->front = 0;
  q->length = 0;
}

int  SisEmptyQ (SQueue q){
	return (q->length == 0);
}

int  Senqueue (SQueue q, int x){
	int r = 0;
  if(q->length == Max) r = 1;
  else{
    q->values[(q->front + q->length) % Max] = x;
    q->length++;
  }
	return r;
}

int  Sdequeue (SQueue q, int *x) {
	int r = 0;
  if(q->length == 0) r = 1;
  else{
    *x = q->values[q->front];
    q->length--;
    q->front = (q->front + 1) % Max;
  }
	return r;
}

int  Sfront (SQueue q, int *x) {
  int r = 0;
	if(q->length == 0) r = 1;
  else{
    *x = q->values[q->front];
  }
  return r;
}

void ShowSQueue (SQueue q){
    int i, p;
    printf ("%d Items: ", q->length);
    for (i=0, p=q->front; i<q->length; i++) {
        printf ("%d ", q->values[p]);
        p = (p+1)%Max;
    }
    putchar ('\n');
}

// Queues with dynamic arrays

int dupQueue (DQueue q) {
	int i = 0, j = q->size;
  q->values = realloc(q->values, 2 * j * sizeof(int));
  q->size *= 2;
  whileI(i < q->front) q->values[j++] = q->values[i++];
	return 0;
}

void DinitQueue (DQueue q) {
  q->size = Max;
	q->values = malloc(q->size * sizeof(int));
  q->length = 0;
  q->front = 0;
}

int  DisEmptyQ (DQueue q) {
	return (q->length == 0);
}

int  Denqueue (DQueue q, int x){
  int i = 0, j = q->size;
  if(q->size == q->length){
    q->values = realloc(q->values, 2 * q->size * sizeof(int));
    q->size *= 2;
    while(i < q->front) q->values[j++] = q->values[i++];
  }
  q->values[(q->front + q->length) % q->size] = x;
  q->length++;
  return 0;
}

int  Ddequeue (DQueue q, int *x){
	if(q->length == 0) return 1;
  *x = q->values[q->front];
  q->length--;
  q->front = (q->front + 1) % q->size;
	return 0;
}

int  Dfront (DQueue q, int *x){
	int r = 0;
  if(q->length == 0) r = 1;
  else{
    *x = q->values[q->front];
  }
	return r;
}

void ShowDQueue (DQueue q){
    int i, p;
    printf ("%d Items: ", q->length);
    for (i=0, p=q->front; i<q->length; i++) {
        printf ("%d ", q->values[p]);
        p = (p+1)%q->size;
    }
    putchar ('\n');
}
