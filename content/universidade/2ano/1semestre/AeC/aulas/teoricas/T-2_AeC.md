# C - 1

## Invariantes de ciclo

Estabelecer a correcção de algoritmos com ciclos implica considerar **qualquer número de iterações**, e não é viável fazer essa análise por casos, de forma exaustiva. Recorre-se por isso ao **invariante de ciclo**.

> [!quote]+
> Um **invariante de ciclo** é uma propriedade (fórmula de primeira ordem) que se mantém verdadeira em **todas as iterações**, e que reflecte as transformações de estado efectuadas durante a execução do ciclo.

- Se o invariante se mantém verdadeiro ao longo da execução, será ainda verdadeiro **à saída do ciclo**.
- Tem de ser **suficientemente forte** para permitir provar a pós-condição desejada.
- Raciocinar com um invariante equivale a uma **prova indutiva** no número de iterações de uma execução (que termina) do ciclo.

### Propriedades a provar
Para provar que $I$ é um invariante:

> [!important] Propriedades do invariante
> 1. **Inicialização** (caso de base): $I$ é verdade à entrada do ciclo, antes da 1.ª iteração.
> 2. **Preservação** (caso indutivo): assumindo $I$ verdade no início de uma iteração arbitrária (i.e. a condição do ciclo é satisfeita), então $I$ é satisfeito no final dessa iteração.
> 3. **Utilidade**: $I$ juntamente com a **negação da condição do ciclo** implica a pós-condição.

As 3 propriedades expressam-se como **triplos de Hoare**, envolvendo:

| Propriedade | Código envolvido | Triplo |
|---|---|---|
| Inicialização | o que **antecede** o ciclo | $\{P\}\; \text{antes}\; \{I\}$ |
| Preservação | o **corpo** do ciclo | $\{I \wedge c\}\; S\; \{I\}$ |
| Utilidade | o que **sucede** ao ciclo | $\{I \wedge \neg c\}\; \text{depois}\; \{Q\}$ |

> [!note]
> É exactamente o que dizem as premissas da regra while-3: $P \Rightarrow I$, $\{I \wedge c\}\, S\, \{I\}$, $(I \wedge \neg c) \Rightarrow Q$.

---

## Exemplo: Divisão Inteira

Calcula a divisão de $x$ por $y$, colocando o quociente em $q$ e o resto em $r$.

```c
int divide (int x, int y) {
  // Pre: x >= 0 && y > 0
  // Pos: 0 <= r < y && q*y+r == x
  return q
}
```

Resolver o problema = escrever um bloco $C$ que satisfaça
$$\{x \geq 0 \wedge y > 0\}\; C\; \{0 \leq r < y \wedge q * y + r = x\}$$

> [!note]
> $x$ e $y$ (na pré-condição) são variáveis de **entrada**; $q$ e $r$ (só na pós-condição) são variáveis de **saída**.

### Programa
Conta-se o número de vezes que $y$ cabe em $x$:

```c
r = x;
q = 0;
while (y <= r) {
  r = r-y;
  q = q+1;
}
```

### Simulação para $x = 14$, $y = 3$
Valores à **entrada de cada iteração**:

| iteração | $r$ | $q$ | $q * y + r$ |
|---|---|---|---|
| 1 | 14 | 0 | 14 |
| 2 | 11 | 1 | 14 |
| 3 | 8 | 2 | 14 |
| 4 | 5 | 3 | 14 |
| 5 | 2 | 4 | 14 |

Ao sair: $r = 2 < y = 3$ (condição $y \leq r$ falsa).

> [!tip] Como descobrir o invariante
> - $q * y + r$ **mantém o seu valor** em todas as iterações, e é igual a $x$.
> - $r$ é **não-negativo** durante toda a execução.

$$I \equiv 0 \leq r \wedge q * y + r = x$$

> [!note] Cenário mais simples
> Quando o programa **termina com o ciclo**, a pós-condição é equivalente à conjunção do invariante com a negação da condição do ciclo: $Q \equiv I \wedge \neg c$.

---

### Prova de correcção

#### 1. Inicialização
$$\{x \geq 0 \wedge y > 0\}\; r = x;\; q = 0;\; \{I\}$$
É imediato: $0 \leq x \wedge 0 * y + x = x$ ✔

#### 2. Preservação
$$\{I \wedge y \leq r\}\; r = r - y;\; q = q + 1;\; \{I\}$$

- Admite-se $I \equiv 0 \leq r \wedge q * y + r = x$ à entrada de uma iteração qualquer.
- Também $y \leq r$, senão a iteração não seria executada.
- No fim da iteração, $r$ e $q$ valem $r - y$ e $q + 1$. Queremos mostrar:

$$0 \leq (r - y) \wedge (q+1) * y + (r - y) = x \;\equiv\; y \leq r \wedge q * y + r = x$$

- E a pré-condição garante-o:
$$(0 \leq r \wedge q * y + r = x) \wedge y \leq r \;\rightarrow\; y \leq r \wedge q * y + r = x \;✔$$

> [!example] Detalhe da álgebra
> $(q+1) * y + (r - y) = q*y + y + r - y = q*y + r$. Por isso a 2.ª parte mantém-se igual, e a 1.ª ($0 \leq r - y$) é $y \leq r$, que é a condição do ciclo.

#### 3. Utilidade
$$\{I \wedge \neg(y \leq r)\}\; \{\}\; \{0 \leq r < y \wedge q * y + r = x\}$$

- Trivial: o programa **termina com o ciclo**, não há instruções depois.
- $I \wedge \neg(y \leq r) = 0 \leq r \wedge q*y + r = x \wedge r < y$, que implica (aqui é mesmo equivalente) a pós-condição $0 \leq r < y \wedge q * y + r = x$ ✔

> [!warning]
> Só é **equivalente** porque não há código depois do ciclo. Se houvesse, bastaria que **implicasse** (e o triplo teria de passar pelo código seguinte).

---

### Terminação (correcção total)
O invariante só dá correcção **parcial**. Para a total falta o **variante**:
- $V = r$
- $I \wedge c \Rightarrow r \geq 0$ ✔ (vem de $0 \leq r$ em $I$)
- A cada iteração $r$ passa a $r - y$, com $y > 0$, logo **decresce estritamente** ✔

---

## Esquema para qualquer ciclo

> [!important] Receita
> 1. Fazer uma **simulação** com valores concretos e ver o que se **mantém constante** (expressão que não muda) e o que fica **limitado** ($\geq 0$, $\leq N$...).
> 2. Escrever o invariante $I$ como conjunção dessas propriedades.
> 3. Provar **Inicialização**, **Preservação** e **Utilidade**.
> 4. Se precisar de terminação: encontrar o **variante** $V$.
> 5. Se a utilidade falhar, o invariante é **demasiado fraco**: acrescentar propriedades (ex.: $d \geq 0$, $i \leq N$).

# Reference:
- [[../../resources/C1.pdf]]
