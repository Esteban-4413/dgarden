## Address Operator 
In C the address operator is an **unary operator**[^1]that returns the address of a variable.
![[address.jpg]]

## Pointers
A Pointer is a variable that stores the memory address of another variable. Instead of holding a direct value, it holds the address where the value is stored in memory.
- A pointer is declared by specifying its data type and name, with an asterisk (\*) before the name. *Syntax:* data_type \*pointer_name:
- Accessing the pointer directly will just give us the address that is stored in the pointer. To get the value at the address stored in a pointer variable, we use `*` operator which is call *dereferencing* operator in C.

### Dereference a pointer
Dereference is, use of a pointer to access the value whose address is being stored. We use `*` operator to get the value of the variable from its address.
- When we dereference a pointer, we deal with the actual data stored in the memory location it points to
- When we write `*ptr`, the compiler looks at the address stored in the pointer, goes to that memory location, and accesses or changes the actual data stored there.
![[dereferencing_pointers.webp]]

#### Pointer arithmetic
This means changing the value of a pointer to make it point to a different element in memory. 
- You can move a pointer with `++` and `--` (and with `+=` / `-=`):
```c 
int myNumbers[3] = {10, 20, 30};  
int *p = myNumbers;  // myNumbers[0]  
  
printf("%d\n", *p); // 10  
p++;           // move to myNumbers[1]  
printf("%d\n", *p); // 20  
p--;           // back to myNumbers[0]  
printf("%d\n", *p); // 10  
  
p += 2;        // jump to myNumbers[2]  
printf("%d\n", *p); // 30
```
- You can subtract two pointers that point to elements in the **same array** to find out how many elements are between them:
```c
int myNumbers[5] = {10, 20, 30, 40, 50};  
int *start = &myNumbers[1]; // points to 20  
int *end = &myNumbers[4];   // points to 50  
  
printf("%ld\n", end - start); // 3 elements apart
```

Pointer arithmetic depends on type. No all pointers move the same way because when you add `1` to a pointer, it moves forward by the size of the thing it points to
- An `int*` pointer moves by the size of an integer (usually 4 bytes).
- A `char*` pointer moves by the size of a character (1 byte).

#### Pointer to the pointer (double pointer)
A normal pointer is like a note with an address on it. A pointer to pointer is like another note telling you where that first note is kept

#### Pointers and Structs (The `->` Operator)
When we work with structures (like nodes in a Linked List or Binary Tree), we use pointers to connect them. To access a property of a struct through a pointer, C gives us a shortcut: the arrow operator `->`.
- `l->valor` is exactly the same as `(*l).valor`. 
- First, it dereferences the pointer `(*l)` to get the actual box in memory, and then it uses the dot `.valor` to look inside that box.

**Class Example (Linked Lists):**
```c
#include <stdio.h>
#include <stdlib.h>

typedef struct lligada {
    int valor;
    struct lligada *prox;
} *LInt;

int main() {
    // Criamos um nó dinâmico
    LInt meuNodo = malloc(sizeof(struct lligada));
    
    // Usamos a seta -> para aceder aos campos do struct
    meuNodo->valor = 42;
    meuNodo->prox = NULL;
    
    // Lemos o valor usando a seta ->
    int x = meuNodo->valor;
    
    free(meuNodo);
    return 0;
}
```

Step-by-Step en Python Tutor:  
1. **Línea 11:** En la columna izquierda (Stack), aparece la variable `meuNodo`. En la columna derecha (Heap), aparece una caja vacía de dos espacios (`valor` y `prox`). La flecha conecta el Stack con el Heap.  
2. **Líneas 14-15:** Ves cómo el número `42` y una `X` azul (que representa `NULL`) llenan los espacios dentro de la caja en el Heap.  
3. **Línea 18:** En el Stack, se crea la variable `x` y copia el valor `42` leyendo la caja del Heap.  
4. **Línea 20:** La caja del Heap desaparece (liberación de memoria) y la flecha se rompe.

