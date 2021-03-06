-- 1. head' возвращает первый элемент непустого списка (0,5 балла)
head' :: [a] -> a
head' (x:_) = x
-- 2. tail' возвращает список без первого элемента, для пустого - пустой (0,5)
tail' :: [a] -> [a]
tail' [] = []
tail' (_:xs) = xs
-- 3. take' возвращает первые n >= 0 элементов исходного списка (0,5)
take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n a = head' a : take' (n - 1) (tail' a)
-- 4. drop' возвращает список без первых n >= 0 элементов; если n больше длины -- списка, то пустой список. (0,5)
drop' :: Int -> [a] -> [a]
drop' 0 a = a
drop' _ [] = []
drop' n a = drop' (n - 1) (tail' a)
-- 5. filter' возвращает список из элементов, для которых f возвращает True (0,5)
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f xs = if f (head' xs) then (head' xs) : filter' f (tail' xs) else filter' f (tail' xs)  
-- 6. foldl' последовательно применяет функцию f к элементу списка l и значению, полученному на предыдущем шаге, начальное значение z (0,5)
-- foldl' (+) 0 [1, 2, 3] == (((0 + 1) + 2) + 3)   
-- foldl' (*) 4 [] == 4
foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _ z [] = z
foldl' f z (x:xs) = foldl' f (f z x) xs 
-- 7. concat' принимает на вход два списка и возвращает их конкатенацию (0,5)
-- concat' [1,2] [3] == [1,2,3]
concat' :: [a] -> [a] -> [a]
concat' [] a = a
concat' a [] = a
concat' a b = head' a : concat' (tail' a) b
-- 8. quickSort' возвращает его отсортированный список (0,5)
quickSort' :: Ord a => [a] -> [a]
quickSort' [] = []
quickSort' (x:xs) = concat' (quickSort'(filter' (<= x) xs)) (x : (quickSort'(filter' (> x) xs))) 

