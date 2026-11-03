# Preliminares de Lógica: Definições Indutivas e Linguagens

## 1. Definições Indutivas de Conjuntos

> [!abstract] **Definição**
> Sejam $X$ um conjunto e $B$ um subconjunto não vazio de $X$. Seja $O$ um conjunto de operações em $X$ (funções do tipo $X^n \to X$, com $n \in \mathbb{N}$).
> Um subconjunto $I$ de $X$ tal que:
> i) $B \subseteq I$, e
> ii) $I$ é fechado para as operações de $O$
>
> é chamado um **conjunto indutivo**, sobre $X$, de base $B$ e conjunto de operações $O$.

> [!warning] **Nota**
> Os conjuntos indutivos, para uma dada base e operações, **não são únicos**: tanto $X$ como $B$ são, em geral, conjuntos indutivos (o primeiro para qualquer $O$; o segundo quando $O = \emptyset$).

> [!abstract] **Definição — conjunto definido indutivamente**
> O **menor** conjunto indutivo, sobre $X$, de base $B$ e conjunto de operações $O$ chama-se o conjunto **definido indutivamente** (ou **gerado**) por $O$ em $B$. Ao par $(B,O)$ chamamos uma **definição indutiva** sobre o suporte $X$.

> [!info] **Proposição**
> O conjunto $G$ gerado por $O$ em $B$ é a **interseção de todos os conjuntos indutivos**, sobre $X$, de base $B$ e operações $O$.
>
> Equivalentemente: os elementos de $G$ são exactamente os objetos obtidos a partir de $B$, aplicando um número **finito** de operações de $O$ — o que confirma a intuição do Lego da secção anterior.

### Exemplo — o conjunto $C$

Seja $C$ o menor subconjunto de $\mathbb{N}_0$ tal que:
1. $0 \in C$;
2. $\forall n \in \mathbb{N}_0$, se $n \in C$ então $n+2 \in C$.

Aqui, $X = \mathbb{N}_0$, $B = \{0\}$, e $O = \{ n \mapsto n+2 \}$.

Elementos de $C$: $0, 2, 4, \ldots$ — de facto:
- $0 \in C$ pela regra 1;
- $0 \in C \Rightarrow 2 \in C$ pela regra 2;
- $2 \in C \Rightarrow 4 \in C$ pela regra 2.

(Mais à frente mostramos, com indução estrutural, que $C$ é exactamente o conjunto dos números pares.)

## 2. Alfabetos, Palavras e Linguagens

> [!abstract] **Definições**
> 1. **Alfabeto**: um conjunto de símbolos; os seus elementos chamam-se **letras**.
> 2. **Palavra (ou string)** sobre um alfabeto $A$: uma sequência finita de letras de $A$. $A^*$ denota o conjunto de todas as palavras sobre $A$.
> 3. **Palavra vazia**, denotada $\epsilon$: a sequência vazia de letras (a única palavra de comprimento 0).
> 4. Dados $n \in \mathbb{N}$ e letras $a_1,\ldots,a_n \in A$, a notação $a_1a_2\ldots a_n$ representa a palavra cuja $i$-ésima letra é $a_i$.
> 5. **Comprimento** $|u|$ de uma palavra $u$: o comprimento da respetiva sequência de letras.
> 6. Duas palavras são **iguais** quando têm o mesmo comprimento e coincidem letra a letra.
> 7. **Concatenação**: dado $u,v$, a notação $uv$ representa $u$ seguida de $v$.
> 8. **Linguagem** sobre $A$: um conjunto de palavras sobre $A$, i.e., um subconjunto de $A^*$.

### Exemplo — a linguagem de expressões $E$

Seja $A = \{0, s, +, \times, (, )\}$. Definimos $E \subseteq A^*$ indutivamente por:
1. $0 \in E$;
2. $e \in E \implies s(e) \in E$;
3. $e_1, e_2 \in E \implies (e_1 + e_2) \in E$;
4. $e_1, e_2 \in E \implies (e_1 \times e_2) \in E$.

Aqui a base é $B = \{0\}$ e $O$ tem três operações: $s(\cdot)$, $(\cdot + \cdot)$ e $(\cdot \times \cdot)$.

**Pertencem a $E$**: $0$, $s(0)$, $(0 \times 0)$, $(s(0) + (0 \times 0))$.

**Não pertencem a $E$**: `+(00)`, `s0`. De facto, nenhuma palavra de $E$ começa por `+`, e nenhuma (exceto o próprio $0$) termina em `0`.

## 3. Sequências de Formação

> [!abstract] **Definição**
> Seja $(B,O)$ uma definição indutiva sobre $X$ de um conjunto $I$, e $e \in X$. Uma **sequência de formação** de $e$ é uma sequência finita de elementos de $X$ tal que:
> 1. o último elemento é $e$;
> 2. cada elemento pertence a $B$ **ou** é imagem de elementos anteriores na sequência por uma operação de $O$.

> [!example] **Exemplo**
> A sequência
> $$0,\ s(0),\ (0\times 0),\ (s(0) + (0\times 0))$$
> é uma sequência de formação de $(s(0)+(0\times 0))$ — representa exactamente a justificação passo-a-passo dada acima.
>
> **Não é única**: a sequência
> $$0,\ (0\times 0),\ s(0),\ (s(0)+(0\times 0))$$
> também serve. E, se um elemento admite uma sequência de formação, admite infinitas — basta prefixar com mais cópias de $0$.

