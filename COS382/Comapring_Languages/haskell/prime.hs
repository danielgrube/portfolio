isPrime :: Integer -> Bool
isPrime n =  null [a | a <- [2..n - 1], n `mod` a == 0]

--PrimePartitionConstructive :: Integer -> Integer -> String
