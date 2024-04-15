module Win(win) where

import MainMenu (menu)
import Printletters(printL)

win :: String -> String -> Int -> Int -> IO ()
win word letters errors attempts = do
   putStrLn $ unlines
        [ "██████╗░░█████╗░██████╗░░█████╗░██████╗░███████╗███╗░░██╗░██████╗██╗██╗██╗"
        , "██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗░██║██╔════╝██║██║██║"
        , "██████╔╝███████║██████╔╝███████║██████╦╝█████╗░░██╔██╗██║╚█████╗░██║██║██║"
        , "██╔═══╝░██╔══██║██╔══██╗██╔══██║██╔══██╗██╔══╝░░██║╚████║░╚═══██╗╚═╝╚═╝╚═╝"
        , "██║░░░░░██║░░██║██║░░██║██║░░██║██████╦╝███████╗██║░╚███║██████╔╝██╗██╗██╗"
        , "╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚══════╝╚═╝░░╚══╝╚═════╝░╚═╝╚═╝╚═╝"
        ];
    putStrLn $ "Você descobriu a palavra em " ++ show attempts ++ " tentativas!";
    putStrLn $ "Quantidade de erros: " ++ show errors;
    putStrLn "Tentou as letras:";
    printL letters;
    menu