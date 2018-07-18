prods :: Int -> [Int]
prods x = [y * x | y <- [x, x+1..]]

mix :: [Int] -> [Int] -> [Int]
mix x [] = x 
mix [] y = y
mix (x:xs) (y:ys) 
  |  x < y = x:(mix xs (y:ys))
  |  x > y = y:(mix (x:xs) ys)
  |  otherwise = x:(mix xs ys)

myElem :: Int -> [Int] -> Bool
myElem x [] = False
myElem x (y:ys)  
  |  x == y = True
  |  x < y = False
  |  otherwise = myElem x ys

sieve :: [Int] -> [Int] -> [Int]
sieve (n:ns) [] = n:(sieve ns (prods n))
sieve (n:ns) (c:cs)
  |  not (myElem n (c:cs)) = n:(sieve ns (mix (c:cs) (prods n)))
  |  otherwise = (sieve ns (c:cs))    
  
  

firstn :: Int -> [Int]
firstn x = take x (sieve [2..] [])

primesto :: Int -> [Int]
primesto x = takeWhile (<=x) (sieve [2..] []) 
