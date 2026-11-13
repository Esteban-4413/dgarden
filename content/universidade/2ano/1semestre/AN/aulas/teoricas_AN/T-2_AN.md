# Análise Numérica — Aula 2

## 1. Erros

### 1.1 Erro absoluto e erro relativo de um valor aproximado

Sejam $x$ um número dado e $\tilde x$ um valor aproximado para $x$.

$$
\begin{array}{|l|l|}
\hline
\textbf{Conceito} & \textbf{Definição} \\ \hline
\textbf{Erro (absoluto)}\ \text{de}\ \tilde x\ \text{para}\ x & E_{\tilde x}:=x-\tilde x \\ \hline
\begin{array}{l} \textbf{Erro relativo}\ \text{de}\ \tilde x\ \text{para}\ x\ \text{(se} \\ x\neq0\text{)} \end{array} & R_{\tilde x}:=\dfrac{x-\tilde x}{x} \\ \hline
\end{array}
$$

**Exemplo:** $x=\dfrac13$, $\;y=\dfrac1{3000}$, $\;\tilde x=0.3333$, $\;\tilde y=0.0003$.

- $E_{\tilde x}=E_{\tilde y}=0.00003333\ldots$ (os erros absolutos são iguais!)
- $R_{\tilde x}=10^{-4}$ e $R_{\tilde y}=10^{-1}$

→ O **erro relativo tem "mais informação"** do que o absoluto: $\tilde y$ é uma aproximação muito pior de $y$ do que $\tilde x$ de $x$, apesar de o erro absoluto ser o mesmo.

**Notas**

- Na prática, muitas vezes só interessa o **valor absoluto** dos erros; continuam a chamar-se erro absoluto e erro relativo, desde que o contexto seja claro.
- Como na definição de $R_{\tilde x}$ o valor $x$ **não é conhecido**, usa-se a estimativa:

$$|R_{\tilde x}|\approx\frac{|x-\tilde x|}{|\tilde x|}$$

- O erro relativo costuma exprimir-se em **percentagem**: se $|R_{\tilde x}|=0.05$, diz-se que $\tilde x$ tem um erro relativo de $5\%$.
- Da definição obtém-se de imediato:

$$\tilde x=x\,(1-R_{\tilde x})$$

### 1.2 Erro relativo de arredondamento

Num sistema $F(b,t,m,M)$, dado $x\in R_F$, $x\neq0$ (cf. fórmula (2) da aula 1):

$$|R_{\text{fl}(x)}|=\frac{|x-\text{fl}(x)|}{|x|}\le\frac{\tfrac12\,b^{-t}\,b^e}{b^{-1}\,b^e}=\frac12\,b^{1-t}=\mu$$

- O erro relativo cometido ao arredondar um número (representável) para um número de máquina é **majorado pela unidade de erro de arredondamento** da máquina.
- Forma equivalente muito usada:

$$\text{fl}(x)=x(1+\delta),\qquad|\delta|\le\mu$$

**No Matlab:** $|R_{\text{fl}(x)}|\le2^{-53}\approx1.1\times10^{-16}$.

> O denominador $b^{-1}b^e$ vem de $|x|\ge b^{-1}b^e$ (a mantissa normalizada é sempre $\ge b^{-1}$, porque $d_1\neq0$).

### 1.3 Propagação de erros nas operações usuais

Sejam $\tilde x$ e $\tilde y$ valores aproximados para $x$ e $y$ ($x,y\neq0$), e sejam

$$S=x+y,\qquad P=x\times y,\qquad Q=x/y.$$

Sejam $\tilde S,\tilde P,\tilde Q$ os valores obtidos usando $\tilde x,\tilde y$ em vez de $x,y$, **admitindo que as operações são efetuadas exatamente**.

