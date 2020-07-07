rev :: [a] -> [a]
rev [] = []
rev (h:t) =  rev t ++ [h]

isPalindrome :: Eq a => [a] -> Bool
isPalindrome a 
    | a == rev a = True
    | otherwise  = False