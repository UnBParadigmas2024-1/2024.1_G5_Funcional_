module Palavras where

import Data.Char
import Paths_x20241_G5_Funcional

getWords :: IO [String]
getWords = do
    filepath <- getDataFileName "words.txt"
    getWords <- readFile filepath
    let x = words . map toUpper $ removePunc getWords
    return x
    
removePunc :: String -> String
removePunc xs = [x | x <- xs, x `notElem` "-[],.?!:;\"\'"]