Resolução de exercicio da ficha
1.38
>[!reminder]- 
> Recorde-se que um elemento $a \in G$ tem ordem finita se e só se 
> $$\exists_{k \in \mathbb{N}} a^k = 1_ G$$
> Pelo critério I de subgrupo, $T_G$ é subgrupo de $G$ se e só se
> i) $1_G \in T_G$
> ii) $\forall_{a, b \in T_G} ab \in T_G$
> iii) $\forall_a \in T_G a^{-1} \in T_G$

i) Tem-se $O(1_G)$. Logo $1_G \in T_G$ 
ii) Sejam $a, b \in T_G$. Então existem $m, n \in \mathbb{N}$ tais que $a^m = 1_G \quad e \quad b^n = 1_G$
Quer-se mostrar que $ab \in T_G$, ou seja, que 
$$\exists_{k \in \mathbb{N}}(ab)^k = 1_G$$
Seja $ k = m \cdot n$. Então
$$
\begin{align}
(ab)^k &= a^kb^k\\ 
&= (a^m)^n (b^n)^m \\
&= 1_G^n1_G^m \\
&= 1_G
\end{align}
$$
Portanto $ab$ tem ordem finita e, por isso, $ab \in T_G$
iii)
