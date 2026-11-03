# Lógica CC — Resumo do Cap. 2: Cálculo Proposicional da Lógica Clássica (CP)

## Mapa do capítulo

| 2.1 Sintaxe | 2.2 Semântica | 2.3 Dedução Natural (DNP) |
|---|---|---|
| fórmulas, $\mathrm{var}$, substituição, $\mathrm{subf}$ | valorações, tautologias, equivalências, FNC/FND, $\models$ | derivações, $\vdash$, consistência $\Rightarrow$ Correção, Completude, Compacidade |

---

# 2.1 Sintaxe

## Alfabeto $A^{CP}$ (Def. 22)

- **Variáveis proposicionais** $p_0, p_1, \dots, p_n, \dots$ (conjunto numerável $V^{CP}$);
- **Conetivos:** $\bot$ (absurdo), $\neg$, $\wedge$, $\vee$, $\to$, $\leftrightarrow$;
- **Símbolos auxiliares:** $($ e $)$.

## Fórmulas $\mathcal{F}^{CP}$ (Def. 24) — definição indutiva

1. $\bot \in \mathcal{F}^{CP}$;
2. $p \in \mathcal{F}^{CP}$, para todo $p \in V^{CP}$;
3. $\varphi \in \mathcal{F}^{CP} \Rightarrow (\neg\varphi) \in \mathcal{F}^{CP}$;
4. $\varphi, \psi \in \mathcal{F}^{CP} \Rightarrow (\varphi \,\square\, \psi) \in \mathcal{F}^{CP}$, para todo $\square \in \{\wedge, \vee, \to, \leftrightarrow\}$.

**Exemplo.** $((\neg\bot) \wedge (p_6 \to p_0))$ é uma fórmula, com sequência de formação
$$\bot,\ (\neg\bot),\ p_6,\ p_0,\ (p_6 \to p_0),\ ((\neg\bot) \wedge (p_6 \to p_0)).$$
Já $\bot\, p_{20})$ e $(p_1)$ **não** são fórmulas.

**Convenção (Not. 27):** omitem-se os parênteses extremos e os que rodeiam negações.

## Indução e recursão estrutural em fórmulas

- **Princípio de indução (Teor. 28):** provar $P(\bot)$; $P(p)$ para toda a variável; $P(\psi) \Rightarrow P(\neg\psi)$; e $P(\psi_1) \wedge P(\psi_2) \Rightarrow P(\psi_1 \,\square\, \psi_2)$.
  Exemplo (Ex. 30): em toda a fórmula, o número de «$($» é igual ao número de «$)$».
- A definição de $\mathcal{F}^{CP}$ é **determinista**, logo admite **recursão estrutural** (Obs. 31).

## Funções definidas por recursão estrutural

**Variáveis de uma fórmula (Def. 32):**
$$
\begin{aligned}
\mathrm{var}(\bot) &= \emptyset, \qquad \mathrm{var}(p) = \{p\},\\
\mathrm{var}(\neg\varphi) &= \mathrm{var}(\varphi),\\
\mathrm{var}(\varphi \,\square\, \psi) &= \mathrm{var}(\varphi) \cup \mathrm{var}(\psi).
\end{aligned}
$$

**Substituição de $p$ por $\psi$ (Def. 34):**
$$
\begin{aligned}
\bot[\psi/p] &= \bot, \qquad
p_i[\psi/p] =
\begin{cases}
\psi & \text{se } p_i = p\\
p_i & \text{se } p_i \neq p
\end{cases}\\
(\neg\varphi)[\psi/p] &= \neg\,(\varphi[\psi/p]),\\
(\varphi \,\square\, \chi)[\psi/p] &= \varphi[\psi/p] \,\square\, \chi[\psi/p].
\end{aligned}
$$

**Subfórmulas (Def. 37):**
$$
\begin{aligned}
\mathrm{subf}(\varphi) &= \{\varphi\}, \quad \text{para } \varphi \in V^{CP} \cup \{\bot\},\\
\mathrm{subf}(\neg\varphi) &= \{\neg\varphi\} \cup \mathrm{subf}(\varphi),\\
\mathrm{subf}(\varphi \,\square\, \psi) &= \{\varphi \,\square\, \psi\} \cup \mathrm{subf}(\varphi) \cup \mathrm{subf}(\psi).
\end{aligned}
$$

