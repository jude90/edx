module Main where

main = putStrLn "Hello World, fuck you"

ffoldr :: (a -> b -> b) -> b -> [a] -> b
ffoldr f v [] = v
ffoldr f v (x:xs) = f x $ ffoldr f v xs
twice :: (a -> a) -> a -> a
twice f = f.f

len :: [a] -> Int
len [] = 0
len (_:xs) = 1 + len xs 

llen :: [a] -> Int
llen  = ffoldr (\ _ x -> x+1) 0 

ttakeWhile :: (a -> Bool) -> [a] -> [a]
ttakeWhile p [] = []
ttakeWhile p (x:xs) 
    | p x = x : ttakeWhile p xs
    | otherwise = []

ddropWhile :: (a -> Bool) -> [a] -> [a]
ddropWhile p [] = []
ddropWhile p (x:xs)
    | p x = ddropWhile p xs
    | otherwise = x:xs


compose :: [a -> a] -> (a -> a)
compose = foldr (.) id 

--sumsqreven = compose [sum, map (^2), filter even]

type Bit = Int
int2bin :: Int -> [Bit]
int2bin 0 = []
--int2bin n = n `mod` 2 : int2bin (n `div` 2)
int2bin n = int2bin (n `div` 2) ++ [n `mod` 2]
 
unfold p h t x
    | p x = []
    | otherwise = h x : unfold p h t (t x)














