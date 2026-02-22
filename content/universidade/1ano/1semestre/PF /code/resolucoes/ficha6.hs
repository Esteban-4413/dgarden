module Ficha6 where 

data BTree a = Empty 
             | Node a (BTree a) (BTree a) 
             deriving (Show) 

type Aluno = (Numero, Nome, Regime, Classificacao)
type Numero = Int 
type Nome = String 
data Regime = ORD | TE | MEL deriving Show 
data Classificacao = Aprov Int 
                   | Rep 
                   | Faltou 
    deriving Show 
type Turma = BTree Aluno -- árvore binaria de procura (ordenada por número)  

-- extra 
mapBTree :: (a -> b) -> BTree a -> BTree b 
mapBTree f Empty = Empty 
mapBTree f (Node raiz esq dir) = Node (f raiz) (mapBTree f esq) (mapBTree f dir) 

turma :: Turma
turma = (Node (15,"Luís",ORD,Aprov 14) (Node (12,"Joana",MEL,Faltou) (Node (7,"Diogo",TE,Rep) Empty Empty) (Node (14,"Lara",ORD,Aprov 19) Empty Empty)) (Node (20,"Pedro",TE,Aprov 10) Empty (Node (25,"Sofia",ORD,Aprov 20) (Node (23,"Rita",ORD,Aprov 17) Empty Empty) (Node (28,"Vasco",MEL,Rep) Empty Empty))))

-- 1 

-- a)
altura :: BTree a -> Int 
altura Empty = 0 
altura (Node _ esq dir) = 1 + max (altura esq) (altura dir) 

-- b) 
contaNodos :: BTree a -> Int 
contaNodos Empty = 0 
contaNodos (Node raiz esq dir) = 1 + (contaNodos esq) + (contaNodos dir)

-- c) 
folhas :: BTree a -> [a] 
folhas Empty = []
folhas (Node r Empty Empty) = [r]
folhas (Node raiz esq dir) = (folhas esq) ++ (folhas dir) 

-- d) 
prune :: Int -> BTree a -> BTree a
prune 0 _ = Empty 
prune _ Empty = Empty 
prune n (Node raiz esq dir) = Node raiz (prune (n - 1) esq) (prune (n - 1) dir)

-- e) 
path :: [Bool] -> BTree a -> BTree a 
path [] (Node raiz _ _) = [raiz] 
path _ Empty = [] 
path (h:t) (Node raiz esq dir) = raiz : path t (if h then dir else esq) 

-- f) 
mirror :: BTree a -> BTree a 
mirror Empty = Empty 
mirror (Node raiz esq dir) = Node raiz (mirror dir) (mirror esq) 

-- g) 
zipWithBT :: (a -> b -> c) -> BTree a -> BTree b -> BTree c 
zipWithBT Empty _ = Empty 
zipWithBT f _ Empty = Empty 
zipWithBT f (Node raiz1 esq1 dir1) (Node raiz2 esq2 dir2) = Node (f raiz1 raiz2) (zipWithBT f esq1 esq2) (zipWithBT f dir1 dir2)

unzipBT :: BTree (a, b, c) -> (BTree a, BTree b, BTree c) 
unzipBT Empty = (Empty, Empty, Empty)
unzipBT (Node (a, b, c) esq dir) = (Node a unzip esq1 dir1, Node b esq2 dir2, Node esq3 dir3) 
    where 
        (esq1, esq2, esq3) = unzipBT esq
        (dir1, dir2, dir3) = unzipBT dir 

-- 2 

-- a) 
minimo :: Ord a => BTree a -> a 
minimo (Node raiz Empty _) = raiz 
minimo (Node raiz left right) = minimo left  

-- b) 
semMinimo :: Ord a => BTree a -> BTree a 
semMinimo (Node raiz Empty right) = right 
semMinimo (Node raiz left right) = Node raiz (semMinimo left) right 

-- c) 
minSmin :: Ord a => a -> BTree a -> (a, BTree a) 
minSmin (Node _ Empty dir) = (raiz, dir)
minSmin (Node raiz esq dir) = (a, Node raiz b dir)
    where 
        (a,b) = minSmin esq 

