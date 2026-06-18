#include <stdio.h>
#include <stdlib.h>

typedef struct {
	float teste, minis;
} Aluno;

int isFib(int n) {
	if (n < 0)
		return 0;
	else {
		long F[n + 1];
		int i = 0;
		for (; i <= n + 1; i++) {
			if (i < 2)
				F[i] = i;
			else
				F[i] = F[i - 1] + F[i - 2];
			if (F[i] == n)
				return 1;
			else if (F[i] > n)
				return 0;
		}
	}
	return F;
}


// hhahahaha

void swap(int a, int b, int arr[]) {
	int temp = arr[a];
	arr[a] = arr[b];
	arr[b] = temp;
}

int partition(int v[], int N) {
	int i, p;
	for (i = p = 0; i < N - 1; i++) {
		if (v[i] < v[N - 1]) {
			swap(i, p, v);
			p++;
		}
	}
	swap(i, p, v);
	return p;
}

void quickSort(int arr[], int N) {
	int p;
	if (N > 1) {
		p = partition(arr, N);
		quickSort(arr, p);
		quickSort(arr + p + 1, N - p - 1);
	}
}


int nota(Aluno a) {
	int m = 0, r;
	m = a.minis * 0.5 + a.teste * 0.8;
	m = (int)(m + 0.5);
	(m < 10) ? (r = 0) : (r = m);
	return r;
}
// [5, 5, 5, 7, 8, 9]
int lower_bound(int x, int v[], int N) {
	int high = N, low = 0;
	while (low < high) {
		int mid = low + (high - low) / 2;
		if (x <= v[mid])
			high = mid;
		else
			low = mid + 1;
	}
	return low;
}

int upper_bound(int x, int v[], int N) {
	int high = N, low = 0;
	while (low < high) {
		int mid = low + (high - low) / 2;
		if (x >= v[mid])
			low = mid + 1;
		else
			high = mid;
	}
	return low;
}

int findFreq(int v[], int x, int N) {
	int ub = upper_bound(x, v, N);
	int lb = lower_bound(x, v, N);
	return (ub - lb);
}

int *pauta(Aluno turma[], int N) {
	int i, notas[N];
	while (i < N) {
		notas[i] = nota(turma[i]);
	}
	return notas;
}

int moda(Aluno turma[], int N) {
	int maisFreq = 0, ant = 0;
	int *notas = pauta(turma, N);
	quickSort(notas, N);
	for (int i = 0; i < N; i++) {
		int freq = findFreq(notas, notas[i], N);
		if (freq > ant) {
			maisFreq = notas[i];
			freq = ant;
		}
	}
	return maisFreq;
}

// Teste, 23 de Maio de 2025
// 1.
typedef struct {
	int inf, sup;
} Intervalo;

int partition2(Intervalo v[], int N) {
	int i, p;
	for (i = p = 0; i < N - 1; i++) {
		if ((v[i]).inf <= v[N - 1].inf) {
			Intervalo temp = v[i];
			v[i] = v[p];
			v[p] = temp;
			p++;
		}
	}
	Intervalo temp = v[p];
	v[p] = v[N - 1];
	v[N - 1] = temp;
	return p;
}

void ordena(Intervalo c[], int N) {
	int p;
	if (N > 1) {
		p = partition2(c, N);
		ordena(c, p);
		ordena(c + p + 1, N - p - 1);
	}
}

// 2.
int cardinalidade(Intervalo c[], int N) {
	if (c == NULL)
		return 0;
	int i, card = 0, ainf = c[0].inf, asup = c[0].sup;

	for (i = 1; i < N; i++) {
		if (c[i].inf <= asup + 1) {
			if (c[i].sup > asup) {
				asup = c[i].sup;
			}
		} else {
			card += (asup - ainf + 1);
			ainf = c[i].inf;
			asup = c[i].sup;
		}
	}
	card += (asup - ainf + 1);
	return card;
}

// 3.
void camel2snake(char *id) {}

// 4.
typedef struct no {
	int valor;
	struct no *prox;
} *LInt;

LInt arrayToList(int v[], int N) {
	int i = N - 1;
	LInt r = NULL;
	for (; i >= 0; i--) {
		LInt nova = malloc(sizeof(struct no)); // malloc(sizeof(*nova));
		nova->valor = v[i];
		nova->prox = r;
		r = nova;
	}
	return r;
}


int main() {
	// Array con números que VAMOS A PROBAR
	int testes[] = {
		0,	 1,			 // Casos base (super importantes)
		2,	 3,	  5, 8,	 // Casos normales verdaderos
		4,	 6,	  7, 10, // Casos normales falsos (huecos entre Fibonaccis)
		144, 145,		 // Casos grandes (verdadero y falso)
		-5				 // Caso trampa (negativo)
	};

	// Array con la RESPUESTA CORRECTA ESPERADA (1 = Sí, 0 = No)
	int esperados[] = {1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0};

	int num_testes = sizeof(testes) / sizeof(testes[0]);
	int nota = 0;

	printf("--- INICIANDO TESTES DE isFib ---\n\n");

	for (int i = 0; i < num_testes; i++) {
		int resultado = isFib(testes[i]);

		printf("Testando isFib(%3d): ", testes[i]);

		if (resultado == esperados[i]) {
			printf("[PASS] \n");
			nota++;
		} else {
			printf("[FAIL] -> Esperava %d, mas a funcao retornou %d\n",
				   esperados[i], resultado);
		}
	}

	printf("\n--- RESULTADO FINAL ---\n");
	printf("Nota: %d / %d testes passados.\n", nota, num_testes);

	if (nota == num_testes) {
		printf("Status: PERFEITO! O teu codigo esta blindado.\n");
	} else {
		printf("Status: Ops! Tens alguns gremlins para cazar.\n");
	}

	return 0;
}
