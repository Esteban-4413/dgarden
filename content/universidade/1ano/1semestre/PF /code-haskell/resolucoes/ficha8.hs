module Ficha8 where 

data Frac = F Integer Integer 

data Exp a = Const a 
           | Simetrico (Exp a) 
           | Mais (Exp a) (Exp a)
           | Menos (Exp a) (Exp a)
           | Mult (Exp a) (Exp a) 
           
-- 1 

-- a) 
mdc :: Integer -> Integer -> Integer 
mdc 0 x = x 
mdc x 0 = x 
mdc x y 
    | x < y = mdc x (mod y x) 
    | otherwise = mdc (mod x y) y 

normaliza :: Frac -> Frac 
normaliza (F n d) = 
    let 
        an = abs n 
        ad = abs d 
        m = mdc an ad 
        s = signum (n * d)
    in F (s * (div an m)) (div ad m) 

-- b) 
instance Eq Frac where 
    (F a b) == (F c d) = a * d == b * c 

-- c) 
instance Ord Frac where 
    x <= y = 
        let 
            F a b = normaliza x 
            F c d = normaliza y 
        in a * d <= b*c 

-- d) 
instance Show Frac where 
    show (F a b) = "(" ++ show a ++ "/" ++ show b ++ ")" 

-- e) 
instance Num Frac where 
    (F x y) + (F a b) = normaliza (F (x * b + y * a) (y * b))
    (F x y) * (F a b) = normaliza (F (x * a) (y * b))
    negate (F x y) = F (negate x) y 
    abs (F x y) = F (abs x) (abs y) 
    signum (F x y) = F (signum (x * y)) 1 
    fromInteger i = F i 1 

-- f) 
funcao :: Frac -> [Frac] -> [Frac] 
funcao f l = filter (> 2 * f) l 

funcao2 :: Frac -> [Frac] -> [Frac] 
funcao2 f l = [x | x <- l, x > 2 * f] 

-- 2 

-- a) 
instance Show a => Show (Exp a) where
    show (Const a) = show a 
    show (Simetrico a) = "(-" ++ show a ++ ")"
    show (Mais a b) = "(" ++ show a ++ "+" ++ show b ++ ")" 
    show (Menos a b) = "(" ++ show a ++ "-" ++ show b ++ ")" 
    show (Mult a b) = "(" ++ show a ++ "*" ++ show b ++ ")" 

-- b) 
calcula :: Num a => Exp a -> a 
calcula (Const x) = x 
calcula (Simetrico x) = - (calcula x) 
calcula (Mais exp1 exp2) = (calcula exp1) + (calcula exp2) 
calcula (Menos exp1 exp2) = (calcula exp1) - (calcula exp2) 
calcula (Mult exp1 exp2) = (calcula exp1) * (calcula exp2) 

instance (Num a, Eq a) => Eq (Exp a) where 
    a == b = calcula a == calcula b

-- c) 
instance (Num a, Eq a) => Num (Exp a) where 
    x + y = Mais x y 
    x - y = Menos x y 
    x * y = Mult x y 
    negate x = Simetrico x 
    fromInteger x = Const (fromInteger x)  



 