<iframe width="100%" height="600" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=%23include%20%3Cstdio.h%3E%0A%23include%20%3Cstdlib.h%3E%0A%0Atypedef%20struct%20lligada%20%7B%0A%20%20%20%20int%20valor%3B%0A%20%20%20%20struct%20lligada%20*prox%3B%0A%7D%20*LInt%3B%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20//%20Criamos%20um%20n%C3%B3%20din%C3%A2mico%0A%20%20%20%20LInt%20meuNodo%20%3D%20malloc%28sizeof%28struct%20lligada%29%29%3B%0A%20%20%20%20%0A%20%20%20%20//%20Usamos%20a%20seta%20-%3E%20para%20aceder%20aos%20campos%20do%20struct%0A%20%20%20%20meuNodo-%3Evalor%20%3D%2042%3B%0A%20%20%20%20meuNodo-%3Eprox%20%3D%20NULL%3B%0A%20%20%20%20%0A%20%20%20%20//%20Lemos%20o%20valor%20usando%20a%20seta%20-%3E%0A%20%20%20%20int%20x%20%3D%20meuNodo-%3Evalor%3B%0A%20%20%20%20%0A%20%20%20%20free%28meuNodo%29%3B%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&curInstr=0&origin=opt-frontend.js&py=c_gcc9.3.0"> </iframe>


**Passing by Reference (Why do we need pointers in functions?)**  
In C, when you pass a variable to a function, it normally sends a _copy_ of the value (Pass by Value). If the function changes it, the original variable remains unchanged.  
To let a function modify our original variable, we must pass its memory address using the Address Operator `&`, and the function must receive it using a Pointer.  

**Class Example (The pop function in a Stack):**
```c
#include <stdio.h>
#include <stdlib.h>

typedef struct lligada {
    int valor;
    struct lligada *prox;
} *Stack;

// Recebe o endereço do topo da pilha (*s) e o endereço de uma variável (*x)
int pop(Stack *s, int *x) {
    if (*s == NULL) return 1;
    
    Stack t = *s;
    *s = (*s)->prox;
    *x = t->valor; // Modificamos a variável original no main!
    
    free(t);
    return 0;
}

int main() {
    // Simulamos uma pilha com um único elemento (o número 99)
    Stack minhaPilha = malloc(sizeof(struct lligada));
    minhaPilha->valor = 99;
    minhaPilha->prox = NULL;
    
    int valorRetirado = 0; // Variável normal no main
    
    // Passamos o ENDEREÇO da pilha e o ENDEREÇO da variável
    pop(&minhaPilha, &valorRetirado);
    
    return 0;
}
```
Step-by-Step en Python Tutor:  
1. **Líneas 23-25:** Se crea `minhaPilha` en el Stack apuntando a un nodo con el valor `99` en el Heap.  
2. **Línea 27:** Nace `valorRetirado` en el Stack valiendo `0`.  
3. **Línea 30 (Llamada a función):** Entramos a `pop`. ¡Fíjate en las flechas! El puntero `s` apunta hacia la variable `minhaPilha` (Stack a Stack). El puntero `x` apunta hacia `valorRetirado`.  
4. **Línea 15:** A través del puntero `x`, la función cambia remotamente el `0` por el `99` directamente en el marco del `main`.
<iframe width="100%" height="600" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=%23include%20%3Cstdio.h%3E%0A%23include%20%3Cstdlib.h%3E%0A%0Atypedef%20struct%20lligada%20%7B%0A%20%20%20%20int%20valor%3B%0A%20%20%20%20struct%20lligada%20*prox%3B%0A%7D%20*Stack%3B%0A%0A//%20Recebe%20o%20endere%C3%A7o%20do%20topo%20da%20pilha%20%28*s%29%20e%20o%20endere%C3%A7o%20de%20uma%20vari%C3%A1vel%20%28*x%29%0Aint%20pop%28Stack%20*s,%20int%20*x%29%20%7B%0A%20%20%20%20if%20%28*s%20%3D%3D%20NULL%29%20return%201%3B%0A%20%20%20%20%0A%20%20%20%20Stack%20t%20%3D%20*s%3B%0A%20%20%20%20*s%20%3D%20%28*s%29-%3Eprox%3B%0A%20%20%20%20*x%20%3D%20t-%3Evalor%3B%20//%20Modificamos%20a%20vari%C3%A1vel%20original%20no%20main!%0A%20%20%20%20%0A%20%20%20%20free%28t%29%3B%0A%20%20%20%20return%200%3B%0A%7D%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20//%20Simulamos%20uma%20pilha%20com%20um%20%C3%BAnico%20elemento%20%28o%20n%C3%BAmero%2099%29%0A%20%20%20%20Stack%20minhaPilha%20%3D%20malloc%28sizeof%28struct%20lligada%29%29%3B%0A%20%20%20%20minhaPilha-%3Evalor%20%3D%2099%3B%0A%20%20%20%20minhaPilha-%3Eprox%20%3D%20NULL%3B%0A%20%20%20%20%0A%20%20%20%20int%20valorRetirado%20%3D%200%3B%20//%20Vari%C3%A1vel%20normal%20no%20main%0A%20%20%20%20%0A%20%20%20%20//%20Passamos%20o%20ENDERE%C3%87O%20da%20pilha%20e%20o%20ENDERE%C3%87O%20da%20vari%C3%A1vel%0A%20%20%20%20pop%28%26minhaPilha,%20%26valorRetirado%29%3B%0A%20%20%20%20%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&curInstr=15&origin=opt-frontend.js&py=c_gcc9.3.0"> </iframe>

