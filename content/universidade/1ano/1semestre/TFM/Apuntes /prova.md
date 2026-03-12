> **Teorema:** Para todo $n > 4$, temos $n! > 2^n$.
> **Método:** Princípio da Indução Matemática.

**1. Caso Base ($n = 5$):**
$$5! = 120 \quad \text{e} \quad 2^5 = 32 \implies 120 > 32 \quad \text{(Verdadeiro)}$$

**2. Hipótese de Indução (H.I.):**
Assumimos que para um certo $k \ge 5$, a regra funciona:
$$k! > 2^k$$

**3. Passo Indutivo (Provar para $k+1$):**
O objetivo é chegar a $(k+1)! > 2^{k+1}$. Começamos pela definição de fatorial:
$$(k+1)! = (k+1) \cdot k!$$

Usando a nossa H.I., substituímos $k!$ por $2^k$:
$$(k+1)! > (k+1) \cdot 2^k$$

Como $k \ge 5$, sabemos que $(k+1)$ é pelo menos $6$. Sendo $6 > 2$, podemos focar apenas no $2$ para manter a desigualdade:
$$(k+1)! > 2 \cdot 2^k$$

Agrupando as potências de base 2, chegamos ao final:
$$(k+1)! > 2^{k+1}$$

$\blacksquare$ **Conclusão:** O passo indutivo está provado. Logo, $n! > 2^n$ para todo $n > 4$.