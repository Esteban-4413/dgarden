module Ficha9 where 

data Aposta = Ap [Int] -> (Int, Int) 

-- 2 

--a) 
valida :: Aposta -> Bool 
valida (Ap nums (e1, e2)) = length nums == 5 && all (\x -> x >= 1 && x <= 50) nums && not (temRepetidos numms) && e1 >= 1 && e1 <= 9 && e2 >= 1 && e2 <= 9 && e1 /= e2

temRepetidos :: [Int] -> Bool 
temRepetidos [] = False 
temRepetidos (h:t) 
    | h `elem` t = True 
    | otherwise = temRepetidos t 