**Resultados:**

- **Prop. 36:** se $p \notin \mathrm{var}(\varphi)$, então $\varphi[\psi/p] = \varphi$.
- **Prop. 39:** $\varphi$ é subfórmula de $\psi$ se e só se $\psi = \varphi$, ou $\psi = \neg\psi_1$ e $\varphi \in \mathrm{subf}(\psi_1)$, ou $\psi = \psi_1 \,\square\, \psi_2$ e $\varphi \in \mathrm{subf}(\psi_1) \cup \mathrm{subf}(\psi_2)$.

---

# 2.2 Semântica

## Valorações (Def. 40–41)

Valores lógicos: verdadeiro $= 1$, falso $= 0$. Uma **valoração** é uma função $v : \mathcal{F}^{CP} \to \{0,1\}$ tal que:

- $v(\bot) = 0$;
- $v(\neg\varphi) = f_\neg(v(\varphi))$ e $v(\varphi \,\square\, \psi) = f_\square(v(\varphi), v(\psi))$, de acordo com as tabelas de verdade.

| $\varphi$ | $\psi$ | $\varphi \wedge \psi$ | $\varphi \vee \psi$ | $\varphi \to \psi$ | $\varphi \leftrightarrow \psi$ |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 1 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 | 0 | 0 |
| 0 | 1 | 0 | 1 | 1 | 0 |
| 0 | 0 | 0 | 0 | 1 | 1 |

**Formulações úteis (Prop. 42):**

- $v(\neg\varphi) = 1 - v(\varphi)$;
- $v(\varphi \wedge \psi) = \min\{v(\varphi), v(\psi)\}$ e $v(\varphi \vee \psi) = \max\{v(\varphi), v(\psi)\}$;
- $v(\varphi \to \psi) = 1 \iff v(\varphi) = 0$ ou $v(\psi) = 1$;
- $v(\varphi \leftrightarrow \psi) = 1 \iff v(\varphi) = v(\psi)$.

**Dois resultados estruturais:**

- **Prop. 43:** toda a função $f : V^{CP} \to \{0,1\}$ se estende a **uma e uma só** valoração (consequência da recursão estrutural).
- **Prop. 46 (localidade):** se $v_1(p) = v_2(p)$ para todo $p \in \mathrm{var}(\varphi)$, então $v_1(\varphi) = v_2(\varphi)$ (por indução estrutural).

## Tautologias e contradições (Def. 47–52)

