
# C - 1

## Correcção de um algoritmo

> [!quote]+
> Um algoritmo diz-se correcto se para todos os valores dos inputs (variáveis de entrada) ele pára com os valores esperados dos outputs (variáveis de saída). Neste caso diz-se que ele resolve o problema computacional em questão.

- Nem sempre a incorrecção é um motivo para a inutilidade de um algoritmo:
  - Em certas aplicações basta que funcione correctamente para alguns dos seus inputs.
  - Em problemas muito difíceis, pode ser suficiente obter soluções aproximadas.
- A análise da correcção pretende determinar se o algoritmo é correcto, e **em que condições**.
- Se não há fluxo de controlo, a demonstração faz-se por **simples inspecção**:

```c
int soma(int a, int b) {
  int sum = a+b;
  return sum;
}
```

- Por vezes a correcção advém da própria especificação (ex.: factorial recursivo, que segue de perto a definição):

```c
int factorial(int n) {
  int f;
  if (n<1) f = 1;
  else f = n*factorial(n-1);
  return f;
}
```

- No caso geral a análise é difícil, e deve ser feita com algum formalismo (lógica de programas).

---

## Especificações
A correcção de um programa está relacionada com a sua especificação (um programa que ordena um vector está correcto se essa for a especificação; está incorrecto se a especificação for inicializá-lo com zeros).

Para especificar um programa usam-se dois predicados que estabelecem as propriedades dos estados antes e depois da execução:
- a *pré-condição*: condições em que o programa deve funcionar (só interessam as execuções que a satisfazem);
- a *pós-condição*: o que deve acontecer após a execução (o que se quer provar verdadeiro no estado final).

### Asserções
Proposições lógicas sobre o estado actual do programa (o conjunto das suas variáveis). Exemplos:
- $x > 0$
- $a[i] < a[j]$
- $\forall i.\; 0 \leq i < n \Rightarrow a[i] < 1000$

> [!note]
> Em $a[i] < a[j]$, $i$ e $j$ são variáveis do programa: a fórmula é verdadeira ou falsa consoante o estado. Em $\forall i.\; 0 \leq i < n \Rightarrow a[i] < 1000$, $i$ é uma **variável ligada** pelo quantificador: não é variável do programa e pode ser renomeada (em todas as ocorrências).

### Exemplos

$\textbf{Exemplo 1 (swap).}$ Um programa que troca os valores das variáveis x e y.
- pré-condição: $True$
- pós-condição: $x = y \wedge y = x$

> [!note]
> - a pré-condição $True$ significa que não há quaisquer restrições ao funcionamento do programa;
> - a pós-condição apresentada não funciona bem: é uma forma rebuscada de dizer que no final x e y são **iguais**, o que não era o pretendido.

Por vezes a especificação precisa de relacionar valores de variáveis antes e depois da execução. Fixam-se os valores iniciais com **variáveis lógicas** ($x_0$, $y_0$), que não correspondem a nenhuma variável do programa:
- pré-condição: $x = x_0 \wedge y = y_0$
- pós-condição: $x = y_0 \wedge y = x_0$

$\textbf{Exemplo 2 (produto).}$
- pré-condição: $x = x_0 \wedge y = y_0 \geq 0$
- pós-condição: $m = x_0 * y_0$

> [!note]
> A especificação é omissa quanto ao que acontece a $x$ e $y$: podem ou não ser modificados.

$\textbf{Exemplo 3 (mod).}$ Coloca em m o resto da divisão inteira entre os valores iniciais de x e y.
- pré-condição: $x = x_0 > 0 \wedge y = y_0 \geq 0$
- pós-condição: $0 \leq m < y_0 \wedge \exists_{d \geq 0}\; d * y_0 + m = x_0$

$\textbf{Exemplo 4 (procura).}$ Procurar um dado valor ($x$) num vector ordenado ($v[]$ da posição $a$ a $b$).
- pré-condição: $(\forall_{a \leq i \leq b}\; v[i] = v_i) \wedge (\forall_{a \leq i < b}\; v_i \leq v_{i+1})$
- pós-condição: $(\forall_{a \leq i \leq b}\; v[i] = v_i) \wedge ((\exists_{a \leq i \leq b}\; v_i = x) \Rightarrow v[p] = x)$

