data Tree a = Null | Node a (Tree a) (Tree a)
    deriving (Read,Show)

addNode :: Ord a => a -> Tree a -> Tree a
addNode p Null = Node p Null Null
addNode p (Node n t1 t2)
   | p < n     = Node n (addNode p t1) t2
   | otherwise = Node n t1 (addNode p t2)

makeTree :: Ord a => [a] -> Tree a
makeTree []     = Null
makeTree (x:xs) = addNode x (makeTree xs)

inOrder :: Tree a -> [a]
inOrder Null           = []
inOrder (Node n t1 t2) = (inOrder t1) ++ [n] ++ (inOrder t2)

mpSort :: Ord a => [a] -> [a]
mpsort t = inorder(maketree(t))