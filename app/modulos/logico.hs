
validaEntUser :: Char -> IO () --funcao para validar a entrada do usuario
validaEntUser a 
    | a == 'ç' || a == 'k' || a == 'w' || a == 'y' = putStrLn "digite a letra novamente"
    | otherwise = putStrLn "Letra aceita!"




removeElemento :: Eq a => a -> [a] -> [a] --funcao para remover um elemento de uma lista, vai remover as letras que o usuario escolher 
removeElemento _ [] = []
removeElemento x xs = letrasRestantes
    where
        letrasRestantes = filter (/= x) xs

whileLoop :: Int -> IO ()
whileLoop a =
    if (a > 0)
    then do
        putStrLn $ "vidas totais: " ++ show a
        whileLoop (a-1)
    else do 
        putStrLn $ "perdeu"
        return ()


main = do --main de teste

    let lista = ['a'..'z']
    let totalVida = 5

    whileLoop (totalVida :: Int) --é chamado assim por ser uma funça~oque imprime na tela, logo função IO. Mas pode ser chamada apenas whileLoop 4

    putStrLn $ "Digite uma letra"

    elementoAMenos <- getChar --vai fazer o usuario digitar um elemento 
    -- validaEntUser elementoAMenos para chamar o validador 

    let listaSem = removeElemento elementoAMenos lista
    putStrLn $ "Lista original: " ++ show lista
    putStrLn $ "Se você tirar " ++ show elementoAMenos ++" Você ainda tem esses elementos: " ++ show listaSem