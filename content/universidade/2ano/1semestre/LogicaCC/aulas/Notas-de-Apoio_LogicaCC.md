# Preliminares: definições indutivas e linguagens 
$\textbf{Definição:}$ Sejam $X$ um conjunto e $B$ um subconjunto não vazio de $X$. Seja $ O$ um conjunto de *operações* em $X$ (*i.e.*, funções do tipo $X^N \to X$, com $n \in \mathbb{N}$). Um subconjunto $I$ de $X$ tal que
  i) $B \subseteq I$ e
  ii) $I$ é *fechado* para as operações de $O$ (*i.e.,* as operações de $O$ quando aplicadas a elementos de $I$ produzem elementos de $I$ ou, por outras palavras, para cada operação $f: X^n \to X$ de $O$ e para cada $(x_1,\dots, x_n) \in I^n$, $f(x_1, \dots, x_n) \in I$)
é chamado um **conjunto indutivo**, sobre $X$, de base $B$ e **conjunto de operações** $O$. 

As chamadas **definições indutivas de conjuntos** é um mecanismo útil para definir conjuntos. Por exemplo, podemos definir o conjunto dos números pares da seguinte forma:

$\textbf{Exemplo}$ Seja $C$ o menor subconjunto de $\mathbb{N}_0$ que satisfaz as seguintes condições:
  - 1. $0 \in C$
  - 2. para todo $n \in \mathbb{N}_0$, se $n \in C$, então $n + 2 \in C$.
 
 Assim temos que:
- $0$ é um elemento de $C$, por $C$ satisfazer 1;
- sabendo que $0 \in C$, por $C$ satisfazer 2., segue $0+2=2 \in C$;
- sabendo que $2 \in C$, por $C$ satisfazer 2., segue $2+2=4 \in C$.

[[apontamentos.pdf]]
