#include <stdio.h>
#include <stdlib.h>


// LISTAS LIGADAS

typedef struct lligada {
    int valor;
    struct lligada *prox;
} *LInt;


// 1.
int length(LInt l){
    int conta = 0;
    while (l != NULL)
    { 
        l = l->prox;
        conta ++;
    }
    return conta;
}


// 2. 
int freeL(LInt l)
{
    LInt temp;
    while(l != NULL)
    {
        temp = l->prox;
        free(l);
        l = temp;
    }

}


// 3.
void imprimeL(LInt l)
{
    while(l != NULL)
    {
        int x = l->valor;
        printf("%d\n", x);
        l = l->prox;
    }
}


// 4. 
LInt reverseL(LInt l)
{
    LInt anterior = NULL;
    LInt atual = l;
    LInt seguinte = NULL;
    while(atual != NULL)
    {
        seguinte = l->prox;
        atual->prox = anterior;
        anterior = atual;
        atual = seguinte;

    }
    return anterior;
}


// 5.
void insertOrd(LInt *l, int x)
{
    while(*l != NULL && (*l)->valor < x) l = &((*l)->prox);
    LInt novo = malloc(sizeof(struct lligada));
    novo->valor = x;
    novo->prox = *l;
    *l=novo;
}


// 6.
int removeOneOrd(LInt *l, int x){
    LInt ant = NULL;
    LInt atual = *l;
    while(atual != NULL && atual->valor < x){
        ant = atual;
        atual = atual->prox;
    }
    if(atual == NULL || atual->valor != x) return 1;
    if(ant == NULL) *l = atual->prox;
    else ant->prox = atual->prox;
    free(atual);
    return 0;
}


// 7. 

//recursive aproach 
void merge(LInt *r, LInt a, LInt b){
    if(a == NULL) *r = b; 
    if(b == NULL) *r = a; 
    if(a->valor < b->valor)
    {
        *r = a;
        merge(&((*r)->prox), a->prox, b);
    } else {
        *r = b;
        merge(&((*r)->prox), a->prox, b);
    }
}

//approach imperativo :)
void merge2(LInt *r, LInt a, LInt b){
    while(a != NULL && b != NULL){
        if(a->valor < b->valor){
            *r = a;
            a = a->prox;
        } else {
            *r = b;
            b = b->prox;
        }
        r = &((*r)->prox);
    }
    if(a != NULL) *r = a;
    else *r = b;
}

void splitQS(LInt l, int x, LInt *mx, LInt *Mx){
    while(l != NULL){
        if(l->valor < x){
            *mx = l;
            mx = &((*mx)->prox);
        } else {
            *Mx = l;
            Mx = &((*Mx)->prox);
        }
        l = l->prox;
    }
    *mx = NULL;
    *Mx = NULL;
}

LInt parteAmeio (LInt *l){
    int n = 0;
    LInt temp = *l;
    while(temp != NULL){
        n ++;
        temp = temp ->prox;
    }
    int meio = n / 2;
    if(meio == 0) return NULL;
    LInt y = *l;
    LInt ant = NULL;
    LInt atual = *l;
    for(int i = 0; i < meio; i ++){
        ant = atual;
        atual = atual->prox;
    }
    ant->prox = NULL;
    *l = atual;
    return y;
}

int main(){
    return 0;
}