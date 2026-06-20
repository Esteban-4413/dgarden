---
topic: Congruencias
date: 2026-02-24
course: Matemática Discreta
tags:
  - Universidade
  - math
  - math
  - math/matematica-discreta
---
# Lecture 6: Introdução às Congruências (Aritmética Modular)

## 1. A Ideia Intuitiva: Aritmética do Relógio e do Calendário

Para percebermos congruências, vamos resolver um problema do quotidiano.
Hoje é um determinado dia da semana (por exemplo, terça-feira). **Que dia da semana será daqui a exatos 100 dias?**

Não precisamos de contar 100 dias no calendário. A semana funciona num ciclo de 7 dias. Por isso, só nos interessa saber quantas "semanas completas" cabem em 100 dias e, mais importante, **quantos dias sobram (o resto)**.

Usando o Algoritmo da Divisão:
$$100 = 7 \cdot 14 + 2$$
Isto significa que 100 dias equivalem a 14 semanas completas mais 2 dias. No nosso "relógio semanal", avançar 100 dias tem exatamente o mesmo efeito que avançar apenas 2 dias. Se hoje for terça-feira, daqui a 100 dias será **quinta-feira**.

Na matemática discreta, dizemos que 100 e 2 são **congruentes módulo 7**, porque ambos deixam o mesmo resto quando divididos por 7.
Escreve-se:
$$100 \equiv 2 \pmod 7$$

---

## 2. Definição Formal de Congruência

Sejam $a, b \in \mathbb{Z}$ e $n \in \mathbb{N}$ (com $n > 1$). Dizemos que **$a$ é congruente com $b$ módulo $n$** se e só se o $n$ dividir a diferença entre $a$ e $b$.

**Definição:**
$$a \equiv b \pmod n \iff n | (a - b)$$

> **O que isto significa na prática?**
> Dizer que $n | (a - b)$ é matematicamente equivalente a dizer que **$a$ e $b$ deixam exatamente o mesmo resto quando divididos por $n$**. 
> Por exemplo, $17 \equiv 5 \pmod 4$, porque tanto o 17 como o 5 deixam resto 1 quando divididos por 4 (e repara que $17 - 5 = 12$, que é divisível por 4).

> **Definição Alternativa (Muito Útil para Demonstrações):**
> Pela definição de divisibilidade, $a \equiv b \pmod n$ é equivalente a dizer que existe um inteiro $k$ tal que $a - b = kn$, ou seja:
> $$a = b + kn \quad (k \in \mathbb{Z})$$


## 3. Aplicação Prática: Identificar Quadrados Perfeitos

Uma das utilidades mais poderosas das congruências e dos restos da divisão é provar que certos números **não podem** ser quadrados perfeitos ($x^2$).

Vamos analisar os restos possíveis quando dividimos um número por 4.
Pelo Algoritmo da Divisão, qualquer inteiro $n$ deixa um resto de $0, 1, 2$ ou $3$ quando dividido por $4$. Em linguagem de congruências:
$$n \equiv 0, 1, 2, \text{ ou } 3 \pmod 4$$

O que acontece se elevarmos $n$ ao quadrado? Vamos testar todos os casos:
1. Se $n \equiv 0 \pmod 4 \implies n^2 \equiv 0^2 \equiv \mathbf{0} \pmod 4$
2. Se $n \equiv 1 \pmod 4 \implies n^2 \equiv 1^2 \equiv \mathbf{1} \pmod 4$
3. Se $n \equiv 2 \pmod 4 \implies n^2 \equiv 2^2 \equiv 4 \equiv \mathbf{0} \pmod 4$ *(pois 4 dividido por 4 dá resto 0)*
4. Se $n \equiv 3 \pmod 4 \implies n^2 \equiv 3^2 \equiv 9 \equiv \mathbf{1} \pmod 4$ *(pois 9 dividido por 4 dá resto 1)*

**Conclusão Brilhante:**
Um quadrado perfeito, quando dividido por 4, **só pode deixar resto 0 ou resto 1**. 
$$\forall x \in \mathbb{Z}, \quad x^2 \equiv 0 \pmod 4 \quad \lor \quad x^2 \equiv 1 \pmod 4$$

> [!example] Exemplo de Exame
> **Pergunta:** O número $7957438258273932485981242$ pode ser um quadrado perfeito?
> **Resposta:** Não! Sabemos que um número é divisível por 4 se os seus dois últimos algarismos formarem um número divisível por 4. Os dois últimos algarismos são 42. Se dividirmos 42 por 4, o resto é **2** ($42 = 4 \cdot 10 + 2$). 
> Como vimos, nenhum quadrado perfeito pode deixar resto 2 quando dividido por 4. Logo, é impossível que este número gigante seja o quadrado de algum inteiro, sem precisarmos de calcular nenhuma raiz quadrada!

