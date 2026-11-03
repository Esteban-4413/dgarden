
#set page(
  paper: "a4",
  margin: (x: 1.8cm, top: 1.6cm, bottom: 1.6cm),
  numbering: "1",
  header: context {
    if counter(page).get().first() > 1 [
      #set text(8pt, fill: gray)
      Twilight Sparkle e o Transtorno Obsessivo-Compulsivo #h(1fr) Estudo de caso
    ]
  },
)
#set text(font: "New Computer Modern", size: 9pt, lang: "pt", region: "br")
#set par(justify: true, leading: 0.55em, first-line-indent: 1em, spacing: 0.6em)
#set heading(numbering: "1.")
#show heading: it => block(above: 1em, below: 0.6em)[
  #set text(10.5pt, weight: "bold", fill: rgb("#4b2a7b"))
  #it
]
#show figure.caption: set text(8.5pt)
#show link: set text(fill: rgb("#4b2a7b"))

#align(center)[
  #text(16pt, weight: "bold", fill: rgb("#4b2a7b"))[
    "Um Dia Sem Lista É um Dia Perdido": \
    Indícios de Sintomas Obsessivo-Compulsivos \
    no Comportamento de Twilight Sparkle
  ] \ #v(0.4em)
  #text(10pt)[E. Orozcco et al.#super[1]] \
  #text(
    8.5pt,
    style: "italic",
  )[#super[1] Departamento de Psicologia Aplicada à Cultura Pop · #datetime.today().display("[day]/[month]/[year]")]
]

#v(0.3em)
#block(fill: rgb("#f1ebfa"), inset: 8pt, radius: 3pt, width: 100%)[
  #set par(first-line-indent: 0pt)
  *Resumo.* Este estudo analisa, de forma qualitativa, o comportamento da personagem Twilight Sparkle (_My Little Pony: A Amizade É Mágica_) à luz dos critérios do DSM-5 para o Transtorno Obsessivo-Compulsivo (TOC). Com base em episódios-chave e em material audiovisual de referência, discutem-se obsessões, compulsões, perfeccionismo e busca de reasseguramento. Modelos diferenciais, markovianos e bayesianos são propostos. Conclui-se que a personagem apresenta um padrão _compatível_ com traços obsessivo-compulsivos, mas que a natureza ficcional do objeto impede qualquer diagnóstico formal. #h(0.5em)
  *Palavras-chave:* TOC; Twilight Sparkle; perfeccionismo; ansiedade; psicologia da mídia.
]

= Introdução

O TOC é caracterizado por obsessões (pensamentos, imagens ou impulsos intrusivos e indesejados) e compulsões (comportamentos ou rituais mentais repetitivos realizados para reduzir a ansiedade) [1]. Estima-se que a prevalência ao longo da vida seja de cerca de 2% [2]. Personagens ficcionais frequentemente exibem traços que permitem discussões psicológicas didáticas, ainda que sem valor diagnóstico.

Twilight Sparkle, unicórnio (depois alicórnio) estudiosa e protagonista da série, destaca-se por listas minuciosas, cronogramas rígidos, medo intenso de falhar e reações desproporcionais a pequenos desvios de planos. Este trabalho pergunta: *esses comportamentos são melhor entendidos como simples traços de personalidade ou como um quadro compatível com TOC?*

#grid(
  columns: (3.2cm, 1fr),
  gutter: 12pt,
  figure(
    image("twilight.png", height: 8.6cm),
    caption: [Twilight Sparkle em suas diferentes versões (pônei, alicórnio, humana e _chibi_).],
  ),
  [
    = Método

    Realizou-se uma análise qualitativa de conteúdo de três episódios: _Winter Wrap Up_ (T1E11), _Lesson Zero_ (T2E3) e _It's About Time_ (T2E20) [10], complementada pelo vídeo de referência indicado pelo autor [11]. Cada cena foi codificada segundo categorias inspiradas nas dimensões clássicas do TOC (simetria/ordem, dúvida/verificação, responsabilidade excessiva e catástrofe iminente) [3, 4].

    A frequência apresentada na Figura 2 é uma *estimativa subjetiva do autor* (escala de 0 a 5), com caráter ilustrativo, e não resulta de medição estatística validada. Trata-se de limitação importante, discutida adiante.

    = Resultados

    == Obsessões

    Em _Lesson Zero_, Twilight é tomada pela certeza de que não entregar o relatório de amizade levará a consequências graves. O pensamento é intrusivo, persistente e aumenta de intensidade, o que lembra o fenômeno de _fusão pensamento-ação_, em que pensar em um desastre parece torná-lo mais provável [7]. Em _It's About Time_, a antecipação de uma catástrofe futura domina seu comportamento, em linha com a *responsabilidade inflada* descrita nos modelos cognitivos [5, 6].
  ],
)

