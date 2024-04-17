module Forca where

import System.Random
import Data.List (intersperse, (\\), group, sort, minimumBy)
import Data.Char


chooseWord :: [String] -> IO String
chooseWord wordsList = do
  index <- randomRIO (0, length wordsList - 1)
  return $ wordsList !! index


checkLetter :: String -> Char -> Bool
checkLetter word guess = guess `elem` word


updateWordDisplay :: String -> String -> Char -> String
updateWordDisplay word display guess =
  [ if x == guess || x `elem` guessed then x else '_' | x <- word]
  where
    guessed = display ++ [guess]


isGameOver :: String -> String -> Int -> Int -> Bool
isGameOver word display errors maxErrors =
  word == display || errors >= maxErrors


displayGame :: String -> String -> Int -> Int -> IO ()
displayGame word display errors maxErrors = do
  putStrLn $ "Palavra: " ++ intersperse ' ' display
  putStrLn $ "Erros: " ++ show errors ++ "/" ++ show maxErrors


nonGuessedLetters :: String -> String -> String
nonGuessedLetters word incompleteWord = word \\ incompleteWord

countChars :: String -> [(Char, Int)]
countChars = map (\xs -> (head xs, length xs)) . group . sort

tipLetter :: String -> Char
tipLetter tipStr = fst (minimumBy (\(_, count1) (_, count2) -> compare count1 count2) (countChars tipStr))


runGame :: String -> Int -> IO ()
runGame word maxErrors = do
  let wordLength = length word
      display = replicate wordLength '_'
  loop word display 0
  where
    loop word display errors = do
      displayGame word display errors maxErrors
      if isGameOver word display errors maxErrors
        then if word == display
               then putStrLn "Você ganhou!"
               else putStrLn $ "Você perdeu! A palavra era: " ++ word
        else do
          putStrLn "Chute uma letra (ou envie ? para mostrar uma letra):"
          guess <- getLine
          case (map toUpper guess) of
            [c] -> if checkLetter word c
                      then do
                        let newDisplay = updateWordDisplay word display c
                        loop word newDisplay errors
                    else if c == '?'
                      then do
                        let auxWord = nonGuessedLetters word display
                        let tipChar = tipLetter auxWord
                        let newDisplay = updateWordDisplay word display tipChar
                        loop word newDisplay errors

                    else loop word display (errors + 1)
            _   -> putStrLn "Por favor, insira apenas uma letra." >> loop word display errors