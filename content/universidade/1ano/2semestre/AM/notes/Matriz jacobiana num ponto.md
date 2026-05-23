# Cálculo de Diferenciais (Matriz Jacobiana num Ponto)

Quando a notação pede o diferencial $Df(P)$ num ponto específico $P$, o objetivo é simplesmente calcular a matriz jacobiana genérica e substituir as variáveis pelas coordenadas do ponto.

## 1. Diferencial de $f$ no ponto $(-1, 0, 1)$
Dada a função $\boldsymbol{f}(x,y,z) = (x - y + z, x^2yz, xyz)$:

**Passo 1: Matriz Jacobiana genérica ($3 \times 3$)**
$$Df(x,y,z) = \begin{pmatrix} 1 & -1 & 1 \\ 2xyz & x^2z & x^2y \\ yz & xz & xy \end{pmatrix}$$

**Passo 2: Avaliar no ponto $P = (-1, 0, 1)$**
Substituímos $x = -1$, $y = 0$, $z = 1$:
$$Df(-1, 0, 1) = \begin{pmatrix} 1 & -1 & 1 \\ 2(-1)(0)(1) & (-1)^2(1) & (-1)^2(0) \\ (0)(1) & (-1)(1) & (-1)(0) \end{pmatrix} = \begin{pmatrix} 1 & -1 & 1 \\ 0 & 1 & 0 \\ 0 & -1 & 0 \end{pmatrix}$$

---

## 2. Diferencial de $g$ no ponto $(-1, 0, -1)$
Dada a função $\boldsymbol{g}(x,y,z) = (xy, yz, 2x, xyz)$:

**Passo 1: Matriz Jacobiana genérica ($4 \times 3$)**
$$Dg(x,y,z) = \begin{pmatrix} y & x & 0 \\ 0 & z & y \\ 2 & 0 & 0 \\ yz & xz & xy \end{pmatrix}$$

**Passo 2: Avaliar no ponto $P = (-1, 0, -1)$**
Substituímos $x = -1$, $y = 0$, $z = -1$:
$$Dg(-1, 0, -1) = \begin{pmatrix} 0 & -1 & 0 \\ 0 & -1 & 0 \\ 2 & 0 & 0 \\ (0)(-1) & (-1)(-1) & (-1)(0) \end{pmatrix} = \begin{pmatrix} 0 & -1 & 0 \\ 0 & -1 & 0 \\ 2 & 0 & 0 \\ 0 & 1 & 0 \end{pmatrix}$$

# Exercício 4.3: Matriz Jacobiana de Funções Lineares

Dada a função $\boldsymbol{f}(x,y) = (3x, x + 2y)$, que transforma vetores do $\mathbb{R}^2$ noutros vetores do $\mathbb{R}^2$.

## a) Matriz Jacobiana de $\boldsymbol{f}$
As funções componentes são $f_1(x,y) = 3x$ e $f_2(x,y) = x + 2y$. Calculando as derivadas parciais:
* $\frac{\partial f_1}{\partial x} = 3$, $\quad \frac{\partial f_1}{\partial y} = 0$
* $\frac{\partial f_2}{\partial x} = 1$, $\quad \frac{\partial f_2}{\partial y} = 2$

A matriz jacobiana genérica é:
$$J_{\boldsymbol{f}}(x,y) = \begin{pmatrix} 3 & 0 \\ 1 & 2 \end{pmatrix}$$

## b) Justificação da Derivabilidade
A função $\boldsymbol{f}$ é derivável em todo o $\mathbb{R}^2$ porque as suas componentes são polinómios de grau 1 (funções estritamente lineares). As suas derivadas parciais existem e são constantes (logo, perfeitamente contínuas) em todo o domínio. Pelo teorema da diferenciabilidade, como as derivadas parciais são contínuas, a função é diferenciável.

## c) Derivada no ponto $(1,2)$ e Comparação
A derivada (diferencial) da função no ponto $(1,2)$ é simplesmente a matriz jacobiana avaliada nesse ponto. Como a nossa matriz só tem números constantes, não é afetada pelos valores de $x$ e $y$:
$$D\boldsymbol{f}(1,2) = \begin{pmatrix} 3 & 0 \\ 1 & 2 \end{pmatrix}$$

**Comparação:** O que acontece se aplicarmos este diferencial $D\boldsymbol{f}(1,2)$ a um vetor genérico $\vec{v} = (x, y)$?
$$D\boldsymbol{f}(1,2) \begin{pmatrix} x \\ y \end{pmatrix} = \begin{pmatrix} 3 & 0 \\ 1 & 2 \end{pmatrix} \begin{pmatrix} x \\ y \end{pmatrix} = \begin{pmatrix} 3x \\ x + 2y \end{pmatrix}$$

**Conclusão:** O diferencial atua exatamente da mesma forma que a função original. Ou seja, $D\boldsymbol{f}(1,2)(\vec{v}) = \boldsymbol{f}(\vec{v})$. Isto acontece porque $\boldsymbol{f}$ é uma transformação linear. A "melhor aproximação linear" de uma função que já é linear... é ela própria.

## d) Diferencial num ponto genérico $(x_0, y_0)$
Seguindo a mesma lógica da alínea anterior, como a matriz jacobiana não possui variáveis $x$ nem $y$, o diferencial é imutável em qualquer ponto do plano:
$$D\boldsymbol{f}(x_0, y_0) = \begin{pmatrix} 3 & 0 \\ 1 & 2 \end{pmatrix}$$