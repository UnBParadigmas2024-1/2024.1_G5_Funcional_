
module Modulos.Logico where 

import Data.Array

import System.IO

import Data.Maybe (mapMaybe)

import System.Random

import Data.List 


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
                jogo
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
                putStrLn "parou aqui!!!"
                menu
            "4" -> putStrLn "O jogo serah finalizado...";


}

lose :: String -> String -> IO ()
lose word letras = do
    putStrLn $ unlines
        [ "░██████╗░░█████╗░███╗░░░███╗███████╗  ░█████╗░██╗░░░██╗███████╗██████╗░"
        , "██╔════╝░██╔══██╗████╗░████║██╔════╝  ██╔══██╗██║░░░██║██╔════╝██╔══██╗"
        , "██║░░██╗░███████║██╔████╔██║█████╗░░  ██║░░██║╚██╗░██╔╝█████╗░░██████╔╝"
        , "██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░  ██║░░██║░╚████╔╝░██╔══╝░░██╔══██╗"
        , "╚██████╔╝██║░░██║██║░╚═╝░██║███████╗  ╚█████╔╝░░╚██╔╝░░███████╗██║░░██║"
        , "░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝  ░╚════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝"
        ];
    putStrLn $ "a palavra eh " ++ show word;
    --putStrLn $ "Quantidade de erros: " ++ show errors;
    putStrLn $ "Tentou as letras: " 
    printL letras 
    menu
    
printL :: String -> IO ()
printL letters = putStrLn $ intercalate " " (map (\c -> [c]) letters)


win :: String -> String -> IO ()
win word letters  = do
   putStrLn $ unlines
        [ "██████╗░░█████╗░██████╗░░█████╗░██████╗░███████╗███╗░░██╗░██████╗██╗██╗██╗"
        , "██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗░██║██╔════╝██║██║██║"
        , "██████╔╝███████║██████╔╝███████║██████╦╝█████╗░░██╔██╗██║╚█████╗░██║██║██║"
        , "██╔═══╝░██╔══██║██╔══██╗██╔══██║██╔══██╗██╔══╝░░██║╚████║░╚═══██╗╚═╝╚═╝╚═╝"
        , "██║░░░░░██║░░██║██║░░██║██║░░██║██████╦╝███████╗██║░╚███║██████╔╝██╗██╗██╗"
        , "╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚══════╝╚═╝░░╚══╝╚═════╝░╚═╝╚═╝╚═╝"
        ];
    --putStrLn $ "Você descobriu a palavra em " ++ show attempts ++ " tentativas!";
    --putStrLn $ "Quantidade de erros: " ++ show errors;
    putStrLn "Tentou as letras:";
    printL letters;
    menu

-----------------------------------------------------parte do aleatorio--------------------------------------

-- Função para gerar um número aleatório entre 1 e n
randomNumber :: Int -> IO Int
randomNumber n = randomRIO (1, n)


-- Tipo de dado para representar uma linha do arquivo
data Entry = Entry { name :: String, hint :: String } deriving Show

-- Função para converter uma linha do arquivo em um Entry
parseEntry :: String -> Maybe Entry
parseEntry line = case words line of
    [name, hint] -> Just (Entry name hint)
    _ -> Nothing

-- Função para ler o arquivo e retornar uma lista de Entries
parseEntries :: FilePath -> IO [Entry]
parseEntries filePath = do
    contents <- readFile filePath
    let entries = mapMaybe parseEntry (lines contents)
    return entries

-- Função para obter os dados de uma entrada em uma linha específica
getEntryAtLine :: FilePath -> Int -> IO (Maybe Entry)
getEntryAtLine filePath lineNumber = do
    entries <- parseEntries filePath
    if lineNumber >= 1 && lineNumber <= length entries
        then return (Just (entries !! (lineNumber - 1)))
        else return Nothing



--------------------------------------------------------jogo-------------------------------------





percorrerString :: String -> Char -> IO () -- percorre a palavra e entrega os campos escolhidos, ex: o _ o _  _  _  _ o _  _  _  _  _  _ o _ o _  _  _  _  _  
percorrerString str char = percorrerStringAux str char 0
    where
        percorrerStringAux :: String -> Char -> Int -> IO ()
        percorrerStringAux [] _ _ = putStrLn " Fim da string."
        percorrerStringAux (c:cs) char indice = do
            if c == char
                then do  
                    --putStrLn $ "Caractere atual: " ++ [c] ++ ", Índice: " ++ show indice ++ " - Este está contido"
                    putStr $ [char]
                    percorrerStringAux cs char (indice + 1)
                else do 
                    --putStrLn $ "Caractere atual: " ++ [c] ++ ", Índice: " ++ show indice
                    putStr $  " _ "
                    percorrerStringAux cs char (indice + 1)

-- IDEIA = Pegar essa função acima e alterar para pegar o indice e substituir num caracter, assim gerando a nova String de entrada.

percorreAdd :: String -> String -> IO ()
percorreAdd palavra dica = do
    let palavraComUnderscores = replicate (length palavra) '*'
    let tentativa = 5
    let alfabeto = filter (\x -> x /= 'k' && x /= 'w' && x /= 'y' && x /= 'z') ['a'..'z']  -- limita a possibilidade de caracteres disponiveis
    putStrLn $ "Palavra: " ++ palavraComUnderscores
    loop palavra palavraComUnderscores dica tentativa alfabeto

