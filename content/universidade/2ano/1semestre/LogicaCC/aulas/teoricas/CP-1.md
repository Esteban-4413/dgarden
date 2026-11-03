# Lógica CC — Resumo do Cap. 1: Preliminares, definições indutivas e linguagens

## 0. Ideia central

Quase tudo o que vem a seguir (fórmulas, derivações, termos, …) define-se **indutivamente**. Este capítulo dá três ferramentas que serão usadas ao longo de todo o semestre:

1. **Definir** conjuntos de forma indutiva.
2. **Demonstrar** propriedades sobre esses conjuntos por **indução estrutural**.
3. **Definir funções** sobre eles por **recursão estrutural**.

---

## 1. Definições indutivas

**Ingredientes** (Def. 2 e 4):

- um conjunto suporte $X$;
- uma **base** $B \subseteq X$, não vazia;
- um conjunto $O$ de **operações** em $X$, isto é, funções $f : X^n \to X$ com $n \in \mathbb{N}$.

Um subconjunto $I \subseteq X$ diz-se **indutivo** (de base $B$ e operações $O$) quando:

1. $B \subseteq I$;
2. $I$ é **fechado** para as operações de $O$: para cada $f : X^n \to X$ em $O$ e cada $(x_1,\dots,x_n) \in I^n$, tem-se $f(x_1,\dots,x_n) \in I$.

O **conjunto definido indutivamente** (ou **gerado**) por $O$ em $B$ é o **mais pequeno** conjunto indutivo. O par $(B, O)$ chama-se uma **definição indutiva** sobre o conjunto suporte $X$.

**Porquê «o mais pequeno»?** (Obs. 3) Porque $X$ é sempre indutivo, e $B$ também o é quando $O = \emptyset$. Os conjuntos indutivos não são únicos, pelo que se exige o menor (isto é, o contido em todos os outros).

**Duas caracterizações equivalentes** do conjunto gerado $G$ (Obs. 6):

- $G$ é a **interseção** de todos os conjuntos indutivos de base $B$ e operações $O$;
- os elementos de $G$ são exatamente os objetos obtidos a partir de $B$ por aplicação de um **número finito** de operações de $O$.

### Exemplo 1 — os números pares

$C$ é o menor subconjunto de $\mathbb{N}_0$ tal que:

1. $0 \in C$;
2. para todo $n \in \mathbb{N}_0$, se $n \in C$, então $n + 2 \in C$.

Aqui, $X = \mathbb{N}_0$, $B = \{0\}$ e $O = \{\, n \mapsto n+2 \,\}$ (Exercício 5). Mostra-se que $C$ é o conjunto dos números pares.

### Exemplo 8 — expressões aritméticas $E$

Alfabeto $A = \{0,\, s,\, +,\, \times,\, (,\, )\}$. A linguagem $E \subseteq A^*$ define-se por:

1. $0 \in E$;
2. $e \in E \Rightarrow s(e) \in E$;
3. $e_1, e_2 \in E \Rightarrow (e_1 + e_2) \in E$;
4. $e_1, e_2 \in E \Rightarrow (e_1 \times e_2) \in E$.

Pertencem a $E$: $0$, $s(0)$, $(0 \times 0)$, $(s(0) + (0 \times 0))$. **Não** pertencem: $+(00)$ e $s0$.

---

## 2. Alfabetos, palavras e linguagens (Def. 7)

| Conceito | Definição |
|---|---|
| **Alfabeto** | conjunto de símbolos; os seus elementos são as *letras* |
| **Palavra** sobre $A$ | sequência finita de letras de $A$ |
| $A^*$ | conjunto de todas as palavras sobre $A$ |
| **Palavra vazia** $\epsilon$ | sequência sem letras; $\lvert\epsilon\rvert = 0$ |
| **Comprimento** $\lvert u\rvert$ | comprimento da sequência de letras de $u$ |
| **Igualdade** | mesmo comprimento e coincidência letra a letra |
| **Concatenação** $uv$ | primeiro as letras de $u$, depois as de $v$ |
| **Linguagem** sobre $A$ | qualquer subconjunto de $A^*$ |

Nota: as palavras $p_1$ e $(p_1)$ são **diferentes**.

---

## 3. Sequências de formação (Def. 9, Prop. 11)

Uma **sequência de formação** de $e \in X$ é uma sequência finita de elementos de $X$ em que:

1. o **último** elemento é $e$;
2. **cada** elemento pertence a $B$ ou é imagem, por uma operação de $O$, de elementos **anteriores** da sequência.

**Exemplo.** Uma sequência de formação de $(s(0) + (0 \times 0))$:

