# Questões
[50 questoes from site of the professora Sofia](https://pf.sofiars.xyz/50q/)

1. Apresente uma definição recursiva da função (pré-definida) `enumFromTo :: Int -> Int -> [Int]` que constrói a lista dos números inteiros comprendidos entre dois limites.
Por exemplo, `enumFromTo 1 5` corresponde à lista `[1, 2, 3, 4, 5]`

```haskell title:"enumFromTo recursive"
enumFromTo' :: Int -> Int -> [Int]
enumFromTo' a b | a > b     = []
                | otherwise = a : enumFromTo' (a+1) b
```

```haskell title:"enumFromTo not recursive"
enumFromTo' :: Int -> Int -> [Int] 
enumFromTo' a b | a <= b = [a..b]
                | otherwise = [a, a-1..b]
```

2. Apresente uma definição recursiva da função (pré-definida) `enumFromThenTo :: Int -> Int -> Int -> [Int]` que constrói a lista dos números inteiros compreendidos entre dois limites e espaçados de um valor constante.
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

5. Apresente uma definição recursiva da função (pré-definida) `reverse :: [a] -> [a]` que dada uma lista calcula uma lista com os elementos dessa lista pela ordem inversa.
Por exemplo, `reverse [10, 20, 30]` corresponde a `[30, 20, 10]`.

```haskell title:"reverse"
reverse' :: [a] -> [a] 
reverse' [] = [] 
reverse' (h:t) = reverse' t ++ [h] 
```

6. Apresente uma definição recursiva da função (pré-definida) `take :: Int -> [a] -> [a]` que dado um inteiro `n` e uma lista `l` calcula a lista com os (no máximo) `n` primeiros elementos de `l`.
A lista resultado só terá menos de que `n` elementos se a lista `l` tiver menos do que `n` elementos. Nesse caso a lista calculada é igual à lista fornecida.
Por exemplo, `take 2 [10, 20, 30]` corresponde a `[10, 20]`

```haskell title:"Take"
take :: Int -> [a] -> [a]
take _ [] = []
take n _ 
	| n <= 0 = []
take n (h:t) = h . take (n - 1) t
```

7. Apresente uma definição recursiva da função (pré-definida) `drop :: Int -> [a] -> [a]` que dado um inteiro `n` e uma lista `l` calcula a lista se os (no máximo) `n` primeiros elementos de `l`. 
Se a lista fornecida não tiver `n` elementos ou menos, a lista resultante será vazia. 
Por exemplo, `drop 2 [10, 20, 30]` corresponde a `[30]`.

```haskell title:"Drop"
drop' :: Int -> [a] -> [a]
drop' n l | n <= 0 = l
drop' x [] = []
drop' x (h : t)
  | x == 1 = t
  | otherwise = drop' (x - 1) t
```

8. Apresente uma definição recursiva da função (pré-definida) `zip :: [a] -> [b] -> [(a, b)]` constói uma lista de pares a partir de duas listas. 
Por exemplo, `zip [1, 2, 3] [10, 20, 30, 40]` corresponde `[(1, 10), (2, 20), (3, 30)]`.

```haskell title:"Zip"
zip :: [a] -> [b] -> [(a, b)]
zip [] [] = []
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x, y) : zip xs ys
```

9. Apresente uma definição recursiva da função (pré-definida) `replicate :: Int -> a -> [a]` que dado um inteiro `n` e um elemento `x` constói uma lista com `n` elementos, todos iguais a `x`.
Por exemplo, `replicate 3 10` corresponde a `[10, 10, 10]`.

```haskell title:"Replicate"
replicate :: Int -> a -> [a]
replicate n x
	| n <= 0 = []
	| otherwise = x : replicate (n - 1) x
```

10. Apresente uma definição recursiva da função (pré-definida) `intersperse :: a -> [a] -> [a]` que, dado um elemento e uma lista, constrói uma lista em que o elemento fornecido é intercalado entre os elementos da lista fornecida.

```haskell title:"Intersperce"
intersperce :: a -> [a] -> [a]
intersperce x [] = []
intersperce x [z] = [z]
intersperce x (h : t) = h : x : intersperce x t
```

11. Apresente uma definição recursiva da função (pré-definida) `group :: Eq a => [a] -> [[a]]` que agrupa elementos iguais e consecutivos de uma lista.
Exemplo

```ghci
> group [1,2,2,3,4,4,4,5,4]
[[1],[2,2],[3],[4,4,4],[5],[4]]
```

```haskell title:"Group"
group :: (Eq a) => [a] -> [[a]]
group [x] = [[x]]
group (h : t)
	| h `elem` (head gt) = (h : (head gt)) : tail gt
	| otherwise = [h] : gt
	where
		gt = group t
```

12. Apresente uma definição recursiva da função (pré-definida) `concat :: [[a]] -> [a]` que concatena as listas de uma lista.

```ghci
> concat [[1],[2,2],[3],[4,4,4],[5],[4]]
[1,2,2,3,4,4,4,5,4]
```

```haskell title:"Concat"
concat :: [[a]] -> [a]
concat [] = []
concat [[x]] = [x]
concat (h : xs) = h ++ concat xs
```

13. Apresente uma definição recursiva da função (pré-definida) `inits :: [a] -> [[a]]` que calcula a lista dos prefixos de uma lista.

```ghci
> inits [11,21,13]
[[],[11],[11,21],[11,21,13]]
```

```haskell title:"Tails"
inits :: [a] -> [[a]]
inits [] = [[]]
inits l@(h : t) = l : xs
	where 
		xs = inits t
```

14. Apresente uma definição recursiva da função (pré-definida) `tails :: [a] -> [[a]]` que calcula a lista dos sufixos de uma lista.

```ghci
> tails [1,2,3]
[[1,2,3],[2,3],[3],[]]
```

15. Defina a função `heads :: [[a]] -> [a]` que recebe uma lista de listas e produz a lista com o primeiro elemento de cada lista.

```ghci
> heads [[2,3,4],[1,7],[],[8,5,3]]
[2,1,8]
```

```haskell title:"Heads"
heads :: [[a]] -> [a]
heads [[]] = []
heads (h : t)
	| null h = heads t
	| otherwise = head h : heads t
```


