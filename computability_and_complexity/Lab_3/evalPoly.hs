evalPoly :: Int -> [Int] -> Int

evalPoly x [] = 0
evalPoly a (x:xs) = x + a * (evalPoly a xs)