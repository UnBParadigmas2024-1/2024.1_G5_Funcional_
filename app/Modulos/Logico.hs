
module Modulos.Logico where 

import Data.Array

import System.IO

import Data.Maybe (mapMaybe)

import System.Random


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


forLoop :: Int -> IO ()
forLoop 0 = putStrLn $ "0 iteracoes"
forLoop it = 
    if it > 0
        then do
            putStrLn $ "iteracao" ++ show it 
            forLoop (it-1)
        else 
            return()


temLetra :: String -> Char -> Int -> IO () 
temLetra [] _ _ = putStrLn $ "Não tem essa letra na palavra" 
temLetra (h:t) char tam = do 
    let futuro = 0
    if h == char
        then do 
            putStrLn $ "Tem a letra " ++ show char ++ " na posicao" ++ show futuro 
            temLetra t char (futuro+1)
        else 
            temLetra t char (futuro+1)


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
    | tentativas <= 0 = putStrLn $ "Vocẽ perdeu, a palavra eh: " ++ show palavra
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
                            else putStrLn "Palavra adivinhada"
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
