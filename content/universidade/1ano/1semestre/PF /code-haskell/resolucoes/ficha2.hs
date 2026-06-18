module Ficha2 where 

type Polinomio = [(Double, Int)]

funB :: [Int] -> [Int]
funB [] = []
funB (h:t) = if (mod h 2 == 0) 
            then h : funB t 
            else funB t 

funC :: [Int] -> [Int]
funC (x:y:t) = x : funC t 
funC [x] = []
funC [] = [] 

funD :: [a] -> [a]
funD l = aux l []
            where 
            aux [] m = m 
            aux (h:t) m = aux t (h:m) 

dobros :: [Int] -> [Int] 
-- dobros [2,0,-1] = [4,0,-2]
dobros [] = []
dobros (h:t) = 2*h : dobros t 

numOcorre :: Char -> [Char] -> Int 
--numOcorre 'a' "abracadabra" = 5 
numOcorre c [] = 0 
numOcorre c (h:t) = if c == h then (numOcorre c t) + 1 
                    else numOcorre c t 

numOcorre2 :: Char -> [Char] -> Int 
numOcorre2 c [] = 0 
numOcorre2 c (h:t) | c == h = 1 + numOcorre2 c t 
                   | otherwise = numOcorre2 c t 

soPos :: [Int] -> Bool 
-- soPos [1,2,-1,3] == False 
soPos [] = True
soPos (h:t) = if h == abs h 
              then soPos t 
              else False 

soPos2 :: [Int] -> Bool 
soPos2 [] = True 
soPos2 (h:t) = h == abs h && soPos t 

conta :: Int -> Polinomio -> Int
-- conta 3 [(5,2), (1,3), (4,1), (2,3)] = 2
conta x [] = 0 
conta x (h:t) = if x == snd h then (conta x t) + 1
                              else conta x t 

doGrau :: Int -> Polinomio -> [Double]
--dograu 3 [(2,1), (4,3), (5,2), (8,3)] = [4, 8]
doGrau x []= []
doGrau x (h:t) | x == snd h = fst h : doGrau x t 
               |otherwise = doGrau x t 