loop :: String -> String -> String -> Int -> [Char] -> IO ()
loop palavra palavraComUnderscores dica tentativas alfabeto
--    | tentativas <= 0 = putStrLn $ "Vocẽ perdeu, a palavra eh: " ++ show palavra
    | tentativas <= 0 = do
        let teste = armazenaLetra alfabeto
        lose palavra teste
    | otherwise = do

        --let alfabeto = filter (\x -> x /= 'k' && x /= 'w' && x /= 'y' && x /= 'z') ['a'..'z']  -- limita a possibilidade de caracteres disponiveis

        putStrLn $ "Você pode escolher os seguintes caracteres: " ++ show alfabeto ++". A dica eh: " ++ show dica ++ ". Digite uma letra:"
        
        letra <- getChar

        let validador = validaEntUser letra 
        let novaPalavraComUnderscores = atualizarPalavra palavra palavraComUnderscores letra

        _ <- getLine -- Consumir a nova linha após a letra digitada

        if(validador == True) --vai validar se a letra digitada pelo usuario é valida ou não na coleção de letras possíveis
            then do
                let alfabetoAlterado = removeElemento letra alfabeto
        
                if novaPalavraComUnderscores /= palavraComUnderscores
                    then do
                        putStrLn $ "Palavra: " ++ novaPalavraComUnderscores
                        if '*' `elem` novaPalavraComUnderscores
                            then loop palavra novaPalavraComUnderscores dica tentativas alfabetoAlterado
                            --else putStrLn "Palavra adivinhada"
                            else do
                                let teste = armazenaLetra alfabeto
                                win palavra teste
                    else do
                        if tentativas > 1
                            then do 
                                putStrLn $ "Letra errada. Você tem mais " ++ show (tentativas-1) ++ " tentativas. Tente novamente!"
                                putStrLn $ " "
                                putStrLn $ "Palavra: " ++ novaPalavraComUnderscores
                                loop palavra palavraComUnderscores dica (tentativas - 1) alfabetoAlterado
                            else do 
                                loop palavra palavraComUnderscores dica (tentativas - 1) alfabetoAlterado
              
                        
            else do 
                putStrLn $ "Letra não permitida, tente novamente!"
                putStrLn $ " "
                putStrLn $ "Palavra: " ++ novaPalavraComUnderscores
                loop palavra palavraComUnderscores dica tentativas alfabeto


        

 

atualizarPalavra :: String -> String -> Char -> String
atualizarPalavra [] _ _ = []
atualizarPalavra (c:cs) (u:us) letra
    | c == letra = c : atualizarPalavra cs us letra
    | otherwise = u : atualizarPalavra cs us letra




-- criarString :: Int -> String
-- criarString n = replicate n '0'






validaEntUser :: Char -> Bool --funcao para validar a entrada do usuario
validaEntUser a 
    | a == 'z' || a == 'k' || a == 'w' || a == 'y' = False
    | otherwise = True




removeElemento :: Eq a => a -> [a] -> [a] --funcao para remover um elemento de uma lista, vai remover as letras que o usuario escolher 
removeElemento _ [] = []
removeElemento x xs = letrasRestantes
    where
        letrasRestantes = filter (/= x) xs

armazenaLetra :: [Char] -> [Char]
armazenaLetra y = restante 
    where
        restante = filter (\x -> x /= 'k' && x /= 'w' && x /= 'y' && x /= 'z') ['a'..'z'] \\ y


-- whileLoop :: Int -> [Char] -> IO ()
-- whileLoop a lista =    -- validaEntUser elementoAMenos para chamar o validador 

--     if (a > 0)
--     then do
        
--         putStrLn $ "vidas totais: " ++ show a
--         putStrLn $ "Digite uma letra"

    

--         elementoAMenos <- getChar --vai fazer o usuario digitar um elemento 
--         putStrLn $ " "

--         let validador = validaEntUser elementoAMenos --valida entrada do usuario
--         if(validador == True)
--             then do
--                 let listaSem = removeElemento elementoAMenos lista
--                 putStrLn $ "Lista original: " ++ show lista
--                 putStrLn $ "Você escolheu a letra " ++ show elementoAMenos ++". Você ainda tem esses elementos: " ++ show listaSem
--                 whileLoop (a-1) listaSem --recursão para voltar com a lista do alfabeto
                        
--             else do 
--                 putStrLn $ "Letra não permitida, tente novamente!"
--                 whileLoop a lista 

--     else do 
--         putStrLn $ "perdeu"
--         return ()



jogo :: IO ()
jogo = do --main de teste


    let n = 4
    lineNumber <- randomNumber n  -- Gera um número aleatório entre 1 e n
    result <- getEntryAtLine "app/Modulos/yourfile.txt" lineNumber
    case result of
        Just entry -> do
            let palavra = name entry
                dica = hint entry
            putStrLn $ "Palavra: " ++ palavra ++ ", Dica: " ++ dica ++ "; Como o número sorteado: " ++ show lineNumber
            percorreAdd palavra dica  -- Chamada para a função percorreAdd dentro do bloco case
        Nothing -> putStrLn "Linha especificada não encontrada."


-- jogo :: IO ()
-- jogo = do --main de teste

--     let totalVida = 5
--     let lista = ['a'..'z']
--     let palavra = "teste"
--     let dica = "estamos testando esse recurso"

--     -- whileLoop (totalVida :: Int) lista --é chamado assim por ser uma funça~oque imprime na tela, logo função IO. Mas pode ser chamada apenas whileLoop 4
--     percorreAdd palavra dica