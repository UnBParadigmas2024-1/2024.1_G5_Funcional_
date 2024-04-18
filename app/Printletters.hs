module Printletters(printL) where

import Data.List (intercalate)

printL :: String -> IO ()
printL letters = putStrLn $ intercalate " " (map (\c -> [c]) letters)