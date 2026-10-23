# Homomorfismos

$\textbf{Definição.}$ Sejam $(G, \cdot)$ e $(H, *)$ grupos. Uma aplicação $\varphi: G \to H$ diz-se um homomorfismo se 
$$\forall_{x, y \in G} \phi(x \cdot y) = \phi(x) * \phi(y)$$ 

$\textbf{Exemplo.}$

1)

//TODO


$\textbf{Definição.}$ Um homomorfismo $\varphi: G \to G'$ diz-se um:
- *monomorfismo* se é uma aplicação injetiva
- *epimorfismo* se é uma aplicação sobrejetiva
- *isomorfismo* se é uma aplicação bijetiva. Neste caso diz-se que $G$ é isomorfo a $G'$ e escreve-se $G \cong G'$

$\textbf{Lema.}$ A relação $\cong$ é uma equivalencia no conjunto de todos os grupos. Ou seja, $G \cong G$ (a $id_G$ é um isomorfismo); $G \cong G' \implies G' \cong G$ ($\varphi: G \to G^{-1} \implies \varphi^{-1}: G^{-1} \to G$); $G \cong G'$ e $G' \cong G'' \implies G \cong G''$ (a composta de um isomorfismo é ainda um isomorfismo)

$\textbf{Exemplos.}$
1) Se $G$ e $G'$ são grupos, então 
$$
\begin{align}
id_G: G &\longrightarrow G \\
x &\longmapsto x \\
\end{align}
$$
é um isomorfismo e
$$
\begin{align}
\varphi: G &\longrightarrow G' \\
x &\longmapsto 1_G \\
\end{align}
$$
é um homomorfismo

2) 
$$
\begin{align}
f: (\mathbb{Z}, +) &\longrightarrow (\mathbb{Z}, +) \\
x &\longmapsto 2x \\
\end{align}
$$
é um monomorfismo e para além disso é injetiva e 
$$
\begin{align}
\varphi(x + y) &= 2(x + y) \\
&= 2x + 2y \\
&= \varphi(x) + \varphi(y)
\end{align}
$$

para quaisquer $x, y$ e $\mathbb{Z}$

3) 
$$
\begin{align}
\psi: (\mathbb{Z}, +) &\longrightarrow (\mathbb{Z_n}, +_n) \\
x &\longmapsto [x]_n \\
\end{align}
$$
é um epimorfismo

>[!note]- Exemplo 
> Seja $n = 3$, tem-se $2 = 5 = [2]_3$

$\textbf{Proposição.}$ Seja $\varphi: G \to G'$ um homomorfismo (de grupos). Então
1) $\varphi(1_G) = 1_{G'}$
2) $\forall_{a \in G} \, \varphi(a^{-1}) = \varphi(a)^{-1}$
3) Se $H \leq G$, então $\varphi(H') = \{x \in G \, : \, \varphi(x) \in H'\} \leq G$
4) Se $H' \leq G'$, então $\varphi(H') = \{x \in G \, : \, \varphi(x) \in H'\} \leq G$

$\textbf{Demonstração.}$
1) $\varphi(1_G) \in G'$ e 
$$
\begin{align}
\varphi(1_G) \cdot \varphi(1_G) &= \varphi(1_G \cdot 1_G) \quad \text{pois, } \varphi \text{ é homomorfismo} \\
&= \varphi(1_G)
\end{align}
$$

$\therefore \, \varphi(1_G)$ é idempotente
$\therefore \varphi(1_G) = 1_{G'}$
