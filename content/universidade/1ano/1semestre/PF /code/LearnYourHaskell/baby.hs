import Data.List
import qualified Data.Map as M -- Now, to reference Data.Map's filter function, we just use M.filter.

doubleMe :: Num a => a -> a 
doubleMe x = x + x 

doubleUs :: Num a => a -> a -> a 
doubleUs x y = doubleMe x + doubleMe y 

doubleSmallNumber :: (Num a, Ord a) => a -> a
doubleSmallNumber x = if x > 100
                      then x 
                      else x * 2

doubleSmallNumber' :: (Num a, Ord a) => a -> a 
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1 

conanOBrien :: String 
conanOBrien = "It's a-me, Conan O'Brien!"

boomBangs :: [Int] -> [String]
boomBangs xs = [if x < 10 then  "BOOM!" else "BANG!" | x <- xs, not (odd x)]

length' :: [a] -> Int
length' xs = sum [1 | _ <- xs]

removeNonUppercase :: String -> String 
removeNonUppercase st = [c | c <- st, c 'elem' ['A'..'Z']]

lucky :: (Integral a) => a -> String 
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: (Integral a) => a -> String 
sayMe 1 = "One!"
sayMe 2 = "Two!" 
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: (Integral a) => a -> a 
factorial 0 = 1 
factorial n = n * factorial (n - 1) 

addVectors :: (Num a) => (a, a) -> (a,a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y2 + y2)

tell :: (Show a) => [a] -> String 
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x 
tell (x:y:[]) = "The list has two elements: " ++ show x ++ show y 
tell (x:y:z:_) = "The list is long. The first three elements are: " ++ show x ++ show y ++ show z 

capital :: String -> String 
capital [] = "Empty string, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

bmiTell :: (RealFloat a) => a -> a -> String 
bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly"
    | bmi <= fat = "You're fat! Lose some weight, fatty!"
    | otherwise = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2 
          skinny = 18.5
          normal = 25.0
          fat = 30.0

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs] 
    where bmi weight height = weight / height ^ 2

cylinder :: (RealFloat a) => a -> a -> a 
cylinder r h = 
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2 
    in sideArea + 2  * topArea 

describeList :: [a] -> String 
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [x] -> "a singleton list."
                                               xs -> "a longer list." 

maximum' :: (Ord a) => [a] -> a 
maximum' [] = error "maximum of empty list"
maximum' [x] = x 
maximum' (x:xs) = max x (maximum' xs)

replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x 
    | n <= 0 = []
    | otherwise = x : replicate' (n-1) x

take' :: (Num i, Ord i) => i -> [a] -> [a] 
take' n _ 
    | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n - 1) xs

reverse' :: [a] -> [a] 
reverse' [] = [] 
reverse' (h:t) = reverse' t ++ [h]  

zip' :: [a] -> [b] -> [(a, b)] 
zip' _ [] = [] 
zip' [] _ = [] 
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys 

elem' :: Eq a => a -> [a] -> Bool 
elem' a [] = False 
elem' a (x:xs)  
    | a == x = True 
    | otherwise = elem a xs 

quickSort :: Ord a => [a] -> [a] 
quickSort [] = [] 
quickSort (x:xs) = 
    let smallerSorted = quickSort [a | a <- xs, a <= x] 
        biggerSorted = quickSort [a | a <- xs, a > x] 
    in smallerSorted ++ [x] ++ biggerSorted  

multThree :: (Num a) => a -> (a -> (a -> a))  
multThree x y z = x * y * z 

compareWithHundred :: (Num a, Ord a) => a -> Ordering 
compareWithHundred = compare 100 

divideByTen :: (Floating a) => a -> a 
divideByTen = (/10) 

isUpperAlphanum :: Char -> Bool 
isUpperAlphanum = (`elem` ['A'..'Z']) 

applyTwice :: (a -> a) -> a -> a 
applyTwice f x = f (f x) 

zipWith' :: (a -> b -> c ) -> [a] -> [b] -> [c] 
zipWith' _ [] _ = [] 
zipWith' _ _ [] = [] 
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys 

flip' :: (a -> b -> c) -> (b -> a -> c) 
flip' f y x = f x y 

map' :: (a -> b) -> [a] -> [b] 
map' _ [] = [] 
map' f (x:xs) = f x : map f xs 

filter' :: (a -> Bool) -> [a] -> [a] 
filter' _ [] = [] 
filter' p (x:xs) 
    | p x = x : filter p xs 
    | otherwise = filter p xs 

quickSort' :: (Ord a) => [a] -> [a] 
quickSort' [] = [] 
quickSort' (x:xs) = 
    let smallerSorted = quickSort' (filter (<= x) xs)
        biggerSorted = quickSort' (filter (> x) xs) 
    in smallerSorted ++ [x] ++ biggerSorted 

largestDivisible :: (Integral a) => a 
largestDivisible = head (filter p [1000000, 99999..]) 
    where p x = x `mod` 3820 == 0 

chain :: (Integral a) => a -> [a] 
chain 1 = [1] 
chain n 
    | even n = n:chain (n `div` 2) 
    | odd n = n:chain (n*3 +1) 

numLongChains :: Int 
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))   

sum' :: (Num a) => [a] -> a 
sum' xs = foldl (\acc x -> acc + x) 0 xs 

sum2 :: (Num a) => [a] -> a 
sum2 = foldl (+) 0 

elem2 :: (Eq a) => a -> [a] -> Bool 
elem2 y ys = foldl (\acc x -> if x == y then True else False) False ys 

map2 :: (a -> b) -> [a] -> [b] 
map2 f xs = foldr (\x acc -> f x : acc) [] xs 

maximum2 :: (Ord a) => [a] -> a  
maximum2 = foldr1 (\x acc -> if x > acc then x else acc)  
  
reverse2 :: [a] -> [a]  
reverse2 = foldl (\acc x -> x : acc) []  
  
product' :: (Num a) => [a] -> a  
product' = foldr1 (*)  
  
filter2 :: (a -> Bool) -> [a] -> [a]  
filter2 p = foldr (\x acc -> if p x then x : acc else acc) []  
  
head' :: [a] -> a  
head' = foldr1 (\x _ -> x)  
  
last' :: [a] -> a  
last' = foldl1 (\_ x -> x)  

sqrtSums :: Int 
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

fn = ceiling . negate . tan . cos . max 50 

oddSquareSum :: Integer 
oddSquareSum = sum . takeWhile (<1000) . filter odd . map (^2) $ [1..] 

oddSquareSum2 :: Integer 
oddSquareSum2 = 
    let oddSquares = filter odd $ map (^2) [1..] 
        belowLimit = takeWhile (<1000) oddSquares 
    in sum belowLimit 

numUniques :: (Eq a) => [a] -> Int 
numUniques = length . nub -- nub is a function defined in Data.List that takes a list and weeds out duplicate elements


