elemSorted :: Ord a => a -> [a] -> Bool

elemSorted _ [] = False

elemSorted a (x:xs) 
    | a < x     = False
    | a == x    = True
    | otherwise = elemSorted a xs