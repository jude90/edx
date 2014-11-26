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