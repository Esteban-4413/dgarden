module Ficha3 where

--1.

data Hora = H Int Int 
          deriving (Show, Eq, Ord)

type Etapa = (Hora, Hora)
type Viagem = [Etapa] 

--2.
data Ponto = Cartesiano Double Double 
             | Polar Double Double 
  deriving (Show, Eq)    
type Poligonal = [Ponto]

--3.
data Contacto = Casa Integer 
              | Trab Integer 
              | Tlm Integer 
              | Email String 
              deriving Show 
type Nome = String 
type Agenda = [(Nome, [Contacto])]

--extra
tamanho :: Agenda -> Int 
tamanho a = length a 

nomes :: Agenda -> [Nome]
nomes [] = []
nomes (c:cs) = fst c : nomes cs

conhecido :: Agenda -> Nome -> Bool 
conhecido a nome = elem nome (nomes a)

contactos :: Agenda -> Nome -> Maybe [Contacto]
contactos [] _ = Nothing 
contactos ((x, y):resto) n = if x == n then Just y else contactos resto n 

--1.
v1 :: Viagem 
v1 = [(H 9 30, H 10 25), (H 11 20, H 12 45), (H 13 30, H 14 45)]

validaHora :: Hora -> Bool 
validaHora (H h m) = h>=0 && h<24 && m>=0 && m<60 

validaEtapa :: Etapa -> Bool  
validaEtapa (h1, h2) = validaHora h1 && validaHora h2 && h1 < h2

validaViagem :: Viagem -> Bool 
validaViagem ((h1, h2):(h3, h4):t) = validaEtapa (h1, h2) && (h1, h2) < (h3, h4)

calcHoras :: Viagem -> (Hora, Hora)
calcHoras (h1:t) = (fst (h1), snd (last t))

fromMinToHours :: Int -> Hora 
fromMinToHours m = H (div m 60) (mod m 60)

calcViagemEfectiva :: Viagem -> Hora
calcViagemEfectiva [] = H 0 0 
calcViagemEfectiva ((H h1 m1, H h2 m2):t) = 
     let difHoras (H h1 m1) (H h2 m2) = (h2 * 60 + m2) - (h1 * 60 + m1)
         difEtapas (H h1 m1, H h2 m2) = difHoras (H h1 m1) (H h2 m2)
         H h m = calcViagemEfectiva t 
         minRest = h * 60 + m
     in fromMinToHours (difEtapas (H h1 m1, H h2 m2) + minRest)

{-
calcViagemEfectiva :: Viagem -> Hora
calcViagemEfectiva v = fromMinToHours (sumMinutes v)
     where
          sumMinutes :: Viagem -> Int
          sumMinutes [] = 0
          sumMinutes ((H h1 m1, H h2 m2):t) =
               let dif = (h2 * 60 + m2) - (h1 * 60 + m1)
               in dif + sumMinutes t

          fromMinToHours :: Int -> Hora
          fromMinToHours m = H (m `div` 60) (m `mod` 60)
-}

calcTempEsp :: Viagem -> Hora 
calcTempEsp [] = H 0 0 
calcTempEsp [_] = H 0 0 
calcTempEsp v = fromMinToHours (minEspera v)
     where 
          minEspera :: Viagem -> Int 
          minEspera [] = 0 
          minEspera [_] = 0
          minEspera ((_ , H h2 m2):(H h3 m3, _):t) = 
               let dif = (h3 * 60 + m3) - (h2 * 60 + m2)
               in dif + minEspera t


calcTempTotal :: Viagem -> Hora 
calcTempTotal [] = H 0 0 
calcTempTotal v = 
     let (H h1 m1, _) = head v 
         (_, H hn mn) = last v 
         totalMin = (hn * 60 + mn) - (h1 * 60 + m1) 
     in fromMinToHours (totalMin)

--2. 

 
--3.
a1 :: Agenda 
a1 = [("Joao", [Casa 123, Tlm 444])
     ,("Maria", [Email "MA@gmail.com"])
     ,("Ana", [Tlm 4322, Trab 433, Email "x"])
     ,("Pedro", [Tlm 42414])]


--a)
acresEmail :: Nome -> String -> Agenda -> Agenda 
acresEmail a b [] = [(a, [Email b])]
acresEmail a b ((x, y) : resto) = if (a == x) then ((x,(Email b):y)):resto
                                  else (x, y):(acresEmail a b resto)

--b) 
verEmails :: Nome -> Agenda -> Maybe [String] 
verEmails _ [] = Nothing 
verEmails a ((x, y):resto) 
                        | a == x = Just [e | Email e <- y]
                        | a /= x = verEmails a resto 

--c) 
consTelefs :: [Contacto] -> [Integer] 
consTelefs [] = [0]
consTelefs contactos = [nums | Tlm nums <- contactos] ++ [telefone | Casa telefone <- contactos]

--d)
casa :: Nome -> Agenda -> Maybe Integer
casa _ [] = Nothing 
casa nome ((x, y):resto) 
  | nome == x = case [num | Casa num <- y] of [] -> Nothing
                                              [z] -> Just z  
  | otherwise = casa nome resto 
