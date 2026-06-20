
#include "Queue.h"
#include <stdio.h>
#include <stdlib.h>

void initQueue(Queue *q) {
  q->inicio = NULL;
  q->fim = NULL;
}

int QisEmpty(Queue q) { return (q.inicio == NULL); }

int enqueue(Queue *q, int x) {
  LInt n;
  n = newLInt(x, NULL);
  if (n == NULL)
    return 1;
  if ((*q).fim != NULL) {
    (*q).fim->prox = n;
    (*q).fim = n;
  } else
    (*q).fim = (*q).inicio = n;
  return 0;
}

int dequeue(Queue *q, int *x) {
  LInt t;
  if ((*q).inicio == NULL)
    return 1;
  t = (*q).inicio;
  (*q).inicio = (*q).inicio->prox;
  if ((*q).inicio == NULL)
    (*q).fim = NULL;
  *x = t->valor;
  free(t);
  return 0;
}

int frontQ(Queue q, int *x) {
  if (q.inicio == NULL) return 1;
  *x = q.inicio->valor;
  return 0;
}

typedef LInt QueueC;

void initQueueC(QueueC *q){
  *q = NULL;
}

int QisEmptyC(QueueC q){
  return(q == NULL);
}

int enqueueC(QueueC *q, int x) { 
  LInt n = malloc(sizeof(struct slist));
  if(n == NULL) return 1;
  n->valor = x;
  if(*q == NULL){
    n->prox = n;
    *q = n;
  } else {
    n->prox = (*q)->prox;
    (*q)->prox = n;
    *q = n;
  }
  return 0; 
}

int dequeueC(QueueC *q, int *x) {
  if(QisEmptyC(*q)) return 1;
  LInt t = (*q)->prox;
  *x = t->valor;
  if(*q == t) *q = NULL;
  else (*q)->prox = t->prox;
  free(t);
  return 0;
}

int frontC(QueueC q, int *x) {
  if(QisEmptyC(q)) return 1;
  *x = q->prox->valor;
  return 0;
}
