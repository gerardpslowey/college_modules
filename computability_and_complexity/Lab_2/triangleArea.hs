triangleArea :: Float -> Float -> Float -> Float

triangleArea a b c
	| (a + b) < c = error "Not a triangle!"
	| (a + c) < b = error "Not a triangle!"
	| (b + c) < a = error "Not a triangle!"
	| otherwise   = sqrt(s*(s-a)*(s-b)*(s-c))
	where s       = (a + b + c)/2 