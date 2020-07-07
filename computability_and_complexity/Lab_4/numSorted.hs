numSorted :: Ord a => a -> [a] -> Int

numSorted _ [] = 0
numSorted a (x:xs) 
    | a < x     = 0
    | a == x    = 1 + numSorted a xs
    | otherwise = numSorted a xs