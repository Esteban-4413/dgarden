#include <stdio.h>
#include <stdlib.h>

// LISTAS LIGADAS

typedef struct lligada {
	int valor;
	struct lligada *prox;
} *LInt;

// 1.
int length(LInt l) {
	int conta = 0;
	while (l != NULL) {
		l = l->prox;
		conta++;
	}
	return conta;
}

// 2.
int freeL(LInt l) {
	LInt temp;
	while (l != NULL) {
		temp = l->prox;
		free(l);
		l = temp;
	}
	return 0;
}

// 3.
void imprimeL(LInt l) {
	while (l != NULL) {
		int x = l->valor;
		printf("%d\n", x);
		l = l->prox;
	}
}

// 4.
LInt reverseL(LInt l) {
	LInt anterior = NULL;
	LInt atual = l;
	LInt seguinte = NULL;
	while (atual != NULL) {
		seguinte = atual->prox;
		atual->prox = anterior;
		anterior = atual;
		atual = seguinte;
	}
	return anterior;
}

// 5.
void insertOrd(LInt *l, int x) {
	while (*l != NULL && (*l)->valor < x)
		l = &((*l)->prox);
	LInt novo = malloc(sizeof(struct lligada));
	novo->valor = x;
	novo->prox = *l;
	*l = novo;
}

// 6.
int removeOneOrd(LInt *l, int x) {
	LInt ant = NULL;
	LInt atual = *l;
	while (atual != NULL && atual->valor < x) {
		ant = atual;
		atual = atual->prox;
	}
	if (atual == NULL || atual->valor != x)
		return 1;
	if (ant == NULL)
		*l = atual->prox;
	else
		ant->prox = atual->prox;
	free(atual);
	return 0;
}

// ou
int removeOneOrd2(LInt *l, int x) {
	while (*l != NULL && (*l)->valor < x)
		l = &((*l)->prox);
	if (*l == NULL || (*l)->valor != x)
		return 1;
	LInt toFree = *l;
	*l = (*l)->prox;
	free(toFree);
	return 0;
}

// 7.

// recursive aproach
void merge(LInt *r, LInt a, LInt b) {
	if (a == NULL)
		*r = b;
	if (b == NULL)
		*r = a;
	if (a->valor < b->valor) {
		*r = a;
		merge(&((*r)->prox), a->prox, b);
	} else {
		*r = b;
		merge(&((*r)->prox), a->prox, b);
	}
}

// approach iterativo :)
void merge2(LInt *r, LInt a, LInt b) {
	while (a != NULL && b != NULL) {
		if (a->valor < b->valor) {
			*r = a;
			a = a->prox;
		} else {
			*r = b;
			b = b->prox;
		}
		r = &((*r)->prox);
	}
	if (a != NULL)
		*r = a;
	else
		*r = b;
}

