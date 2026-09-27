# C - 1

## Especificações
A correção de um programa esta relacionada com a sua especificação.

> [!quote]+
> | Um algoritmo diz-se correcto se para todos os valores dos inputs ele pára como os valores esperados dos outputs.

Para especificar um programa se usam dois predicados que estabelecem as propriedades dos estados antes e depois da execução do programa:
- a *pré-condição* que estabelece as condições em que o program deve funcionar;
- a *pós-condição* que estabelece aquilo que deve acontecer após a execução do programa.

### Exemplos
$\textbf{Exemplo 1 (swap).}$ Um programa que troca os valores das variáveis x e y.
- pré-condição: $True$
- pós-condição: $x = y \wedge y = x$

> [!note]
> - a pré-condição $True$ significa que não há quaisquer restrições ao funcionamento do programa;
> - a pós-condição apresentada, dado o problema computacional a resolver, não funciona bem porque pode ser considerada uma forma rebuscada de dizer que no final os valores das variáveis x e y são iguais.

Este exemplo mostra que por vezes a especificação de um problema precisa que relacionar valores de variáveis antes e depois da execução do programa. Assim podemos escrever as especificações deste programa da seguinte forma:
- pré-condição: $x = x_0 \wedge y = y_0$
- pós-condição: $x = y_0 \wedge y = x_0$

$\textbf{Exemplo 2 (produto).}$
- pré-condição: $x = x_0 \wedge y = y_0 \geq 0$
- pós-condição: $m = x_0 * y_0$


$\textbf{Exemplo 3 (mod).}$ A especificação a seguir estabelece os requisitos de um programa que coloca em m o resto da divisão inteira entre os valores iniciais das variáveis x e y.
- pré-condição: $x = x_0 > 0 \land y = y_0 \geq 0$
- pós-condição: $0 \leq m < y_0 \and \exists_{d \geq 0} d * y_0 + m = x _0$

$\textbf{Exemplo 4 (procura)}$ Agora vamos a considerar o problema de procurar um dado valor (x) num vector ordenado



### Triplos de Hoare
A análise de correção dos algoritmos baseia-se na utilização de proposições lógicas sobre os estado actual do programa (o conjunto das duas variáveis).

![[../../resources/C1.pdf]]
