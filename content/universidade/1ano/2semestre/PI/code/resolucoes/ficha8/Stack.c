
#include <stdio.h>
#include <stdlib.h>
#include "Stack.h"

void initStack (Stack *s){
  *s = NULL;
}

int SisEmpty (Stack s){
    return (s == NULL);
}

int push (Stack *s, int x){
  Stack r = malloc(sizeof(struct slist));
  if( r == NULL) return 1;
  r->valor = x;
  r->prox = *s;
  *s = r;
  return 0;
}

int pop (Stack *s, int *x){
  LInt t;
  if(*s == NULL) return 1;
  t = *s;
  *s = (*s)->prox;
  *x = t->valor;
  free(t);
  return 0;
}

int top (Stack s, int *x){
  if(s == NULL) return 1;
  *x = s->valor;
  return 0;
}