void splitQS(LInt l, int x, LInt *mx, LInt *Mx) {
	while (l != NULL) {
		if (l->valor < x) {
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

LInt parteAmeio(LInt *l) {
	int n = 0, i = 0;
	LInt temp = *l;
	while (temp != NULL) {
		n++;
		temp = temp->prox;
	}
	int meio = n / 2;
	if (meio == 0)
		return NULL;
	LInt y = *l;
	LInt ant = NULL;
	LInt atual = *l;
	for (; i < meio; i++) {
		ant = atual;
		atual = atual->prox;
	}
	ant->prox = NULL;
	*l = atual;
	return y;
}

int removeAll(LInt *lista, int x) {
	LInt ant = NULL;
	LInt l = (*lista);
	int conta = 0;
	while (l != NULL) {
		if (l->valor == x) {
			if (ant == NULL) {
				*lista = l->prox;
				free(l);
				l = *lista;
			} else {
				ant->prox = l->prox;
				l->prox = NULL;
				free(l);
				l = ant->prox;
			}
			conta++;
		} else {
			ant = l;
			l = l->prox;
		}
	}
	return conta;
}

int removeDups(LInt *l) {
	int conta = 0;
	while (*l != NULL) {
		LInt *inner = &((*l)->prox);
		while (*inner != NULL) {
			if ((*inner)->valor == (*l)->valor) {
				LInt toFree = *inner;
				*inner = (*inner)->prox;
				free(toFree);
				conta++;
			} else {
				inner = &((*inner)->prox);
			}
		}
		l = &((*l)->prox);
	}
	return conta;
}

int removeMaiorL(LInt *l) {
	LInt *maior = l;
	(*maior)->valor = (*l)->valor;
	while (*l != NULL) {
		if ((*l)->valor > (*maior)->valor) {
			maior = l;
		}
		l = &((*l)->prox);
	}
	LInt toFree = *maior;
	*maior = (*maior)->prox;
	return (toFree->valor);
}

void init(LInt *l) {
	while ((*l)->prox != NULL) {
		l = &((*l)->prox);
	}
	LInt apagar = *l;
	*l = (*l)->prox;
	free(apagar);
}

void appendL(LInt *l, int x) {
	LInt nova = malloc(sizeof(struct lligada));
	nova->prox = NULL;
	nova->valor = x;
	while (*l != NULL)
		l = &((*l)->prox);
	*l = nova;
}

void concatL(LInt *a, LInt b) {
	while ((*a) != NULL) {
		a = &((*a)->prox);
	}
	(*a) = b;
}

// 16.
LInt cloneL(LInt a) {
	LInt head = NULL;
	while (a != NULL) {
		appendL(&head, a->valor);
		a = a->prox;
	}
	return head;
}

// 17.
LInt cloneRev(LInt a) {
	LInt b = cloneL(a);
	return reverseL(b);
}

// 18.
int maximo(LInt l) {
	int max = l->valor;
	while (l != NULL) {
		if (l->valor > max) {
			max = l->valor;
		}
		l = l->prox;
	}
	return max;
}

// 19.
int take(int n, LInt *l) {
	int conta = 0;
	while (conta < n && *l != NULL) {
		l = &((*l)->prox);
		conta++;
	}
	while (*l != NULL) {
		LInt temp = *l;
		*l = (*l)->prox;
		free(temp);
	}
	return conta;
}

// 20.
int drop(int n, LInt *l) {
	int conta = 0;
	while (conta < n && *l != NULL) {
		LInt temp = *l;
		*l = (*l)->prox;
		conta++;
	}
	return conta;
}

// 21.
LInt Nforward(LInt l, int N) {
	for (int i = 0; i < N; i++)
		l = l->prox;
	return l;
}

// 21.
int listToArray(LInt l, int v[], int N) {
	int i = 0;
	for (; i < N && l != NULL; i++) {
		v[i] = l->valor;
		l = l->prox;
	}
	return i;
}

// 23.
LInt arrayToList(int v[], int N) {
	LInt a = NULL, nova;
	for (int i = N - 1; i >= 0; i--) {
		nova = malloc(sizeof(struct lligada));
		nova->valor = v[i];
		nova->prox = a;
		a = nova;
	}
	return a;
}

// 24.
LInt somasAcL(LInt l) {
	LInt head = NULL;
	LInt *tail = &head;
	int conta = 0;
	while (l != NULL) {
		conta += l->valor;
		LInt nova = malloc(sizeof(struct lligada));
		nova->prox = NULL;
		nova->valor = conta;
		*tail = nova;
		tail = &((*tail)->prox);
		l = l->prox;
	}
	return head;
}

// 25.
int remreps(LInt l) {
	int conta = 0;
	while (l != NULL) {
		if (l->valor == l->prox->valor) {
			LInt toFree = l->prox;
			l->prox = toFree->prox;
			free(toFree);
			conta++;
		} else {
			l = l->prox;
		}
	}
	return conta;
}

// 26.
LInt rotateL(LInt l) {
	if (l == NULL || l->prox == NULL)
		return l;
	LInt head = l;
	head = head->prox;
	LInt *tail = &l;
	while ((*tail) != NULL) {
		tail = &((*tail)->prox);
	}
	*tail = l;
	l->prox = NULL;
	return head;
}

// 27.
LInt parte(LInt l) {
	if (l == NULL || l->prox == NULL)
		return NULL;
	LInt headY = l->prox;
	LInt x = l;
	LInt y = headY;
	while (x != NULL && x->prox != NULL) {
		x->prox = y->prox;
		y->prox = (x->prox != NULL) ? x->prox->prox : NULL;
		x = x->prox;
		y = y->prox;
	}
	return headY;
}

// ARVORES BINARIAS
typedef struct nodo {
	int valor;
	struct nodo *esq, *dir;
} *ABin;

// 28.
int altura(ABin t) {
	if (t == NULL)
		return 0;
	int esq = altura(t->esq);
	int dir = altura(t->dir);
	return 1 + ((esq > dir) ? esq : dir);
}

// 29.
ABin cloneAB(ABin a) {
	if (a == NULL)
		return NULL;
	ABin copia = malloc(sizeof(struct nodo));
	copia->valor = a->valor;
	copia->esq = cloneAB(a->esq);
	copia->dir = cloneAB(a->dir);
	return copia;
}

// 30.
void mirror(ABin *a) {
	if (*a != NULL) {
		mirror(&((*a)->dir));
		mirror(&((*a)->esq));
		ABin temp = (*a)->esq;
		(*a)->esq = (*a)->dir;
		(*a)->dir = temp;
	}
}

// 31.
void inorder(ABin a, LInt *l) {
	if (a != NULL) {
		inorder(a->esq, l);
		LInt nova = malloc(sizeof(struct lligada));
		nova->valor = a->valor;
		nova->prox = NULL;
		while (*l != NULL) {
			l = &((*l)->prox);
		}
		*l = nova;
		inorder(a->dir, l);
	}
}

// 32.
void preorder(ABin a, LInt *l) {
	if (a != NULL) {
		LInt nova = malloc(sizeof(struct lligada));
		nova->valor = a->valor;
		nova->prox = NULL;
		*l = nova;
		LInt *tail = &((nova)->prox);
		preorder(a->esq, tail);
		while (*tail != NULL)
			tail = &((*tail)->prox);
		preorder(a->dir, tail);
	}
}

// 33.
void posorder(ABin a, LInt *l) {
	if (a != NULL) {
		posorder(a->esq, l);
		posorder(a->dir, l);
		LInt nova = malloc(sizeof(struct lligada));
		nova->valor = a->valor;
		nova->prox = NULL;
		while (*l != NULL)
			l = &((*l)->prox);
		*l = nova;
	}
}

// 34.
int depth(ABin a, int x) {
	int dir, esq;
	if (a == NULL)
		return -1;
	if (a->valor == x)
		return 1;
	esq = depth(a->esq, x);
	dir = depth(a->dir, x);
	if (esq == -1 && dir == -1)
		return -1;
	if (esq == -1)
		return 1 + dir;
	if (dir == -1)
		return 1 + esq;
	return 1 + ((esq < dir) ? esq : dir);
}

// 35.
int freeAB(ABin a) {
	if (a != NULL) {
		int esq = freeAB(a->esq);
		int dir = freeAB(a->dir);
		free(a);
		return esq + dir + 1;
	}
	return 0;
}

// 36.
int pruneAB(ABin *a, int l) {
	if (*a != NULL) {
		if (l <= 0) {
			int total = freeAB(*a);
			*a = NULL;
			return total;
		}
		if (l == 1) {
			int esq = freeAB((*a)->esq);
			int dir = freeAB((*a)->dir);
			(*a)->dir = NULL;
			(*a)->esq = NULL;
			return esq + dir;
		} else {
			int pruneEsq = pruneAB(&((*a)->esq), l - 1);
			int pruneDir = pruneAB(&((*a)->dir), l - 1);
			return pruneEsq + pruneDir;
		}
	}
	return 0;
}

// 38.
int iguaisAB(ABin a, ABin b) {
	if (a == NULL && b == NULL)
		return 1;
	if (a == NULL || b == NULL)
		return 0;
	return (a->valor == b->valor) && iguaisAB(a->esq, b->esq) &&
		   iguaisAB(a->dir, b->dir);
}

// 37
LInt nivelL(ABin a, int n) {
	LInt r = NULL, e, d;
	if (a != NULL) {
		if (n == 1) {
			r = malloc(sizeof(struct lligada));
			r->valor = a->valor;
			r->prox = NULL;
		} else {
			e = nivelL(a->esq, n - 1);
			d = nivelL(a->dir, n - 1);
			if (e == NULL)
				r = d;
			else {
				r = e;
				LInt *tail = &(e->prox);
				while (*tail != NULL)
					tail = &((*tail)->prox);
				*tail = d;
			}
		}
	}
	return r;
}

// 39.
int nivelV(ABin a, int n, int v[]) {
	if (a == NULL || n < 0)
		return 0;
	if (n == 1) {
		v[0] = a->valor;
		return 1;
	}
	int esq = nivelV(a->esq, n - 1, v);
	int dir = nivelV(a->dir, n - 1, v + esq);
	return esq + dir;
}

// 40.
int dumpAbin(ABin a, int v[], int N) {
	if (a != NULL) {
		int esq = dumpAbin(a->esq, v, N);
		if (esq >= N)
			return esq;
		else {
			v[esq] = a->valor;
			int dir = dumpAbin(a->dir, v + esq + 1, N - esq - 1);
			return esq + dir + 1;
		}
	}
	return 0;
}

// 41.
// aux
int somaTotal(ABin a) {
	if (a == NULL)
		return 0;
	return a->valor + somaTotal(a->esq) + somaTotal(a->dir);
}

ABin somasAcA(ABin a) {
	if (a == NULL)
		return NULL;
	ABin new = malloc(sizeof(struct nodo));
	new->esq = somasAcA(a->esq);
	new->dir = somasAcA(a->dir);
	new->valor = somaTotal(a);
	return new;
}

// 42.
int contaFolhas(ABin a) {
	if (a == NULL)
		return 0;
	if (a->esq == NULL && a->dir == NULL)
		return 1;
	return contaFolhas(a->esq) + contaFolhas(a->dir);
}

// 43.
ABin cloneMirror(ABin a) {
	if (a == NULL)
		return NULL;
	ABin nova = malloc(sizeof(struct nodo));
	nova->valor = a->valor;
	nova->esq = NULL;
	nova->dir = NULL;
	if (a->esq != NULL && a->dir != NULL) {
		nova->esq = cloneMirror(a->dir);
		nova->dir = cloneMirror(a->esq);
	} else {
		if (a->esq == NULL) {
			nova->dir = NULL;
			nova->esq = cloneMirror(a->dir);
		}
		if (a->dir == NULL) {
			nova->esq = NULL;
			nova->dir = cloneMirror(a->esq);
		}
	}
	return nova;
}

// 44.
int addOrd(ABin *a, int x) {
	while (*a != NULL) {
		if ((*a)->valor == x)
			return 1;
		if (x < (*a)->valor)
			a = &((*a)->esq);
		else
			a = &((*a)->dir);
	}
	ABin nova = malloc(sizeof(struct nodo));
	nova->valor = x;
	nova->esq = NULL;
	nova->dir = NULL;
	*a = nova;
	return 0;
}

// 45.
int lookupAB(ABin a, int x) {
	while (a != NULL) {
		if (a->valor == x)
			return 1;
		if (x < a->valor)
			a = a->esq;
		else
			a = a->dir;
	}
	return 0;
}

// 46.
int depthOrd(ABin a, int x) {
	int conta = 1;
	while (a != NULL && a->valor != x) {
		if (x < a->valor)
			a = a->esq;
		else
			a = a->dir;
		conta++;
	}
	return (a == NULL) ? -1 : conta;
}

// 47.
int maiorAB(ABin a) {
	while (a->dir != NULL)
		a = a->dir;
	return a->valor;
}

// 48.
void removeMaiorA(ABin *a) {
	while ((*a)->dir != NULL)
		a = &((*a)->dir);
	ABin toFree = *a;
	*a = (*a)->esq;
	free(toFree);
}

// 49.
int quantosMaiores(ABin a, int x) {
	if (a == NULL)
		return 0;
	int esq = quantosMaiores(a->esq, x);
	int dir = quantosMaiores(a->dir, x);
	return (a->valor > x) ? esq + dir + 1 : esq + dir;
}

// 50.
// aux
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

void listToBTree(LInt l, ABin *a) {
	if (l == NULL) {
		*a = NULL;
		return;
	}
	int conta = 0;
	ABin *actual = a;
	while (l != NULL) {
		ABin new = malloc(sizeof(struct nodo));
		new->valor = l->valor;
		new->esq = NULL;
		new->dir = NULL;
		*actual = new;
		actual = &((*actual)->dir);
		conta++;
		l = l->prox;
	}
}

// 51.
int deProcura(ABin a) {
	if (a == NULL)
		return 1;
	if (a->esq != NULL) {
		ABin maxEsq = a->esq;
		while (maxEsq->dir != NULL)
			maxEsq = maxEsq->dir;
		if (maxEsq->valor >= a->valor)
			return 0;
	}
	if (a->dir != NULL) {
		ABin minDir = a->dir;
		while (minDir->esq != NULL)
			minDir = minDir->esq;
		if (minDir->valor <= a->valor)
			return 0;
	}
	return deProcura(a->esq) && deProcura(a->dir);
}

int main() { return 0; }
