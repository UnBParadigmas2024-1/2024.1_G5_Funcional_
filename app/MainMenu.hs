module MainMenu (menu) where

--import System.IO
import System.Random
--import Control.Monad
import Palavras (getWords)
import Forca (runGame)

-- Definindo o máximo de erros permitidos
maxErrors :: Int
maxErrors = 6

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
        putStrLn "3 - Sair";
        opcao <- getLine;
        case opcao of 
            "1" -> do
                putStrLn "Iniciando jogo..."
                wordList <- getWords
                randomIndex <- randomRIO (0, length wordList - 1)
                let word = wordList !! randomIndex
                runGame word maxErrors  

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
            "3" -> putStrLn "O jogo será finalizado...";
}