> [!note]
> - O 1.º termo da pré-condição **fixa os valores iniciais** do vector. Ao aparecer também na pós-condição, obriga a que o vector **não seja alterado**.
> - O 2.º termo da pré-condição diz que o vector está **ordenado**. Alternativa: $\forall_{a \leq i,j \leq b}\; i \leq j \Rightarrow v_i \leq v_j$
> - O 2.º termo da pós-condição diz que, **se existir** um elemento igual a $x$, então $v[p] = x$. Não se especifica o valor de $p$ no caso de $x$ não ocorrer no vector.

---

## Triplos de Hoare

**Definição.** Um triplo de Hoare escreve-se
$$\{P\}\; C\; \{Q\}$$
- $C$ é o bloco de instruções cuja correcção se analisa
- $P$ é a pré-condição e $Q$ é a pós-condição

> [!quote]+
> O triplo $\{P\} C \{Q\}$ é **válido** (correcção parcial) quando todas as execuções de $C$ partindo de estados iniciais que satisfazem $P$, **caso terminem**, resultam num estado final que satisfaz $Q$.

### Contra-exemplo
$\{x > 0\}\; x = x + y\; \{x > 1\}$ **não é válido**:
- Estado inicial $A$: $x = 3,\ y = -5$. Verifica $P$ ($3 > 0$).
- Estado final $B$: $x = -2,\ y = -5$. Não verifica $Q$ ($-2 > 1$ é falso).

> [!tip]
> Para provar que um triplo **não** é válido basta **um contra-exemplo**. Para provar que **é** válido não se podem enumerar todos os estados, por isso usam-se **regras de prova**.

### Especificação de uma função (exemplo do mínimo)
```c
int min (int u[], int N) {
  // pre: N > 0
  C
  // pos: 0<=m<N && forall_{0<=i<N} a[m] <= a[i]
  return m;
}
```
A pós-condição é a versão ASCII de:
$$0 \leq m \wedge m < N \wedge \forall i.\; 0 \leq i \wedge i < N \rightarrow a[m] \leq a[i]$$

Provar a correcção = provar a validade de
$$\{N > 0\}\; C\; \{0 \leq m \wedge m < N \wedge \forall i.\; 0 \leq i \wedge i < N \rightarrow a[m] \leq a[i]\}$$

> [!note]
> A especificação funciona como um **caderno de encargos**: pode ser entregue a um programador, que tem de escrever um programa que a cumpra.

### Pós-condição alternativa (com $<$ em vez de $\leq$)
$$0 \leq m \wedge m < N \wedge \forall i.\; 0 \leq i < N \rightarrow a[m] < a[i]$$

> [!warning]
> Esta pós-condição é **insatisfazível**. Tomando $i = m$ (que está em $0 \leq i < N$), exigiria $a[m] < a[m]$, o que é **falso**.
> - Nenhum programa que termine pode satisfazê-la: **nenhuma implementação é correcta**.
> - Só seria "válido" para programas que **nunca terminam** (validade vacuosa, porque a correcção parcial só olha para as execuções que terminam).
> - Para exigir um mínimo **estrito** (único), a condição correcta seria $\forall i.\; 0 \leq i < N \wedge i \neq m \rightarrow a[m] < a[i]$.

---

## Relação com a implicação
- $P \Rightarrow Q$: se $P$ é válido, $Q$ também. $P$ é **mais forte** (mais restritivo) que $Q$.
- $\{P\} S \{Q\}$: se $P$ é válido antes de $S$, $Q$ é válido depois.

## Regras de prova

**Fortalecimento da pré-condição** (Fort)
$$\frac{R \Rightarrow P \qquad \{P\}\, S\, \{Q\}}{\{R\}\, S\, \{Q\}}$$

**Enfraquecimento da pós-condição** (Enfraq)
$$\frac{\{P\}\, S\, \{Q\} \qquad Q \Rightarrow R}{\{P\}\, S\, \{R\}}$$

**Consequência** (junta as duas)
$$\frac{P \Rightarrow P' \qquad \{P'\}\, S\, \{Q'\} \qquad Q' \Rightarrow Q}{\{P\}\, S\, \{Q\}}$$

**Atribuição** (Atrib1): a expressão $E$ calcula-se no estado **inicial**
$$\{P[x \backslash E]\}\; x = E\; \{P\}$$

