#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct stack {
	int sp;
	char *v;
	int size;
} *Stack;

void pop(Stack s, char *x) {
	if (s->sp == 0)
		x = NULL;
	else {
		s->sp--;
		*x = s->v[s->sp];
	}
}

void push(Stack s, char x) {
	if (s->sp == s->size) {
		s->v = realloc(s->v, 2 * s->size * sizeof(char));
		s->size *= 2;
	}
	s->v[s->sp++] = x;
}

// 1. Strings

int parentesis_ok(char exp[]) {
	int i = 0;
	char c;
	Stack s = malloc(sizeof(struct stack));
	s->sp = 0;
	s->size = 10;
	s->v = malloc(10 * sizeof(char));
	while (exp[i] != '\0') {
		if (exp[i] == '(')
			push(s, '(');
		if (exp[i] == ')') {
			if (s->sp == 0) {
				free(s->v);
				free(s);
				return 0;
			}
			pop(s, &c);
			if (c != '(') {
				free(s->v);
				free(s);
				return 0;
			}
		}
		i++;
	}
	int r = (s->sp == 0) ? 1 : 0;
	free(s->v);
	free(s);
	return r;
}

int parentesis_ok2(char exp[]) {
	int balance = 0;
	for (int i = 0; i < strlen(exp); i++) {
		if (exp[i] == '(')
			balance++;
		if (exp[i] == ')') {
			balance--;
			if (balance < 0)
				return 0;
		}
	}
	return (balance == 0) ? 1 : 0;
}

// 2. Arrays
int myRandom(int N) { return rand() % N; }

void sorteia(int a[], int N) {
	int i;
	for (i = 0; i < N; i++)
		a[i] = i;
	for (i = N - 1; i > 0; i--) {
		int j = myRandom(i + 1);
		int temp = a[i];
		a[i] = a[j];
		a[j] = temp;
	}
}

// 3. Ordenação de arrays
int minInd(int v[], int N) {
	int i, m = 0;
	for (i = 1; i < N; i++)
		if (v[i] < v[m])
			m = i;
	return m;
}

void minSort(int v[], int N) {
	int i, m;
	for (i = 0; i < N - 1; i++) {
		m = minInd(v + i, N - i);
		int temp = v[i];
		v[i] = v[m + i];
		v[m + i] = temp;
	}
}

// 4. Listas ligadas
typedef struct no {
	int valor;
	struct no *prox;
} *LInt;

int quantosMaiores(LInt l) {
	int i = 1, maior = l->valor;
	for (l = l->prox; l != NULL; l = l->prox) {
		if (l->valor > maior) {
			maior = l->valor;
			i = 1;
		} else if (l->valor == maior)
			i++;
	}
	return i;
}

// 5.
LInt retiraMaior(LInt *l) {
	if (*l == NULL)
		return NULL;
	LInt *curr = l;

	int maior = (*curr)->valor;
	while (*curr != NULL) {
		if ((*curr)->valor > maior)
			maior = (*curr)->valor;
		curr = &((*curr)->prox);
	}
	curr = l;
	while ((*curr)->valor != maior) {
		curr = &((*curr)->prox);
	}
	LInt r = *curr;
	*curr = (*curr)->prox;
	return r;
}

LInt maxSort(LInt l) {
	LInt r, m;
	r = NULL;
	while (l != NULL) {
		m = retiraMaior(&l);
		m->prox = r;
		r = m;
	}
	return r;
}

// 6. Árvores binárias
typedef struct nodo {
	int valor;
	struct nodo *esq, *dir;
} *ABin;

void mirror(ABin a) {
	ABin t;
	if (a != NULL) {
		mirror(a->esq);
		mirror(a->dir);
		t = a->esq;
		a->esq = a->dir;
		a->dir = t;
	}
}

int iguais(ABin a, ABin b) {
	if (a == NULL && b == NULL)
		return 1;
	if (a == NULL || b == NULL)
		return 0;
	return (a->valor == b->valor && iguais(a->esq, b->esq) &&
			iguais(a->dir, b->dir));
}

int iguaisM(ABin a, ABin b) {
	if (a == NULL && b == NULL)
		return 1;
	if (a == NULL || b == NULL)
		return 0;
	return (a->valor == b->valor && iguais(a->esq, b->dir) &&
			iguais(a->dir, a->esq));
}

int simetrico(ABin a) { return iguaisM(a, a); }
