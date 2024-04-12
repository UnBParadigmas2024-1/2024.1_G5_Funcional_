module Main where

import MainMenu (menu)

main :: IO ()
main = do 
    putStrLn "Hello, Haskell!"
    menu
