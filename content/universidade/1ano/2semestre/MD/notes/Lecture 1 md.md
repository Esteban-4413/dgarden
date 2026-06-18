---
topic: Introduction
date: 2026-02-02
course: Matemática Discreta
tags:
  - Universidade
  - math/matematica-discreta
  - math
---
# Información General
- **Profesor:** Pedro Patrício
- **Evaluación:**
	- 2 Testes.
	- Fecha 1º Test: 20 de marzo.
	- Nota: Los tests son la semana anterior al "Enterro da Gata".

# Programa
1. Teoria de Números (Enfoque actual)
2. Teoria de Grafos

---

# Conceitos Chave (Key Concepts)

## 1. Princípio da Boa Ordenação (P.B.O.)
Todo subconjunto não vazio de números naturais tem um elemento mínimo.

Seja $S \subseteq \mathbb{N}$ e $S \neq \emptyset$, então:
$$\exists a \in S : \forall b \in S, a \leq b$$

> **Nota:** Este princípio é fundamental para provar o algoritmo da divisão e a indução.

## 2. Propriedade Arquimediana
Para quaisquer dois números naturais, existe sempre um múltiplo do primeiro que supera o segundo. Ou seja, os naturais não são limitados superiormente.

$$\forall a, b \in \mathbb{N}, \exists n \in \mathbb{N} : n \cdot a > b$$

**Esboço da Demonstração (por absurdo):**
- Supomos que $\forall n \in \mathbb{N}, na \le b$.
- Definimos um conjunto $S$ com as diferenças.
- Pelo P.B.O., existiria um mínimo que levaria a uma contradição ($b - (n+1)a < \text{mínimo}$).

---

# Indução Matemática

## 1º Princípio da Indução
Para provar que uma propriedade $P(n)$ é verdadeira para todo $n \in \mathbb{N}$:
1.  **Base:** Provar que $P(1)$ é verdadeira.
2.  **Passo Indutivo:** Provar que se $P(k)$ é verdadeira, então $P(k+1)$ também é.
$$P(k) \implies P(k+1)$$

## Princípio da Indução Completa (Forte)
Às vezes é necessário assumir que a propriedade vale para **todos** os anteriores, não apenas o imediato.
$$(\forall k < n, P(k) \text{ é válida}) \implies P(n) \text{ é válida}$$

---

# Algoritmo da Divisão
Dados dois inteiros, existe uma única maneira de dividi-los com resto não negativo menor que o divisor.

**Teorema:**
$$\forall a \in \mathbb{Z}, b \in \mathbb{N}, \exists! (q, r) \in \mathbb{Z} \times \mathbb{Z} : a = bq + r \quad \text{com} \quad 0 \leq r < b$$

## Demonstração (Resumo Aula)

### 1. Existência (Usando P.B.O.)
Definimos o conjunto $S$ de todos os restos não-negativos possíveis:
$$S = \{ a - xb : x \in \mathbb{Z} \land a - xb \geq 0 \} \subseteq \mathbb{N}_0$$
- Pelo **P.B.O.**, $S$ tem um elemento mínimo. Chamamos esse mínimo de $r$.
- Definimos $q$ tal que $r = a - qb$.
- **Prova de que $r < b$:** Se $r \geq b$, poderíamos subtrair $b$ mais uma vez e obter um resto ainda menor que o mínimo (contradição).

### 2. Unicidade
Supomos que existem dois pares $(q, r)$ e $(q', r')$.
$$a = bq + r = bq' + r'$$
Manipulando a equação:
$$|r - r'| = |q - q'|b$$
Como $0 \le r, r' < b$, a distância entre eles é menor que $b$ ($|r-r'| < b$).
Isso implica que $|q - q'| < 1$. Como são inteiros, a única opção é $q = q'$, e consequentemente $r = r'$.