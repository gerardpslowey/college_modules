dup :: Eq a => [a] -> Bool

dup a
   | a == []                = False
   | length a == 1          = False
   | elem (head a) (tail a) = True
   | otherwise              = dup (tail a)