
module Logico where 

import Data.Array

import System.IO

import Data.Maybe (mapMaybe)

import System.Random

import Data.List 

import Lose(lose)
import Win(win)

    
printL :: String -> IO ()
printL letters = putStrLn $ intercalate " " (map (\c -> [c]) letters)

----------------------------------------------- gera n aleatorio e selecionar palavra na base-------------------------------------------------

randomNumber :: Int -> IO Int --gera numero aleatorio de 1 a n. Esse n é descrito na main, especificamente em "jogo"
randomNumber n = randomRIO (1, n)


data Entry = Entry { name :: String, hint :: String } deriving Show --linha do arquivo

parseEntry :: String -> Maybe Entry ---- parse da linha do arquivo
parseEntry line = case words line of
    [name, hint] -> Just (Entry name hint)
    _ -> Nothing

parseEntries :: FilePath -> IO [Entry] -- retornar os entryes
parseEntries filePath = do
    contents <- readFile filePath
    let entries = mapMaybe parseEntry (lines contents)
    return entries

getEntryAtLine :: FilePath -> Int -> IO (Maybe Entry) --obter dados de uma linha especifica
getEntryAtLine filePath lineNumber = do
    entries <- parseEntries filePath
    if lineNumber >= 1 && lineNumber <= length entries
        then return (Just (entries !! (lineNumber - 1)))
        else return Nothing


--------------------------------------------------------jogo-------------------------------------








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

        putStrLn $ "Você pode escolher os seguintes caracteres: " ++ show alfabeto ++". Dica: é um(a) " ++ show dica ++ ". Digite uma letra:"
        putStrLn $ "Ou digite ? para revelar uma letra " -- ++ show ajudas ++ "/3 restantes."

        c <- getChar
        -- letra
        let letra = getLetter c palavra palavraComUnderscores
        -- putStrLn $ "Letra:::: " ++ show letra

        
        let validador = validaEntUser letra 
        let novaPalavraComUnderscores = atualizarPalavra palavra palavraComUnderscores letra

        _ <- getLine -- Consumir a nova linha após a letra digitada

        if(validador == True) --vai validar se a letra digitada pelo usuario é valida ou não na coleção de letras possíveis
            then do
                let alfabetoAlterado = removeElemento letra alfabeto
        
                if novaPalavraComUnderscores /= palavraComUnderscores
                    then do
                        
                        if '*' `elem` novaPalavraComUnderscores
                            then do 
                                putStrLn $ " "
                                putStrLn $ "Palavra: " ++ novaPalavraComUnderscores ++ ". Você ainda tem " ++ show tentativas ++ " tentativas"
                                loop palavra novaPalavraComUnderscores dica tentativas alfabetoAlterado
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


nonGuessedLetters :: String -> String -> String
nonGuessedLetters word incompleteWord = word \\ incompleteWord

countChars :: String -> [(Char, Int)]
countChars = map (\x -> (head x, length x)) . group . sort

helpLetter :: String -> Char
helpLetter word = fst (minimumBy (\(_, count1) (_, count2) -> compare count1 count2) (countChars word))


getLetter :: Char -> String -> String -> Char
getLetter c word incompleteWord | c == '?' = helpLetter (nonGuessedLetters word incompleteWord)
                                | otherwise = c


jogo :: IO ()
jogo = do


    let n = 31
    lineNumber <- randomNumber n  -- Gera um número aleatório entre 1 e n
    result <- getEntryAtLine "app/file.txt" lineNumber
    case result of
        Just entry -> do
            let palavra = name entry
                dica = hint entry
            --putStrLn $ "Palavra: " ++ palavra ++ ", Dica: " ++ dica ++ "; Como o número sorteado: " ++ show lineNumber
            percorreAdd palavra dica  
        Nothing -> putStrLn "Linha especificada não encontrada."
