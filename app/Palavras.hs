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

easyStrings :: [String] -> [String]
easyStrings xs = [s | s <- xs, length s <= 5]

easyMode :: IO [String]
easyMode = do
    wordsList <- getWords
    let easyList = easyStrings wordsList
    return easyList

mediumStrings :: [String] -> [String]
mediumStrings xs = [s | s <- xs, length s > 5 && length s <= 8]

mediumMode :: IO [String]
mediumMode = do
    wordsList <- getWords
    let mediumList = mediumStrings wordsList
    return mediumList

hardStrings :: [String] -> [String]
hardStrings xs = [s | s <- xs, length s > 8]

hardMode :: IO [String]
hardMode = do
    wordsList <- getWords
    let hardList = hardStrings wordsList
    return hardList

main :: IO ()
main = do
    putStrLn "Easy strings"
    outputList <- easyMode
    print outputList
    putStrLn "Medium strings"
    outputList <- mediumMode
    print outputList
    putStrLn "Hard strings"
    outputList <- hardMode
    print outputList