$$0,\quad s(0),\quad (0 \times 0),\quad (s(0) + (0 \times 0))$$

**Proposição 11.** $e \in I \iff e$ admite uma sequência de formação.

Observações (Obs. 12):

- A sequência **não é única**: $0,\ (0\times 0),\ s(0),\ (s(0)+(0\times 0))$ também serve.
- Se existe uma, existem **infinitas** (basta acrescentar $0$'s no início).
- Uma sequência de formação é, no essencial, a justificação passo a passo de que a palavra pertence ao conjunto.

---

## 4. Indução estrutural (Teor. 14)

**Enunciado.** Seja $(B,O)$ uma definição indutiva de $I$ sobre $X$ e $P(e)$ uma propriedade sobre $e \in I$. Se:

1. **Base:** $P(b)$ é verdadeira para todo $b \in B$;
2. **Passo indutivo:** para cada $f : X^n \to X$ em $O$ e para todos $e_1,\dots,e_n \in I$, se $P(e_1),\dots,P(e_n)$ são verdadeiras (**hipóteses de indução**, H.I.), então $P(f(e_1,\dots,e_n))$ é verdadeira;

então $P(e)$ é verdadeira **para todo $e \in I$**.

**Porque funciona** (ideia da demonstração). Seja $Y = \{\, e \in I : P(e) \,\}$. As condições 1 e 2 dizem que $Y$ é um conjunto indutivo. Como $I$ é o *mais pequeno* conjunto indutivo, $I \subseteq Y$; e por definição $Y \subseteq I$. Logo $Y = I$.

**Observações:**

- **Cada definição indutiva tem o seu próprio princípio de indução estrutural.**
- A indução usual em $\mathbb{N}$ é o caso particular em que $\mathbb{N}$ é o menor conjunto com $1 \in \mathbb{N}$ e $n \in \mathbb{N} \Rightarrow n+1 \in \mathbb{N}$.
- Para $C$ (os pares) o princípio é: $P(0)$ e, para todo $k \in C$, $P(k) \Rightarrow P(k+2)$.
- Para $E$ há **um caso por cada regra**: $P(0)$; $P(e) \Rightarrow P(s(e))$; $P(e_1) \wedge P(e_2) \Rightarrow P((e_1+e_2))$; e o mesmo para $\times$.

### Receita para uma demonstração por indução estrutural

1. Definir com clareza a propriedade $P(e)$.
2. Escrever um caso por cada elemento da base e por cada operação.
3. Em cada passo indutivo, **enunciar a H.I.** e dizer o que se pretende provar.
4. Concluir invocando o princípio de indução estrutural.

---

## 5. Recursão estrutural

**Ideia:** definir uma função em $I$ indicando o seu valor na base e, para cada regra, o valor de $f(e_1,\dots,e_n)$ **à custa dos valores nas subexpressões diretas**.

### Exemplo 18 — número de parênteses $np : E \to \mathbb{N}_0$

$$
\begin{aligned}
np(0) &= 0\\
np(s(e)) &= 2 + np(e)\\
np((e_1 + e_2)) &= 2 + np(e_1) + np(e_2)\\
np((e_1 \times e_2)) &= 2 + np(e_1) + np(e_2)
\end{aligned}
$$

**Propriedade provada por indução estrutural:** para todo $e \in E$, $np(e)$ é par.

- Base: $np(0) = 0$, que é par.
- Passos: $2 + (\text{par})$ e $2 + (\text{par}) + (\text{par})$ são pares.

### Exemplo 19 — em $C$

Existe uma e uma só função $f : C \to \mathbb{N}_0$ tal que $f(0) = 0$ e $f(n+2) = 1 + f(n)$. Prova-se (exercício) que $f(n) = \dfrac{n}{2}$ para todo $n \in C$.

### Atenção: nem toda a definição indutiva admite recursão (Obs. 20)

O princípio de recursão estrutural só é válido para as definições indutivas **deterministas**, isto é, aquelas em que cada elemento tem uma **decomposição única**. $C$ e $E$ são deterministas.

**Contraexemplo.** Acrescente-se a $C$ a regra «se $n \in C$, então $2n \in C$» e a cláusula $f(2n) = 2 + f(n)$. Então $f(4)$ teria dois valores:

- por $4 = 2 \times 2$: $f(4) = 2 + f(2) = 2 + 1 + f(0) = \mathbf{3}$;
- por $4 = 2 + 2$: $f(4) = 1 + f(2) = 1 + 1 = \mathbf{2}$.

Isto é impossível, logo a função não está bem definida (a decomposição de $4$ não é única).

---