- **Tautologia:** $v(\varphi) = 1$ para toda a valoração $v$. Escreve-se $\models \varphi$.
- **Contradição:** $v(\varphi) = 0$ para toda a valoração $v$.
- $\varphi$ é tautologia $\iff$ $\neg\varphi$ é contradição; $\varphi$ é contradição $\iff$ $\neg\varphi$ é tautologia (Prop. 50).
- **Atenção (Obs. 51):** «não ser tautologia» **não** é o mesmo que «ser contradição». Há fórmulas que não são nenhuma das duas, como $p_0$ ou $p_0 \vee p_1$.
- **Decidibilidade (Obs. 52):** pela Prop. 46, basta testar $2^{\#\mathrm{var}(\varphi)}$ valorações, ou seja, construir uma **tabela de verdade** (colunas para as variáveis, para as subfórmulas auxiliares e para $\varphi$).

**Teorema da Generalização (Teor. 54):** se $\varphi$ é tautologia, então $\varphi[\psi/p]$ também é.
Exemplo: como $p_0 \vee \neg p_0$ é tautologia, $\psi \vee \neg\psi$ é tautologia para qualquer $\psi$.

## Equivalência lógica (Def. 56–60)

$\varphi \Leftrightarrow \psi$ quando $\varphi \leftrightarrow \psi$ é tautologia, isto é, $v(\varphi) = v(\psi)$ para toda a valoração $v$. É uma **relação de equivalência** (reflexiva, simétrica e transitiva; Prop. 58 e Cor. 59).

**Equivalências lógicas fundamentais (Prop. 60):**

| Lei | Fórmulas |
|---|---|
| Associatividade | $(\varphi \vee \psi) \vee \sigma \Leftrightarrow \varphi \vee (\psi \vee \sigma)$ ; idem para $\wedge$ |
| Comutatividade | $\varphi \vee \psi \Leftrightarrow \psi \vee \varphi$ ; idem para $\wedge$ |
| Idempotência | $\varphi \vee \varphi \Leftrightarrow \varphi$ ; idem para $\wedge$ |
| Elemento neutro | $\varphi \vee \bot \Leftrightarrow \varphi$ ; $\varphi \wedge \neg\bot \Leftrightarrow \varphi$ |
| Elemento absorvente | $\varphi \vee \neg\bot \Leftrightarrow \neg\bot$ ; $\varphi \wedge \bot \Leftrightarrow \bot$ |
| Distributividade | $\varphi \vee (\psi \wedge \sigma) \Leftrightarrow (\varphi \vee \psi) \wedge (\varphi \vee \sigma)$ ; $\varphi \wedge (\psi \vee \sigma) \Leftrightarrow (\varphi \wedge \psi) \vee (\varphi \wedge \sigma)$ |
| Leis de De Morgan | $\neg(\varphi \vee \psi) \Leftrightarrow \neg\varphi \wedge \neg\psi$ ; $\neg(\varphi \wedge \psi) \Leftrightarrow \neg\varphi \vee \neg\psi$ |
| Dupla negação | $\neg\neg\varphi \Leftrightarrow \varphi$ |
| Contrarrecíproco | $\varphi \to \psi \Leftrightarrow \neg\psi \to \neg\varphi$ |
| Um conetivo à custa de outros | $\varphi \to \psi \Leftrightarrow \neg\varphi \vee \psi$ ; $\varphi \leftrightarrow \psi \Leftrightarrow (\varphi \to \psi) \wedge (\psi \to \varphi)$ ; $\varphi \vee \psi \Leftrightarrow \neg\varphi \to \psi$ ; $\varphi \wedge \psi \Leftrightarrow \neg(\neg\varphi \vee \neg\psi)$ ; $\neg\varphi \Leftrightarrow \varphi \to \bot$ ; $\bot \Leftrightarrow \varphi \wedge \neg\varphi$ |

**Teorema da Substituição (Teor. 62):** $\varphi_1 \Leftrightarrow \varphi_2$ se e só se $\psi[\varphi_1/p] \Leftrightarrow \psi[\varphi_2/p]$ para todo $\psi \in \mathcal{F}^{CP}$.
Serve para **reescrever dentro de uma fórmula**. Exemplo (Ex. 63):
$$\neg(\neg\varphi \wedge \psi) \Leftrightarrow \neg\neg\varphi \vee \neg\psi \Leftrightarrow \varphi \vee \neg\psi.$$

## Conjuntos completos de conetivos (Def. 64, Prop. 65)

Um conjunto $X$ de conetivos é **completo** se toda a fórmula é logicamente equivalente a uma fórmula que só usa conetivos de $X$.
São completos: $\{\to, \neg\}$, $\{\to, \bot\}$, $\{\wedge, \neg\}$ e $\{\vee, \neg\}$.

*Técnica da prova (para $\{\to,\neg\}$):* definir por recursão uma tradução $f$ com
$$f(\bot) = \neg(p_0 \to p_0), \quad f(\varphi \vee \psi) = \neg f(\varphi) \to f(\psi), \quad f(\varphi \wedge \psi) = \neg(f(\varphi) \to \neg f(\psi)), \ \dots$$
e provar por indução estrutural que $\varphi \Leftrightarrow f(\varphi)$.

## Formas normais (Def. 67–73)

- **Literal:** variável proposicional ou negação de variável proposicional.
- **FNC** (forma normal conjuntiva): $(l_{11} \vee \dots \vee l_{1m_1}) \wedge \dots \wedge (l_{n1} \vee \dots \vee l_{nm_n})$.
- **FND** (forma normal disjuntiva): $(l_{11} \wedge \dots \wedge l_{1m_1}) \vee \dots \vee (l_{n1} \wedge \dots \wedge l_{nm_n})$.
- Todo o literal, e toda a conjunção ou disjunção de literais, é simultaneamente FNC e FND. Já $\neg(p_1 \vee p_0)$ não é nenhuma das duas.

**Prop. 70:** toda a fórmula tem uma FNC e uma FND logicamente equivalentes.

**Método 1 — transformações:**

1. eliminar $\leftrightarrow$, $\to$ e $\bot$ (usando as equivalências acima);
2. passar as negações para dentro com as leis de De Morgan;
3. eliminar duplas negações;
4. aplicar a distributividade.

**Método 2 — tabela de verdade (para a FND):**

1. se $\varphi$ é contradição, tomar $p_0 \wedge \neg p_0$; se é tautologia, tomar $p_0 \vee \neg p_0$;
2. caso contrário, para cada linha com valor $1$, formar a conjunção $\beta_i = \alpha_{i,1} \wedge \dots \wedge \alpha_{i,n}$, onde $\alpha_{i,j} = p_j$ se $a_{i,j} = 1$ e $\alpha_{i,j} = \neg p_j$ se $a_{i,j} = 0$;
3. $\varphi^d = \beta_{i_1} \vee \dots \vee \beta_{i_k}$.

*Exemplo 73:* $((p_3 \to p_1) \vee (\neg p_1 \leftrightarrow \bot)) \wedge p_2$ vale $1$ em três linhas, e uma FND equivalente é
$$(p_1 \wedge p_2 \wedge p_3) \vee (p_1 \wedge p_2 \wedge \neg p_3) \vee (\neg p_1 \wedge p_2 \wedge \neg p_3).$$

## Satisfação, consistência e consequência semântica

**Definições (Def. 74–77):**

- $v$ **satisfaz** $\varphi$ ($v \models \varphi$) quando $v(\varphi) = 1$. $v$ satisfaz $\Gamma$ quando satisfaz **todas** as fórmulas de $\Gamma$. Toda a valoração satisfaz $\emptyset$.
- Uma fórmula (ou conjunto) é **satisfazível** / **(semanticamente) consistente** se alguma valoração a(o) satisfaz; é **insatisfazível** / **inconsistente** se nenhuma o faz.
- Se $\Gamma \subseteq \Delta$: $\Delta$ consistente $\Rightarrow$ $\Gamma$ consistente; $\Gamma$ inconsistente $\Rightarrow$ $\Delta$ inconsistente (Prop. 79).

**Consequência semântica (Def. 80):** $\Gamma \models \varphi$ quando **toda** a valoração que satisfaz $\Gamma$ satisfaz também $\varphi$.

Observações e exemplos:

- $\models \varphi \iff \emptyset \models \varphi$ (Prop. 83).
- Se $\Gamma$ é **inconsistente**, então $\Gamma \models \varphi$ para toda a fórmula $\varphi$ (Obs. 84).
- $\{\varphi, \varphi \to \psi\} \models \psi$ (modus ponens) é válido; mas $\{\varphi \to \psi\} \models \psi$ é **falso** (contraexemplo: $v(p_1) = v(p_2) = 0$).

**Propriedades de $\models$ (Prop. 86):**

| | |
|---|---|
| a) | $\varphi \in \Gamma \Rightarrow \Gamma \models \varphi$ |
| b) | $\Gamma \models \varphi$ e $\Gamma \subseteq \Delta$ $\Rightarrow$ $\Delta \models \varphi$ (monotonia) |
| c) | $\Gamma \models \varphi$ e $\Delta, \varphi \models \psi$ $\Rightarrow$ $\Delta, \Gamma \models \psi$ (corte) |
| d) | $\Gamma \models \varphi \to \psi \iff \Gamma, \varphi \models \psi$ |
| e) | $\Gamma \models \varphi \to \psi$ e $\Gamma \models \varphi$ $\Rightarrow$ $\Gamma \models \psi$ |

