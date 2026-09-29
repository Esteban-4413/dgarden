## 1. Introdução

### 1.1 O que é a Análise Numérica?

- **Métodos numéricos**: métodos que utilizam apenas um **número finito de operações elementares da aritmética** → especialmente adequados para utilização num computador.
- Opõem-se aos **métodos analíticos** (derivação, integração, …), que envolvem **processos limite**.
- **Análise Numérica** = ramo da Matemática dedicado ao **desenvolvimento e análise** de métodos numéricos.
- Aplicações: dinâmica de fluidos, engenharia de estruturas, meteorologia, biologia, medicina, economia, …
- Muitos métodos são muito antigos (Newton para equações não lineares, Gauss para sistemas de equações lineares), mas assumiram grande importância com o aparecimento e a acessibilidade dos computadores. A própria designação "Análise Numérica" surge em **1946**, no início da era do computador.
- Consequência de trabalhar em computador → **erros de arredondamento** (capacidade limitada de representação de números).

### 1.2 Fases da resolução de um problema computacional

1. Formulação de um **modelo matemático** e recolha de dados.
2. **Escolha de um algoritmo** adequado. ← *é aqui que a análise numérica se concentra*
3. **Cálculos** (num computador).
4. **Análise dos resultados**.

Questões típicas de um analista numérico:
- Quão **preciso** é o método numérico escolhido?
- Sendo um método iterativo, quão **rápida** é a sua convergência?
- Quantas **operações aritméticas** envolve?

### 1.3 Tipos de erro

| # | Tipo | Origem |
|---|------|--------|
| 1 | Erros humanos | "bugs" |
| 2 | Erros de modelação | simplificação e idealização do problema |
| 3 | Erros nos dados | medição de quantidades físicas |
| 4 | **Erros de truncatura** | aproximação de integrais, limites, etc. |
| 5 | **Erros de arredondamento** | arredondamento dos dados e dos resultados das operações aritméticas, por se trabalhar num computador |

> Na UC de Análise Numérica interessam-nos especialmente os **erros de truncatura** e os **erros de arredondamento**.

### 1.4 Erro de truncatura (ou de discretização)

Ocorre quando **numérico ≠ analítico**.

**Exemplo 1 — calcular exp(0.125)**

Analiticamente:

$$\exp(0.125)=\lim_{n\to\infty}\left(1+\frac{0.125}{n}\right)^n$$

Numericamente, usando os **primeiros 8 termos** da expansão em série de McLaurin:

$$\exp(0.125)\approx 1+0.125+\frac{0.125^2}{2}+\dots+\frac{0.125^7}{7!}\approx 1.13315$$

A diferença entre o valor exato e o obtido com a série truncada é o **erro de truncatura**.

**Exemplo 2 — regra do trapézio**

$$\int_a^b f(x)\,dx\approx\frac{b-a}{2}\,\big[f(a)+f(b)\big]$$

com erro

$$E(f)=-\frac{(b-a)^3}{12}\,f''(\xi),\qquad \xi\in[a,b]$$

Substitui-se a área por baixo da curva pela área de um trapézio: a diferença entre as duas é o erro de truncatura.

---

## 2. Aritmética Computacional

### 2.1 Representação de reais em vírgula flutuante

Representação **normalizada** de $x\neq0$ na base $b$:

$$x=(-1)^s\,(.d_1d_2d_3\ldots)_b\times b^e$$

- $(.d_1d_2d_3\ldots)_b = d_1b^{-1}+d_2b^{-2}+d_3b^{-3}+\cdots$ → **mantissa** $m_x$
- $e\in\mathbb Z$ → **expoente**
- $b\in\mathbb N,\ b\ge2$; $s\in\{0,1\}$ (sinal); $d_i\in\{0,\dots,b-1\}$ com **$d_1\neq0$**

Esta representação **existe sempre** e é **única** se excluirmos as representações em que, a partir de determinada ordem, todos os dígitos são iguais a $b-1$ (por exemplo, na base 10 não se considera $.4999\ldots$ para o número $0.5$).

**Exemplos**

- $-3.725=-0.3725\times10^{1}=-(3\cdot10^{-1}+7\cdot10^{-2}+2\cdot10^{-3}+5\cdot10^{-4})\times10^1$
- $(101.01)_2=(0.10101)_2\times2^3=(2^{-1}+2^{-3}+2^{-5})\times2^3$ $\;(=5.25)$
- $\dfrac13=0.33333\ldots=\Big(\sum_{k=1}^{\infty}3\cdot10^{-k}\Big)\times10^0$

### 2.2 Sistema de numeração de máquina $F(b,t,m,M)$

Quatro parâmetros:

| Parâmetro | Significado |
|-----------|-------------|
| $b$ | base |
| $t$ | número de dígitos da mantissa |
| $m$ | valor **mínimo** do expoente |
| $M$ | valor **máximo** do expoente |

$F$ é constituído pelo **zero** e por todos os números que se puderem escrever na forma

