# C - 1 

## Exemplo: função factorial
Função que calcula de forma iterativa o factorial de um número $n \in \mathbb{N}$
```c
int fact (int n){
  // Pre: n >= 0
  f = 1;
  i = 1;
  while(i <= n){
    f = f * i;
    i = i + 1
  }
  // Pos: f = n!

  return f;
}
```
Para mostrar que a definição de esta função é correta então temos de provar a validade do seguinte triplo de Hoare (com $\textbf{F}$ é o corpo da função).

$$\{n \geq 0\} \textbf{F} \{f = n!\}$$

Para isso é preciso descobrir um invariante $I$ tal que sejam válidos
>[!important] Triplos de Hoare a provar:
> 1. Inicialização: $\{n \geq 0\}\; f = 1;\; f = 1\; \{I\}$
> 2. Preservação: $\{I \land i \leq n\}$ `f = f * i; i = i + 1` $\{I\}$
> 2. Utilidade: $\{I \land \neg(i \leq n)\}\;\{\}\;\{f = n!\}$

### Simulação
O par $(i, f)$ à entrada de cada iteração toma os valores:

| iteração | $i$ | $f$ |
|---|---|---|
| 1 | 1 | 1 |
| 2 | 2 | 1 |
| 3 | 3 | 2 |
| 4 | 4 | 6 |
| 5 | 5 | 24 |


Assim obtemos que o valor $f$ à entrada de uma iteração é igual ao fatorial de $i - 1$. Por outro lado o valor de $i$ varia entre $1$ e $n + 1$

### Prova 

#### 1. Inicialização
Depois de `f = 1; i = 1`:
$$f = 1 = 0! = (i - 1)!\; \text{e}\; 1 \leq n + 1 \quad \text{(porque } n \geq 0)$$

#### 2. Preservação
O corpo multiplica $f$ por $i$ e incrementa $i$. Temos de mostrar que depois da iteração: 

$$
\begin{array}{l}
\{\, f = (i-1)! \;\wedge\; i \leq n+1 \;\wedge\; i \leq n \,\} \quad \text{\small (I} \wedge \text{c)} \\
\{\, f * i = i! \;\wedge\; i + 1 \leq n + 1 \,\} \\
\texttt{f = f * i;} \\
\{\, f = i! \;\wedge\; i + 1 \leq n + 1 \,\} \\
\texttt{i = i + 1;} \\
\{\, f = (i-1)! \;\wedge\; i \leq n+1 \,\} \quad \text{\small (I)}
\end{array}
$$

#### 3. Utilidade
À saída, a condição booleana $i \leq n$ é falsa. Então: 
$f = (i - 1)! \land i \leq n + 1 \land \neg(i \leq n) \implies f = n!$

### Terminação
- Variante: $V = n - i + 1$
- $I \wedge i \leq n \Rightarrow V \geq 1 > 0$ 
- $i$ aumenta 1 em cada iteração, logo $V$ **decresce estritamente**


## Exercício: soma dos elementos de um array
Programa que calcula o somatório dos $n$ elementos de um array.

```c
int sum (int vector[], int n) {
  // n >= 0
  result = 0;
  i = 0;
  while (i < n) {
    result = vector[i] + result;
    i = i+1;
  }
  // result == SOMA_{k=0..n-1} vector[k]
  return result;
}
```
Mostrar a correção corresponde a mostrar a validade do seguinte triplo de Hoare:
$$\{0 \leq n\} \textbf{ Sum }\{result = \sum_{k = 0}^{n - 1}vector[k]\}$$

Pede-se:
1. Apresente um invariante adequado para o ciclo.
2. Escreva os triplos de Hoare correspondentes à inicialização, preservação, e utilidade do invariante, e argumente informalmente que são válidos 

# Reference:
- [[../../resources/C1.pdf]]
