-- Esta é uma função que verifica se uma palavra esta em uma lista.

notContainedLetters :: [Char] -> [Char] -> [Char]
notContainedLetters [] _      = []
notContainedLetters (x:xs) ys =
    if containsLetter x ys
    then notContainedLetters xs ys
    else x : notContainedLetters xs ys

containsLetter :: Char -> [Char] -> Bool
containsLetter _ []     = False
containsLetter c (x:xs)
    | c == x    = True
    | otherwise = containsLetter c xs


-- Exemplo de uso na maim.
-- main :: IO ()
-- main = do
--   let myList = "abcd"
--   print $ containsLetter 'a' myList  -- True
--   print $ containsLetter 'e' myList  -- False

