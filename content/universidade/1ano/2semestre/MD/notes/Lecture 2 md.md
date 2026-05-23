---
topic: Divisibilidade
date: 2026-02-13
course: Matemática Discreta
tags:
  - Universidade
  - math
  - matematicaDiscreta
---
# Lecture 2: Divisibilidade e Números Primos

## 1. Divisibilidade

A teoria dos números foca-se nas propriedades dos números inteiros ($\mathbb{Z}$). A noção de divisibilidade é central.

**Definição:**
Sejam $a, b \in \mathbb{Z}$ com $a \neq 0$. Diz-se que **$a$ divide $b$** (escreve-se $a | b$) se e só se existe um inteiro $c$ tal que $b = a \cdot c$.

* **Terminologia:**
    * $a$ é divisor de $b$.
    * $b$ é múltiplo de $a$.
    * $a$ é um fator de $b$.

### Propriedades da Divisibilidade
Sejam $a, b, c, d \in \mathbb{Z}$. As seguintes propriedades são fundamentais:

1.  **Reflexiva:** $a | a$ (para todo $a \neq 0$).
2.  **Universal:** $1 | a$ (para todo $a$).
3.  **Transitiva:** Se $a | b$ e $b | c$, então $a | c$.
4.  **Linearidade (Muito Importante):** Se $d | a$ e $d | b$, então $d$ divide qualquer combinação linear de $a$ e $b$.
    $$\forall x, y \in \mathbb{Z} \implies d | (ax + by)$$
5.  **Multiplicação:** Se $a | b$, então $ac | bc$ (para $c \neq 0$).
6.  **Limitação (em valor absoluto):** Se $a | b$ e $b \neq 0$, então $|a| \leq |b|$.
7.  **Anti-simetria (nos Naturais):** Se $a | b$ e $b | a$, com $a, b > 0$, então $a = b$. (Em $\mathbb{Z}$, $a = \pm b$).

---

## 2. Números Primos

**Definição:**
Um inteiro $p > 1$ é chamado de **número primo** se os seus únicos divisores positivos forem $1$ e $p$.
* Se um inteiro $n > 1$ não é primo, diz-se que é **composto**.

**Teorema Fundamental da Aritmética (T.F.A):**
Todo o inteiro $n > 1$ pode ser representado como um produto de números primos de forma única (a menos da ordem dos fatores).

$$n = p_1^{\alpha_1} p_2^{\alpha_2} \dots p_k^{\alpha_k}$$

**Teorema (Infinitude dos Primos):**
Existem infinitos números primos.

---
**O Crivo de Eratóstenes:**
É um algoritmo simples e prático para encontrar todos os números primos até um determinado limite $N$. 
* **Método:** Escreve-se uma lista de números de 2 até $N$. O primeiro número (2) é primo. De seguida, riscam-se todos os seus múltiplos. O próximo número não riscado (3) é primo. Riscam-se os seus múltiplos, e assim sucessivamente, até atingir a raiz quadrada de $N$ ($\sqrt{N}$). Os números que sobrarem sem ser riscados são todos primos.
---

## Links 
- [[Lecture 1 md]]