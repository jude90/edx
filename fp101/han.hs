import System.IO

-- pure
diff :: String -> String -> String
diff xs ys =
    [if elem x ys then x else '-' | x <- xs]


-- impure

hangman :: IO ()
hangman = 
    do putStrLn "Think of a word"
    word <- sgetLine
    putStrLn "Try to guess it"
    guess word

sgetLine :: IO String
sgetLine = do x <- getCh
              if x == '\n' then
                do putChar x
                    return []
              else
                do putChar '-'
                   xs <- sgetLine
                   return (x:xs)

getCh :: IO Char
getCh = do hSetEcho stdin False
           c <- getChar
           hSetEcho stdin True
           return c 

guess :: String -> IO ()
guess word =
    do putStr ">"