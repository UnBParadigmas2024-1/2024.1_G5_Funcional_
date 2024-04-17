module Modulos.Teste where 

import System.IO

import Data.Maybe (mapMaybe)

import System.Random


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

-- Função principal que lê o arquivo, seleciona os dados de uma linha específica e os armazena em uma variável
main :: IO ()
main = do
    let n = 4
    lineNumber <- randomNumber n  -- Gera um número aleatório entre 1 e n
    result <- getEntryAtLine "app/Modulos/yourfile.txt" lineNumber
    case result of
        Just entry -> putStrLn $ "Nome: " ++ name entry ++ ", Dica: " ++ hint entry ++ "; Como o numero sorteado: " ++ show lineNumber
        Nothing -> putStrLn "Linha especificada não encontrada."