**Atribuição** (Atrib2): versão mais usual
$$\frac{P \Rightarrow Q[x \backslash E]}{\{P\}\; x = E\; \{Q\}}$$

> [!example]
> $(x + y)[x \backslash x - y] = (x - y) + y$

**Sequência** (;)
$$\frac{\{P\}\, S_1\, \{R\} \qquad \{R\}\, S_2\, \{Q\}}{\{P\}\, S_1; S_2\, \{Q\}}$$

> [!tip]
> Com atribuições consecutivas, aplica-se a regra da atribuição **pela ordem inversa** (do fim para o início):
> $P \Rightarrow Q[x_n \backslash E_n] \cdots [x_2 \backslash E_2][x_1 \backslash E_1]$

> [!example] Atribuição simultânea vs. sequencial (com $a = 10,\ b = 6$)
> - `a = a + b; b = a - b` $\to$ $a = 16,\ b = 10$ (a 2.ª expressão usa o estado intermédio)
> - `a, b = a + b, a - b` $\to$ $a = 16,\ b = 4$ (ambas calculadas no estado inicial)

**Condicional** (ifThenElse)
$$\frac{\{P \wedge c\}\, S_1\, \{Q\} \qquad \{P \wedge \neg c\}\, S_2\, \{Q\}}{\{P\}\; \text{if } c\; S_1 \text{ else } S_2\; \{Q\}}$$

**Condicional sem else** (ifThen)
$$\frac{\{P \wedge c\}\, S\, \{Q\} \qquad (P \wedge \neg c) \Rightarrow Q}{\{P\}\; \text{if } c\; S\; \{Q\}}$$

**Ciclo** (while-1)
$$\frac{\{I \wedge c\}\, S\, \{I\}}{\{I\}\; \text{while } c\; S\; \{I \wedge \neg c\}}$$

**Ciclo** (while-3)
$$\frac{P \Rightarrow I \qquad \{I \wedge c\}\, S\, \{I\} \qquad (I \wedge \neg c) \Rightarrow Q}{\{P\}\; \text{while } c\; S\; \{Q\}}$$

> [!important] Premissas do ciclo
> 1. $P \Rightarrow I$: antes do ciclo, o **invariante** é verdadeiro.
> 2. $\{I \wedge c\}\, S\, \{I\}$: o invariante é **preservado** por cada iteração.
> 3. $(I \wedge \neg c) \Rightarrow Q$: à saída do ciclo, a **pós-condição** é estabelecida.

---

## Exemplos resolvidos

### Swap sem variável auxiliar (`x = x + y; y = x - y; x = x - y`)
Calcula-se de trás para a frente:
- $R_1 = (x = y_0 \wedge y = x_0)[x \backslash x - y] = (x - y = y_0 \wedge y = x_0)$
- $R_2 = R_1[y \backslash x - y] = (y = y_0 \wedge x - y = x_0)$
- Falta provar $(x = x_0 \wedge y = y_0) \Rightarrow R_2[x \backslash x + y] = (y = y_0 \wedge x = x_0)$. É o antecedente, logo é válido ✔

### Swap com variável auxiliar (`z = x; x = y; y = z`)
- $R_1 = (x = y_0 \wedge y = x_0)[y \backslash z] = (x = y_0 \wedge z = x_0)$
- $R_2 = R_1[x \backslash y] = (y = y_0 \wedge z = x_0)$
- $(x = x_0 \wedge y = y_0) \Rightarrow R_2[z \backslash x] = (y = y_0 \wedge x = x_0)$ ✔

### Máximo (`if (x > y) M = x; else M = y;`)
- pré: $x = x_0 \wedge y = y_0$; pós: $M = \max(x_0, y_0)$
- Ramo 1: $(x > y \wedge x = x_0 \wedge y = y_0) \Rightarrow x = \max(x_0, y_0)$
- Ramo 2: $(x \leq y \wedge x = x_0 \wedge y = y_0) \Rightarrow y = \max(x_0, y_0)$

### Multiplicação por somas sucessivas (`m = 0; d = y; while (d>0) { m = m + x; d = d - 1; }`)
- $I \doteq x = x_0 \wedge y = y_0 \wedge x_0 * d + m = x_0 * y_0 \wedge d \geq 0$
- O $d \geq 0$ é necessário para que, ao sair do ciclo ($d \leq 0$), se conclua $d = 0$.

