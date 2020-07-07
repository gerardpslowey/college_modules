myProduct :: [Int] -> Int

myProduct [] = 1
myProduct(n:ns) = n * myProduct ns