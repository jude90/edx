module Main where

main = putStrLn "Hello World"

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