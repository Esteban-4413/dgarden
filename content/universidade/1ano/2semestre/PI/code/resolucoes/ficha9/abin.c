
#include "abin.h"



ABin newABin (int r, ABin e, ABin d) {
   ABin a = malloc (sizeof(struct nodo));
   if (a!=NULL) {
      a->valor = r; a->esq = e; a->dir = d;
   }
   return a;
}

ABin RandArvFromArray (int v[], int N) {
   ABin a = NULL;
    int m;
    if (N > 0){
    	m = rand() % N;
    	a = newABin (v[m], RandArvFromArray (v,m), RandArvFromArray (v+m+1,N-m-1));
    }
    return a;	
}

int altura (ABin a){
  int esq, dir;
  if(a == NULL) return 0;
  esq = altura(a->esq);
  dir = altura(a->dir);
  return 1 + ((esq > dir) ? esq : dir);
}

int nFolhas (ABin a){
  if(a == NULL) return 0;
  if(a->esq == NULL && a->dir == NULL) return 1;
  return (nFolhas(a->esq) + nFolhas(a->dir));
}

ABin maisEsquerda (ABin a){
  if(a == NULL) return NULL;
  while(a->esq != NULL){
    a = a->esq;
  }
  return a;
}

void imprimeNivel (ABin a, int l){
   if(a != NULL){
    if(l == 0) printf("%d", a->valor);
    else {
      imprimeNivel(a->esq, l-1);
      imprimeNivel(a->dir, l-1);
    }
  } 
}

int procuraE (ABin a, int x){
  if(a == NULL) return 0;
  if(a->valor == x) return 1;
  return(procura(a->esq, x) || procura(a->dir, x));
}

struct nodo *procura (ABin a, int x){
  while(a != NULL && a->valor != x){
    if(x < a->valor) a = a->esq;
    else a = a->dir;
  }
  return a;
}



int nivel (ABin a, int x){
  int nivel = 0;
  while(a != NULL && a->valor != x){
    if(x < a->valor) a = a->esq;
    else a = a->dir;
    nivel++;
  }
  return (a == NULL) ? (-1) : nivel;
}

void inorder(ABin a){
  if(a != NULL){
    inorder(a->esq);
    printf("%d", a->valor);
    inorder(a->dir);
  }
}

void imprimeAte (ABin a, int x){
  if(a != NULL){
    if(x > a->valor){
      inorder(a->esq);
      printf("%d", a->valor);
      imprimeAte(a->dir, x);
    }
    else imprimeAte(a->esq, x);
  } 
}