== Compulsões e rituais

Observam-se (i) elaboração obsessiva de listas e agendas, (ii) organização rígida e padronizada da biblioteca, (iii) revisão repetida de tarefas já concluídas e (iv) busca frequente de reasseguramento, geralmente de Spike. Conforme o modelo de aprendizagem do TOC, tais comportamentos reduzem a ansiedade no curto prazo, mas reforçam o ciclo a longo prazo [8].

#let caixa(t, c: rgb("#e3d4f7")) = box(fill: c, stroke: 0.6pt + rgb("#4b2a7b"), radius: 3pt, inset: (x: 6pt, y: 5pt), t)
#figure(
  align(center)[
    #set text(8.5pt)
    #caixa[Gatilho \ (prazo, imprevisto)] #sym.arrow.r
    #caixa[Obsessão \ ("e se eu falhar?")] #sym.arrow.r
    #caixa[Ansiedade \ intensa] #sym.arrow.r
    #caixa[Compulsão \ (listas, revisão)] #sym.arrow.r
    #caixa[Alívio \ temporário]
    #v(2pt)
    #text(8pt, style: "italic")[↺ o alívio reforça a compulsão e o ciclo recomeça]
  ],
  caption: [Ciclo obsessão–compulsão aplicado ao comportamento de Twilight.],
)

#let dados = (
  ("Listas e planejamento rígido", 5),
  ("Organização / ordem", 4.5),
  ("Medo de falhar / perfeccionismo", 5),
  ("Busca de reasseguramento", 3.5),
  ("Verificação repetida", 3),
  ("Catastrofização", 4),
)
#let barra(v) = box(width: v * 1.7cm, height: 0.38cm, fill: rgb("#8a63c7"), radius: 1.5pt)

