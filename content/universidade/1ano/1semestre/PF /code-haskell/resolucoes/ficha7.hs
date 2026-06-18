module Ficha7 where 

data ExpInt = Const Int 
            | Simetrico ExpInt 
            | Mais ExpInt ExpInt 
            | Menos ExpInt ExpInt 
            | Mult ExpInt ExpInt 

data RTree a = R a [RTree a] 

data LTree a = Tip a | Fork (LTree a) (LTree a)  

data FTree a b = Leaf b | No a (FTree a b) (FTree a b)   

separaEither :: [Either a b] -> ([a], [b]) -- 
separaEither [] = ([], []) 
separaEither (Left x:t) = (x:a, b) 
    where (a, b) = separaEither t 
separaEither (Right x:t) = (a, x:b) 
    where (a, b) = separaEither t 

-- 1 

-- a) 
calcula :: ExpInt -> Int 
calcula (Const x) = x 
calcula (Simetrico x) = - (calcula x) 
calcula (Mais exp1 exp2) = (calcula exp1) + (calcula exp2) 
calcula (Menos exp1 exp2) = (calcula exp1) - (calcula exp2) 
calcula (Mult exp1 exp2) = (calcula exp1) * (calcula exp2) 

-- b) 
-- ex: infixa (Mais (Const 3) (Menos (Const 2) (Const 5))) == "(3 + (2 - 5))"
infixa :: ExpInt -> String 
infixa (Const x) = show x
infixa (Simetrico exp) = "(-(" ++ infixa exp ++ "))"
infixa (Mais exp1 exp2) = "(" ++ infixa exp1 ++ "+" ++ infixa exp2 ++ ")"
infixa (Menos exp1 exp2) = "(" ++ infixa exp1 ++ "-" ++ infixa exp2 ++ ")"
infixa (Mult exp1 exp2) = "(" ++ infixa exp1 ++ "*" ++ infixa exp2 ++ ")"

-- c) 
-- ex: posfixa (Mais (Const 3) (Menos (Const 2) (Const 5))) == "3 2 5 - +" 
posfixa :: ExpInt -> String 
posfixa (Const x) = show x 
posfixa (Simetrico exp) = posfixa exp ++ "(-)" 
posfixa (Mais exp1 exp2) = posfixa exp1 ++ posfixa exp2 ++ "+" 
posfixa (Menos exp1 exp2) = posfixa exp1 ++ posfixa exp2 ++ "-" 
posfixa (Mult exp1 exp2) = posfixa exp1 ++ posfixa exp2 ++ "*"  

-- 2
arvore2 = R 6 [R 4 [R 7 [R 1 [],
                        R 3 []],
                   R 9 []],
              R 3 [R 12 []],
              R 6 [],
              R 11 []]

mapRT :: (a->b) -> RTree a -> RTree b 
mapRT f (R x []) = R f x [] 
mapRT f (R x l) = R (f x) (map(mapRT f) l) 

-- a
soma :: Num a => RTree a -> a 
soma (R x l) = x + sum (map soma l) 

-- b 
altura :: RTree a -> Int 
altura (R x []) = 1 
altura (R x l) = 1 + maximum (map altura l) 

-- c 
prune :: Int -> RTree a -> RTree a 
prune 0 (R x _) = R x [] 
prune n (R x l) = R x (map (prune (n - 1)) l) 

-- d) 
mirror :: RTree a -> RTree a 
mirror (R x l) = R x (map mirror (reverse l)) 

-- e) 
postorder :: RTree a -> [a] 
postorder  (R x l) = concatMap postorder l ++ [x] 

-- 3 

arvore3 = Fork (Fork (Tip 5)
                    (Fork (Tip 6)
                          (Tip 4)))
              (Fork (Fork (Tip 3)
                          (Tip 7))
                    (Tip 5))

-- a) 
ltSum :: Num a => LTree a -> a 
ltSum (Tip n) = n 
ltSum (Fork a b) = ltSum a + ltSum b 

--b) 
listaLT :: LTree a -> [a] 
listaLT (Tip n) = [n] 
listaLT (Fork a b) = listaLT a ++ listaLT b 

--c) 
ltHeight :: LTree a -> Int 
ltHeight (Tip _) = 0 
ltHeight (Fork a b) = 1 + max (lttHeight a) (ltHeight b) 

-- 4 

arvore4 = No 8 (No 1 (Leaf 5)
                    (No 2 (Leaf 6)
                          (Leaf 4)))
              (No 9 (No 10 (Leaf 3)
                           (Leaf 7))
                    (Leaf 5))

-- a) 
splitFTree :: FTree a b -> (BTree a, LTree b) 
splitFTree (Leaf n) = (Empty, Tip n) 
splitFTree (No x esq dir) = 
    let 
        (bt1, lt1) = splitFTree esq 
        (bt2, lt2) = splitFTree dir 
    in (Node x b1 b2, Fork lt1 lt2) 

-- b) 
joinTrees :: BTree a -> LTree b -> Maybe (FTree a b) 
joinTrees Empty (Tip b) = Just (Leaf b) 
joinTrees (Node x esqBT dirBT) (Fork esqLT dirLT) = 
    case (joinTrees esqBT esqLT, joinTrees dirBT dirLT) of 
        (Just t1, Just t2) -> Just (No x t1 t2) 
        _ -> Nothing 
joinTrees _ _ = Empty 