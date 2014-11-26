module Main where

main = putStrLn "Hello World"

twice :: (a -> a) -> a -> a
twice f = f.f