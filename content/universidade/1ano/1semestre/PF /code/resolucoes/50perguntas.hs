module Questoes where

data Movimento = Norte | Sul | Este | Oeste 
    deriving (Show) 

type Ponto = (Float, Float) 

data Rectangulo = Rect Ponto Ponto 

data Equipamento = Bom | Razoavel | Avariado 
    deriving (Show) 

--extra 
elem' :: Eq a => a -> [a] -> Bool 
elem' _ [] = False 
elem' x (h:t) 
    | x == h = True 
    |otherwise = elem x t 

pos :: Eq a => a -> [a] -> Int 
pos _ [] = -1 
pos x (h:t) 
        | x == h = 0
        | y == -1 = -1 
        | otherwise = 1 + y 
    where y = pos x t 
   
posAux :: Eq a => a -> [a] -> Int -> Int 
posAux x [] p = -1 
posAux x (h:t) p | x == h = p 
                 | otherwise = posAux x t (p+1) 

group :: Eq a => [a] -> [[a]] 
group [] = [] 
group [x] = [[x]]
group (h:t) | h == head (head gt) = (h : head gt) : tail gt 
            | otherwise = [h] : gt 
    where  gt = group t 

iguaisInicio :: Eq a => a -> [a] -> [a] 
iguaisInicio x [] = []
iguaisInicio x (h:t) | x == h = h : iguaisInicio x t 
                     | otherwise = [] 

remInicio :: Eq a => a -> [a] -> [a] 
remInicio x [] = [] 
remInicio x (h:t) | x == h = remInicio x t 
                  | otherwise = (h:t) 

groupAlt [] = [] 
groupAlt (h:t) = (h : iguaisInicio h t ) : groupAlt (remInicio h t) 

--1 
enumFromTo' :: Int -> Int -> [Int] 
enumFromTo' a b | a <= b = [a..b]
                | otherwise = [a, a-1..b]

--2 
enumFromThenTo' :: Int -> Int -> Int -> [Int]
enumFromThenTo' x y z = [x, x+(y-x)..z] 

--3
maisMais :: [a] -> [a] -> [a] 
maisMais [] l = l 
maisMais (h:t) (x:xs) = h : maisMais t (x:xs)

--4 
bangBang :: [a] -> Int -> a
bangBang (h:t) n 
    | n <= 0 = h 
    | otherwise = bangBang t (n-1) 

--5 
reverse' :: [a] -> [a] 
reverse' [] = [] 
reverse' (h:t) = reverse' t ++ [h] 

--6 
take' :: Int -> [a] -> [a] 
take' _ [] = [] 
take' n _  
    | n <= 0 = []
take' n (h:t) = h : take' (n-1) t     

--7 
drop' :: Int -> [a] -> [a] 
drop' 0 l = l 
drop' x [] = [] 
drop' x (h:t) | x == 1 = t 
             | otherwise = drop' (x-1) t 

--8 
zip' :: [a] -> [b] -> [(a, b)]   
zip' [] [] = []  
zip' [] _ = [] 
zip' _ [] = [] 
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys 

--9
replicate' :: Int -> a -> [a] 
replicate' n x | n <= 0 = [] 
               | otherwise = x : replicate' (n-1) x 

--10 
intersperce' :: a -> [a] -> [a] 
intersperce' x [] = [] 
intersperce' x [z] = [z] 
intersperce' x (h:t) = h:x : intersperce' x t 

--11 
group' :: Eq a => [a] -> [[a]]
group' [x] = [[x]] 
group' (h:t) 
    | elem h (head gt) = (h : (head gt)) : tail gt
    | otherwise = [h] : gt
        where gt = group' t 

--12 
-- > concat [[1],[2,2],[3],[4,4,4],[5],[4]] == [1,2,2,3,4,4,4,5,4]
concat' :: [[a]] -> [a]
concat' [] = []
concat' [[x]] = [x]
concat' (h:xs) = h ++ concat' xs  

--13 
-- > inits' [11,21,13] == [[],[11],[11,21],[11,21,13]] 
inits' :: [a] -> [[a]]
inits' [x] = [[], [x]]
inits' (h:t) = [] : map (h:) xs 
    where xs = inits' t 

-- 14 
-- > tails [1,2,3] == [[1,2,3],[2,3],[3],[]]
tails' :: [a] -> [[a]]
tails' [] = [[]]
tails' l@(h:t) = l : xs 
    where xs = tails' t 