**Prop. 87:** as seguintes afirmações são equivalentes:

1. $\varphi_1, \dots, \varphi_n \models \varphi$;
2. $\varphi_1 \wedge \dots \wedge \varphi_n \models \varphi$;
3. $\models (\varphi_1 \wedge \dots \wedge \varphi_n) \to \varphi$.

**Redução ao absurdo (Prop. 88):** $\Gamma \models \varphi \iff \Gamma \cup \{\neg\varphi\}$ é semanticamente inconsistente.

---

# 2.3 Sistema Formal de Dedução Natural (DNP)

## Ideia

Uma formalização de «demonstração» através de **regras de inferência** que constroem **árvores finitas de fórmulas**. As hipóteses temporárias são **canceladas**, o que se nota por $[\varphi]$.

## Regras de inferência de DNP (Def. 93)

**Regras de introdução**

$$
\dfrac{\begin{matrix}[\varphi]\\ \vdots\\ \psi\end{matrix}}{\varphi \to \psi}\ {\to}I
\qquad
\dfrac{\varphi \quad \psi}{\varphi \wedge \psi}\ {\wedge}I
\qquad
\dfrac{\begin{matrix}[\varphi]\\ \vdots\\ \bot\end{matrix}}{\neg\varphi}\ {\neg}I
$$

