data LTree a = 
    | Leaf a
    | Fork (LTree a) (LTree a)

resultado :: [Int] -> Int -> Maybe String 
resultado [] _ = Nothing 
resultado [x] r = if x == r then (Just (show x)) else Nothing 
resultado (a:b:c) r = 
    let 
        ra = resultado (b:c) (r - a)
        rs = resultado (b:c) (r + a) 
        rm = resultado (b:c) (r `div` a)  
    in case ra of 
        Just sa -> Just $ show a ++ "+" ++ "(" ++ sa ++ ")"
        Nothing -> case rs of 
            Just ss -> Just $ show a ++ "-" ++ "(" ++ ss ++ ")"
            Nothing -> case rm of 
                Just sm -> Just $ show a ++ "*" ++ "(" ++ sm ++ ")" 
                Nothing -> Nothing 

deleteMin :: Ord a => [a] -> [a] 
deleteMin l = 
    let m = minimum l 
    in filter (/=m) l 

minRem :: Ord a => [a] -> (a, [a])
minRem [u] = (u, [])
minRem (a:as) 
        | a > m = (m, a:rs)
        | a == m = (m, rs) 
        | otherwise = (a, as)
    where (m, rs) = minRem as 

deleteRandom :: Eq a => [a] -> IO [a] 
deleteRandom [] = return [] 
deleteRandom l = 
    let 
        indMax = (length l) -1 
        indRand = randomRIO (0, indMax) -- randomRio :: (Int, Int) -> IO Int 
    in 
        do 
            i <- indRand
            return $ delete (!! i ) l 

selectLeaf :: String -> LTree a -> Maybe a 
selectLeaf " " (Leaf x) = Just x
selectLeaf " " _ = Nothing 
selectLeaf _ (Leaf _ ) = Nothing 
selectLeaf (p:ps) (Fork esq dir) = 
    case p of 
        '1' -> selectLeaf ps dir 
        '2' -> selectLeaf ps esq 
 
 