--15 
-- > heads [[2,3,4],[1,7],[],[8,5,3]] == [2,1,8]
heads :: [[a]] -> [a]
heads [[]] = [] 
heads (h:t) 
    | null h = heads t 
    | otherwise = head h : heads t 

-- 16 
-- > total [[2,3,4],[1,7],[],[8,5,3]] == 8 
total :: [[a]] -> Int 
total [] = 0 
total (h:t) = 
    let 
        total1 :: [a] -> Int 
        total1 [] = 0 
        total1 [x] = 1
        total1 (h:t) = 1 + total1 t 
    in total1 h + total t 

-- 17 
-- > fun [("rui",3,2), ("maria",5,2), ("ana",43,7)] == [("rui",2), ("maria",2), ("ana",7)]
fun :: [(a, b, c)] -> [(a, c)] 
fun [] = []
fun ((x,y,z):t) = (x, z) : fun t 

-- 18 
-- > cola [("rui",3,2), ("maria",5,2), ("ana",43,7)] == "ruimariaana"
cola :: [(String, b, c)] -> String 
cola l = concat $ map (\ (string, _, _) -> string) l 

-- 19 
-- > idade 2021 26 [("rui",1995), ("maria",2009), ("ana",1947)] == ["rui","ana"]
idade :: Int -> Int -> [(String, Int)] -> [String] 
idade _ _ [] = []
idade ano edad lista = [nome | (nome, nasc) <- lista, ano - nasc >= edad]

-- 20 
-- > powerEnumFrom 2 10 == [1,2,4,8,16,32,64,128,256,512]
powerEnumFrom :: Int -> Int -> [Int] 
powerEnumFrom n m = aux 0 
    where 
        aux k 
            | k >= m = []
            | otherwise = n^k : aux (k+1)

-- 21 
-- > isPrime 7 == True 
-- > isPrime 21 == False 
isPrime :: Int -> Bool 
isPrime x = 
    let 
        prime n = [m | m <- [2..(n-1)], m * m > n, mod n m == 0] 
    in (null $ prime x) && (x > 1)

--22 
-- > isPrefixOf [10,20] [10,20,30] == True 
-- > isPrefixOf [10,30] [10,20,30] == False 
isPrefixOf1 :: Eq a => [a] -> [a] -> Bool 
isPrefixOf1 lista1 lista2 = lista1 == lista3
    where 
        lista3 = take (length lista1) lista2

isPrefixOf :: Eq a => [a] -> [a] -> Bool 
isPrefixOf [] _ = True  
isPrefixOf _ [] = False
isPrefixOf (h:t) (x:xs) = if h == x then isPrefixOf t xs else False 

--23 
-- > isSuffixOf [20,30] [10,20,30] == True 
-- > isSuffixOf [20,30] [10,20,30] == False 
isSuffixOf :: Eq a => [a] -> [a] -> Bool 
isSuffixOf lista1 lista2 = isPrefixOf (reverse lista1) (reverse lista2)

--24
-- > isSubsequenceOf [20,40] [10,20,30,40] == True 
-- > isSubsequenceOf [40,20] [10,20,30,40] == False 
isSubsequenceOf :: Eq a => [a] -> [a] -> Bool 
isSubsequenceOf [] _ = True 
isSubsequenceOf _ [] = False 
isSubsequenceOf lista@(x:xs) (y:ys) 
    | x == y = isSubsequenceOf xs ys 
    | otherwise = isSubsequenceOf lista ys 

--25  
-- > elemIndices 3 [1,2,3,4,3,2,3,4,5] == [2,4,6]
elemIndices :: Eq a => a -> [a] -> [Int] 
elemIndices _ [] = [] 
elemIndices x lista = aux 0 lista 
    where
        aux :: Int -> [a] -> [Int] 
        aux _ [] = [] 
        aux i (y:ys) = if x == y then i : aux (i + 1) ys else aux (i + 1) ys 

--26 
-- > nub [1,2,1,2,3,1,2] == [1,2,3]
nub :: Eq a => [a] -> [a] 
nub [] = [] 
nub (h:t) = h : nub (filter (/= h) t)