> [!info] **Proposição**
> $e$ é elemento de $I$ **se e só se** $e$ admite uma sequência de formação.
>
> (Esta equivalência é a ponte que permite justificar o Princípio de Indução Estrutural a seguir.)

## 4. Princípio de Indução Estrutural

> [!quote] **Teorema — Indução Estrutural**
> Seja $(B,O)$ uma definição indutiva de $I$ sobre $X$, e $P(e)$ uma condição sobre $e \in I$. Se:
> 1. para todo $b \in B$, $P(b)$ é verdadeira;
> 2. para cada operação $f: X^n \to X$ de $O$ e para todo $e_1,\ldots,e_n \in I$, se $P(e_1),\ldots,P(e_n)$ são verdadeiras então $P(f(e_1,\ldots,e_n))$ é verdadeira;
>
> então, para todo $e \in I$, $P(e)$ é verdadeira.

**Demonstração**: seja $Y = \{e \in I : P(e) \text{ é verdadeira}\}$. Então $Y$ é indutivo (contém $B$ e é fechado para $O$). Como $I$ é o *menor* indutivo, $I \subseteq Y$. E como $Y \subseteq I$ por definição, segue $Y = I$. Logo $P(e)$ vale para todo $e \in I$. $\blacksquare$

> [!warning] **Nota**
> A cada definição indutiva corresponde o seu próprio princípio de indução estrutural. O **Princípio de Indução usual em $\mathbb{N}$** é apenas o caso particular associado à definição indutiva de $\mathbb{N}$ com base $\{1\}$ e operação $n \mapsto n+1$. Ou seja: a indução matemática "normal" **não é um princípio à parte** — é uma instância de indução estrutural.

### Exemplo — provando que $C$ são os pares

Princípio de indução estrutural para $C$ (base $\{0\}$, operação $n \mapsto n+2$): se $P(0)$ e ($P(k) \Rightarrow P(k+2)$ para todo $k \in C$), então $P(n)$ vale para todo $n \in C$.

Seja $P(n)$: "$n$ é par". Prova:
1. $0$ é par ⟹ $P(0)$ verdadeira.
2. Seja $k \in C$ com $P(k)$ verdadeira (H.I.: $k$ par). Então $k+2$ é soma de dois pares, logo par ⟹ $P(k+2)$ verdadeira.

Por indução estrutural, $P(n)$ vale para todo $n \in C$, i.e., $C \subseteq$ {números pares}.

(Para a inclusão inversa — todo par pertence a $C$ — usa-se indução comum em $\mathbb{N}_0$: mostra-se que $2n \in C$ para todo $n$. Exercício do slide.)

## 5. Recursão Estrutural

Uma definição indutiva também permite **definir funções** por casos, um caso por regra da definição — sem ter de "explicar" a função em geral, só dizer o que fazer em cada peça da construção.

### Exemplo — contar parênteses em $E$

Seja $np: E \to \mathbb{N}_0$ que conta ocorrências de parênteses numa expressão. Definida por recursão estrutural:
1. $np(0) = 0$;
2. $np(s(e)) = 2 + np(e)$;
3. $np((e_1+e_2)) = 2 + np(e_1) + np(e_2)$;
4. $np((e_1\times e_2)) = 2 + np(e_1) + np(e_2)$.

Repara no padrão: nos casos indutivos, o valor da função em algo *construído* depende só dos valores da função nas peças *usadas para construir* — nunca de nada mais.

> [!check]- **Demonstração** — $np(e)$ é sempre par, para todo $e \in E$
> Por indução estrutural em $E$, com $P(e)$: "$np(e)$ é par".
> 1. **Base**: $np(0) = 0$, par ⟹ $P(0)$ verdadeira.
> 2. **Caso $s(e)$**: assumindo $P(e)$ (H.I.: $np(e)$ par), $np(s(e)) = 2+np(e)$ é soma de dois pares ⟹ par.
> 3. **Caso $(e_1+e_2)$**: assumindo H.I. para $e_1, e_2$, $np((e_1+e_2)) = 2+np(e_1)+np(e_2)$ é soma de pares ⟹ par.
> 4. **Caso $(e_1\times e_2)$**: idêntico ao caso anterior.
>
> Pelo Princípio de Indução Estrutural para $E$, $np(e)$ é par para todo $e \in E$. $\blacksquare$

### Exemplo — recursão sobre $C$

	Existe uma única $f: C \to \mathbb{N}_0$ tal que $f(0)=0$ e $f(n+2) = 1+f(n)$ para todo $n \in C$. Prova-se (por indução estrutural em $C$) que $f(n) = n/2$ para todo $n \in C$.

## 6. Quando a recursão falha: definições indutivas não deterministas

> [!warning] **Nota importante**
> Nem toda a definição indutiva admite um princípio de recursão estrutural associado. Isso só é garantido para as **definições indutivas deterministas** — aquelas em que cada elemento admite uma **decomposição única**.

### Contra-exemplo

Acrescenta-se a $C$ uma terceira regra: se $n \in C$, então $2n \in C$. E tenta-se estender $f$ com $f(2n) = 2+f(n)$.

Agora, $4$ pode ser decomposto de duas formas diferentes:
- $4 = 2 \times 2$ (regra 3): $f(4) = 2+f(2) = 2+(1+f(0)) = 3$.
- $4 = 2+2$ (regra 2): $f(4) = 1+f(2) = 1+1 = 2$.

Duas imagens distintas para o mesmo elemento — impossível para uma função bem definida. Logo, **este** princípio de recursão estrutural não é válido para esta definição (não determinista).


