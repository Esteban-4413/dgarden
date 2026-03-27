---
title: "Teoria de Números: Teoremas"
tags:
  - matematica-discreta
  - teoria-de-numeros
  - estudo
---

# Matemática Discreta: Teoremas de Congruências

Esta nota resume os conceitos essenciais de aritmética modular e os teoremas que servem de base para a criptografia moderna.

---

## 1. Função $\phi$ de Euler (Totiente)
A função $\phi(n)$ indica a quantidade de números entre $1$ e $n$ que são **coprimos** com $n$, ou seja, cujo máximo divisor comum com $n$ é $1$.

> [!INFO] Propriedades de Cálculo
> - **Se $p$ é primo**: $\phi(p) = p - 1$ [cite: 2026-02-02].
> - **Se $n = p^k$ (potência de primo)**: $\phi(p^k) = p^k - p^{k-1}$ [cite: 2026-02-02].
> - **Se $mdc(m, n) = 1$**: $\phi(m \cdot n) = \phi(m) \cdot \phi(n)$ [cite: 2026-02-02].

---

## 2. Pequeno Teorema de Fermat
Um teorema fundamental para simplificar potências em módulos primos.

> [!THEOREM] Pequeno Teorema de Fermat
> Seja $p$ um número primo e $a$ um inteiro tal que $p \nmid a$ (p não divide a) [cite: 2026-02-02]:
> $$a^{p-1} \equiv 1 \pmod p$$
> 
> *Forma Geral:* Para qualquer inteiro $a$, $a^p \equiv a \pmod p$ [cite: 2026-02-02].

---

## 3. Teorema de Euler
Este teorema é a generalização do Teorema de Fermat para qualquer módulo $n$, desde que haja coprimaridade.

> [!THEOREM] Teorema de Euler
> Se $a$ e $n$ são inteiros tais que $mdc(a, n) = 1$, então [cite: 2026-02-02]:
> $$a^{\phi(n)} \equiv 1 \pmod n$$

---

## 4. Teorema de Wilson
Uma propriedade elegante que caracteriza exclusivamente os números primos através do seu fatorial.

> [!THEOREM] Teorema de Wilson
> Um número natural $p > 1$ é primo se, e somente se [cite: 2026-02-02]:
> $$(p-1)! \equiv -1 \pmod p$$
> *(Ou equivalentemente: $(p-1)! \equiv p-1 \pmod p$)*

---

## 5. Teorema Chinês dos Restos (TCR)
O TCR permite resolver sistemas de várias congruências lineares com módulos diferentes.

> [!THEOREM] Teorema Chinês dos Restos
> Seja o sistema de congruências:
> $$\begin{cases} x \equiv a_1 \pmod{m_1} \\ x \equiv a_2 \pmod{m_2} \\ \dots \\ x \equiv a_k \pmod{m_k} \end{cases}$$
> Se os módulos $m_i$ forem **coprimos dois a dois** ($mdc(m_i, m_j) = 1$ para $i \neq j$), então o sistema tem uma **solução única** módulo $M = m_1 \cdot m_2 \dots m_k$.


## Lei do Corte (Cancelamento)

A Lei do Corte permite-nos simplificar uma congruência dividindo ambos os lados por um fator comum, mas exige um cuidado especial com o módulo $n$ [cite: 2026-02-02].

> [!THEOREM] Lei do Corte Geral
> Se tivermos a congruência:
> $$ac \equiv bc \pmod n$$
> Podemos dividir ambos os lados por $c$ se, e somente se, dividirmos o módulo pelo $mdc$ de $c$ e $n$:
> $$a \equiv b \pmod{\frac{n}{mdc(c, n)}}$$

> [!IMPORTANT] Caso Especial: Coprimaridade
> Se o número que queres "cortar" ($c$) for **coprimo** com o módulo ($mdc(c, n) = 1$), a regra simplifica-se e o módulo não se altera:
> $$ac \equiv bc \pmod n \implies a \equiv b \pmod n$$

---

###  Exemplo Prático
Considera a congruência: $10x \equiv 20 \pmod{15}$
1. Podemos ver que $10x \equiv 10(2) \pmod{15}$. Aqui, $c = 10$.
2. Calculamos o $mdc(10, 15) = 5$.
3. Aplicando a lei: $x \equiv 2 \pmod{15/5} \implies \mathbf{x \equiv 2 \pmod 3}$.

---

##  Porquê isto importa?
- **RSA**: A segurança das tuas compras online depende do Teorema de Euler e da dificuldade de calcular $\phi(n)$ para números gigantes.
- **Cálculo Rápido**: Estes teoremas permitem descobrir o resto de $3^{2000} \div 7$ em segundos, sem usar calculadora.

---