--27
-- > delete 2 [1,2,1,2,3,1,2] == [1,1,2,3,1,2]
-- > delete 4 [1,3,2,1,3,5] == [1,3,2,1,3,5] 
delete :: Eq a => a -> [a] -> [a] 
delete _ [] = [] 
delete x (h:t) 
    | x == h = t
    | otherwise = h : delete x t 

--28 
-- > (\\) [1,2,3,4,5,1] [1,5] == [2,3,4,1] 
(\\) :: Eq a => [a] -> [a] -> [a] 
(\\) lista [] = lista
(\\) [] _ = [] 
(\\) lista (h:t) = (\\) (delete h lista) t 

--29 
-- > union [1,1,2,3,4] [1,5] == [1,1,2,3,4,5]
union :: Eq a => [a] -> [a] -> [a] 
union [] lista = lista
union lista [] = lista 
union (h:t) ys = h : union t (delete h ys) 

--30 
-- > intersect [1,1,2,3,4] [1,3,5] == [1,1,3] 
intersect :: Eq a => [a] -> [a] -> [a]
intersect [] _ = [] 
intersect _ [] = [] 
intersect (h:t) lista 
    | h `elem` lista = h : intersect t lista 
    | otherwise = intersect t lista 

--31 
-- > insert 25 [1,20,30,40] == [1,20,25,30,40]
insert :: Ord a => a -> [a] -> [a] 
insert x [] = [x] 
insert x lista@(h:t) 
    | x == h = lista 
    | x < h = x : lista 
    | otherwise = h : insert x t 

--32 
-- > unwords ["Programacao", "Funcional"] == "Programacao Funcional"
unwords :: [String] -> String
unwords [] = []
unwords [x] = x 
unwords (h:t) = h ++ " " ++ unwords t  

--33 
-- > unlines ["Prog", "Func"] == "Prog\nFunc\n"
unlines :: [String] -> String 
unlines [] = [] 
unlines (h:t) = h ++ "\n" ++ unlines t 

--34 
-- > pMaior [2,6,3,1,5,4] == 1
-- > pMaior [30,10,20,40,0] == 3 
pMaior :: Ord a => [a] -> Int  
pMaior [x] = 0
pMaior l@(h:t) = aux 0 (0, h) l
    where 
        aux _ (pos, _) [] = pos 
        aux i (pos, max) (x:xs) 
            | x > max = aux (i + 1) (i, x) xs
            | otherwise = aux (i + 1) (pos, max) xs

--35 
-- > lookup 'a' [('a',1),('b',4),('c',5)] == Just 1
lookup :: Eq a => a -> [(a, b)] -> Maybe b 
lookup _ [] = Nothing 
lookup k ((a, b):t) = if k == a then Just b else lookup k t 

--36 
-- > preCrescente [3,7,9,6,10,22] == [3,7,9] 
preCrescente :: Ord a => [a] -> [a] 
preCrescente [x] = [x] 
preCrescente [] = []
preCrescente (h:x:t) 
    | h < x = h : preCrescente (x:t)
    | otherwise = [h] 

--37 
-- > iSort [3,1,2,5,4] == [1,2,3,4,5]
iSort :: Ord a => [a] -> [a] 
iSort [] = [] 
iSort [x] = [x] 
iSort (h:t) = insert h (iSort t) 

--38 
-- > menor "sai" "saiu" == True 
-- > menor "programacao" "funcional" = False 
menor :: String -> String -> Bool 
menor [] [] = False 
menor [] _ = True 
menor _ [] = False 
menor (h:t) (x:xs) 
    | h < x = True 
    | h == x = menor t xs 
    | otherwise = False 

--39 
-- > elemMSet ’a’ [(’b’,2), (’a’,4), (’c’,1)] == True
-- > elemMSet ’d’ [(’b’,2), (’a’,4), (’c’,1)] == False 
elemMSet :: Eq a => a -> [(a, Int)] -> Bool 
elemMSet _ [] = False
elemMSet x ((x1, _):t) = if x == x1 then True else elemMSet x t 