**Pointer to the pointer (Double Pointer** `**`**)**  
 A pointer to a pointer is needed when you want a function to be able to change where a normal pointer is pointing.  
If you pass a normal pointer to a function, the function can change the _data_ inside that address, but it cannot change the address itself. If you need to redirect the original pointer to a completely new memory box, you need a double pointer.  
Class Example (Modifying the Head of a List):  
Because `LInt` is defined as a pointer (`typedef struct lligada *LInt`), writing `LInt *l` in a function argument is actually a double pointer (`struct lligada **l`).

```c
#include <stdio.h>
#include <stdlib.h>

typedef struct lligada {
    int valor;
    struct lligada *prox;
} *LInt;

// Queremos que esta função mude para onde a cabeça da lista aponta
void inserirNoInicio(LInt *l, int x) {
    LInt novo = malloc(sizeof(struct lligada));
    novo->valor = x;
    
    // novo->prox aponta para onde a lista começava antes
    novo->prox = *l; 
    
    // Mudamos o ponteiro original no main para apontar para o 'novo'
    *l = novo; 
}

int main() {
    LInt cabeca = NULL; // Lista começa vazia
    
    // Passamos o endereço do ponteiro 'cabeca'
    inserirNoInicio(&cabeca, 10);
    inserirNoInicio(&cabeca, 20); // O 20 vai empurrar o 10
    
    return 0;
}
```
Step-by-Step en Python Tutor:  
1. **Línea 22:** `cabeca` inicia vacía (`NULL` / cruz azul) en el Stack.  
2. **Línea 25 (Primera Inserción):** Entramos a la función. El puntero doble `l` apunta a la variable `cabeca` del `main`. Se crea un nodo en el Heap con el valor `10`. En la línea 18, `cabeca` ahora apunta mágicamente a este nuevo nodo.  
3. **Línea 26 (Segunda Inserción):** Volvemos a entrar. Se crea el nodo `20`. En la línea 15, el nuevo nodo se engancha al nodo `10`. En la línea 18, `cabeca` deja de apuntar al `10` y ahora apunta al `20`. ¡La cabeza de la lista ha sido actualizada.
<iframe width="100%" height="600" frameborder="0" src="https://pythontutor.com/iframe-embed.html#code=%23include%20%3Cstdio.h%3E%0A%23include%20%3Cstdlib.h%3E%0A%0Atypedef%20struct%20lligada%20%7B%0A%20%20%20%20int%20valor%3B%0A%20%20%20%20struct%20lligada%20*prox%3B%0A%7D%20*LInt%3B%0A%0A//%20Queremos%20que%20esta%20fun%C3%A7%C3%A3o%20mude%20para%20onde%20a%20cabe%C3%A7a%20da%20lista%20aponta%0Avoid%20inserirNoInicio%28LInt%20*l,%20int%20x%29%20%7B%0A%20%20%20%20LInt%20novo%20%3D%20malloc%28sizeof%28struct%20lligada%29%29%3B%0A%20%20%20%20novo-%3Evalor%20%3D%20x%3B%0A%20%20%20%20%0A%20%20%20%20//%20novo-%3Eprox%20aponta%20para%20onde%20a%20lista%20come%C3%A7ava%20antes%0A%20%20%20%20novo-%3Eprox%20%3D%20*l%3B%20%0A%20%20%20%20%0A%20%20%20%20//%20Mudamos%20o%20ponteiro%20original%20no%20main%20para%20apontar%20para%20o%20'novo'%0A%20%20%20%20*l%20%3D%20novo%3B%20%0A%7D%0A%0Aint%20main%28%29%20%7B%0A%20%20%20%20LInt%20cabeca%20%3D%20NULL%3B%20//%20Lista%20come%C3%A7a%20vazia%0A%20%20%20%20%0A%20%20%20%20//%20Passamos%20o%20endere%C3%A7o%20do%20ponteiro%20'cabeca'%0A%20%20%20%20inserirNoInicio%28%26cabeca,%2010%29%3B%0A%20%20%20%20inserirNoInicio%28%26cabeca,%2020%29%3B%20//%20O%2020%20vai%20empurrar%20o%2010%0A%20%20%20%20%0A%20%20%20%20return%200%3B%0A%7D&codeDivHeight=400&codeDivWidth=350&curInstr=0&origin=opt-frontend.js&py=c_gcc9.3.0"> </iframe>

