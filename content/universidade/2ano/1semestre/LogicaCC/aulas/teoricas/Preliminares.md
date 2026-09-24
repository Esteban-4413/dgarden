# Preliminares de Lógica: Definições Indutivas e Linguagens

## Definições Indutivas de Conjuntos
* Uma definição indutiva é um mecanismo útil para definir conjuntos, de uso frequente em Ciências da Computação.
* Para definir um conjunto indutivo sobre um conjunto suporte $X$, precisamos de:
  * Uma **base** $B$, que é um subconjunto não vazio de $X$.
  * Um **conjunto de operações** $O$ em $X$ (funções do tipo $X^n \rightarrow X$).
* Um subconjunto $I$ de $X$ é considerado indutivo se contém a base ($B \subseteq I$) e é fechado para as operações de $O$ (a aplicação das operações a elementos de $I$ produz elementos que também pertencem a $I$).
* O **conjunto definido indutivamente** (ou gerado) é o *menor* conjunto indutivo de base $B$ e conjunto de operações $O$.

## Alfabetos e Linguagens
* **Alfabeto**: É um conjunto de símbolos, sendo os seus elementos chamados de letras.
* **Palavra (ou string)**: É uma sequência finita de letras de um alfabeto $A$. 
* O conjunto de todas as palavras sobre $A$ denota-se por $A^*$.
* **Palavra vazia**: Denotada por $\epsilon$, é a sequência vazia de letras (a única com comprimento 0).
* **Linguagem**: É um conjunto de palavras sobre um alfabeto $A$, ou seja, um subconjunto de $A^*$.

## Sequências de Formação
* Uma **sequência de formação** de um elemento $e$ é uma sequência finita de elementos onde o último elemento é o próprio $e$
* Cada elemento desta sequência ou pertence à base $B$, ou é o resultado da aplicação de uma operação de $O$ a elementos anteriores da sequência
* Um elemento pertence ao conjunto indutivo se e somente se admitir uma sequência de formação

## Princípio de Indução Estrutural
* A cada definição indutiva está associado um princípio de indução estrutural, que serve para provar que uma condição $P(e)$ é verdadeira para todos os elementos do conjunto
* Para tal, é necessário provar que:
  1. $P(b)$ é verdadeira para todo o elemento da base $b \in B$
  2. Se a condição é verdadeira para os argumentos (hipótese de indução), então também é verdadeira para a imagem gerada pela operação

## Recursão Estrutural
* Permite a definição de funções sobre um conjunto definido indutivamente
* Este princípio requer que a definição indutiva seja **determinista**, o que significa que o conjunto permite decomposições únicas dos seus elementos (não há ambiguidade na forma como um elemento foi gerado)