$$(-1)^s\times(.d_1d_2\ldots d_t)_b\times b^e,\quad d_1\neq0,\ m\le e\le M$$

(são os números de máquina **normais** ou **normalizados**).

**Números desnormalizados (subnormais)**: $(-1)^s\times(.0\,d_2\ldots d_t)_b\times b^m$.
Se nada for dito em contrário, consideram-se apenas os normalizados.

### 2.3 Nível de *overflow* e nível de *underflow*

| Conceito | Fórmula |
|----------|---------|
| Maior número de $F$ — **nível de *overflow*** | $\Omega=(1-b^{-t})\,b^M$ |
| Menor número positivo normalizado — **nível de *underflow*** | $\omega=b^{m-1}$ |
| Menor número positivo se houver desnormalizados | $b^{m-t}$ |

**Conjunto dos representáveis:**

$$R_F=[-\Omega,-\omega]\cup\{0\}\cup[\omega,\Omega]$$

- $|x|>\Omega$ → origina ***overflow***
- $0<|x|<\omega$ → conduz a ***underflow***

(Trata-se de uma simplificação: na realidade, números com $|x|<\omega$ podem ser "substituídos" por desnormalizados ou por zero, e alguns com $|x|>\Omega$ podem ser representados por $\pm\Omega$.)

Note-se que $F\subsetneq R_F$: os números de máquina constituem um **subconjunto finito** do conjunto dos números representáveis.

**Exemplo: $F=F(10,4,-99,99)$**

- $\Omega=(1-10^{-4})\times10^{99}=0.9999\times10^{99}$
- $\omega=10^{-99-1}=10^{-100}$
- $R_F=[-0.9999\times10^{99},-10^{-100}]\cup\{0\}\cup[10^{-100},0.9999\times10^{99}]$
- $\pi\in R_F$, mas $\pi\notin F$ (não se pode escrever com uma mantissa de apenas quatro dígitos: $3.141592654\ldots$)
- $10^{100}\notin R_F$ → ***overflow***
- $10^{-101}\notin R_F$ → ***underflow***

### 2.4 Arredondamento

Dado $x\in R_F$, é necessário encontrar um número de máquina $\text{fl}(x)$ que o represente, o mais próximo possível:

$$|\text{fl}(x)-x|\le|y-x|\quad\forall y\in F \tag{1}$$

→ **arredondamento para o mais próximo**. Se $x\in F$, tem-se $\text{fl}(x)=x$.

**Empates** (dois números de máquina à mesma distância de $x$):
- **Arredondamento para par**: escolhe-se aquele cujo último dígito da mantissa seja par (é a regra usada, por defeito, no **Matlab**).
- **Arredondamento habitual** (o que usamos nos cálculos "à mão"): arredonda-se a mantissa para cima em caso de empate (equivale a somar $\tfrac12 b\,b^{-(t+1)}$ à mantissa e truncar depois para $t$ dígitos).

> Nota: existem outras formas de determinar $\text{fl}(x)$, como a **truncatura**, em que simplesmente se ignoram todos os dígitos da mantissa que estejam para além da posição $t$.

**Exemplos em $F(10,4,-2,3)$**

| $x$ | fl(x) | Regra |
|-----|-------|-------|
| $.75824\times10^{-2}$ | $.7582\times10^{-2}$ | — |
| $.75826\times10^{-2}$ | $.7583\times10^{-2}$ | — |
| $.75825\times10^{-2}$ | $.7582\times10^{-2}$ | empate → **para par** |
| $.75825\times10^{-2}$ | $.7583\times10^{-2}$ | empate → **habitual** |
| $.758251\times10^{-2}$ | $.7583\times10^{-2}$ | sem empate (ambas as regras) |

**Exemplos em $F(2,4,-2,3)$**

- $\text{fl}(.10110\times2^{-2})=.1011\times2^{-2}$ (já cabe em 4 dígitos)
- $\text{fl}(.10111\times2^{-2})=.1100\times2^{-2}$ (empate entre $.1011$ e $.1100$ → para par)

### 2.5 Majorante do erro de arredondamento, épsilon e $\mu$

Se $x\in R_F$ tiver expoente $e$ na notação normalizada:

$$|\text{fl}(x)-x|\le\tfrac12\,b\,b^{-(t+1)}\,b^e=\tfrac12\,b^{-t}\,b^e \tag{2}$$

| Conceito | Definição |
|----------|-----------|
| **Epsilon da máquina** $\varepsilon$ | diferença entre o número de máquina imediatamente superior a $1$ e o número $1$: $\varepsilon=b^{1-t}$ |
| **Unidade de erro de arredondamento** $\mu$ | $\mu=\tfrac12 b^{1-t}=\tfrac12\varepsilon$ |

### 2.6 Operações de vírgula flutuante

Representam-se pelo símbolo usual rodeado por $\circ$: $\oplus,\ \otimes,\ldots$

$$x\oplus y=\text{fl}(x+y),\qquad x\otimes y=\text{fl}(x\times y)$$

(supondo que o resultado da operação exata não conduz nem a *overflow* nem a *underflow*).

