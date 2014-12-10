seq_1 , seq_3, seq_4 ,seq_5:: Monad m => [m a] -> m ()


seq_1 [] = return () 
seq_1 (m:ms) = (foldl (>>) m ms) >> return ()

--seq_2 ms = foldl (>>) (return ()) ms

seq_3 [] = return ()
seq_3 (m:ms) = m >> seq_3 ms

seq_4 [] = return ()
seq_4 (m :ms) = m >>= \ _ -> seq_4 ms

seq_5 ms = foldr (>>) (return ()) ms