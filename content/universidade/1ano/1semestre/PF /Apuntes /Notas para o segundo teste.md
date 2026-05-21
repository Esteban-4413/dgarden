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
# Notas para o segundo teste

## Key Concepts

## Important Details

## Examples

## Questions
- 

## Summary

## Related Topics
- [[]]## Preguntas

```haskell
multThree :: (Num a) => a -> a -> a -> a  
multThree x y z = x * y * z 
```

```haskell 
ghci> let multTwoWithNine = multThree 9  
ghci> multTwoWithNine 2 3  
54  
ghci> let multWithEighteen = multTwoWithNine 2  
ghci> multWithEighteen 10  
180 
```

```haskell
data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show) 
```

acumuladores 
```haskell
pmaior :: [Int] -> Int -> Int  
-- pmaior [4, 3, 12, 5] = 2
pmaior lista@(x:xs) acc | if max lista == x then 0 else 
						| otherwise pmaior xs (acc + 1) = ... (FIX ME)
```

```haskell
pmaiorA :: (Int, Int, Int) -> [Int] -> Int
pmaiorA (m, pm, p) [] = pm 
pmaiorA (m, pm. p) (h:t) | h > m = pmaiorA (h, p, p + 1) t
						   | otherwise = pmaiorA (m, pm , p + 1) t 
```

```haskell
mP :: [Int] -> (Int, Int)
mP [x] = (x, 0) 
mP (h:t) | h > x = (h, 0)
		 | otherwise = (x, p + 1)
	where (x, p) = mP t 
```

```haskell
isLeft :: Either a b -> Bool 
isLeft (Left _) = True 
isLeft _ = False

separaE :: [Either a b] -> ([a], [b])
separaE lista@(h:t) = ([a | Left a <- l], [b ])