$$
\begin{array}{|l|l|l|}
\hline
\textbf{Operação} & \textbf{Erro absoluto} & \textbf{Erro relativo} \\ \hline
\textbf{Soma} & E_{\tilde S}=E_{\tilde x}+E_{\tilde y} & R_{\tilde S}=\dfrac{x}{x+y}R_{\tilde x}+\dfrac{y}{x+y}R_{\tilde y} \\ \hline
\textbf{Produto} & E_{\tilde P}=E_{\tilde x}\,y+E_{\tilde y}\,x-E_{\tilde x}E_{\tilde y} & R_{\tilde P}=R_{\tilde x}+R_{\tilde y}-R_{\tilde x}R_{\tilde y} \\ \hline
\textbf{Quociente} & E_{\tilde Q}=\dfrac{y\,E_{\tilde x}-x\,E_{\tilde y}}{y\,\tilde y} & R_{\tilde Q}=\dfrac{R_{\tilde x}-R_{\tilde y}}{1-R_{\tilde y}} \\ \hline
\end{array}
$$

Se $|R_{\tilde x}|,|R_{\tilde y}|\ll1$, então:

$$R_{\tilde P}\approx R_{\tilde x}+R_{\tilde y},\qquad R_{\tilde Q}\approx R_{\tilde x}-R_{\tilde y}$$

**Operação mais "perigosa": a adição.** Pergunta do slide: *em que caso?*
Quando $x+y\approx0$, isto é, quando **$x$ e $y$ têm sinais opostos e valores absolutos próximos**. Nesse caso os fatores $\frac{x}{x+y}$ e $\frac{y}{x+y}$ são enormes e amplificam o erro relativo dos dados. (É o **cancelamento subtrativo**, visto mais à frente.)

**Exemplo (extra):** $x=1000$, $y=-999$ com $|R_{\tilde x}|,|R_{\tilde y}|\le10^{-6}$.
Como $x+y=1$:

$$|R_{\tilde S}|\le1000\cdot10^{-6}+999\cdot10^{-6}=1999\times10^{-6}\approx2\times10^{-3}$$

O erro relativo passou de $10^{-6}$ para cerca de $10^{-3}$: amplificação de ~2000 vezes. Já no produto e no quociente o erro relativo apenas se **soma/subtrai** (fica da mesma ordem de grandeza).

### 1.4 Casas decimais de precisão e algarismos significativos

Seja $x=(-1)^s\times m_x\times10^e$ (notação normalizada, sistema decimal) e $\tilde x$ uma aproximação de $x$.

$$
\begin{array}{|l|l|}
\hline
\textbf{Conceito} & \textbf{Definição} \\ \hline
\boldsymbol{p}\ \textbf{casas decimais (c.d.)}\ \text{corretas} & \begin{array}{l} p\ \text{é o}\ \textbf{maior}\ \text{inteiro (positivo)} \\ \text{tal que}\ \;|x-\tilde x|\le0.5\times10^{-p} \end{array} \\ \hline
\begin{array}{l} \boldsymbol{q}\ \textbf{algarismos significativos} \\ \textbf{(a.s.)}\ \text{corretos} \end{array} & \begin{array}{l} q\ \text{é o}\ \textbf{maior}\ \text{inteiro (positivo)} \\ \text{tal que}\ \;|x-\tilde x|\le0.5\times10^{-q}\times10^{e} \end{array} \\ \hline
\end{array}
$$

(Assume-se que $\tilde x$ tem, na notação normalizada, o mesmo expoente que $x$.)

**Exemplos**

$$
\begin{array}{|l|l|l|l|l|l|}
\hline
x & \tilde x & e & \lvert x-\tilde x\rvert & \textbf{c.d.} & \textbf{a.s.} \\ \hline
3.127 & 3.123 & 1 & 0.4\times10^{-2}<0.5\times10^{-2}=0.5\times10^{1-3} & \text{2} & \text{3} \\ \hline
0.0003127 & 0.0003123 & -3 & 0.4\times10^{-6}<0.5\times10^{-6}=0.5\times10^{-3-3} & \text{6} & \text{3} \\ \hline
3.127 & 3.12 & 1 & 0.7\times10^{-2}<0.5\times10^{-1}=0.5\times10^{1-2} & \text{1} & \text{2} \\ \hline
3.127 & 3.13 & 1 & 0.3\times10^{-2}<0.5\times10^{-2}=0.5\times10^{1-3} & \text{2} & \text{3} \\ \hline
\end{array}
$$