**The NULL Pointer (The Dead End)**  
A `NULL` pointer is a pointer that points to exactly nowhere (address `0x0`). It is fundamentally used as a safe indicator that a data structure has ended.  
- In **Linked Lists**: The `prox` pointer of the last node is `NULL`.  
- In **Binary Trees**: If a node has no left child, its `esq` pointer is `NULL` (a leaf has both as `NULL`).  
- **Danger:** Trying to dereference a NULL pointer (e.g., asking for `l->valor` when `l` is `NULL`) will instantly crash the program with a **Segmentation Fault**. That is why we always write `while (l != NULL)`!


[^1]: An unary operator  in C is an operator that acts on a single operand. Unlike binary operators like `+` in `a + b` unary operators streamline operations using a single variable or constant.

## **Bibliografía**  
Para profundizar en la gestión de memoria y la aritmética de punteros, se recomiendan las siguientes fuentes:  
- **GeeksforGeeks:**  
    • [Address Operator in C](https://www.geeksforgeeks.org/cpp/address-operator-in-c/) - Guía detallada sobre el operador `&` y la referencia de memoria.
    • [C Pointers](https://www.geeksforgeeks.org/c/c-pointers/) - Compendio completo sobre declaración, inicialización y uso de punteros.  
    • [Dereference Pointer in C](https://www.geeksforgeeks.org/cpp/dereference-pointer-in-c/) - Explicación sobre el acceso a valores mediante el operador `*`.  
- **Kernighan, B. W., & Ritchie, D. M.:** _The C Programming Language_. (El libro "K&R"). Es la biblia del lenguaje C y explica de forma inigualable la relación entre punteros y arrays.  
- **Stanford CS Education Library:** [Essential C](http://cslibrary.stanford.edu/101/) - Un recurso excelente para entender la memoria dinámica y los errores comunes de punteros.  

## **Links Relacionados**
Estas notas contienen las implementaciones prácticas donde se aplican todos los conceptos de esta página:  
- **Estructuras Lineales:**  
    • [[pi tp 8]] - Implementación de filas circulares y gestión de memoria dinámica inicial.  
    • [[pi tp 9]] - Construcción de Stacks y el uso de punteros simples para Listas Ligadas.  
    • [[pi tp 10]] - Operaciones avanzadas de Listas: Inversión _in-place_, conversión a arrays e inserción ordenada (uso de punteros dobles).  
- **Estructuras No Lineales:**  
    • [[pi tp 11]] - Árboles Binarios (ABin): Recursividad bidimensional y búsqueda avanzada mediante punteros.  
- **Ejercicios Prácticos:**  
    • [[Ficha3]] - Ejercicios de aritmética de punteros y arrays.  
    • [[Ficha4]] - Problemas de manipulación de estructuras dinámicas y punteros dobles.