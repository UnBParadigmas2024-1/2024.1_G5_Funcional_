import System.Random

data WordInfo = WordInfo
    { wordId :: Int
    , word :: String
    , hint :: String
    }


countries :: [(Int, String, String)]
countries =
    [ (1, "BRASIL", "É um País!")
    , (2, "CHILE", "É um País!")
    , (3, "ARGENTINA", "É um País!")
    , (4, "CHINA", "É um País!")
    , (5, "CANADA", "É um País!")
    , (6, "JAPAO", "É um País!")
    , (7, "MEXICO", "É um País!")
    ]

animals :: [(Int, String, String)]
animals =
    [ (1, "GATO", "É um Animal!")
    , (2, "CACHORRO", "É um Animal!")
    , (3, "VACA", "É um Animal!")
    , (4, "ABELHA", "É um Animal!")
    , (5, "ALPACA", "É um Animal!")
    , (6, "BALEIA", "É um Animal!")
    , (7, "BORBOLETA", "É um Animal!")
    , (8, "CANGURU", "É um Animal!")
    , (9, "CISNE", "É um Animal!")
    , (10, "ELEFANTE", "É um Animal!")
    , (11, "FLAMINGO", "É um Animal!")
    , (12, "GIRAFA", "É um Animal!")
    , (13, "JAVALI", "É um Animal!")
    , (14, "MACACO", "É um Animal!")
    , (15, "GALINHA", "É um Animal!")
    ]   

fruits :: [(Int, String, String)]
fruits =
    [ (1, "UVA", "É uma Fruta!")
    , (2, "FIGO", "É uma Fruta!")
    , (3, "MAMAO", "É uma Fruta!")
    , (4, "AMORA", "É uma Fruta!")
    , (5, "CAJU", "É uma Fruta!")
    , (6, "LARANJA", "É uma Fruta!")
    , (7, "CUPUACU", "É uma Fruta!")
    , (8, "MORANGO", "É uma Fruta!")
    , (9, "CEREJA", "É uma Fruta!")
    , (10, "ABACAXI", "É uma Fruta!")
    , (11, "MARMELO", "É uma Fruta!")
    , (12, "JACA", "É uma Fruta!")
    , (13, "BANANA", "É uma Fruta!")
    , (14, "FRAMBOESA", "É uma Fruta!")
    , (15, "PITANGA", "É uma Fruta!")
    ]

-- Função para selecionar uma palavra aleatória da lista
randomWord :: [(Int, String, String)] -> IO (Int, String, String)
randomWord list = do
    randomIndex <- randomRIO (0, length list - 1)
    return (list !! randomIndex)

fruta :: IO ()
fruta = do
    putStrLn "Selecionando uma palavra aleatória da lista de frutas:"
    (id, word, hint) <- randomWord fruits
    putStrLn $ "ID: " ++ show id ++ ", Palavra: " ++ word ++ ", Dica: " ++ hint

animal :: IO ()
animal = do
    putStrLn "Selecionando uma palavra aleatória da lista de animais:"
    (id, word, hint) <- randomWord animals
    putStrLn $ "ID: " ++ show id ++ ", Palavra: " ++ word ++ ", Dica: " ++ hint

pais :: IO ()
pais = do
    putStrLn "Selecionando uma palavra aleatória da lista de paises:"
    (id, word, hint) <- randomWord countries
    putStrLn $ "ID: " ++ show id ++ ", Palavra: " ++ word ++ ", Dica: " ++ hint

    
