module Main where

import qualified Modulos.Logico as Logico
import qualified Modulos.Teste as Teste 
import MainMenu (menu)

main :: IO ()
main = do 
    -- putStrLn "Hello, Haskell!"
    -- menu
    Logico.jogo 
    --Teste.main 