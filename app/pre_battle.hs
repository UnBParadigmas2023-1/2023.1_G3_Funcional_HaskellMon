module Pre_battle where

import System.Process


verificaEntrada :: Int -> Int
verificaEntrada x
                |x==1=1
                |x==2=2
                |x==3=3
                |otherwise = 0;

list_gym :: IO Int
list_gym  = 
    do
        system "clear"
        putStrLn "\t\tGinásios\n\n"
        putStrLn "[1] Ginásio foo\n\tDificuldade: Fácil\n"
        putStrLn "[2] Ginásio bar\n\tDificuldade: Médio\n"
        putStrLn "[3] Ginásio xpto\n\tDificuldade: Dificil\n"
        input <- readLn :: IO Int
        -- print (verificaEntrada input)
        return (verificaEntrada input)
        -- return input





pre_battle = list_gym







-- list_gym :: IO Int
-- list_gym  = 
--     do
--         system "clear"
--         putStrLn "\t\tGinásios\n\n"
--         putStrLn "[1] Ginásio foo\n\tDificuldade: Fácil\n"
--         putStrLn "[2] Ginásio bar\n\tDificuldade: Médio\n"
--         putStrLn "[3] Ginásio xpto\n\tDificuldade: Dificil\n"
--         input <- readLn :: IO Int
--         case input of
--             1 -> return input
--             2 -> return input
--             3 -> return input
--             _ -> do 
--                     system "clear"
--                     putStrLn "Digite um valor inteiro valido (1, 2 ou 3)"
--                     list_gym
