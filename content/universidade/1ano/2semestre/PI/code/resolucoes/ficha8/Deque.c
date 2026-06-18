
#include <stdio.h>
#include <stdlib.h>
#include "Deque.h"


void initDeque (Deque *q){
  q->back = NULL;
  q->front = NULL;
}

int DisEmpty (Deque q){
    return (q.front == NULL);
}

int pushBack (Deque *q, int x){
  DList n = malloc(sizeof(struct dlist));
  if(n == NULL) return 1;
  n->valor = x;
  n->prox = NULL;
  n->ant = q->back;

  if(q->back != NULL) q->back->prox = n;
  else q->front = n;
  q->back = n;
  return 0;
}

int pushFront (Deque *q, int x){
  DList n = malloc(sizeof(struct dlist));
  if(n == NULL) return 1;
  n->valor = x;
  n->ant = NULL;
  n->prox = q->front;
  if(q->front != NULL){
    q->front->ant = n;
  }
  else{
    q->back = n;
  }
  q->front = n;

  return 0;
}

int popBack (Deque *q, int *x){
  if(DisEmpty(*q)) return 1;
  DList t = q->back;
  *x = t->valor;
  q->back = t->ant;
  if(q->back != NULL){
    q->back->prox = NULL;
  } else{
    q->front = NULL;
  }
  free(t);
  return 0;
}

int popFront (Deque *q, int *x){
  if(DisEmpty(*q)) return 1;
  DList t = q->front;
  *x = t->valor;
  q->front = t->prox;
  if(q->front != NULL){
    q->front->ant = NULL;
  } else {
    q->back = NULL;
  }
  free(t);
  return 0;
}

int popMax (Deque *q, int *x){
  if(DisEmpty(*q)) return 1;
  DList curr = q->front;
  DList maxNode = curr;
  int maxVal = curr->valor;
  while(curr != NULL){
    if(curr->valor > maxVal){
      maxVal = curr->valor;
      maxNode = curr;
    }
    curr = curr->prox;
  }
  *x = maxVal;
  if(maxNode->ant != NULL){
    maxNode->ant->prox = maxNode->prox;
  } else{
    q->front = maxNode->prox;
  }
  if(maxNode->prox != NULL){
    maxNode->prox->ant = maxNode->ant;
  } else {
    q->back = maxNode->ant;
  }
  free(maxNode);
  return 0;
}

int back (Deque q, int *x){
  if(DisEmpty(q)) return 1;
  *x = q.front->valor;
  return 0;  
}

int front (Deque q, int *x){
  if(DisEmpty(q)) return 1;
  *x = q.front->valor;
  return 0;
}
