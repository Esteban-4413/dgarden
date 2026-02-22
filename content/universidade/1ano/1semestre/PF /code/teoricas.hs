module Teoricas where 
import Data.Char 


dobro :: Int -> Int 
dobro x = 2 * x

elem' :: Eq a => a -> [a] -> Bool 
elem' x [] = False 
elem' x (h:t) | x == h = True
              | otherwise = elem' x t 

elemO :: Ord a => a -> [a] -> Bool 
elemO x [] = False 
elemO x (h:t) | x < h = False 
              | x == h = True 
              | x > h = elemO x t
    
               
ordena :: Ord a => [a] -> [a]
ordena [] = [] 
ordena (h:t) = insere h (ordena t)  
               where insere x [] = [x] 
                     insere x (h:t) | x <= h = x:h:t
                                    | otherwise = h : insere x t

minimo [x] = x 
minimo (h:t) = min h (minimo t)

apaga _ [] = []
apaga x (h:t)
    | x == h = t
    | otherwise = h : apaga x t

minSort :: Ord a => [a] -> [a]
minSort [] = [] 
minSort [x] = [x]
minSort l = m : minSort l' 
   where m = minimo l 
         l' = apaga m l

mergeSort [] = []
mergeSort [x] = [x] 
mergeSort l = 
    let (a, b) = parte l
        l1 = mergeSort a
        l2 = mergeSort b
    in merge l1 l2 
    where 
        parte l = 
            let x = length l 
                y = div x 2 
            in (take y l, drop y l)
        merge [] l2 = l2
        merge l1 [] = l1
        merge (h1:t1) (h2:t2) | h1 <= h2 = h1 : merge t1 (h2:t2)
                              | otherwise = h2 : merge (h1:t1) t2

minSmin :: Ord a => [a] -> (a, [a])
minSmin [x] = (x, [])
minSmin (h:t) = if (h <= m) then (h, t)
                else (m, h:t') 
    where (m, t') = minSmin t 

parte' [] = ([], []) 
parte' [x] = ([x], []) 
parte' (x:y:resto) = (x:a, y:b) 
    where (a, b) = parte' resto 

take' :: Int -> [a] -> [a]
take' 0 l = []
take' n [] = []
take' n (h:t) = h: take' (n-1) t  

drop' 0 l = l 
drop' n [] = [] 
drop' n (h:t) = drop' (n-1) t

splitAt' :: Int -> [a] -> ([a], [a]) 
splitAt' 0 l = ([], l)
splitAt' n [] = ([], [])
splitAt' n (h:t) = (h:a, b)
    where (a, b) = splitAt' (n-1) t 

qSort :: Ord a => [a] -> [a] 
qSort [] = [] 
qSort [x] = [x] 
qSort (h:t) = let (a, b) = parteQ h t 
                  a' = qSort a
                  b' = qSort b 
              in a' ++ [h] ++ b' 
    where 
        parteQ :: Ord a => a -> [a] -> ([a], [a]) 
        parteQ x [] = ([], [])
        parteQ x (h:t) = if (h <= x) then (h:a, b) 
                         else (a, h:b) 
            where (a, b) = parteQ x t 

pMaior :: Ord a => [a] -> Int 
pMaior l = let m = maximum l 
               posicao i l = posAux i l 0 
                    where posAux i (h:t) n 
                          | i == h = n 
                          | otherwise = posAux i t (n + 1)   
           in posicao m l 

pMaiorA :: a -> Int -> Int -> [a] -> Int 
pMaiorA m pm p [] = pm 
pMaiorA m pm (h:t) 
    | h > m = pMaiorA h p (p + 1) t 
    | otherwise = pMaiorA m pm (p + 1) t 

sumA :: a -> [a] -> a 
sumA s [] = s 
sumA s (h:t) = sumA (s + h) t 

revA :: [a] -> [a] -> [a] 
revA li [] = li 
revA li (h:t) = revA (h:li) t 

maisUm :: [Int] -> [Int] 
maisUm l = map (+1) 

ords :: String -> [Int] 
ords l = map ord 

maiusculas :: String -> String 
maiusculas l = map toUpper    
 