-- d) 
remove :: Ord a => a -> BTree a -> BTree a 
remove x Empty = Empty 
remove x (Node raiz esq dir) 
    | x > raiz = Node raiz esq (remove x dir)
    | x < raiz = Node raiz (remove x esq) dir 
    | otherwise = 
        case dir of 
            Empty -> esq 
            _ -> 
                let (a,b) = minSmin dir 
                in Node a esq b 

-- 3 
-- a)
inscNum :: Numero -> Turma -> Bool 
inscNum _ Empty = False 
inscNum n (Node (numero, nome, _ , _ ) esq dir) 
    | n < numero = inscNum n esq
    | n > numero = inscNum n dir 
    | otherwise = True  

-- b) 
inscNome :: Numero -> Turma -> Bool 
inscNome _ Empty = False 
inscNome name (Node ( _ , nome, _ , _ ) esq dir) 
    | name == nome = True
    | otherwise = inscNome name esq || inscNome name dir 

-- c) 
trabEst :: Turma -> [(Numero, Nome)] 
trabEst (Node (numero, nome, TE , _) esq dir) = trabEst esq ++ [(numero, nome)] ++ trabEst dir 
trabEst (Node _ esq dir) = trabEst esq ++ trabEst dir 

-- d) 
nota :: Numero -> Turma -> Maybe Classificacao 
nota _ Empty = Nothing 
nota n turma = if not inscNum n turma then Nothing 
nota n (Node (num, _ , _ , classificacao) esq dir) 
    | n > num = nota n dir 
    | n < num = nota n esq 
    | otherwise = Just classificacao 

-- e 
percFaltas :: Turma -> Float
percFaltas turma = 
    let 
        listaFaltas Empty = [] 
        listaFaltas (Node (numero, nome, _, Faltou) esq dir) = listaFaltas esq ++ [nome] ++ listaFaltas dir 
        listaFaltas (Node _ esq dir) = listaFaltas esq ++ listaFaltas dir 
        listaAlunosTotal turmaTotal = contaNodos turmaTotal 
    in ((fromIntegral (length (listaFaltas turma))) / (fromIntegral (listaAlunosTotal turma))) * 100 

-- f 
mediaAprov :: Turma -> Float 
mediaAprov turma = 
    let 
        alunosAprov Empty = [] 
        alunosAprov (Node (_, _, _, Aprov x) esq dir) = [x] ++ alunosAprov esq ++ alunosAprov dir 
        alunosAprov (Node _ esq dir) = alunosAprov esq ++ alunosAprov dir 
    in (fromIntegral (sum (alunosAprov turma)) / (fromIntegral (length (alunosAprov turma))))

-- g) 
aprovAv :: Turma -> Float 
aprovAv turma = 
    let 
        aux :: Turma -> (0, 0) 
        aux Empty = (0, 0) 
        aux (Node (_, _, _, classif) esq dir) = 
            let 
                (aprovEsq, totalEsq) = aux esq 
                (aprovDir, totalDir) = aux dir 
                a = aprovEsq + aprovDir 
                t = totalEsq + totalDir 
            in case classif of 
                Aprov _ -> (a + 1, t + 1) 
                Rep -> (a, t + 1) 
                Faltou -> (a, t) 
        aprovados = aux turma 
    in 
        if total == 0 then 0 
        else fromIntegral aprovados / fromIntegral total 


aprovAv2 :: Turma -> Float 
aprovAv2 turma = 
    let 
        aprovados Empty = 0 
        aprovados (Node (_, _, _, Aprov _) esq dir) = 1 + aprovados esq + aprovados dir 
        aprovados (Node _ esq dir) = aprovados esq + aprovados dir 
        reprovados Empty = 0 
        reprovados (Node (_, _, _, Rep) esq dir) = 1 + reprovados esq + reprovados dir 
        reprovados (Node _ esq dir) = reprovados esq + reprovados dir 
        avaliados turma = fromIntegral $ aprovados turma + reprovados turma 
    in (fromIntegral $ aprovados turma) / avaliados turma 
     