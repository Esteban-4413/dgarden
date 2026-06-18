module Ficha1 where  
import Data.Char hiding (isUpper, isAlpha, toUpper)  

type Polinomio = [(Double, Int)]
type Hora = (Int, Int) 
data Semaforo = Verde | Amarelo | Vermelho
  deriving (Show, Eq)
data Ponto = Cartesiano Double Double 
             | Polar Double Double 
  deriving (Show, Eq)    

-- 1   
perimetro ::  Floating a => a -> a  
perimetro raio = 2 * 3.14 * raio 

dist :: (Double, Double) -> (Double, Double) -> Double
dist (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2 + (y2 - y1)^2)

primUlt :: [a] -> (a, a) 
primUlt l = (head l, last l)

multiplo :: Int -> Int -> Bool 
multiplo m n 
  | mod m n == 0 = True 
  | otherwise = False 

truncaImpar :: [a] -> [a]
truncaImpar l = if mod (length l) 2 == 0 then l else tail l 

max2 :: Int -> Int -> Int 
max2 x y = if x > y then x else y 

max3 :: Int -> Int -> Int -> Int 
max3 x y z = max2 (max2 x y) z 

--2 
nRaizes :: Polinomio -> Int 
nRaizes [] = 0  
nRaizes [(b, e)] = e
nRaizes ((b, e):t) = 
  let maxExp = nRaizes t 
  in if e < maxExp then maxExp else e 

{-
nRaizes [(3,2), (4,5), (1,0)]
nRaizes [(3,2),(4,5),(1,0)]
      |
      | (b,e) = (3,2)
      | t = [(4,5),(1,0)]
      V
      maxResto = nRaizes [(4,5),(1,0)]
                    |
                    | (b,e) = (4,5)
                    | t = [(1,0)]
                    V
                    maxResto = nRaizes [(1,0)]
                                  |
                                  | Caso base: devuelve e = 0
                                  V
                              maxResto = 0
                    Compara: 5 > 0 → devuelve 5
      Compara: 2 > 5 → falso → devuelve 5
-}                
        
raizes :: Polinomio -> [Double]
raizes [] = [0.0]
raizes ((b, e):t) = sqrt (b ^ e) : raizes t

-- 3
validaHora :: Hora -> Bool 
validaHora (h, m) = h>=0 && h<24 && m>=0 && m<60 

comparaHora :: Hora -> Hora -> Bool
comparaHora (h1, m1) (h2, m2) = 
  if h1 > h2 then True 
  else if h1 < h2 then False 
  else m1 > m2 

-- 5.   
next ::  Semaforo -> Semaforo
next Verde = Amarelo 
next Amarelo = Vermelho 
next Vermelho = Verde 

safe :: Semaforo -> Semaforo -> Bool 
safe Vermelho _ = True 
safe _ Vermelho = True 
safe _ _ = False 

--6.        
cx :: Ponto -> Double 
cx (Cartesiano x y ) = x 
cx (Polar x y) = x * cos y 

cy :: Ponto -> Double 
cy (Cartesiano x y) = y 
cy (Polar x y) = x * sin y 

dist' :: Ponto -> Ponto -> Double 
dist' p q = sqrt (((cy p) - (cy q))^2 + ((cx p) - (cx q))^2) 

-- extra
isUpper :: Char -> Bool 
isUpper c = if (ord c >= ord 'A' && ord c <= ord 'Z') 
            then True 
            else False  

isAlpha :: Char -> Bool 
isAlpha c = (c >= 'A' &&  c <= 'Z') || (c >= 'a' && c <= 'z') 

toUpper :: Char -> Char 
toUpper c = if (c >= 'a' && c <= 'z') 
            then chr (ord c - ord 'a' + ord 'A')
            else c 