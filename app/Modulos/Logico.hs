
module Modulos.Logico where 

import Data.Array


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
    putStrLn $ "Palavra: " ++ palavraComUnderscores
    loop palavra palavraComUnderscores dica tentativa

loop :: String -> String -> String -> Int -> IO ()
loop palavra palavraComUnderscores dica tentativas
    | tentativas <= 0 = putStrLn "Vocẽ perdeu"
    | otherwise = do
        putStrLn $ "A dica eh: " ++ show dica ++ ". Digite uma letra:"
        letra <- getChar
        _ <- getLine -- Consumir a nova linha após a letra
        let novaPalavraComUnderscores = atualizarPalavra palavra palavraComUnderscores letra
        if novaPalavraComUnderscores /= palavraComUnderscores
            then do
                putStrLn $ "Palavra: " ++ novaPalavraComUnderscores
                if '*' `elem` novaPalavraComUnderscores
                    then loop palavra novaPalavraComUnderscores dica tentativas
                    else putStrLn "Palavra adivinhada"
            else do
                if tentativas > 1
                    then do 
                        putStrLn $ "Letra errada. Você tem mais " ++ show (tentativas-1) ++ " tentativas. Tente novamente:"
                        loop palavra palavraComUnderscores dica (tentativas - 1)
                    else do 
                        loop palavra palavraComUnderscores dica (tentativas - 1)
              

 

atualizarPalavra :: String -> String -> Char -> String
atualizarPalavra [] _ _ = []
atualizarPalavra (c:cs) (u:us) letra
    | c == letra = c : atualizarPalavra cs us letra
    | otherwise = u : atualizarPalavra cs us letra




-- criarString :: Int -> String
-- criarString n = replicate n '0'






validaEntUser :: Char -> Bool --funcao para validar a entrada do usuario
validaEntUser a 
    | a == 'ç' || a == 'k' || a == 'w' || a == 'y' = False
    | otherwise = True




removeElemento :: Eq a => a -> [a] -> [a] --funcao para remover um elemento de uma lista, vai remover as letras que o usuario escolher 
removeElemento _ [] = []
removeElemento x xs = letrasRestantes
    where
        letrasRestantes = filter (/= x) xs


whileLoop :: Int -> [Char] -> IO ()
whileLoop a lista =    -- validaEntUser elementoAMenos para chamar o validador 

    if (a > 0)
    then do
        
        putStrLn $ "vidas totais: " ++ show a
        putStrLn $ "Digite uma letra"

        


        elementoAMenos <- getChar --vai fazer o usuario digitar um elemento 
        putStrLn $ " "

        let validador = validaEntUser elementoAMenos --valida entrada do usuario
        if(validador == True)
            then do
                let listaSem = removeElemento elementoAMenos lista
                putStrLn $ "Lista original: " ++ show lista
                putStrLn $ "Você escolheu a letra " ++ show elementoAMenos ++". Você ainda tem esses elementos: " ++ show listaSem
                whileLoop (a-1) listaSem --recursão para voltar com a lista do alfabeto
                        
            else do 
                putStrLn $ "Letra não permitida, tente novamente!"
                whileLoop a lista 

    else do 
        putStrLn $ "perdeu"
        return ()



jogo :: IO ()
jogo = do --main de teste

    let totalVida = 5
    let lista = ['a'..'z']
    let palavra = "teste"
    let dica = "estamos testando esse recurso"

    -- whileLoop (totalVida :: Int) lista --é chamado assim por ser uma funça~oque imprime na tela, logo função IO. Mas pode ser chamada apenas whileLoop 4
    percorreAdd palavra dica