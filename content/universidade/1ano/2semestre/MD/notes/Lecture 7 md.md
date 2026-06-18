---
topic: Congruencias
date: 2026-03-21
course: Matemática Discreta
tags:
  - Universidade
  - math/matematica-discreta
  - math
  - math/matematica-discreta
---
# Lecture 6: Congruências Lineares e Inversos Modulares

## 1. Congruências Lineares ($ax \equiv b \pmod n$)

Uma congruência linear é uma equação onde queremos descobrir o valor de $x$.
Para isolar o $x$, não podemos simplesmente "dividir" por $a$. Precisamos de multiplicar ambos os lados da equação pelo **inverso multiplicativo de $a$ módulo $n$**.

**Condição de Existência:**
A equação $ax \equiv b \pmod n$ tem solução se e só se o $\text{mdc}(a, n)$ dividir $b$.
Para encontrar o inverso de $a$ (quando $\text{mdc}(a, n) = 1$), utilizamos o Algoritmo de Euclides Estendido.

---

## 2. Exercício Prático (Algoritmo de Euclides Estendido)
[[mais_TN.pdf]]

**Pergunta:** Resolve a congruência linear $81x \equiv 37 \pmod{95}$.

> [!example]- Ver Resolução Passo a Passo
> **Passo 1: Verificar se existe inverso (Algoritmo de Euclides)**
> Calculamos o $\text{mdc}(81, 95)$:
> $95 = 81 \cdot 1 + 14$
> $81 = 14 \cdot 5 + 11$
> $14 = 11 \cdot 1 + 3$
> $11 = 3 \cdot 3 + 2$
> $3 = 2 \cdot 1 + \mathbf{1}$
> Como o último resto não nulo é 1, o $\text{mdc}$ é 1 e o inverso existe.
> 
> **Passo 2: Algoritmo Estendido (Trabalhar de baixo para cima)**
> Expressamos o 1 como combinação linear de 81 e 95 a partir das equações anteriores:
> $1 = 3 - 2 \cdot 1$
> $1 = 3 - (11 - 3 \cdot 3) = 4 \cdot 3 - 11$
> $1 = 4 \cdot (14 - 11 \cdot 1) - 11 = 4 \cdot 14 - 5 \cdot 11$
> $1 = 4 \cdot 14 - 5 \cdot (81 - 14 \cdot 5) = 29 \cdot 14 - 5 \cdot 81$
> $1 = 29 \cdot (95 - 81 \cdot 1) - 5 \cdot 81 = \mathbf{29 \cdot 95 - 34 \cdot 81}$
> 
> **Passo 3: Encontrar o Inverso**
> Analisando a equação módulo 95, o termo múltiplo de 95 desaparece:
> $-34 \cdot 81 \equiv 1 \pmod{95}$
> O inverso de 81 é -34. Para passar a um valor positivo dentro do módulo, somamos 95: 
> $-34 + 95 = \mathbf{61}$.
> 
> **Passo 4: Resolver a Equação Original**
> Multiplicamos ambos os lados da equação original pelo inverso descoberto (61):
> $81x \equiv 37 \pmod{95}$
> $61 \cdot 81x \equiv 61 \cdot 37 \pmod{95}$
> $x \equiv 2257 \pmod{95}$
> 
> **Passo 5: Simplificar (Menor Resto Positivo)**
> Dividimos 2257 por 95 para encontrar o resto e simplificar a resposta:
> $2257 = 95 \cdot 23 + 72$
> **Solução Final:** $x \equiv 72 \pmod{95}$.


## Links
- [[Lecture 1 md]]
- [[Lecture 2 md]]
- [[Lecture 3 md]]
- [[Lecture 4 md]]
- [[Lecture 5 md]]
- [[Lecture 6 md]]
