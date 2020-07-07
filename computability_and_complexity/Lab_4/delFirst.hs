delFirst :: Eq a => a -> [a] -> [a]

delFirst _ [] = []
delFirst a (b:bc) 
	| a == b    = bc
    | otherwise = b : delFirst a bc