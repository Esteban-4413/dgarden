---
topic: Teorema fundamental da aritmética
date: 2026-02-24
course: Matemática Discreta
tags:
  - Universidade
  - math
  - math/matematica-discreta
---
# Lecture 5: O Teorema Fundamental da Aritmética e Números Primos

## 1. O Teorema Fundamental da Aritmética (T.F.A.)

Este teorema garante que os números primos são os "blocos de construção" de todos os inteiros.

**Teorema:**
Todo o número inteiro $n > 1$ pode ser expresso como um produto de números primos de forma única, a não ser pela ordem dos fatores.
$$n = p_1^{\alpha_1} p_2^{\alpha_2} \dots p_k^{\alpha_k}$$

### Propriedade Chave: O Lema de Euclides
Para provar a *unicidade* do T.F.A., usa-se uma propriedade fundamental da divisibilidade com números primos.
**Lema:** Se $p$ é um número primo e $p | (ab)$, então $p | a$ ou $p | b$.
*(Atenção: isto só é garantido se $p$ for primo. Por exemplo, $4 | (2 \cdot 6)$, mas o 4 não divide o 2 nem divide o 6).*

**Exemplo Prático do T.F.A.:**
A decomposição do número 120:
$120 = 2 \cdot 60 = 2 \cdot 2 \cdot 30 = 2 \cdot 2 \cdot 2 \cdot 15 = 2^3 \cdot 3 \cdot 5$
Não existe nenhuma outra combinação de primos que resulte em 120.

---

## 2. O Crivo de Eratóstenes

O Crivo de Eratóstenes é um algoritmo eficiente para encontrar todos os números primos menores ou iguais a um determinado número inteiro $N$.



**O Algoritmo:**
1. Escrevemos uma lista de todos os inteiros de 2 até $N$.
2. O primeiro número não marcado é o 2 (que é primo). Deixamos o 2 e riscamos da lista todos os seus múltiplos (4, 6, 8, 10...).
3. O próximo número não riscado é o 3 (primo). Riscamos todos os múltiplos de 3.
4. Repetimos o processo para o 5, o 7, etc.
5. **Critério de Paragem:** Só precisamos de testar e riscar múltiplos para os primos $p$ tais que $p \le \sqrt{N}$. Todos os números que sobrarem na lista sem serem riscados são primos.

**Exemplo Prático (Primos até 30):**
* $N = 30$. Como $\sqrt{30} \approx 5.47$, só precisamos de riscar os múltiplos dos primos 2, 3 e 5.
* Múltiplos de 2 riscados: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30.
* Múltiplos de 3 riscados: 9, 15, 21, 27.
* Múltiplos de 5 riscados: 25.
* Os números que sobram são garantidamente primos: **2, 3, 5, 7, 11, 13, 17, 19, 23, 29**.

---

## 3. Teorema de Euclides (Infinitude dos Primos)

**Teorema a Provar:** Existem infinitos números primos. 
*(Dica para estudo: Usa a demonstração por redução ao absurdo construindo um número $N$).*

> [!check]- Ver Demonstração Passo a Passo
> 1. **Suposição inicial:** Vamos supor, por absurdo, que existe um número finito de primos. Podemos listá-los a todos: $p_1, p_2, p_3, \dots, p_r$.
> 2. **A Construção:** Consideremos um novo número $N$, que é o produto de todos os primos da nossa lista, adicionado de 1:
>    $$N = (p_1 \cdot p_2 \cdot \dots \cdot p_r) + 1$$
> 3. **Análise de $N$:** Pelo Teorema Fundamental da Aritmética, este número $N$ deve ser divisível por algum número primo $q$.
> 4. **A Contradição:** O primo $q$ deve estar na nossa lista finita (pois assumimos que a lista tem *todos* os primos). No entanto, se dividirmos $N$ por qualquer primo da lista ($p_1, p_2, \dots$), o resto da divisão será sempre 1.
> 5. **Conclusão:** Logo, $q$ não pode ser nenhum dos primos da nossa lista. Isso significa que ou $N$ é um novo número primo, ou é divisível por um primo que não estava na lista. Em ambos os casos, a nossa suposição de que a lista era finita é falsa. Portanto, existem infinitos primos. $\blacksquare$
> 
> **Exemplo Prático da Construção de $N$:**
> Se assumíssemos que os únicos primos no universo eram $\{2, 3, 5\}$.
> Construímos $N = (2 \cdot 3 \cdot 5) + 1 = 30 + 1 = 31$.
> 31 não é divisível por 2, nem por 3, nem por 5. De facto, 31 é um número primo novo que não estava na lista.

## Links
- [[Lecture 1 md]]
- [[Lecture 2 md]]
- [[Lecture 3 md]]
- [[Lecture 4 md]]