sequ_1, sequ_2, sequ_3,sequ_4 :: Monad m => [m a] -> m [a]

sequ_1 [] = return []
sequ_1 (m:ms) 
    = m >>= 
        \ a ->
         do as <- sequ_1 ms
            return (a:as)

sequ_2 ms = foldr func (return ()) ms
    where func :: (Monad m) => m a -> m [a] -> m [a]
          func m acc 
            = do x <- m 
                 xs <- acc
                 return (x:xs)

sequ_3 ms = foldr func (return []) ms
    where func :: (Monad m) => m a -> m [a] -> m [a]
          func m acc = m :acc

sequ_4 = undefined
--sequ_4 ms = foldr func (return []) ms
--sequ_4 (m:ms) = return (x:as)
--    where func :: (Monad m) => m a -> m [a] -> m [a]
--          func m acc 
--            = do x <- m 
--                 xs <- acc
--                 return (x:xs)

foldLeftM :: Monad m => (a -> b -> m a) -> a -> [b] -> m a
foldLeftM f a [] = return a
foldLeftM f a (x:xs) = foldLeftM f (f x a>>= \acc -> return acc ) xs