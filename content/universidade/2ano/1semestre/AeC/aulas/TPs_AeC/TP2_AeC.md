# Correção
[[ficha1_AeC.pdf]]

1) 
a) $\{True\} \, r = x + y \, \{r \leq x \}$

Exemplo:
$r = 7, x = 4, y = 2 \longrightarrow r = 6, x 0 4, y = 2$

Contra-exemplo:
$r = 7, x = 2, y = -3 \longrightarrow r = -1, x = 2, y = -3$

b) $\{True\} \, x = x + y; \, y = x - y; x = x - y \, \{x == y\}$

Exemplo:
$x = 1, y = 1 \longrightarrow x = y = 1$

Contra-exemplo: 
$x = -50, y = -30 \longrightarrow x = -30, y = -50$

d) $\{True\} \texttt{ if(x > y) r = x - y; else r = y - x;} \{r > 0 \}$

Exemplo:
$x = 7, y = 3, r = 1 \longrightarrow r = 4$

Contra-exemplo
$x = 3, y = -3 \longrightarrow x = 5, y = 5, r = 0$

e) $\{True\} \texttt{ while(x > 0) \{y = y + 1; x = x - 1;\} } \{y > x\}$

Exemplo: 
$x = 5, y = 3 \longrightarrow y = 8, x = 0$

Contra-exemplo:
$x = -2,, y = -42 \longrightarrow x = -1, y = -42$

2)
a) $\{y \leq 0 \} \, r = x + y; \{r \geq x \}$
b) $\{x == y\}\, x = x + y; y = x - y; x = x - y; \, \{x == y\}$
c) ...


3) 

**Regra da Atribuição:**
$$
\frac{P \Rightarrow Q[x \setminus E]}{\{P\} \ x = E \ \{Q\}}
$$

$Q[x \setminus E]$ significa substituir todas as ocorrências (livres) da variável $x$ pela expressão $E$.

a)
$$ \{y \geq 0\} \ r = x + y \ \{r \geq x\} $$

$$
\begin{align*}
\quad & (y \geq 0) \Rightarrow (r \geq x)[r \setminus x + y] \\
& (y \geq 0) \Rightarrow x + y \geq x \\
& y \geq 0 \Rightarrow y \geq 0 \quad \text{True}
\end{align*}
$$

b)
$$ \{x == y\} \ x = x + y; \ y = x - y; \ x = x - y; \ \{x == y\} $$

$$
\begin{align*}
\quad & (x == y) \Rightarrow (x == y)[x \setminus x - y][y \setminus x - y][x \setminus x + y] \\
& \equiv (x == y) \Rightarrow (x - y == y)[y \setminus x - y][x \setminus x + y] \\
& \equiv (x == y) \Rightarrow (x - (x - y) == x - y)[x \setminus x + y] \\
& \equiv (x == y) \Rightarrow (y == x - y)[x \setminus x + y] \\
& \equiv (x == y) \Rightarrow (y == (x + y) - y) \\
& \equiv (x == y) \Rightarrow (y == x) \quad \text{True}
\end{align*}
$$

d)
$$
\{True\} \texttt{ if(x > y) r = x - y; else r = y - x;} \{r > 0 \}
$$

1)
$$
\begin{align}
&\quad \{x != y \land x > y\} \, r = x - y; \{r > 0\} \\
&(x \neq \land x > y) \implies r > 0 [r \setminus x - y] \\
& \equiv ( x\neq y \land x > y) \implies x - y > 0 \\
& \equiv (x \neq y \land x > y) \implies x > y \quad \text{True} \\
\end{align}
$$

2)
$$
\begin{align}
&\{x \neq y \land x \leq\} \, r = y - x; \, \{r > 0\}j \\
&(x \neq y \land x \leq y) \implies (r > 0)[r \setminus y - x] \\
&\equiv (x < y) \implies y - x > 0 \\
& x < y \implies y > x \quad \text{True}
\end{align}
$$
