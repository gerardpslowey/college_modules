-- Student Name: Gerard Slowey
-- Student Number: 17349433

-- prefix takes the longest current prefix and the next word
-- it returns the longest prefix from both
-- the strings supplied are represented as character arrays
prefix :: String -> String -> String

-- an empty string is returned if either the longest prefix
-- or the given test list is empty
prefix _ "" = ""
prefix "" _ = ""

-- prefix recursively builds the longest common prefix (lcp)
-- (x:xs) represents the current lcp 
-- (y:ys) is the next word in the list
prefix (x:xs) (y:ys)
    -- if x equals y
    -- return x plus the lcp of the other strings
   | x == y = x : prefix xs ys
   -- otherwise return an epty string
   | otherwise = ""


lcp :: [String] -> String

-- base case if the list is empty
lcp [] = ""

-- use foldl1 to iterate through the given string
-- feeding the result at each stage to the next stage
lcp list = foldl1 prefix list