--40 
-- > converteMSet [(’b’,2), (’a’,4), (’c’,1)] == "bbaaaac"
converteMSet :: [(a, Int)] -> [a]
converteMSet [] = [] 
converteMSet ((x, n):t) = (replicate' n x) ++ converteMSet t 

--41
-- > insereMSet ’c’ [(’b’,2), (’a’,4), (’c’,1)] == [(’b’,2),(’a’,4), (’c’,2)]
insereMSet :: Eq a => a -> [(a, Int)] -> [(a, Int)] 
insereMSet x [] = [(x, 1)] 
insereMSet a ((x, n):t) = if a == x then (x, n + 1):t else  (x, n) : insereMSet a t 

--42
-- > removeMSet ’c’ [(’b’,2), (’a’,4), (’c’,1)] == [(’b’,2),(’a’,4)]
removeMSet :: Eq a => a -> [(a, Int)] -> [(a, Int)] 
removeMSet _ [] = [] 
removeMSet obj ((x, n):t) 
    | n > 1 = if obj == x then (x, n - 1) : t else (x, n) : removeMSet obj t 
    | otherwise = if obj == x then t else (x, n) : removeMSet obj t 

--43 
-- > constroiMSet "aaabccc" == [(’a’,3), (’b’,1), (’c’,3)]
constroiMSet :: Ord a => [a] -> [(a, Int)]
constroiMSet [] = [] 
constroiMSet (h:t) = insereMSet (h) (constroiMSet t)

--44 
-- > partitionEithers [Left 1, Right 2, Left 3, Right 4, Left 5]
partitionEithers :: [Either a b] -> ([a], [b])
partitionEithers [] = ([], []) 
partitionEithers ((Left x):t) = (x:a, b) 
    where (a, b) = partitionEithers t 
partitionEithers ((Right x):t) = (a, x:b)
    where (a, b) = partitionEithers t 

--45 
-- > catMaybes [Just 1, Just 2, Nothing, Just 3, Nothing, Just 4, Just 5, Nothing] == [1,2,3,4,5]
catMaybes :: [Maybe a] -> [a] 
catMaybes [] = []
catMaybes (h:t) =
    case h of 
        Just x -> x: catMaybes t 
        Nothing -> catMaybes t 

--46
-- > caminho (0,0) (3,4)
-- > [Este,Este,Este,Norte,Norte,Norte,Norte]
caminho :: (Int, Int) -> (Int, Int) -> [Movimento] 
caminho (xi, yi) (xf, yf) 
    | xi < xf = Este  : caminho (xi + 1, yi) (xf, yf)
    | xi > xf = Oeste : caminho (xi - 1, yi) (xf, yf)
    | yi < yf = Norte : caminho (xi, yi + 1) (xf, yf)
    | yi > yf = Sul   : caminho (xi, yi - 1) (xf, yf)
    | otherwise = [] 

--47 
-- > hasLoops (0,0) [Norte, Norte, Este, Sul, Oeste, Sul, Este, Norte, Este] == True 
-- > hasLoops (2,1) [Sul, Este, Sul, Oeste, Norte, Este, Sul] == False 
hasLoops :: (Int, Int) -> [Movimento] -> Bool 
hasLoops inicio movimentos = aux inicio movimentos 
    where 
        aux _ [] = False 
        aux (x, y) (m:ms) =  
            let 
                proxima = case m of 
                    Norte -> (x, y + 1) 
                    Sul -> (x, y - 1) 
                    Este -> (x + 1, y) 
                    Oeste -> (x - 1, y) 
            in if proxima == inicio then True else aux proxima ms 

--48
-- > contaQuadrados [Rect (0,0) (2,2), Rect (1,3) (7,4), Rect (5,2) (8,5), Rect (1,2) (2,4)] == 2 
contaQuadrados :: [Rectangulo] -> Int 
contaQuadrados [] = 0 
contaQuadrados ((Rect (x, y) (a, b)):t) 
    | abs (x - a) == abs (y - b) = 1 + contaQuadrados t 
    | otherwise = contaQuadrados t  

--49 
-- > areaTotal [Rect (0,0) (2,2), Rect (1,3) (7,4), Rect (5,2) (8,5), Rect (1,2) (2,4)] == 21.0 
areaTotal :: [Rectangulo] -> Float 
areaTotal lista  = sum  (map (\ (Rect (x, y) (z, w)) -> abs (x - z) * abs (y - w)) lista)

--50
-- > naoReparar [Bom, Avariado, Bom, Razoavel, Avariado] == 3 
naoReparar :: [Equipamento] -> Int 
naoReparar [] = 0 
naoRepara (h:t) = 
    case h of 
        Avariado -> naoReparar t
        _ -> 1 + naoReparar t 