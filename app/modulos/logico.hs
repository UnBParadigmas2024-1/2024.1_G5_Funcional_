
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


main = do --main de teste

    let totalVida = 5
    let lista = ['a'..'z']

    whileLoop (totalVida :: Int) lista --é chamado assim por ser uma funça~oque imprime na tela, logo função IO. Mas pode ser chamada apenas whileLoop 4
