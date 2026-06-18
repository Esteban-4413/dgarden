# Questões

1. Apresente uma definição recursiva da função (pré-definida) `enumFromTo :: Int -> Int -> [Int]` que constrói a lista dos números inteiros comprendidos entre dois limites.
Por exemplo, `enumFromTo 1 5` corresponde à lista `[1, 2, 3, 4, 5]`

```haskell title:"enumFromto"
enumFromTo' :: Int -> Int -> [Int] 
enumFromTo' a b | a <= b = [a..b]
                | otherwise = [a, a-1..b]
```

2. Apresente uma definição recursiva da função (pré-definida) `enumFromThenTo :: Int -> Int -> Int -> [Int]` que constrói a lista dos números inteiros compreendidos entre dois limites e espaçãdos de um valor constante.
Por exemplo, `enumFromThenTo 1 3 10` corresponde à lista `[1, 3, 5, 7, 9]`

```haskell title:"enumFromThenTo"
enumFromThenTo' :: Int -> Int -> Int -> [Int]
enumFromThenTo' x y z = [x, x+(y-x)..z] 
```

3. Apresente uma definição recursiva da função (pré-definida) `(++) :: [a] -> [a] -> [a]` que concatena duas listas.
Por exemplo, `(++) [1, 2, 3] [10, 20, 30]` corresponde à lista `[1, 2, 3, 4, 10, 20, 30]`.

```haskell title:"(++)"
maisMais :: [a] -> [a] -> [a] 
maisMais [] l = l 
maisMais (h:t) (x:xs) = h : maisMais t (x:xs)
```

4. Apresente uma definição recursiva da função (pré-definida) `(!!) :: [a] -> Int -> a` que dada uma lista e um inteiro, calcula o elemento da lista que se encontra nessa posição (assume-se que o primeiro elemento se encontra na posição 0).
Por exemplo, `(!!) [10, 20, 30] 1` corresponde a 20.
Ignore os casos em que a função não se encontra definida (i.e., em que a posição fornecida não corresponde a nenhuma posição válida da lista).

```haskell title:"(!!)"
bangBang :: [a] -> Int -> a
bangBang (h:t) n 
    | n <= 0 = h 
    | otherwise = bangBang t (n-1) 
```

5. Apresente uma definção recursiva da função (pré-definida) `reverse :: [a] -> [a]` que dada uma lista calcula uma lista com os elementos dessa lista pela ordem inversa.
Por exemplo, `reverse [10, 20, 30]` corresponde a `[30, 20, 10]`.

```haskell title:"reverse"
reverse' :: [a] -> [a] 
reverse' [] = [] 
reverse' (h:t) = reverse' t ++ [h] 
```
