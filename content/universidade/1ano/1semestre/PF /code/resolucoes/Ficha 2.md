---
topic:
date: 2026-02-13
course:
tags:
  - Universidade
  - programming
  - haskell
excalidraw-plugin: parsed
excalidraw-open-md: true
---
# Ficha 2

# Ficha 2: Funções recursivas sobre listas
1) Indique como é que o interpretador de Haskell avalia as expressões das alíneas que se seguem, apresentando a cadeia de redução de cada uma dessas expressões (i.e., os vários passos intermédios até se chegar ao valor final)

 a) Considere a seguinte definição:

```
funA :: [Double] -> Double
funA [] = 0
funA (y:ys) = y ^ 2 + (funA ys)
```

 Diga, justificando, qual é o valor de `funA [2,3,5,1]`.

```
funA [2,3,5,1]
    = funA (2:[3,5,1])
    = 2 ^ 2 + (funA [3,5,1])
    = 4 + funA (3:[5,1])
    = 4 + 3 ^ 2 + (funA [5,1])
    = 4 + 9 + funA (5:[1])
    = 13 + 5 ^ 2 + (funA [1])
    = 13 + 25 + funA (1:[])
    = 38 + 1 ^ 2 + (funA [])
    = 38 + 1 + 0
    = 39
```

 b) Considere a seguinte definição:

```
funB :: [Int] -> [Int]
funB [] = []
funB (h:t) = if mod h 2 == 0
             then h : funB t
             else funB t
```

 Diga, justificando, qual é o valor de `funB [8,5,2]`.

```
funB [8,5,2]
    = funB (8:[5,2]) -- mod 8 2 = 0
    = 8 : funB [5,2]
    = 8 : funB (5:[2]) -- mod 5 2 = 1
    = 8 : funB [2]
    = 8 : funB (2:[]) -- mod 2 2 = 0
    = 8 : 2 : funB []
    = 8 : 2 : []
    = [8,2]
```

 c) Considere a seguinte definição:

```
funC (x:y:t) = funC t
funC [x] = [x]
funC [] = []
```

 Diga, justificando, qual é o valor de `funC [1,2,3,4,5]`.

```
funC [1,2,3,4,5]
    = funC (1:2:[3,4,5])
    = funC [3,4,5]
    = funC (3:4:[5])
    = funC [5]
    = [5]
```

 d) Considere a seguinte definição:

```
funD l = g [] l
g acc [] = acc
g acc (h:t) = g (h:acc) t
```

 Diga, justificando, qual é o valor de `funD "otrec"`.

```
funD "otrec"
    = g [] "otrec"
    = g [] ('o':"trec")
    = g ('o':[]) "trec"
    = g "o" ('t':"rec")
    = g ('t':"o") "rec"
    = g "to" ('r':"ec")
    = g ('r':"to") "ec"
    = g "rto" ('e':"c")
    = g ('e':"rto") "c"
    = g "erto" ('c':[])
    = g ('c':"erto") []
    = "certo"
```

## 2) Defina recursivamente as seguintes funções sobre listas:

 a) `dobros :: [Float] -> [Float]` que recebe uma lista e produz a lista em que cada elemento é o dobro do valor correspondente na lista de entrada.

```
dobros :: [Float] -> [Float]
dobros [] = []
dobros (h:t) = h * 2 : dobros t
```

 b) `numOcorre :: Char -> String -> Int` que calcula o número de vezes que um caracter ocorre numa string.

```
numOcorre :: Char -> String -> Int
numOcorre _ "" = 0
numOcorre c (h:t) = if c == h
                    then 1 + numOcorre c t
                    else numOcorre c t
```

 c) `positivos :: [Int] -> Bool` que testa se uma lista só tem elementos positivos.

```
positivos :: [Int] -> Bool
positivos [] = True
positivos (h:t) = if h <= 0
                  then False
                  else positivos t
```

 d) `soPos :: [Int] -> [Int]` que retira todos os elementos não positivos de uma lista de inteiros.

```
soPos :: [Int] -> [Int]
soPos [] = []
soPos (h:t)
    | h > 0 = h : soPos t
    | otherwise = soPos t
```

 e) `somaNeg :: [Int] -> Int` que soma todos os números negativos da lista de entrada.

```
somaNeg :: [Int] -> Int
somaNeg [] = 0
somaNeg (h:t)
    | h < 0 = h + somaNeg t
    | otherwise = somaNeg t
```

 f) `tresUlt :: [a] -> [a]` devolve os últimos três elementos de uma lista. Se a lista de entrada tiver menos de três elementos, devolve a própria lista.

```
tresUlt :: [a] -> [a]
tresUlt [] = []
tresUlt (h:t)
    | length t < 3 = h:t
    | otherwise = tresUlt t
```

 g) `segundos :: [(a,b)] -> [b]` que calcula a lista das segundas componentes dos pares.

```
segundos :: [(a,b)] -> [b]
segundos [] = []
segundos ((_,h2):t) = h2 : segundos t
```

 h) `nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool` que testa se um elemento aparece na lista como primeira componente de algum dos pares.

```
nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros _ [] = False
nosPrimeiros x ((h1,_):t) = x == h1 || nosPrimeiros x t
```

i) `sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)` soma uma lista de triplos componente a componente.

 Por exemplo, `sumTriplos [(2,4,11), (3,1,-5), (10,-3,6)] = (15,2,12)`.

```
sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos [] = (0,0,0)
sumTriplos ((a,b,c):t) = (a+ra, b+rb, c+rc)
    where (ra,rb,rc) = sumTriplos t
```

## 3) Recorrendo a funções do módulo `Data.Char`, defina recursivamente as seguintes funções sobre strings:

a) `soDigitos :: [Char] -> [Char]` que recebe uma lista de caracteres e seleciona dessa lista os caracteres que são algarismos.

```
soDigitos :: [Char] -> [Char]
soDigitos [] = []
soDigitos (h:t)
    | isDigit h = h : soDigitos t
    | otherwise = soDigitos t
```

b) `minusculas :: [Char] -> Int` que recebe uma lista de caracteres e conta quantos desses caracteres são letras minúsculas.

```
minusculas :: [Char] -> Int
minusculas [] = 0
minusculas (h:t)
    | isLower h = 1 + minusculas t
    | otherwise = minusculas t
```

c) `nums :: String -> [Int]` que recebe uma string e devolve uma lista com os algarismos que ocorrem nessa string, pela mesma ordem.

```
nums :: String -> [Int]
nums "" = []
nums (h:t)
    | isDigit h = digitToInt h : nums t
    | otherwise = nums t
```

## 4) Uma forma de representar polinómios de uma variável é usar listas de monómios representados por pares _(coeficiente, expoente)_

```
type Polinomio = [Monomio]
type Monomio = (Float,Int)
```

Por exemplo, `[(2,3), (3,4), (5,3), (4,5)]` representa o polinómio `2x^3 + 3x^4 + 5x^3 + 4x^5` Defina as seguintes funções:

a) `conta :: Int -> Polinomio -> Int` de forma a que `conta n p` indica quantos monómios de grau `n` existem em `p`.

```
conta :: Int -> Polinomio -> Int
conta _ [] = 0
conta n ((coeficiente,grau):t)
    | n == grau = 1 + conta n t
    | otherwise = conta n t
```

b) `grau :: Polinomio -> Int` que indica o grau de um polinómio.

```
grau :: Polinomio -> Int
grau [] = 0
grau ((c,g):t)
    | g > grau t = g
    | otherwise = grau t
```

c) `selgrau :: Int -> Polinomio -> Polinomio` que selecciona os monómios com um dado grau de um polinómio.

```
selgrau :: Int -> Polinomio -> Polinomio
selgrau _ [] = []
selgrau n ((c,g):t)
    | n == g = (c,g) : selgrau n t
    | otherwise = selgrau n t
```

d) `deriv :: Polinomio -> Polinomio` que calcula a derivada de um polinómio.

```
deriv :: Polinomio -> Polinomio
deriv [] = []
deriv ((c,g):t)
    | g == 0 = deriv t
    | otherwise = (c * fromIntegral g,g-1) : deriv t
```

e) `calcula :: Float -> Polinomio -> Float` que calcula o valor de um polinómio para um dado valor de x.

```
calcula :: Float -> Polinomio -> Float
calcula _ [] = 0
calcula x ((c,g):t) = c * (x ^ g) + calcula x t
```

f) `simp :: Polinomio -> Polinomio` que retira de um polinómio os monómios de coeficiente zero.

```
simp :: Polinomio -> Polinomio
simp [] = []
simp ((c,g):t)
    | c == 0 = simp t
    | otherwise = (c,g) : simp t
```

g) `mult :: Monomio -> Polinomio -> Polinomio` que calcula o resultado da multiplicação de um monómio por um polinómio.

```
mult :: Monomio -> Polinomio -> Polinomio
mult _ [] = []
mult (cm,gm) ((c,g):t) = (cm * c, gm + g) : mult (cm,gm) t
```

h) `normaliza :: Polinomio -> Polinomio` que dado um polinómio constrói um polinómio equivalente em que não podem aparecer vários monómios com o mesmo grau.

```
normaliza :: Polinomio -> Polinomio
normaliza [] = []
normaliza ((c,g):t) = normalizaAux (c,g) (normaliza t)

normalizaAux :: Monomio -> Polinomio -> Polinomio
normalizaAux m [] = [m]
normalizaAux (cm,gm) ((c,g):t)
    | gm == g = (cm + c,g) : t
    | otherwise = (c,g) : normalizaAux (cm,gm) t
```

i) `soma :: Polinomio -> Polinomio -> Polinomio` que soma dois polinómios de forma a que se os polinómios que recebe estiverem normalizados produz também um polinómio normalizado.

```
soma :: Polinomio -> Polinomio -> Polinomio
soma p [] = p
soma [] p = p
soma ((c,g):t) p = somaAux (c,g) (soma t p)

somaAux :: Monomio -> Polinomio -> Polinomio
somaAux m [] = [m]
somaAux (cm,gm) ((c,g):t)
    | gm == g = (cm + c,g) : t
    | otherwise = (c,g) : somaAux (cm,gm) t
```

j) `produto :: Polinomio -> Polinomio -> Polinomio` que calcula o produto de dois polinómios.

```
produto :: Polinomio -> Polinomio -> Polinomio
produto [] _ = []
produto (m:t) p = (mult m p) ++ produto t p
```

k) `ordena :: Polinomio -> Polinomio` que ordena um polinómio por ordem crescente dos graus dos seus monómios.

```
ordena :: Polinomio -> Polinomio
ordena [] = []
ordena (m:t) = insere m (ordena t)

insere :: Monomio -> Polinomio -> Polinomio
insere m [] = [m]
insere (cm,gm) ((c,g):t)
    | g > gm = (cm,gm) : (c,g) : t
    | otherwise = (c,g) : insere (cm,gm) t
```

l) `equiv :: Polinomio -> Polinomio -> Bool` que testa se dois polinómios são equivalentes.

```
equiv :: Polinomio -> Polinomio -> Bool
equiv p1 p2 = ordena (normaliza p1) == ordena (normaliza p2)
```