$$
\dfrac{\varphi}{\varphi \vee \psi}\ {\vee_1}I
\qquad
\dfrac{\psi}{\varphi \vee \psi}\ {\vee_2}I
\qquad
\dfrac{\begin{matrix}[\varphi]\\ \vdots\\ \psi\end{matrix} \quad \begin{matrix}[\psi]\\ \vdots\\ \varphi\end{matrix}}{\varphi \leftrightarrow \psi}\ {\leftrightarrow}I
$$

**Regras de eliminação**

$$
\dfrac{\varphi \quad \varphi \to \psi}{\psi}\ {\to}E
\qquad
\dfrac{\varphi \wedge \psi}{\varphi}\ {\wedge_1}E
\qquad
\dfrac{\varphi \wedge \psi}{\psi}\ {\wedge_2}E
\qquad
\dfrac{\varphi \quad \neg\varphi}{\bot}\ {\neg}E
$$

$$
\dfrac{\varphi \vee \psi \quad \begin{matrix}[\varphi]\\ \vdots\\ \sigma\end{matrix} \quad \begin{matrix}[\psi]\\ \vdots\\ \sigma\end{matrix}}{\sigma}\ {\vee}E
\qquad
\dfrac{\varphi \quad \varphi \leftrightarrow \psi}{\psi}\ {\leftrightarrow_1}E
\qquad
\dfrac{\psi \quad \varphi \leftrightarrow \psi}{\varphi}\ {\leftrightarrow_2}E
$$

**Regras de absurdo**

$$
\dfrac{\begin{matrix}[\neg\varphi]\\ \vdots\\ \bot\end{matrix}}{\varphi}\ \text{(RAA)}
\qquad
\dfrac{\bot}{\varphi}\ (\bot)\ \text{(ex falso)}
$$

Quais as regras que **cancelam** hipóteses: ${\to}I$, ${\neg}I$, ${\leftrightarrow}I$, ${\vee}E$ e RAA.

A regra **RAA** é a que distingue a lógica clássica da intuicionista: é ela que permite provar $\neg\neg\varphi \to \varphi$.

## Derivações (Def. 95–99)

- O conjunto $\mathcal{D}_{DNP}$ das **derivações** é o **menor** conjunto de árvores tal que: (a) toda a fórmula, sozinha, é uma derivação; (b) é fechado para cada regra de inferência. *(É mais uma definição indutiva: admite indução estrutural, recursão estrutural e subderivações.)*
- **Conclusão:** a raiz. **Hipóteses:** as folhas, que podem ser **canceladas** ou **não canceladas**.
- $D$ é uma **derivação de $\varphi$ a partir de $\Gamma$** se a conclusão de $D$ é $\varphi$ e o conjunto das hipóteses **não canceladas** de $D$ está contido em $\Gamma$.
- $D$ é uma **demonstração de $\varphi$** se é uma derivação de $\varphi$ a partir de $\emptyset$.

**Exemplos-chave** (com $\varphi, \psi, \sigma$ quaisquer):

- $\psi \to (\varphi \to \sigma) \vdash (\varphi \wedge \psi) \to \sigma$: usa ${\wedge}E$, ${\to}E$ duas vezes e ${\to}I$.
- $\vdash \neg\neg\varphi \to \varphi$: usa ${\neg}E$, RAA e ${\to}I$.
- $\vdash \varphi \to (\psi \to \varphi)$: a primeira ${\to}I$ cancela $\varphi$; a segunda **não cancela nada** (o cancelamento é opcional).
- $\{\varphi \to \psi\} \vdash (\psi \to \sigma) \to (\varphi \to \sigma)$.
- $\vdash \neg(\varphi \wedge \neg\varphi)$.

