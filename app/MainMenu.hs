module MainMenu (menu) where

import System.IO
import Control.Monad
--import ErrorM(no_errors)
--import Lose(lose)
--import Win(win)
import qualified Logico as Logico


menu :: IO()
menu = do { putStrLn $ unlines
    [ "   _                                                    _   "
    , " /x x\\                                                /x x\\ "
    , " \\ ^ /    ███████╗░█████╗░██████╗░░█████╗░░█████╗░    \\ ^ / "
    , "  _|_     ██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔══██╗     _|_  "
    , " / | \\    █████╗░░██║░░██║██████╔╝██║░░╚═╝███████║    / | \\ "
    , "/  |  \\   ██╔══╝░░██║░░██║██╔══██╗██║░░██╗██╔══██║   /  |  \\"
    , "   |      ██║░░░░░╚█████╔╝██║░░██║╚█████╔╝██║░░██║      |   "
    , "  / \\     ╚═╝░░░░░░╚════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝     / \\  "
    , "_/   \\_                                              _/   \\_"
    ];
        putStrLn "1 - Começar jogo";
        putStrLn "2 - Regras";
        putStrLn "3 - Teste de componentes";
        putStrLn "4 - Sair";
        opcao <- getLine;
        case opcao of 
            "1" -> do
                putStrLn "Iniciando jogo...";
                Logico.jogo 
                menu 

            "2" -> do
                putStrLn "REGRAS";
                putStrLn "1. Tente adivinhar a palavra";
                putStrLn "2. Chute uma letra";
                putStrLn "3. Se a letra existir na palavra, ela será exibida nas posições correspondentes";
                putStrLn "4. Se a letra não existir, o total de erros aumentará e uma parte a mais do boneco será colocada na forca";
                putStrLn "5. O jogo termina quando a palavra é adivinhada corretamente";
                putStrLn "6. Ou quando a quantidade máxima de tentativas é atingida";
                putStrLn "7. Isso significa que seu boneco foi enforcado!!! MORREU!!! GAME OVER!!!";
                menu
            "3" -> do
                -- no_errors 0
                -- no_errors 1
                -- no_errors 2
                -- no_errors 3
                -- no_errors 4
                -- no_errors 5
                -- no_errors 6
                -- lose "banana" "abdefg" 2 10
                -- win "banana" "abdefg" 2 10
                putStrLn "em construção!"
                menu
            "4" -> putStrLn "O jogo serah finalizado...";
}
