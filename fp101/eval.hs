module Main where

main = putStrLn "Hello World"

data Maybe a = Just a | Nothing
data Expr = Num Int | Neg Expr | Add Expr Expr |Div Expr Expr

eval :: Expr -> Maybe Int
eval (Num n) = n
--eval (Neg e) = case eval e of
--                Just v -> Just (-v)
--                Nothing -> Nothing
--eval (Add e1 e2) = case  eval e1 of 
--                    Just v1 -> case eval e2 of
--                                    Just v2 -> Just (v1 + v2)
--                                    Nothing -> Nothing
--                    Nothing -> Nothing

--eval (Div e1 e2) = case eval e2 of 
--                    Just 0 -> Nothing
--                    Just v2 -> case eval e1 of 
--                                Just v1 ->  Just (v1 `div` v2)
--                                Nothing -> Nothing
--                    Nothing -> Nothing

(>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
(Just x) >>= f = f x
Nothing >>= f = Nothing

return :: a -> Maybe a
return a = Maybe a 









