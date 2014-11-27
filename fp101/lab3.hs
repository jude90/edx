module Lab3 where

-----------------------------------------------------------------------------------------------------------------------------
-- LIST COMPREHENSIONS
------------------------------------------------------------------------------------------------------------------------------

-- ===================================
-- Ex. 0 - 2
-- ===================================

evens :: [Integer] -> [Integer]
evens = filter even 

-- ===================================
-- Ex. 3 - 4 
-- ===================================

-- complete the following line with the correct type signature for this function
squares :: Integer -> [Integer]
squares n = [x*x | x<-[1..n]]

sumSquares :: Integer -> Integer
sumSquares n = sum (squares n)

-- ===================================
-- Ex. 5 - 7
-- ===================================

-- complete the following line with the correct type signature for this function
squares' :: Int -> Int -> [Int]
squares' m n = [ x*x | x <- xs]
    where xs = take m [n+1..] 

sumSquares' :: Int -> Int
sumSquares' x = sum . uncurry squares' $ (x, x)

-- ===================================
-- Ex. 8
-- ===================================

coords :: Integer -> Integer -> [(Integer,Integer)]
coords x y = [(a,b)| a <-[0..x] , b <-[0..y]]

data Color = Red | Blue | Green
say :: Color -> String
say Red = "You are Red"
say Blue = "You are Blue"
say Green = "You are Green"
main :: IO()
main = putStrLn  $ "Hello World" ++ ( say Blue)