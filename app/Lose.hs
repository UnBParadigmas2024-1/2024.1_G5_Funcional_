module Lose(lose) where

--import MainMenu (menu)
import Printletters(printL)
--import qualified Logico




lose :: String -> String -> IO ()
lose word letters = do
    putStrLn $ unlines
        [ "░██████╗░░█████╗░███╗░░░███╗███████╗  ░█████╗░██╗░░░██╗███████╗██████╗░"
        , "██╔════╝░██╔══██╗████╗░████║██╔════╝  ██╔══██╗██║░░░██║██╔════╝██╔══██╗"
        , "██║░░██╗░███████║██╔████╔██║█████╗░░  ██║░░██║╚██╗░██╔╝█████╗░░██████╔╝"
        , "██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░  ██║░░██║░╚████╔╝░██╔══╝░░██╔══██╗"
        , "╚██████╔╝██║░░██║██║░╚═╝░██║███████╗  ╚█████╔╝░░╚██╔╝░░███████╗██║░░██║"
        , "░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝  ░╚════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝"
        ];
    --putStrLn $ "Você fez " ++ show attempts ++ " tentativas!";
    --putStrLn $ "Quantidade de erros: " ++ show errors;
    putStrLn $ "a palavra eh " ++ show word;
    putStrLn "Tentou as letras:";
    printL letters;
    --menu

