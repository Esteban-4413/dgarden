#include "abin.h"

ABin newABin(int r, ABin e, ABin d) {
	ABin a = malloc(sizeof(struct nodo));
	if (a != NULL) {
		a->valor = r;
		a->esq = e;
		a->dir = d;
	}
	return a;
}

ABin RandArvFromArray(int v[], int N) {
	ABin a = NULL;
	int m;
	if (N > 0) {
		m = rand() % N;
		a = newABin(v[m], RandArvFromArray(v, m),
					RandArvFromArray(v + m + 1, N - m - 1));
	}
	return a;
}

// Questão 1
ABin removeMenor(ABin *a) {
	ABin ant = NULL, atual = *a;
	while (atual->esq != NULL) {
		ant = atual;
		atual = atual->esq;
	}
	if (ant == NULL)
		(*a) = atual->dir;
	else
		ant->esq = atual->dir;
	atual->dir = NULL;
	return atual;
}

void removeRaiz(ABin *a) {
	ABin atual = (*a), sub = NULL;
	if (atual->dir == NULL) {
		(*a) = atual->esq;
		free(atual);
	} else {
		sub = removeMenor(&(atual->dir));
		sub->esq = (*a)->esq;
		sub->dir = ((*a)->dir);
		(*a) = sub;
		free(atual);
	}
}

int removeElem(ABin *a, int x) {
	ABin atual = *a, ant = NULL;
	while (atual != NULL && atual->valor != x) {
		ant = atual;
		if (x < atual->valor) {
			atual = atual->esq;
		} else {
			atual = atual->dir;
		}
	}
	if (atual == NULL)
		return 1;
	else if (ant == NULL) {
		removeRaiz(a);
		return 0;
	} else {
		((ant->esq) == atual) ? (removeRaiz(&(ant->esq)))
							  : (removeRaiz(&(ant->dir)));
		return 0;
	}
}

// Questão 2
void rodaEsquerda(ABin *a) {
	ABin b = (*a)->dir;
	(*a)->dir = b->esq;
	b->esq = (*a);
	*a = b;
}
void rodaDireita(ABin *a) {
	ABin b = (*a)->esq;
	(*a)->esq = b->dir;
	b->dir = *a;
	*a = b;
}

void promoveMenor(ABin *a) {
	ABin atual = *a;
	if (atual != NULL && atual->esq != NULL) {
		promoveMenor(&(atual->esq));
		rodaDireita(a);
	}
}

void promoveMaior(ABin *a) {
	ABin atual = *a;
	if (atual != NULL && atual->dir != NULL) {
		promoveMaior(&(atual->dir));
		rodaEsquerda(a);
	}
}

ABin removeMenorAlt(ABin *a) {
	if (*a == NULL)
		return NULL;
	promoveMenor(a);
	ABin menor = *a;
	*a = (*a)->dir;
	menor->dir = NULL;
	return menor;
}

// Questão 3
int constroiEspinhaAux(ABin *a, ABin *ult) {
	if (*a == NULL) {
		*ult = NULL;
		return 0;
	}
	ABin raizOriginal = *a, ultEsq = NULL, ultDir = NULL;
	int nEsq = constroiEspinhaAux(&(raizOriginal->esq), &ultEsq);
	if (nEsq > 0) {
		ultEsq->dir = raizOriginal;
		*a = raizOriginal->esq;
	} else {
		*a = raizOriginal;
	}
	int nDir = constroiEspinhaAux(&(raizOriginal->dir), &ultDir);
	if (nDir > 0) {
		*ult = ultDir;
	} else {
		*ult = raizOriginal;
	}
	return nEsq + 1 + nDir;
}

int constroiEspinha(ABin *a) {
	ABin ult;
	return (constroiEspinhaAux(a, &ult));
}

ABin equilibraEspinha(ABin *a, int n) {
	if (n == 0) {
		ABin sobra = *a;
		*a = NULL;
		return sobra;
	}
	int nEsq = n / 2;
	ABin resto = equilibraEspinha(a, nEsq);
	ABin raiz = resto;
	ABin direita = raiz->dir;
	int nDir = n - nEsq - 1;
	ABin restoFinal = equilibraEspinha(&direita, nDir);
	raiz->esq = *a;
	raiz->dir = direita;
	*a = raiz;
	return restoFinal;
}

void equilibra(ABin *a) {
	int n = constroiEspinha(a);
	equilibraEspinha(a, n);
}