---

## 4. Relação de Equivalência

A congruência módulo $n$ comporta-se exatamente como uma relação de igualdade ($=$), pois cumpre três propriedades fundamentais.

**Teorema:** A relação de congruência módulo $n$ é uma relação de equivalência (é Reflexiva, Simétrica e Transitiva).

> [!check]- Ver Demonstração das 3 propriedades
> **1. Reflexiva ($a \equiv a \pmod n$):**
> Qualquer número divide o zero, logo $n | 0$. Como $0 = a - a$, temos que $n | (a - a)$, o que por definição significa $a \equiv a \pmod n$.
> 
> **2. Simétrica (Se $a \equiv b \pmod n$, então $b \equiv a \pmod n$):**
> Se $a \equiv b \pmod n$, então $n | (a - b)$. Logo, existe $k \in \mathbb{Z}$ tal que $a - b = kn$.
> Multiplicando por $-1$, obtemos $b - a = (-k)n$. Como $-k$ também é inteiro, conclui-se que $n | (b - a)$, logo $b \equiv a \pmod n$.
> 
> **3. Transitiva (Se $a \equiv b \pmod n$ e $b \equiv c \pmod n$, então $a \equiv c \pmod n$):**
> Sabemos que $n | (a - b)$ e $n | (b - c)$. 
> Pela propriedade da combinação linear da divisibilidade, $n$ divide a soma destes dois termos.
> $(a - b) + (b - c) = a - c$.
> Como $n | (a - c)$, concluímos que $a \equiv c \pmod n$. $\blacksquare$

---

## 5. Álgebra das Congruências (Operações Aritméticas)

A grande vantagem das congruências é que podemos somar, subtrair e multiplicar equações modulares como se fossem equações normais.

**Teorema:** Sejam $a, b, c, d \in \mathbb{Z}$ e $n \in \mathbb{N}$ ($n > 1$). Se $a \equiv b \pmod n$ e $c \equiv d \pmod n$, então são válidas as seguintes operações:
1. **Adição:** $a + c \equiv b + d \pmod n$
2. **Subtração:** $a - c \equiv b - d \pmod n$
3. **Multiplicação:** $a \cdot c \equiv b \cdot d \pmod n$
4. **Potenciação:** $a^k \equiv b^k \pmod n$ (para qualquer $k \in \mathbb{N}$)

> [!check]- Ver Demonstração (Adição e Multiplicação)
> **Prova da Adição:**
> Sabemos que $n | (a - b)$ e $n | (c - d)$. 
> Logo, $n$ divide a soma: $(a - b) + (c - d)$.
> Reorganizando os termos: $(a + c) - (b + d)$.
> Como $n | ((a + c) - (b + d))$, por definição, $a + c \equiv b + d \pmod n$. $\blacksquare$
> 
> **Prova da Multiplicação:**
> Usando a definição alternativa, existem inteiros $k$ e $j$ tais que:
> $a = b + kn$ e $c = d + jn$.
> Multiplicando $a$ por $c$:
> $ac = (b + kn)(d + jn)$
> $ac = bd + bjn + knd + kjn^2$
> $ac - bd = n(bj + kd + kjn)$
> Como $(bj + kd + kjn)$ é um número inteiro, temos que $n | (ac - bd)$, o que significa que $ac \equiv bd \pmod n$. $\blacksquare$

---

## 4. O Cuidado com a Divisão (Lei do Corte)

Ao contrário da adição e multiplicação, **NÃO podemos simplesmente "cortar" ou dividir** ambos os lados de uma congruência.

**Teorema (A Lei do Corte Modular):**
Se $ac \equiv bc \pmod n$, só podemos "cortar" o $c$ se ele for **primo entre si** com o módulo $n$.
Ou seja, se $ac \equiv bc \pmod n$ e o $\text{mdc}(c, n) = 1$, então $a \equiv b \pmod n$.

*(Se o mdc não for 1, a congruência não se mantém! Por exemplo: $2 \cdot 4 \equiv 2 \cdot 1 \pmod 6$, mas $4 \not\equiv 1 \pmod 6$)*.

## Links
- [[Lecture 1 md]]
- [[Lecture 2 md]]
- [[Lecture 3 md]]
- [[Lecture 4 md]]
- [[Lecture 5 md]]