⚠️ O resultado de **duas ou mais** operações de ponto flutuante pode **não** corresponder ao arredondamento do valor exato: por exemplo, $x\oplus(y\oplus z)$ não é necessariamente igual a $\text{fl}(x+(y+z))$.

As operações de ponto flutuante **não satisfazem todas as propriedades** usuais das operações em $\mathbb R$:
- a adição **não é associativa**;
- **não** é válida a distributividade da multiplicação em relação à adição.

**Exemplo** — em $F(10,4,-99,99)$, com $x=0.5289,\ y=0.8012,\ z=0.6024$:

$$x\oplus(y\oplus z)$$
- $y\oplus z=\text{fl}(1.4036)=0.1404\times10^1$
- $x\oplus 1.404=\text{fl}(1.9329)=0.1933\times10^1$

$$(x\oplus y)\oplus z$$
- $x\oplus y=\text{fl}(1.3301)=0.1330\times10^1$
- $1.330\oplus z=\text{fl}(1.9324)=0.1932\times10^1$

→ $0.1933\times10^1\neq0.1932\times10^1$ — a adição não é associativa!

### 2.7 Sistema de numeração do Matlab (norma IEEE 754, formato duplo / bin64)

Sistema $F(2,\,53,\,-1021,\,1024)$:

| Grandeza | Valor | Comando Matlab |
|----------|-------|----------------|
| $\Omega=(1-2^{-53})2^{1024}=2^{1024}-2^{971}$ | $\approx1.8\times10^{308}$ | `realmax` |
| $\omega=2^{-1022}$ | $\approx2.2\times10^{-308}$ | `realmin` |
| $\varepsilon=2^{-52}$ | $\approx2.2\times10^{-16}$ | `eps` |
| $\mu=2^{-53}$ | $\approx1.1\times10^{-16}$ | — |

- Admite **números desnormalizados**: $(-1)^s(.0\,d_2\cdots d_{53})_2\times2^{-1021}$.
- Menor número positivo do sistema: $2^{-1021}\times2^{-53}=2^{-1074}\approx4.9\times10^{-324}$.

**"Números" especiais**

- `Inf` e `-Inf` ($\pm\infty$): por exemplo, o resultado da divisão de um número (não nulo) por zero.
- `NaN` (*Not a Number*): resultado de operações não definidas matematicamente, como $0/0$ ou $\infty-\infty$.

**Arredondamento no Matlab**
- Arredondamento **para o mais próximo, com arredondamento para par** em caso de empate.
- Exceção: se $|x|\ge(1-2^{-54})2^{1024}$ → $\text{fl}(x)=\texttt{Inf}$ (se $x>0$) ou `-Inf` (se $x<0$).

**Funções do Matlab desta parte**

| Categoria | Funções |
|-----------|---------|
| Conversão de bases | `dec2bin`, `dec2hex`, `dec2base`, `bin2dec`, `hex2dec`, `base2dec` |
| Constantes do sistema | `realmax`, `realmin`, `eps`, `Inf`, `NaN` |
| Arredondamento | `ceil`, `fix`, `floor`, `round` |

---

## 3. Resumo rápido

- **Normalizado**: $x=(-1)^s(.d_1d_2\ldots)_b\,b^e$, com $d_1\neq0$.
- **Sistema** $F(b,t,m,M)$: $\Omega=(1-b^{-t})b^M$, $\omega=b^{m-1}$, menor desnormalizado $b^{m-t}$.
- **Epsilon**: $\varepsilon=b^{1-t}$; **unidade de erro de arredondamento**: $\mu=\tfrac12b^{1-t}$.
- **Arredondamento**: $\text{fl}(x)=x(1+\delta)$, $|\delta|\le\mu$ *(visto no início da parte seguinte, "Erros")*.
- **Operações de máquina**: $x\oplus y=\text{fl}(x+y)$; **não** são associativas nem distributivas.
- **Matlab**: $F(2,53,-1021,1024)$, `eps` $=2^{-52}$, arredondamento para par, `Inf`/`NaN`.

---

## 4. Exercícios para praticar

1. Em $F(10,3,-5,5)$, calcule $\Omega$, $\omega$, $\varepsilon$ e $\mu$.
   *Solução:* $\Omega=0.999\times10^5$, $\omega=10^{-6}$, $\varepsilon=10^{-2}$, $\mu=0.5\times10^{-2}$.
2. Em $F(10,4,-2,3)$, calcule $\text{fl}(.12345\times10^1)$ com arredondamento para par e com arredondamento habitual.
   *Solução:* para par → $.1234\times10^1$; habitual → $.1235\times10^1$.
3. Em $F(2,3,-1,2)$, quais são o maior e o menor números positivos normalizados?
   *Solução:* $\Omega=(1-2^{-3})\cdot2^2=3.5$; $\omega=2^{-2}=0.25$.
4. Verifique no Matlab: `realmax*2`, `0/0`, `1/0`, `eps`, `1+eps/4==1`.

# Reference
- [[slideserrosestabilidade.pdf]]
