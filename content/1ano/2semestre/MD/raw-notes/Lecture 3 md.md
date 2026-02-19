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

# Lecture 3: Máximo Divisor Comum e Mínimo Múltiplo Comum

## 1. Máximo Divisor Comum (MDC)

**Definição:**
Sejam $a$ e $b$ dois inteiros, com pelo menos um deles não nulo. O **máximo divisor comum** de $a$ e $b$, denotado por $\text{mdc}(a, b)$ ou simplesmente $(a, b)$, é o inteiro $d$ tal que:
1.  $d | a$ e $d | b$ ($d$ é divisor comum).
2.  Se $c | a$ e $c | b$, então $c \leq d$ ($d$ é o maior de todos os divisores comuns).

> **Nota:** $\text{mdc}(a, b) = \text{mdc}(|a|, |b|)$, por isso geralmente trabalhamos com inteiros não negativos.

**Primos entre si (Coprimos):**
Dois inteiros $a$ e $b$ dizem-se **primos entre si** se $\text{mdc}(a, b) = 1$.

**Propriedades do MDC:**
* $\text{mdc}(a, b) = \text{mdc}(b, a)$
* $\text{mdc}(a, 0) = |a|$ (pois $a$ divide 0 e é o maior divisor de si mesmo).
* Se $a | b$, então $\text{mdc}(a, b) = |a|$.

---

## 2. Mínimo Múltiplo Comum (mmc)

**Definição:**
Sejam $a, b \in \mathbb{Z} \setminus \{0\}$. O **mínimo múltiplo comum** de $a$ e $b$, denotado por $\text{mmc}(a, b)$, é o menor inteiro positivo que é múltiplo de $a$ e de $b$.

---

## 3. Relação entre MDC e mmc

Existe uma relação fundamental que conecta estes dois conceitos, permitindo calcular um a partir do outro.

**Teorema:**
Para quaisquer inteiros positivos $a$ e $b$:
$$\text{mdc}(a, b) \cdot \text{mmc}(a, b) = a \cdot b$$

Para inteiros gerais (podendo ser negativos):
$$\text{mdc}(a, b) \cdot \text{mmc}(a, b) = |a \cdot b|$$


---