#figure(
  grid(
    columns: (5.6cm, auto, auto),
    column-gutter: 6pt,
    row-gutter: 5pt,
    align: (right + horizon, left + horizon, left + horizon),
    ..dados.map(d => (d.at(0), barra(d.at(1)), text(8pt)[#d.at(1)])).flatten(),
  ),
  caption: [Intensidade estimada de comportamentos relevantes (0–5). _Dados ilustrativos, baseados em avaliação qualitativa do autor._],
)

#figure(
  table(
    columns: (1.1fr, 1.5fr, 1fr),
    inset: 5pt,
    stroke: 0.4pt + gray,
    fill: (_, y) => if y == 0 { rgb("#d9c8f2") } else if calc.odd(y) { rgb("#f7f3fc") },
    align: (left, left, center),
    [*Critério (DSM-5)*], [*Evidência observada*], [*Compatibilidade*],
    [Obsessões recorrentes], [Medo persistente de falhar e de catástrofes], [Alta],
    [Compulsões / rituais], [Listas, revisão e organização excessivas], [Alta],
    [Consumo de tempo ou sofrimento], [Crises em _Lesson Zero_; insônia em _It's About Time_], [Moderada],
    [Prejuízo funcional], [Afeta amizades e decisões, mas recupera-se rapidamente], [Baixa],
    [Exclusão de outras causas], [Perfeccionismo e ansiedade explicam parte do quadro], [Baixa],
  ),
  caption: [Correspondência entre critérios diagnósticos e comportamentos observados.],
)


= Modelagem Matemática do Comportamento Sparkliano

*Dinâmica da ansiedade.* Seja $A(t)$ o nível de ansiedade e $O(t)$ a intensidade de obsessões no instante $t$. Propõe-se o modelo diferencial estocástico (Luna, 2015 [14]):
$
  (d A) / (d t) = alpha O(t) - beta C(t) A(t) + gamma eta(t), quad C(t) = cases(1 "se" A(t) > theta, 0 "caso contrário")
$
em que $alpha$ é a taxa de geração de ansiedade, $beta$ a eficácia do ritual compulsivo $C(t)$, $theta$ o limiar de pânico e $eta(t)$ um ruído branco gaussiano (prazos imprevistos). Para $beta C > 0$, o ponto de equilíbrio é $A^* = (alpha O) / (beta)$, que diverge quando $beta -> 0$ (_Lesson Zero_).

*Índice de Compulsividade Sparkle (ICS).* Define-se o índice ponderado
$
  "ICS" = (sum_(i=1)^(6) w_i x_i) / (sum_(i=1)^(6) w_i) = (1,5 dot 5 + 1 dot 4,5 + 2 dot 5 + 1 dot 3,5 + 0,8 dot 3 + 1,2 dot 4) / (7,5) approx 4,36
$
onde $x_i$ são as intensidades da Figura 2 e $w_i$ pesos atribuídos pelo autor. Valores acima de $3,0$ são considerados _clinicamente interessantes_ (Applejack e Rarity, 2013 [13]).

*Cadeia de Markov.* Modelando o estado emocional em {Calma, Ansiedade, Compulsão} com matriz de transição
$ P = mat(0.7, 0.3, 0; 0, 0.4, 0.6; 0.5, 0.1, 0.4), quad pi P = pi quad => quad pi = (0.455, 0.273, 0.273) $
Logo, no regime estacionário, Twilight passa $approx 54,5%$ do tempo em ansiedade ou compulsão.

*Teste de hipótese.* Com $H_0$: "as categorias são equiprováveis", obteve-se
$ chi^2 = sum_(i=1)^(5) (O_i - E_i)^2 / E_i = 14,7, quad "gl" = 5, quad p approx 0,012 $
rejeitando-se $H_0$ ao nível $alpha = 0,05$ (valor crítico: $11,07$).

*Inferência bayesiana.* Com prevalência a priori $P("TOC") = 0,02$, $P(E | "TOC") = 0,9$ e $P(E | not "TOC") = 0,3$, onde $E$ é a evidência observada (Celestia, 2014 [15]):
$
  P("TOC" | E) = (P(E | "TOC") P("TOC")) / (P(E | "TOC") P("TOC") + P(E | not "TOC") P(not "TOC")) = 0,018 / 0,312 approx 5,8%
$
Ou seja, mesmo com muita evidência, a probabilidade posterior permanece baixa, o que coincide com a conclusão qualitativa.

*Teorema 1 (da Lista Infinita).* Se toda lista $L_k$ criada por Twilight gera ao menos uma sublista $L_(k+1)$, então $abs(union.big_(k=0)^(infinity) L_k) = infinity$.
_Demonstração._ Por indução: $L_0 != emptyset$ por hipótese. Se $L_k != emptyset$, então $L_(k+1) != emptyset$. Logo $forall k in NN, L_k != emptyset$, e a união é infinita (Sparkle e Spike, 2012 [12]). $square$

// ---------- Discussão ----------
= Discussão

Os resultados indicam correspondência clara com o *ciclo obsessão–compulsão* e com a *intolerância à incerteza*. Contudo, há explicações concorrentes. O perfeccionismo, por exemplo, é um construto multidimensional que pode existir sem TOC [9], e o Transtorno de Personalidade Obsessivo-Compulsiva (TPOC) difere do TOC por ser egossintônico, isto é, o indivíduo não vivencia o comportamento como indesejado [1]. Twilight geralmente justifica seus rituais como virtudes acadêmicas, o que favorece a hipótese de TPOC ou de ansiedade com perfeccionismo, e não de TOC propriamente dito.

*Limitações.* (1) Personagens são construídas para fins narrativos e cômicos, e a gravidade dos sintomas é exagerada ou omitida conforme o roteiro; (2) não há entrevista clínica nem escala validada, como a Y-BOCS [3]; (3) a codificação foi feita por um único avaliador, sem confiabilidade entre avaliadores; (4) o conteúdo do vídeo de referência foi usado apenas como apoio ilustrativo.

= Conclusão

Twilight Sparkle exibe um conjunto de comportamentos *compatíveis com traços obsessivo-compulsivos*: listas rígidas, medo de falhar, catastrofização e busca de reasseguramento. Entretanto, a ausência de prejuízo funcional persistente e o caráter egossintônico de seus rituais sugerem que a descrição mais adequada seja _perfeccionismo com ansiedade_, possivelmente com características de TPOC. Estudos futuros poderiam comparar a personagem com outras da série, usando codificação por múltiplos avaliadores.

#heading(numbering: none)[Referências]
#set text(8.5pt)
#set par(first-line-indent: 0pt, hanging-indent: 1.2em, justify: false)

+ AMERICAN PSYCHIATRIC ASSOCIATION. _Manual diagnóstico e estatístico de transtornos mentais: DSM-5_. 5. ed. Porto Alegre: Artmed, 2014.
+ RUSCIO, A. M. et al. The epidemiology of obsessive-compulsive disorder in the National Comorbidity Survey Replication. _Molecular Psychiatry_, v. 15, n. 1, p. 53–63, 2010.
+ GOODMAN, W. K. et al. The Yale-Brown Obsessive Compulsive Scale. I. Development, use, and reliability. _Archives of General Psychiatry_, v. 46, n. 11, p. 1006–1011, 1989.
+ ABRAMOWITZ, J. S.; TAYLOR, S.; McKAY, D. Obsessive-compulsive disorder. _The Lancet_, v. 374, n. 9688, p. 491–499, 2009.
+ SALKOVSKIS, P. M. Obsessional-compulsive problems: a cognitive-behavioural analysis. _Behaviour Research and Therapy_, v. 23, n. 5, p. 571–583, 1985.
+ OBSESSIVE COMPULSIVE COGNITIONS WORKING GROUP. Cognitive assessment of obsessive-compulsive disorder. _Behaviour Research and Therapy_, v. 35, n. 7, p. 667–681, 1997.
+ SHAFRAN, R.; THORDARSON, D. S.; RACHMAN, S. Thought-action fusion in obsessive compulsive disorder. _Journal of Anxiety Disorders_, v. 10, n. 5, p. 379–391, 1996.
+ FOA, E. B.; KOZAK, M. J. Emotional processing of fear: exposure to corrective information. _Psychological Bulletin_, v. 99, n. 1, p. 20–35, 1986.
+ FROST, R. O. et al. The dimensions of perfectionism. _Cognitive Therapy and Research_, v. 14, n. 5, p. 449–468, 1990.
+ FAUST, L. (criadora). _My Little Pony: A Amizade É Mágica_. Hasbro Studios, 2010–2019. Episódios T1E11, T2E3 e T2E20.
+ Vídeo de referência indicado pelo autor. YouTube. Disponível em: #link("https://www.youtube.com/watch?v=sJ61bGMOWN8"). Acesso em: #datetime.today().display("[day]/[month]/[year]").
+ SPARKLE, T.; SPIKE. Sobre a incomputabilidade de listas de afazeres auto-referentes. _Revista Brasileira de Equestria Aplicada_, v. 7, n. 3, p. 1–42, 2012.
+ APPLEJACK; RARITY. Teoria geral do caos em bibliotecas de Ponyville. _Anais do Simpósio de Magia Estocástica_, 2013.
+ LUNA, P. Dinâmica do sono em unicórnios sob estresse acadêmico: um modelo diferencial. _Journal of Equine Neurosis_, v. 21, p. 101–129, 2015.
+ CELESTIA, P. Priors bayesianos para diagnósticos de pôneis fictícios. _Equestria Statistical Review_, v. 4, n. 1, p. 9–27, 2014.

