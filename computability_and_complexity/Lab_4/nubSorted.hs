nubSorted :: Eq a => [a] -> [a]

nubSorted []  = []
nubSorted [x] = [x]

nubSorted (x:(y:xs)) 
    | x == y    = nubSorted (y:xs)
    | otherwise = x : nubSorted (y:xs)