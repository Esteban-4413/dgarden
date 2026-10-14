## Ficha 2
[[ficha2_AeC.pdf]]

1)
```c
void bubbleSort (int v[], int N){
  int i, j;
  for (i=N-1; i>0; i--)
    for (j=0; j<i; j++)
      if (v[j] > v[j+1]) swap (v,j,j+1);
}
```
>[!note]- Fórmula dos sumatorios 
> $S = \sum_{i = a}^b i = a + (a + 1) + \dots + (b - 1) + b$
> $S =  b + (b - 1) + \dots + (a + 1) + b$
> $2S = \underbrace{(a + b) + \dots +(a + b)}_{b - a + 1 \text{ vezes}}$
> $\boxed{S = \frac{(a + b)(b - a + 1)}{2}}$

Para o número de comparações temos que
$$T_{bubbleSort}(N) = \sum_{i = 1}^{N - 1} \sum_{j = 0}^{i - 1} = \sum_{i = 1}^{N - 1}\frac{(i - 1 + 1)(2)}{2} = \sum_{i = 1}^{N - 1}i = \frac{N(N -1)}{2}$$

Para os casos temos que o
- Melhor caso é quando o array esta ordenado por ordem crescente sendo o número de comparações e trocas efetuadas dado por $$\sum_{i = 1}^{N - 1} \sum_{j = 0}^{i - 1}0 = 0$$

- Pior caso é quando o array esta ordenado por ordem decrescente sendo o número de comparações e trocas efetuadas dado por $$\sum_{i = 1}^{N - 1} \sum_{j = 0}^{i - 1}1 = \frac{N (N - 1)}{2}$$

4) 
```c
int crescente (int v[], int N) {
  int i;
  for (i=1; i<N; i++)
    if (v[i] < v[i-1]) break;
  return i;
}
```

Para os casos temos que o
- Melhor caso é quando `v[i] < v[0]` e o número de comparações é $1$ 
- Pior caso é quando os primeiros $N - 1$ elementos do array estão ordenados. Logo, o número de comparações é dado por $N - 1$

```c
int maxcresc (int v[], int N) {
  int r = 1, i = 0, m;
  while (i<N-1) {
    m = crescente (v+i, N-i);
    if (m>r) r = m;
    i++;
  }
  return r;
}
```
>[!example]- Exemplo:
> Seja `v = {2, 4, 1, 10, 23, 4, 42}` um array de $N = 7$ elementos, temos que
>
| r | i | m |
| --------------- | --------------- | --------------- |
| 1 | 0 | ? |
| 2 | 1 | 2 |
| 2 | 2 | 1 |
| 3 | 3 | 3 |

Dada a chamada à função anterior, `int crescente(int[v], int N)`, para contar o número de comparações neste contexto vamos a ter uma expressão da seguinte forma $$T_{maxcresc}(N) = \sum_{i = 0}^{N - 2}T_{crescente}(N - i)$$

Para os casos temos que o
- Melhor caso é quando o $T_{crescente} = 1$ dando por resultado $$\sum_{i = 0}^{N - 2}1 = N - 1$$
- Pior caso é quando o $T_{crescente} = N - 1$ dando por resultado $$\sum_{i = 0}^{N - 2}(N - i - 1)$$ desenvolvendo a expressão optemos o seguinte 
$$
\begin{align*}
\sum_{i = 0}^{N - 2}(N - i - 1) &= \sum_{i = 0}^{N - 2}(N - 1) - \sum_{i = 0}^{N - 2}i \\
&= (N - 1) \sum_{i = 0}^{N - 2}1 - \sum_{i = 0}^{N - 2}i \\
&= (N - 1)(N - 1) - \frac{(N - 2)(N - 1)}{2} \\
&= (N - i) \left((N - 1) - \frac{(N - 2)}{2} \right) \\
&= (N - 1) \frac{2N - 2 - N + 2}{2} \\
&= N \frac{(N - 1)}{2}
\end{align*}
$$

>[!note]- alternativamente
> $$
> \begin{align*}
> \sum_{i = 0}^{N - 2}(N - i - 1) &= (N - 1) + (N - 2) + (N - 3) + \dots + 1 \\
> &= \sum_{k = 1}^{N - 1}K \\
> &= N\frac{(N - 1)}{2} 
> \end{align*}
> $$

uma definição de `int maxcrsc(int v[], int N)` mais eficiente pode ser
```c
int maxcresc(int v[], int N){
  int r, c, i
  r = c = i = 1;
  for(; i < N - 1; i++){
    if(v[i] > v[i - 1]) c = c + 1;
    else c = 1;
    if(c > r) r = c;
  }
  return c;
}
```

pois a número de comparações deixa de ser exponencial e passa a ser lineal sendo podendo ser calculado pela expressão $$T_maxcresc(N) = \sum_{i = 1}^{N - 1}i$$

2)
```c
int mult1 (int x, int y){
  // pre: x>=0
  int a=x, b=y, r=0;
  while (a>0){
    r = r+b; a = a-1;
  }
  // pos: r == x * y
  return r;
}
```

```c
int mult2 (int x, int y){
  // pre: x>=0
  int a=x, b=y, r=0;
  while (a>0) {
    if (a%2 == 1) r = r+b;
    a=a/2; b=b*2;
  }
  // pos: r == x * y
  return r;
}
```

Exemplo: Seja $N$ o número de bits necessários para representar `x` então
$N = 5 \quad 2^{N - 1} \leq x \leq 2^N - 1$
$x = 16$ pois $1000_2$
$x = 31$ pois $1111_2$

Nos casos para `int mult1 (int x, int y)`:
- Melhor caso $2 \cdot 2^{N -1}$
- Pior caso $2 \cdot (2^N - 1)$

Nos casos para `int mult2 (int x, int y)`:
- Melhor caso $5 * 2 + 1$
- Pior caso $5 * 3$
