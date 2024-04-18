module Palavras where

import Data.Char
import Paths_x20241_G5_Funcional
import Data.List


getWords :: IO [String]
getWords = do
    filepath <- getDataFileName "words.txt"
    getWords <- readFile filepath
    let x = lines . map toUpper $ removePunc getWords
    return x


removePunc :: String -> String
removePunc xs = [x | x <- xs, x `notElem` "-[],.?!:;\"\'"]


getInd :: IO Int
getInd = do
    a <- getWords
    q <- cat
    let x = elemIndices q a
    let z = joinInt x
    return z


getCat :: IO [String]
getCat = do
    x <- getInd
    a <- getWords
    let y = words $ a !! (x+1)
    return y


joinInt :: [Int] -> Int
joinInt l = read $ map intToDigit l


cat :: IO String
cat = do
    putStrLn "Escolha a categoria:"
    putStrLn "1 - Fruta";
    putStrLn "2 - Animal";
    putStrLn "3 - Pais";
    opcao <- getLine
    case opcao of
        "1" -> return "FRUTA"
        "2" -> return "ANIMAL"
        "3" -> return "PAIS"
        _ -> do
            putStrLn "Opcao Invalida"
            cat