## Consequência sintática e consistência sintática (Def. 101–109)

- $\Gamma \vdash \varphi$ ($\varphi$ é **derivável** de $\Gamma$): existe uma derivação de $\varphi$ a partir de $\Gamma$.
- $\vdash \varphi$: $\varphi$ é **teorema** de DNP $\iff \emptyset \vdash \varphi$.
- $\Gamma$ é **sintaticamente inconsistente** se $\Gamma \vdash \bot$; caso contrário, é sintaticamente consistente.

**Prop. 107.** São equivalentes:

1. $\Gamma$ é sintaticamente inconsistente;
2. existe $\varphi$ tal que $\Gamma \vdash \varphi$ e $\Gamma \vdash \neg\varphi$;
3. $\Gamma \vdash \varphi$ para **toda** a fórmula $\varphi$.

**Prop. 109 (propriedades de $\vdash$):**

- reflexividade: $\varphi \in \Gamma \Rightarrow \Gamma \vdash \varphi$;
- monotonia: $\Gamma \vdash \varphi$ e $\Gamma \subseteq \Delta$ $\Rightarrow$ $\Delta \vdash \varphi$;
- corte: $\Gamma \vdash \varphi$ e $\Delta, \varphi \vdash \psi$ $\Rightarrow$ $\Delta, \Gamma \vdash \psi$;
- **teorema da dedução:** $\Gamma \vdash \varphi \to \psi \iff \Gamma, \varphi \vdash \psi$;
- $\Gamma \vdash \varphi \to \psi$ e $\Delta \vdash \varphi$ $\Rightarrow$ $\Gamma, \Delta \vdash \psi$.

---

# O grande resultado: $\vdash$ e $\models$ coincidem

## Teorema da Correção

$$\Gamma \vdash \varphi \ \Longrightarrow\ \Gamma \models \varphi$$

**Prova:** por **indução estrutural em derivações**. *Lema:* se $D$ é uma derivação de $\varphi$ a partir de $\Gamma$, então $\Gamma \models \varphi$.

- Caso folha: $\varphi \in \Gamma$, logo $\Gamma \models \varphi$ (Prop. 86a).
- Caso ${\to}I$: pela H.I., $\Gamma, \psi \models \sigma$, donde $\Gamma \models \psi \to \sigma$ (86d).
- Caso ${\to}E$: pelas H.I., $\Gamma \models \sigma$ e $\Gamma \models \sigma \to \psi$, donde $\Gamma \models \psi$ (86e).
- As restantes regras: exercício.

**Uso prático (Obs. 110):** se $\Gamma \not\models \varphi$, então $\Gamma \nvdash \varphi$. É assim que se prova que algo **não** é derivável: basta exibir uma valoração contraexemplo.
*(Ex. 111:* de $\{p_1 \vee p_2,\ p_1 \to p_0\}$ não se deriva $p_0 \vee p_1$, pois a valoração com $v(p_2) = 1$ e $0$ nas restantes variáveis é um contraexemplo.)

## Teorema da Completude — passos da prova

$$\Gamma \models \varphi \ \Longrightarrow\ \Gamma \vdash \varphi$$

A demonstração constrói-se em cinco degraus:

