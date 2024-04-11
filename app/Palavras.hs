module Palavras where

import Data.Char

palavrasList :: [String]
palavrasList =
  [ "CARRO"
  , "PROGRAMACAO"
  , "BOLA"
  , "JOGO"
  , "COMPUTADOR"
  , "CANETA"
  ]

getWords :: IO [String]
getWords = do
    getWords <- readFile "words.txt"
    let x = words . map toUpper $ removePunc getWords
    return x
    
removePunc :: String -> String
removePunc xs = [x | x <- xs, x `notElem` "-[],.?!:;\"\'"]