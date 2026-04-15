---
topic: C
date: 2026-04-14
course: Programação Imperativa
tags:
  - Universidade
  - pi
  - C
  - computer-science
  - programming
---
# pi tp 9

## 1. Listas Inteiras (LInt) 
A base para construir estruturas dinâmicas mais complexas é a definição de um nó de lista simples.
```c
typedef struct lista{
	int valor;
	struct lista *prox;
} *LInt;
```

```c
// Função auxiliar para criar um novo nó
LInt newLInt(int x, LInt xs){
	LInt r = malloc(sizeof(struct list));
	if(r != NULL){
		r->valor = x;
		r->prox = xs;
	}
	return r;
}
```

---

## 2. Pilhas (Stacks) com Listas Ligadas
Uma Pilha segue o princípio **LIFO** (Last-In, First-Out). Ao usar listas ligadas, o "topo" da pilha é sempre o primeiro elemento da lista. Isso permite que as operações de inserção e remoção sejam de tempo constante O(1).

```c 
typedef LInt Stack;
```

---

### Definição e Inicialização
```c
// Inicializa a pilha como NULL (vazia)
void initStack(Stack *s){
	*s = NULL;
}
```

```c
// Verifica se a pilha está vazia
int isEmpty(Stack *s, int x){
	return (s == NULL);
}
```

---

### Push (Empilhar)
Inserir um elemento no topo. O novo nó aponta para o antigo topo, e o ponteiro da pilha passa a apontar para o novo nó.
```c
int push(Stack *s, int x){
	Stack r;
	r = malloc(sizeof(struct lista));
	if(r == NULL) return 1; // Falha na alocação
	r->valor = x; 
	r->prox = *s; // O novo nó aponta para o resto da pilha
	*s = r; // O topo da pilha agora é o novo nó
	return 0;
}
```

---

### Pop (Desempilhar)
Remover o elemento do topo. Guardamos o valor, avançamos o ponteiro da pilha para el siguiente nodo y liberamos la memoria del nodo removido.

```c
int pop(Stack *s, int *s){
	LInt t;
	if(*s == NULL) return 1; // Erro: Pilha vazia
	t = *s; // Guardamos o nó do topo
	*s = (*s)->prox; // O topo passa a ser o próximo elemento
	*x = t -> valor; // Devolvemos o valor por referência
	free(t); // Libertamos a memória do nó removido
	return 0;
```

---

## Diferenças Principais: Queue vs Stack

- **Queue (TP 8):** FIFO (Primeiro a entrar, primeiro a sair). Requer manipulação de `frente` e `comp` ou ponteiros para o início e fim.
    
- **Stack (TP 9):** LIFO (Último a entrar, primeiro a sair). Apenas precisamos de controlar o ponteiro para o topo (início da lista).

---

### Notas técnicas: 
1. **Módulo vs Punteros:** A diferencia de la Queue circular de la clase anterior, aquí no necesitas el operador `%` porque la lista ligada crece dinámicamente nodo a nodo; no hay un array fijo que "dé la vuelta". 
2. **Indirección:** En `initStack`, `push` y `pop` pasamos `Stack *s` (un puntero a la lista). Esto es necesario porque queremos modificar el puntero original de la pila que está en el `main`. Por eso usamos `*s` dentro de las funciones.

---

## Main
Main generado por gemini para probar las funciones e tambien poder visualizarlas mejor con ayuda de python tutor.
```c
#include <stdio.h>
#include <stdlib.h>

// ==========================================
// [...]
// ==========================================

int main() {
    printf("=== TESTANDO A PILHA (STACK) COM LISTAS LIGADAS ===\n");
    
    Stack s;        // Nuestra pila principal
    int valor;      // Variable auxiliar para guardar lo que sacamos con pop()

    // 1. Inicializamos la pila
    initStack(&s);
    printf("Pilha inicializada. Vazia? %s\n", isEmpty(&s) ? "Sim" : "Nao");

    // 2. Empilhar (Push) elementos
    printf("\nEmpilhando (Push) os valores: 10, 20, 30...\n");
    
    push(&s, 10);
    printf("Inserido: 10\n");
    
    push(&s, 20);
    printf("Inserido: 20\n");
    
    push(&s, 30);
    printf("Inserido: 30\n");

    printf("\nA pilha esta vazia agora? %s\n", isEmpty(&s) ? "Sim" : "Nao");

    // 3. Desempilhar (Pop) elementos para comprobar el orden LIFO
    printf("\nDesempilhando (Pop) todos os valores:\n");
    // Mientras la pila NO esté vacía, seguimos sacando elementos
    while (!isEmpty(&s)) {
        if (pop(&s, &valor) == 0) {
            printf("Removido do topo: %d\n", valor);
        }
    }

    // 4. Probar sacar de una pila que ya está vacía (manejo de errores)
    printf("\nTentando desempilhar de uma pilha vazia...\n");
    if (pop(&s, &valor) == 1) {
        printf("Erro capturado com sucesso: A pilha ja esta vazia!\n");
    }

    return 0;
}
```


## Links
- [[1ano/2semestre/PI/fichas/Ficha3.pdf|Ficha3]]
- [[1ano/2semestre/PI/fichas/Ficha3.pdf|Ficha4]]
-  [[pi tp 1]]
- [[pi tp 2]]
- [[pi tp 3]]
- [[pi tp 4]]
- [[pi tp 5]]
- [[pi tp 6]]
- [[pi tp 7]]
- [[pi tp 8]]
