# Especificações

>[!navcard]- Ficha 1
> ![[ficha1_AeC.pdf]] 

1. 
```c
int fa (int x, int y){
  //pre: True
  ...
  //pos: (m == x || m == y) && m >= x && m >= y
}
```
A função `fa` retorna o maior número entre `x` e `y`

```c
int fb (int x, int y){
  //pre: x >= 0 && y >= 0
  ...
  //pos: x % r == 0 && y % r == 0
  return r;
}
```
A função `fb` retorna um divisor comum entre dois números não negativos.

```c
int fd(int a[], int N){
  //pre: n > 0
  ...
  //pos: 0 <= p < N && forall_{0 <= i < N} a[p] <= a[i]
  return p;
}
```
A função `fd` encontra o elemento minimo do array `a`.

```c
int fe(int a[], int N){
  //pre: N > 0
  ...
  //pos: forall_{o <= i <= N} x <= a[i] 
  return x;
}
```
A função `fe` retorna um elemento que é menor ou igual a todos os elementos do array `a`

```c
int ff(int a[], int N){
  //pre: N > 0
  ...
  //pos: forall_{0 <= i <= N} x <= a[i] && exists_{0 <= i < N} x == a[i]
  return x;
}
```

2. 
a) A função `int prod(int x, int y)` que calcula o produto de dois números inteiros não negativos
```c
int prod(int x, int y){
  //pre: x >= 0 && y >= 0
  ...
  //pos: r == x * y
  return r;
}
```

b) a função `int mdc(int a, int b)` que calcula o máximo divisor comum de dois inteiros positivos. 
```c
int mdc(int a, int b){
  //pre: a > 0 && b > 0
  ...
  //pos: a % r == 0 && b % r == 0 && forall_{i}(a % i == 0 && b % i == 0) => r >= i
}
```

e) a função `int isSorted(int v[], int N)` que testa se um array está ordenado por ordem crescente 
```c
int isSorted(int v[], int N){
  //pre: N > 0
  ...
  //pos: ((forall_{0 <= i < N - 1} v[i] <= v[i + 1]) <=> r != 1)
  return r;
}
```

d) a função `int maxPOrd(int v[], int N)` que calcula o comprimento do maior prefixo ordenado de um array
```c
int maxPOrd(int v[], int N){
  //pre: N > 0
  ...
  //pos: (forall_{i < r - 1} v[i] <= v[i + 1]) && v[r] < v[r - 1]
  return r;
}
```