---

## Anotações e condições de verificação (VC)
Disciplina de anotação:
- anotação de **pré** e **pós** no início e no fim;
- anotação **antes de qualquer comando que não seja atribuição**;
- anotação logo a seguir à condição do ciclo (o **invariante**).

| Construção | Condições de verificação |
|---|---|
| Atribuição $\{A_1\}\, x = E\, \{A_2\}$ | $A_1 \Rightarrow A_2[x \backslash E]$ |
| `if c S1 else S2` | VC de $\{A_1 \wedge c\} S_1 \{A_2\}$ e de $\{A_1 \wedge \neg c\} S_2 \{A_2\}$ |
| `if c S` | $(A_1 \wedge \neg c) \Rightarrow A_2$ e VC de $\{A_1 \wedge c\} S \{A_2\}$ |
| `while c` com inv. $A_2$ | $A_1 \Rightarrow A_2$; $(A_2 \wedge \neg c) \Rightarrow A_3$; VC de $\{A_2 \wedge c\} S \{A_2\}$ |

> [!example] Exponenciação inteira (`p = 1; while (b>0) { p = p*a; b = b-1; }`)
> - pré: $a = a_0 \wedge b = b_0 > 0$; pós: $p = a_0^{b_0}$
> - $I \doteq p = a_0^{b_0 - b} \wedge a = a_0 \wedge b \geq 0$
> - VC principal: $(I \wedge b > 0) \Rightarrow (p * a = a_0^{b_0-(b-1)} \wedge a = a_0 \wedge b - 1 \geq 0)$

> [!example] Algoritmo de Euclides (mdc)
> - pré: $a = a_0 > 0 \wedge b = b_0 > 0$; pós: $a = mdc(a_0, b_0)$
> - $I \doteq mdc(a, b) = mdc(a_0, b_0) \wedge a > 0 \wedge b > 0$
> - Usa-se o teorema $mdc(x, y) = mdc(x + y, y) = mdc(x, x + y)$ para justificar a preservação do invariante.

---

## Correcção total
A correcção parcial **não garante terminação**. Exemplo extremo: `while (True) Skip;` satisfaz qualquer especificação com $I = True$, porque o estado final nunca é atingido.

> [!quote]+
> $[P]\; S\; [Q]$ lê-se: o programa $S$ está **totalmente correcto** face a $(P, Q)$:
> 1. desde que $P$ seja válido, $S$ **termina**;
> 2. e, ao terminar, atinge estados em que $Q$ é válido.

- Todas as regras anteriores continuam válidas, **excepto a do ciclo**.
- Introduz-se o **variante** $V$: uma expressão inteira que
  1. **decresce estritamente** em cada iteração;
  2. **nunca desce de um valor fixo** (tipicamente $0$).

**Ciclo-T**
$$\frac{P \Rightarrow I \qquad (I \wedge c) \Rightarrow V \geq 0 \qquad [I \wedge c \wedge V = v_0]\, S\, [I \wedge V < v_0] \qquad (I \wedge \neg c) \Rightarrow Q}{[P]\; \text{while } c\; S\; [Q]}$$

> [!example]
> - `while (d>0) { m = m + x; d = d - 1; }` $\to$ variante $V = d$.
> - Se a condição for `d != 0`, já é preciso usar o **invariante** ($d \geq 0$) para provar $V \geq 0$.
> - Ciclos como o *hotpo* (`n = n/2` ou `n = 3n+1`) mostram que **encontrar um variante nem sempre é trivial**.

> [!tip] Variantes típicos
> - contador a subir até $N$ (`while (i<N)`): $V = N - i$
> - contador a descer até $0$: $V = i$
> - Euclides: $V = a + b$ (ou $\max(a, b)$)
> - divisão por subtracções (`while (r >= y)`): $V = r$

Nas VC, o bloco do ciclo passa a anotar-se com $\{I\}[V]$ e geram-se as condições:
1. $P \Rightarrow I$
2. $(I \wedge c) \Rightarrow V \geq 0$
3. $(I \wedge \neg c) \Rightarrow Q'$
4. VC de $\{I \wedge c \wedge V = v_0\}\, S\, \{I \wedge V < v_0\}$

---


# Reference:
- [[../../resources/C1.pdf]]
