---
topic: Algoritmo de Euclides
date: 2026-02-13
course: Matemática Discreta
tags:
  - Universidade
  - math
  - math/matematica-discreta
---
# Lecture 4: O Algoritmo de Euclides

O método prático e eficiente para calcular o MDC de dois inteiros positivos, sem necessidade de fatorizar os números (o que seria muito difícil para números grandes).

---

## 1. Lema Fundamental (A Base Teórica)

O algoritmo baseia-se na propriedade de que o m.d.c. de dois números é igual ao m.d.c. de um deles e do resto da divisão do outro pelo primeiro.

**Teorema (Lema de Euclides):**
Sejam $a, b \in \mathbb{Z}$ com $b > 0$.
Se aplicarmos o algoritmo da divisão tal que $a = bq + r$ (com $0 \le r < b$), então:
$$\text{mdc}(a, b) = \text{mdc}(b, r)$$

> **Porquê?**
> Qualquer divisor comum a $a$ e $b$ divide também $r$ (pois $r = a - bq$).
> Qualquer divisor comum a $b$ e $r$ divide também $a$ (pois $a = bq + r$).
> Logo, o conjunto de divisores comuns é o mesmo.

---

## 2. Descrição do Algoritmo

Para calcular $\text{mdc}(a, b)$ com $a \ge b > 0$:

1.  Dividimos $a$ por $b$ para obter o resto $r_1$.
    * Se $r_1 = 0$, então $\text{mdc}(a, b) = b$. Fim.
    * Se $r_1 \neq 0$, passamos ao passo seguinte.
2.  Dividimos $b$ por $r_1$ para obter o resto $r_2$.
    * Se $r_2 = 0$, então $\text{mdc}(a, b) = r_1$. Fim.
3.  Repetimos o processo, dividindo sempre o **divisor anterior** pelo **resto anterior**.

**Cadeia de divisões sucessivas:**
$$
\begin{aligned}
a &= b q_1 + r_1 & (0 < r_1 < b) \\
b &= r_1 q_2 + r_2 & (0 < r_2 < r_1) \\
r_1 &= r_2 q_3 + r_3 & (0 < r_3 < r_2) \\
&\vdots & \\
r_{n-2} &= r_{n-1} q_n + r_n & (0 < r_n < r_{n-1}) \\
r_{n-1} &= r_n q_{n+1} + 0 & (\text{resto nulo!})
\end{aligned}
$$

---

## 3. Teorema do Algoritmo de Euclides

O processo de divisões sucessivas termina eventualmente (pois os restos são inteiros positivos decrescentes: $b > r_1 > r_2 > \dots \ge 0$).

**Conclusão:**
O **último resto não nulo** ($r_n$) é o Máximo Divisor Comum de $a$ e $b$.

$$\text{mdc}(a, b) = r_n$$

---

## 4. Exemplo Prático

Calcular o **mdc(252, 198)**.

1.  Dividir 252 por 198:
    $$252 = 198 \cdot 1 + \mathbf{54}$$
    *(O resto é 54. Agora fazemos mdc(198, 54))*

2.  Dividir 198 por 54:
    $$198 = 54 \cdot 3 + \mathbf{36}$$
    *(O resto é 36. Agora fazemos mdc(54, 36))*

3.  Dividir 54 por 36:
    $$54 = 36 \cdot 1 + \mathbf{18}$$
    *(O resto é 18. Agora fazemos mdc(36, 18))*

4.  Dividir 36 por 18:
    $$36 = 18 \cdot 2 + \mathbf{0}$$
    *(Resto zero! O processo termina).*

**Resultado:**
O último resto não nulo foi **18**.
Logo, $\text{mdc}(252, 198) = 18$.

---

### Nota para o futuro (Algoritmo Estendido)
Este processo pode ser "invertido" para escrever o m.d.c. como uma combinação linear dos números originais:
$$18 = 252x + 198y$$
Isto será fundamental para resolver **Equações Diofantinas** e calcular **Inversos Modulares**.

## Links
- [[Lecture 1 md]]
- [[Lecture 2 md]]
- [[Lecture 3 md]]
