prefix :: String -> String -> String

prefix _ "" = ""
prefix "" _ = ""

prefix (x:xs) (y:ys)
   | x == y = x : prefix xs ys
   | otherwise = ""


lcp :: [String] -> String
lcp = foldl1 prefix
