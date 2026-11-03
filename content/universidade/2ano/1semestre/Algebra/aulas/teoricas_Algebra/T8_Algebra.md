---
noteId: 1793662140897
---

Vimos na última [[T7_Algebra.md |aula]] que dado um grupo $G$ e $A \subseteq G$, existe um único subgrupo $\langle A \rangle$, chamado o subgrupo gerado por $A$, que contém $A$ e é o menor nessas condições.

*Observação:* Sejam $G$ um grupo e $A, H \subseteq G$.
Então, $H = \langle A \rangle$ se e só se
1) $A \leq G$
2) $A = H$
3) $(K \leq G \land a \subseteq K) \implies H \subseteq K$.

**Questão:** Dado um grupo $G$ e um elemento $a \in G$, como identificar $\langle a \rangle$?
- $a \in \langle a \rangle$
- $\langle a \rangle \leq G$ e portanto: 
  - $1_G \in \langle a \rangle$
  - $\langle a \rangle$ é fechado para o produto
  - $\langle a \rangle$ é fechado para inversos

Logo, 
$$
\begin{align}
a^{-n} &\in \langle a \rangle \\
a^0 &= 1_G \in \langle a \rangle \\
a^1 &= a \in \langle a \rangle \\
a^2 &\in \langle a \rangle \\
\vdots \\
a^n &\in \langle a \rangle \\
\end{align}
$$


# Links
[[T1_Algebra.md]]
[[T2_Algebra.md]]
[[T3_Algebra.md]]
[[T4_Algebra.md]]
[[T5_Algebra.md]]
[[T6_Algebra.md]]
[[T7_Algebra.md]]
