---
topic: Divisibilidade
date: 2026-02-13
course: Matemática Discreta
tags:
  - Universidade
  - math
  - math/matematica-discreta
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

## 4. Cálculo do mdc e mmc usando Fatorização Prima

Pelo Teorema Fundamental da Aritmética, podemos expressar $a$ e $b$ através dos seus fatores primos. Se considerarmos os mesmos primos $p_i$ para ambos (usando expoentes zero caso um primo não divida um dos números), temos:
$$a = p_1^{\alpha_1} p_2^{\alpha_2} \dots p_k^{\alpha_k}$$
$$b = p_1^{\beta_1} p_2^{\beta_2} \dots p_k^{\beta_k}$$

Com esta representação, podemos calcular diretamente:

**Para o MDC (Máximo Divisor Comum):**
Escolhemos os fatores comuns com o **menor** expoente:
$$\text{mdc}(a, b) = p_1^{\min(\alpha_1, \beta_1)} p_2^{\min(\alpha_2, \beta_2)} \dots p_k^{\min(\alpha_k, \beta_k)}$$

**Para o mmc (Mínimo Múltiplo Comum):**
Escolhemos os fatores comuns e não comuns com o **maior** expoente:
$$\text{mmc}(a, b) = p_1^{\max(\alpha_1, \beta_1)} p_2^{\max(\alpha_2, \beta_2)} \dots p_k^{\max(\alpha_k, \beta_k)}$$
## Links
- [[Lecture 1 md]]
- [[Lecture 2 md]]