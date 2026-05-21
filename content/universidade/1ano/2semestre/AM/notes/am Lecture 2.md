---
topic: Funções de varias variaveis
date: 2026-02-19
course: Análise Matemática
tags:
  - Universidade
  - analiseMatematica
  - calculus
---
# Análise Matemática: Funções de Várias Variáveis e Limites

## 1. Classificação de Funções
Uma função $f: \mathbb{R}^n \rightarrow \mathbb{R}^m$ classifica-se de acordo com a dimensão do seu domínio ($n$) e do seu contradomínio ($m$):
* **$n=1, m=1$:** Função real de uma variável real. Exemplo: $f(x) = x^2 + 1$.
* **$n=1, m>1$:** Função vetorial de uma variável real. Exemplo: $f(x) = (x, x-3)$.
* **$n>1, m=1$:** Função real de várias variáveis reais. Exemplo: $f(x,y) = x+y$.
* **$n>1, m>1$:** Função vetorial de várias variáveis reais. Exemplo: $f(x) = (f_1(x), \dots, f_m(x))$, onde as $f_i$ são funções componentes. O domínio é a interseção dos domínios destas componentes.

---

## 2. Domínio e Gráficos
Seja $\mathcal{D} \subseteq \mathbb{R}^n$ o domínio de $f$. Quando omisso, o domínio é o maior subconjunto onde a expressão analítica faz sentido.

**O Gráfico de $f$:**
É o conjunto $Gr\ f = \{(x_1, \dots, x_n, y) \in \mathbb{R}^{n+1} : (x_1, \dots, x_n) \in \mathcal{D} \text{ e } y = f(x_1, \dots, x_n)\}$.
* Se $n=1$, o gráfico é uma **curva** em $\mathbb{R}^2$.
* Se $n=2$, o gráfico é uma **superfície** em $\mathbb{R}^3$.
* Se $n=3$, o gráfico é uma **hipersuperfície** em $\mathbb{R}^4$.

---

## 3. Conjuntos de Nível
Para descrever graficamente o comportamento de funções multivariáveis:
* **Curvas de Nível ($n=2$):** Soluções de $f(x,y) = c$ para $c$ constante. São as projeções verticais no plano $xy$ das curvas formadas pela interseção do gráfico $z=f(x,y)$ com o plano horizontal $z=c$.
* **Superfícies de Nível ($n=3$):** Conjunto $\Sigma_c = \{(x,y,z) \in \mathcal{D}_f : f(x,y,z) = c\}$.
* **Hipersuperfícies de Nível ($n$ variáveis):** Conjunto $\Sigma_c = \{x \in \mathcal{D}_f : f(x) = c\}$.

---

## 4. Limites e Continuidade

### Definição de Limite
Diz-se que $l$ é o limite de $f(x)$ quando $x \rightarrow a$ ($\lim_{x \to a} f(x) = l$) se:
$$\forall \epsilon > 0 \ \exists \delta > 0 \ \forall x \in \mathcal{D}, \ 0 < ||x - a|| < \delta \implies ||f(x) - l|| < \epsilon$$
* O limite, se existir, é **único**.
* Para funções vetoriais, o limite existe se e só se existir para todas as funções componentes individualmente: $\lim_{x \to a} f_i(x) = l_i$.

### Limites por Trajetórias (O Critério de Não-Existência)
Para que exista $\lim_{(x,y) \to (a,b)} f(x,y) = l$, o valor tem de ser $l$ **independentemente da trajetória** de aproximação ao ponto.
* Se encontrarmos duas trajetórias $C_1$ e $C_2$ onde os limites sejam diferentes, então o **limite não existe**.
* *Exemplo clássico:* Aproximar pelas retas $y = mx$ ou pela parábola $y = x^2$ para testar a convergência na origem. Se os resultados dependerem de $m$, o limite falha.

### Teorema do Enquadramento
Sejam funções tais que $|f(x) - l| \le g(x)$.
Se $\lim_{x \to a} g(x) = 0$, então obrigatoriamente $\lim_{x \to a} f(x) = l$. 
*(Muito útil quando os limites por trajetórias dão todos zero, para provar formalmente que o limite é efetivamente zero).*

### Continuidade
Uma função diz-se contínua num ponto $a \in \mathcal{D}$ se $a$ é um ponto isolado ou se $\lim_{x \to a} f(x) = f(a)$. As operações matemáticas básicas (soma, produto, quociente) mantêm a continuidade.

---

## 5. Ferramentas Sugeridas
* **Geogebra 3D / CalcPlot3D:** Excelentes para plotar gráficos de funções $f(x,y)$ e visualizar interativamente as curvas e superfícies de nível alterando a constante $c$.
* **Symbolab Multivariable Calculus:** Útil para verificar limites passo a passo, especialmente quando precisas testar múltiplas trajetórias ($y=mx$, $y=x^2$, etc.).
* **Desmos 2D:** Ideal para desenhar o mapa de contornos (várias curvas de nível) de uma função bidimensional de forma rápida.

## Links
- [[am Lecture 1]]
- [[Slides2.pdf]]