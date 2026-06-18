---
topic: Divisibilidade
date: 2026-02-21
course: Matemática Discreta
tags:
  - Universidade
  - math
  - vocabulario/english
  - math
  - math/matematica-discreta
---
# Solved exercises

# Exercises - Chapter 1: Divisibility

**Source:** [[1ano/2semestre/MD/bibliografias/biblio1.pdf#page=16|biblio1, page 16]]
**Subchapter:** 1.1 Divisors

---

### Exercise 1: Remainders of Perfect Squares
**Question:** What are the possible remainders when a perfect square ($n^2$) is divided by 3, 5, or 6?

> [!example]- View Solution
> By the Division Algorithm, any integer $n$ can be written as $n = bq + r$ where $0 \le r < b$. Squaring this gives $n^2 = b(bq^2 + 2qr) + r^2$. The remainder of $n^2$ divided by $b$ depends entirely on the remainder of $r^2$ divided by $b$.
> 
> * **Divided by 3:** Possible remainders for $n$ are $0, 1, 2$.
>     * $0^2 = 0 \implies$ Remainder 0
>     * $1^2 = 1 \implies$ Remainder 1
>     * $2^2 = 4 = 3(1) + 1 \implies$ Remainder 1
>     * **Answer:** 0 or 1.
> * **Divided by 5:** Possible remainders for $n$ are $0, 1, 2, 3, 4$.
>     * $0^2 = 0 \implies 0$
>     * $1^2 = 1 \implies 1$
>     * $2^2 = 4 \implies 4$
>     * $3^2 = 9 = 5(1) + 4 \implies 4$
>     * $4^2 = 16 = 5(3) + 1 \implies 1$
>     * **Answer:** 0, 1, or 4.
> * **Divided by 6:** Possible remainders for $n$ are $0, 1, 2, 3, 4, 5$.
>     * $0^2 = 0 \implies 0$
>     * $1^2 = 1 \implies 1$
>     * $2^2 = 4 \implies 4$
>     * $3^2 = 9 = 6(1) + 3 \implies 3$
>     * $4^2 = 16 = 6(2) + 4 \implies 4$
>     * $5^2 = 25 = 6(4) + 1 \implies 1$
>     * **Answer:** 0, 1, 3, or 4.

---

### Exercise 2: Transitivity of Divisibility
**Theorem to Prove:** If $a|b$ and $b|c$, then $a|c$.

> [!check]- View Proof
> 1. Assume $a|b$. By definition, $\exists k_1 \in \mathbb{Z}$ such that $b = a \cdot k_1$.
> 2. Assume $b|c$. By definition, $\exists k_2 \in \mathbb{Z}$ such that $c = b \cdot k_2$.
> 3. Substitute $b$ into the second equation: $c = (a \cdot k_1) \cdot k_2$.
> 4. Regroup: $c = a \cdot (k_1 \cdot k_2)$.
> 5. Since $k_1 \cdot k_2$ is an integer, $a$ divides $c$ by definition. $\blacksquare$

---

### Exercise 3: Multiplication of Divisibilities
**Theorem to Prove:** If $a|b$ and $c|d$, then $ac|bd$.

> [!check]- View Proof
> 1. Assume $a|b \implies b = a \cdot k_1$ for some integer $k_1$.
> 2. Assume $c|d \implies d = c \cdot k_2$ for some integer $k_2$.
> 3. Multiply the equations: $bd = (a \cdot k_1)(c \cdot k_2)$.
> 4. Regroup terms using commutativity: $bd = (ac)(k_1 \cdot k_2)$.
> 5. Since $k_1 \cdot k_2$ is an integer, $ac$ divides $bd$ by definition. $\blacksquare$

---

### Exercise 4: Cancellation/Multiplication Property
**Theorem to Prove:** If $m \neq 0$, then $a|b \iff ma|mb$.

> [!check]- View Proof
> **Forward direction ($\implies$):**
> Assume $a|b$. Thus, $b = ak$ for some integer $k$. Multiply both sides by $m$ to get $mb = mak$. Regrouping gives $mb = (ma)k$. Therefore, $ma|mb$.
> 
> **Backward direction ($\impliedby$):**
> Assume $ma|mb$. Thus, $mb = (ma)k$ for some integer $k$. Since we are explicitly given that $m \neq 0$, we can mathematically cancel $m$ from both sides, leaving $b = ak$. Therefore, $a|b$. $\blacksquare$

---

### Exercise 5: Divisor Size Limit
**Theorem to Prove:** If $d|a$ and $a \neq 0$, then $|d| \le |a|$.

> [!check]- View Proof
> 1. Assume $d|a$. By definition, $a = d \cdot k$ for some integer $k$.
> 2. Since $a \neq 0$, it must be true that $k \neq 0$.
> 3. Take the absolute value of both sides: $|a| = |d| \cdot |k|$.
> 4. Because $k$ is a non-zero integer, its absolute value must be at least 1 ($|k| \ge 1$).
> 5. Multiplying $|d|$ by a number greater than or equal to 1 means the result ($|a|$) must be greater than or equal to $|d|$. Thus, $|d| \le |a|$. $\blacksquare$

---

### Exercise 6 (1.4): Addition of Divisibilities
**Question:** If $a|b$ and $c|d$, must $a+c|b+d$? 

> [!success]- View Solution
> **No.** We can prove this by providing a single counterexample.
> * Let $a = 2$ and $b = 4$ (since $2|4$).
> * Let $c = 3$ and $d = 9$ (since $3|9$).
> 
> Testing the claim: 
> * $a+c = 5$ 
> * $b+d = 13$
> 
> Since 5 does not divide 13, the statement is false.

---

### Exercise 7 (1.5): Euclidean Algorithm
**Question:** Calculate $\gcd(1485, 1745)$.

> [!success]- View Solution
> Using the Euclidean Algorithm (repeated division):
> 1. $1745 = 1485(1) + 260$
> 2. $1485 = 260(5) + 185$
> 3. $260 = 185(1) + 75$
> 4. $185 = 75(2) + 35$
> 5. $75 = 35(2) + 5$
> 6. $35 = 5(7) + 0$
> 
> The algorithm stops at a remainder of 0. The greatest common divisor is the last non-zero remainder.
> **$\gcd(1485, 1745) = 5$**


## Links
- [[1ano/2semestre/MD/bibliografias/biblio1.pdf|biblio1]]