**Relação entre c.d. e a.s.:** se $\tilde x$ aproxima $x$ com $p$ c.d. e $x$ tem expoente $e$ na notação normalizada, então $\tilde x$ tem $q=p+e$ a.s. (supondo $q>0$ e que o expoente de $\tilde x$ é também $e$).

- Confirmação: $3.127$ → $p=2$, $e=1$ → $q=3$ ✓; $0.0003127$ → $p=6$, $e=-3$ → $q=3$ ✓.

### 1.5 Algarismos significativos e erro relativo

- O número de **casas decimais** corretas está ligado ao **erro absoluto**.
- O número de **algarismos significativos** corretos está relacionado com o **erro relativo**:

**(a)** Se $|R_{\tilde x}|\le0.5\times10^{-q}$, então $\tilde x$ tem $q$ a.s. corretos, pois

$$\left|\frac{x-\tilde x}{x}\right|\le0.5\times10^{-q}\;\Rightarrow\;|x-\tilde x|\le0.5\times10^{-q}\,|m_x10^e|<0.5\times10^{-q}\times10^e$$

**(b)** Se $\tilde x$ aproxima $x$ com $q$ a.s. corretos, então

$$|R_{\tilde x}|=\left|\frac{x-\tilde x}{x}\right|\le\frac{0.5\times10^{-q}\times10^e}{|x|}\le\frac{0.5\times10^{-q}\times10^e}{0.1\times10^e}=0.5\times10^{1-q}$$

**No Matlab:** dado $x\in R_F$,

$$|R_{\text{fl}(x)}|\le2^{-53}\approx1.1\times10^{-16}<0.5\times10^{-15}$$

Logo $\text{fl}(x)$ tem, **no mínimo, 15 algarismos significativos** de precisão.

---

## 2. Condicionamento e Estabilidade

### 2.1 Cancelamento subtrativo

**Exemplo**

- $x=0.76545424\times10^1$, $\;y=0.76544199\times10^1$
- $\tilde x=0.76545421\times10^1$, $\;\tilde y=0.76544200\times10^1$
- $\tilde x$ aproxima $x$ com **7 a.s.**; $\tilde y$ aproxima $y$ com **7 a.s.**

Subtraindo:

- $z=x-y=0.1225\times10^{-3}$
- $\tilde z=\tilde x-\tilde y=0.1221\times10^{-3}$
- $\tilde z$ aproxima $z$ com apenas **3 algarismos significativos**!

O erro relativo em $\tilde z$ pode ser cerca de $10\,000$ vezes superior aos erros relativos em $\tilde x$ e $\tilde y$.

> **Cancelamento subtrativo** — perda de algarismos significativos de precisão que resulta da **subtração de números muito próximos**. O erro relativo do resultado é muito maior do que o erro relativo dos dados.

Os primeiros 4 dígitos de $x$ e $y$ (`7.654…`) "cancelam-se" e o resultado fica só com os dígitos finais, que são precisamente os menos fiáveis.

#### Exemplo: $f(x)=\sqrt{x+1}-\sqrt x$ **ou** $g(x)=\dfrac1{\sqrt{x+1}+\sqrt x}$ ?

As duas expressões são **matematicamente equivalentes**, porque

$$\big(\sqrt{x+1}-\sqrt x\big)\big(\sqrt{x+1}+\sqrt x\big)=(x+1)-x=1.$$

Mas, calculadas no Matlab:

$$
\begin{array}{|l|l|l|}
\hline
x & f(x)\ \textbf{(com subtração)} & g(x)\ \textbf{(sem subtração)} \\ \hline
10^{1} & 1.5434713018702029\times10^{-1} & 1.5434713018702051\times10^{-1} \\ \hline
10^{4} & 4.9998750062485442\times10^{-3} & 4.9998750062496093\times10^{-3} \\ \hline
10^{7} & 1.5811387902431306\times10^{-4} & 1.5811387905557208\times10^{-4} \\ \hline
10^{8} & 5.0000000555883162\times10^{-5} & 4.9999999874999996\times10^{-5} \\ \hline
10^{10} & 4.9999944167211652\times10^{-6} & 4.9999999998750004\times10^{-6} \\ \hline
\end{array}
$$

- $f$: **cancelamento subtrativo** ✘ — quanto maior $x$, mais dígitos se perdem (para $x=10^{10}$, só coincidem uns 5 dígitos).
- $g$: **todos os algarismos significativos** ✔.

**Moral:** reescrever a fórmula (aqui, multiplicando pelo conjugado) evita o cancelamento.

### 2.2 As duas grandes questões: condicionamento e estabilidade

Ao resolver um problema, em Análise Numérica há duas questões fundamentais:

$$
\begin{array}{|l|l|}
\hline
\textbf{Questão} & \textbf{Conceito} \\ \hline
\begin{array}{l} \text{Quão sensível é a}\ \textbf{solução}\ \text{à forma} \\ \text{específica do}\ \textbf{problema}\text{?} \end{array} & \begin{array}{l} \textbf{Bom / mau condicionamento}\ \text{do} \\ \textbf{problema} \end{array} \\ \hline
\begin{array}{l} \text{Quão sensível é o}\ \textbf{algoritmo}\ \text{que} \\ \text{estamos a usar à precisão dos} \\ \text{dados?} \end{array} & \begin{array}{l} \textbf{Estabilidade / instabilidade}\ \text{do} \\ \textbf{algoritmo} \end{array} \\ \hline
\end{array}
$$

→ O condicionamento é uma propriedade do **problema**; a estabilidade é uma propriedade do **método/algoritmo**.

### 2.3 Condicionamento de um problema

#### Exemplo 1 — Sistema linear

$$\begin{cases}1.01x+0.99y=2.00\\0.99x+1.01y=2.00\end{cases}\qquad\text{Sol.: }x=1,\ y=1.$$

Alterando ligeiramente o lado direito:

$$
\begin{array}{|l|l|}
\hline
\textbf{Lado direito} & \textbf{Solução} \\ \hline
(2.02,\ 1.98) & x=2,\ y=0 \\ \hline
(1.98,\ 2.02) & x=0,\ y=2 \\ \hline
\end{array}
$$

Uma alteração de $\pm1\%$ nos dados provoca alterações de **100%** na solução: **"pequenas" alterações nos dados ⟹ "grandes" alterações nas soluções** → **problema mal condicionado!**

**Interpretação geométrica:** as duas retas de cada sistema são **quase paralelas**; ao deslocar ligeiramente uma delas, o ponto de interseção "salta" muito ao longo da direção comum.

#### Exemplo 2 — Polinómio de Wilkinson

$$p(x)=(x-1)(x-2)\cdots(x-20)=x^{20}-210x^{19}+20615x^{18}-1256850x^{17}+\cdots+20!$$

Seja $q$ o polinómio que resulta de $p$ modificando o coeficiente de $x^{19}$:

$$q(x)=x^{20}-(210+2^{-23})x^{19}+20615x^{18}-1256850x^{17}+\cdots+20!$$

Perturbação relativa: $\;2^{-23}/210\approx5.7\times10^{-10}$ no coeficiente $a_{19}$.

Raízes obtidas com o **Mathematica** (precisão infinita) e com o **Matlab**:

$$
\begin{array}{|c|c|c|c|}
\hline
\textbf{Raiz exata de}\ p & p\ \textbf{(Matlab)} & q\ \textbf{(Mathematica)} & q\ \textbf{(Matlab)} \\ \hline
\text{1} & \text{1.0000} & \text{1.0000} & \text{1.0000 + 0.0000i} \\ \hline
\text{2} & \text{2.0000} & \text{2.0000} & \text{2.0000 + 0.0000i} \\ \hline
\text{3} & \text{3.0000} & \text{3.0000} & \text{3.0000 + 0.0000i} \\ \hline
\text{4} & \text{4.0000} & \text{4.0000} & \text{4.0000 + 0.0000i} \\ \hline
\text{5} & \text{5.0000} & \text{5.0000} & \text{5.0000 + 0.0000i} \\ \hline
\text{6} & \text{6.0000} & \text{6.0000} & \text{6.0000 + 0.0000i} \\ \hline
\text{7} & \text{7.0000} & \text{6.9997} & \text{6.9994 + 0.0000i} \\ \hline
\text{8} & \text{8.0003} & \text{8.0073} & \text{8.0153 + 0.0000i} \\ \hline
\text{9} & \text{8.9984} & \text{8.91725} & \text{8.8533 + 0.0000i} \\ \hline
\text{10} & \text{10.0061} & \text{10.0953 }- \text{ 0.6435i} & \text{9.9859 }- \text{ 0.8088i} \\ \hline
\text{11} & \text{10.9840} & \text{10.0953 + 0.6435i} & \text{9.9859 + 0.8088i} \\ \hline
\text{12} & \text{12.0334} & \text{11.7936 }- \text{ 1.6523i} & \text{11.6820 }- \text{ 1.8654i} \\ \hline
\text{13} & \text{12.9491} & \text{11.7936 + 1.6523i} & \text{11.6820 + 1.8654i} \\ \hline
\text{14} & \text{14.0653} & \text{13.9924 }- \text{ 2.5188i} & \text{13.9142 }- \text{ 2.7966i} \\ \hline
\text{15} & \text{14.9354} & \text{13.9924 + 2.5188i} & \text{13.9142 + 2.7966i} \\ \hline
\text{16} & \text{16.0483} & \text{16.7307 }- \text{ 2.8126i} & \text{16.7521 }- \text{ 3.1418i} \\ \hline
\text{17} & \text{16.9711} & \text{16.7307 + 2.8126i} & \text{16.7521 + 3.1418i} \\ \hline
\text{18} & \text{18.0112} & \text{19.5024 }- \text{ 1.9403i} & \text{19.6819 }- \text{ 2.2103i} \\ \hline
\text{19} & \text{18.9972} & \text{19.5024 + 1.9403i} & \text{19.6819 + 2.2103i} \\ \hline
\text{20} & \text{20.0003} & \text{20.8469} & \text{21.0997 + 0.0000i} \\ \hline
\end{array}
$$

Conclusões:
- Os resultados do Matlab para as raízes de $p$ mostram como estas são **extremamente sensíveis ao efeito dos erros de arredondamento** (as raízes maiores já falham na 3.ª–4.ª casa decimal).
- Uma perturbação relativa de apenas $5.7\times10^{-10}$ em $a_{19}$ provoca uma alteração muito grande nas raízes: **metade delas "tornam-se" complexas**.

→ **Problema mal condicionado!**

#### Definição

> Um problema diz-se **mal condicionado** se for muito sensível a pequenas alterações nos seus dados; caso contrário, diz-se **bem condicionado**.

**Nota:** o cálculo de zeros de polinómios de grau elevado é, geralmente, um problema mal condicionado; a determinação de boas aproximações numéricas para esses zeros é, em geral, um problema difícil.

### 2.4 Número de condição de uma função

Seja $\tilde x$ um valor aproximado para $x$ com $|R_{\tilde x}|\ll1$, e seja $f$ continuamente diferenciável numa vizinhança de $x$ (que contém $\tilde x$).

**Como se "propaga" o erro em $x$ ao cálculo de $f(x)$?**

Sejam $y=f(x)$ e $\tilde y=f(\tilde x)$. Pelo **teorema do valor médio**:

$$y-\tilde y=f(x)-f(\tilde x)=f'(\xi)(x-\tilde x),\qquad\xi\in\big(\min\{x,\tilde x\},\max\{x,\tilde x\}\big)$$

Então:

$$|R_{\tilde y}|=\left|\frac{y-\tilde y}{y}\right|=\left|\frac{f'(\xi)(x-\tilde x)}{f(x)}\right|=\left|\frac{x\,f'(\xi)}{f(x)}\right|\cdot\left|\frac{x-\tilde x}{x}\right|=\left|\frac{x\,f'(\xi)}{f(x)}\right|\,|R_{\tilde x}|$$

Como $x$ e $\tilde x$ estão próximos, é razoável substituir $f'(\xi)$ por $f'(x)$:

$$|R_{f(\tilde x)}|\approx\left|\frac{x\,f'(x)}{f(x)}\right|\,|R_{\tilde x}|$$

**Número de condição de $f$ em $x$:**

$$\boxed{\;\text{cond}\,f(x)=\left|\frac{x\,f'(x)}{f(x)}\right|\;}$$

- Se $\text{cond}\,f(x)$ é **"pequeno"** → calcular $f(x)$ é um problema **bem condicionado**.
- Se $\text{cond}\,f(x)$ é **"grande"** → calcular $f(x)$ é um problema **mal condicionado**.

(Interpretação: o número de condição é o **fator de amplificação do erro relativo** ao passar de $x$ para $f(x)$.)

**Exemplos**

- $f(x)=\sqrt x$: $\;f'(x)=\dfrac1{2\sqrt x}$ ⟹ $\text{cond}\,f(x)=\dfrac12$
  → função **bem condicionada para todo o $x$** (o erro relativo até diminui para metade).
- $f(x)=e^x$: $\;f'(x)=e^x$ ⟹ $\text{cond}\,f(x)=|x|$
  → **mal condicionada** para $|x|$ "grande"; **bem condicionada** para $|x|$ "pequeno".
  (Por exemplo, em $x=100$ o erro relativo em $x$ é amplificado ~100 vezes.)
- **Extra:** $f(x)=\ln x$: $\;\text{cond}\,f(x)=\dfrac1{|\ln x|}$ → mal condicionada perto de $x=1$ (onde $\ln x\approx0$).

### 2.5 Estabilidade / instabilidade de um método

> Um método é **instável** se os erros se amplificam no decurso dos cálculos, de forma inaceitável; caso contrário, o método diz-se **estável**.

**Exemplo — duas expressões para a mesma função:**

$$f(x)=\frac{1-\cos^2x}{x^2}\qquad\qquad g(x)=\frac{\operatorname{sen}^2x}{x^2}$$

Os resultados de $\cos x$ e $\operatorname{sen}x$ foram arredondados para **10 a.s.**; os restantes cálculos foram efetuados com a precisão do Matlab:

```matlab
>> f=@(x) (1-round(cos(x),10).^2)./x.^2;
>> g=@(x) round(sin(x),10).^2./x.^2;
>> [f(5*10^-5) g(5*10^-5)]
ans =
    0.959999990612914   0.999999999200000
```

- O valor correto está muito perto de $1$ (para $x$ pequeno, $\operatorname{sen}^2x/x^2\approx1-x^2/3\approx0.99999999917$).
- $g$ dá $0.9999999992$ ✔; $f$ dá $0.96$ ✘ — **erro de cerca de 4%!**

**Porquê?** Para $x$ pequeno, $\cos x\approx1$, logo $\cos^2x\approx1$ e $1-\cos^2x$ é uma **subtração de números muito próximos** → cancelamento subtrativo. Como $\cos x$ foi arredondado para 10 a.s., o resultado da subtração (~$2.5\times10^{-9}$) só tem 1–2 dígitos corretos; depois divide-se por $x^2$ (muito pequeno) e o erro fica visível.

**Gráfico do slide** (em $[-0.01,\,0.01]$): $g$ é praticamente constante e igual a $\approx1$, enquanto $f$ **oscila e "cai"** junto de $x=0$.

> As funções $f$ e $g$, embora **matematicamente equivalentes**, são **numericamente diferentes**!

> **Nota:** o uso de fórmulas que possam provocar cancelamento subtrativo é uma das grandes fontes de **instabilidade** nos algoritmos.

