module Main where

import MainMenu (menu)
import ErrorM(no_errors)

main :: IO ()
main = do 
    putStrLn "Hello, Haskell!"
    menu