1. **Conjunto maximalmente consistente (Def. 112).** $\Gamma$ é sintaticamente consistente e, para toda a fórmula $\varphi$, $\varphi \in \Gamma$ ou $\neg\varphi \in \Gamma$. Se $\Gamma$ é maximalmente consistente e $\Gamma \vdash \varphi$, então $\varphi \in \Gamma$ (Prop. 113).
2. **Extensão de Lindenbaum (Prop. 114).** Todo o conjunto $\Gamma$ sintaticamente consistente está contido num $\Gamma^*$ maximalmente consistente. *Construção:* enumerar $\mathcal{F}^{CP}$ (que é numerável) como $\varphi_0, \varphi_1, \dots$; tomar $\Gamma_0 = \Gamma$ e
$$
\Gamma_{n+1} =
\begin{cases}
\Gamma_n \cup \{\varphi_n\} & \text{se } \Gamma_n \cup \{\varphi_n\} \text{ é sintaticamente consistente}\\
\Gamma_n \cup \{\neg\varphi_n\} & \text{caso contrário}
\end{cases}
\qquad
\Gamma^* = \bigcup_{n \in \mathbb{N}_0} \Gamma_n .
$$
3. **Lema do modelo (Prop. 115).** Se $\Gamma$ é sintaticamente consistente, então é **semanticamente consistente**. *Ideia:* definir $v(p) = 1 \iff p \in \Gamma^*$ e provar, por indução estrutural, que $v(\varphi) = 1 \iff \varphi \in \Gamma^*$ para toda a fórmula $\varphi$. É neste passo que todas as regras de DNP se tornam necessárias.
4. **Teorema 116.** $\Gamma$ é sintaticamente consistente $\iff$ $\Gamma$ é semanticamente consistente. («$\Rightarrow$» é o lema anterior; «$\Leftarrow$» vem da Correção: se $\Gamma \vdash \bot$, então $\Gamma \models \bot$, o que é impossível havendo uma valoração que satisfaça $\Gamma$.)
5. **Completude (Teor. 118)**, por contrarrecíproco. Se $\Gamma \nvdash \varphi$, então $\Gamma \cup \{\neg\varphi\}$ é sintaticamente consistente (senão, uma derivação de $\bot$ a partir de $\Gamma \cup \{\neg\varphi\}$ daria, por RAA, uma derivação de $\varphi$ a partir de $\Gamma$). Pelo passo 3, existe $v$ com $v \models \Gamma$ e $v(\varphi) = 0$, logo $\Gamma \not\models \varphi$.

## Adequação e Compacidade

- **Adequação (Teor. 119):** $\Gamma \vdash \varphi \iff \Gamma \models \varphi$.
- **Corolário 120:** $\varphi$ é teorema de DNP $\iff$ $\varphi$ é tautologia.
- **Compacidade (Teor. 121):** $\Gamma$ é consistente $\iff$ todo o subconjunto **finito** de $\Gamma$ é consistente.
  *Porquê:* uma derivação de $\bot$ é uma árvore finita, logo usa apenas um número finito de hipóteses não canceladas.

---

# Cábula final (o que fazer em cada situação)

| Se me pedem… | Uso… |
|---|---|
| Provar uma propriedade de todas as fórmulas | indução estrutural (Teor. 28) |
| Decidir se $\varphi$ é tautologia / contradição | tabela de verdade com $2^{\#\mathrm{var}(\varphi)}$ linhas |
| Simplificar ou transformar uma fórmula | equivalências (Prop. 60) + Teorema da Substituição |
| Passar a FNC/FND | transformações, ou linhas com valor $1$ da tabela (FND) |
| Provar $\Gamma \models \varphi$ | tomar $v \models \Gamma$ e verificar $v(\varphi) = 1$; ou provar que $\Gamma \cup \{\neg\varphi\}$ é inconsistente |
| Refutar $\Gamma \models \varphi$ | exibir $v$ com $v \models \Gamma$ e $v(\varphi) = 0$ |
| Provar $\Gamma \vdash \varphi$ | construir uma derivação em DNP |
| Refutar $\Gamma \vdash \varphi$ | pela Correção, mostrar $\Gamma \not\models \varphi$ |
| Cancelar uma hipótese | ${\to}I$, ${\neg}I$, ${\leftrightarrow}I$, ${\vee}E$, RAA |

## Erros típicos a evitar

- Confundir $\models$ (semântico, olha para valorações) com $\vdash$ (sintático, olha para derivações): só coincidem *graças* à Correção e à Completude.
- Dizer que «não é tautologia $\Rightarrow$ é contradição».
- Pensar que $\{\varphi \to \psi\} \models \psi$.
- Esquecer que de um conjunto **inconsistente** se segue **qualquer** fórmula.
- Deixar por cancelar a hipótese temporária de ${\to}I$, ${\neg}I$, ${\vee}E$ ou RAA, ou cancelá-la com uma regra que não a cancela.
- Em indução estrutural, esquecer algum caso ($\bot$, variáveis, $\neg$ e **cada** conetivo binário).
