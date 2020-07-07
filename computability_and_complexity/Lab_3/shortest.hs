shortest :: [[a]] -> [a]

shortest [] = []
shortest [y] = y
shortest (x:y:list) 
    | length x > length y = shortest(y:list)
    | otherwise           = shortest(x:list)