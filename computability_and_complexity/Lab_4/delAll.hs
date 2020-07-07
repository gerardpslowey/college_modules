delAll :: Eq a => a -> [a] -> [a]

delAll a [] = []
delAll a (b:bc) 
	| a == b    = delAll a bc
	| otherwise = b : delAll a bc