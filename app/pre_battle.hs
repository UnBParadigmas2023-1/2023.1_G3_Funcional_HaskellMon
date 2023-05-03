module Pre_battle where
import System.Process
import System.IO
import Control.Concurrent

list_gym :: String -> IO Int

list_gym "" = 
    do
        system "clear"
        putStrLn "[x] Quit\tGinásios\n"
        putStrLn "[1] Ginásio foo\n\tDificuldade: Fácil\n"
        putStrLn "[2] Ginásio bar\n\tDificuldade: Médio\n"
        putStrLn "[3] Ginásio xpto\n\tDificuldade: Dificil" 
        
        putStr "\n>> "
        hFlush stdout 
        input <- getLine
        list_gym input

list_gym i
    | i == "x" || i == "X" = return 0
    | i == "1" = return 1
    | i == "2" = return 2
    | i == "3" = return 3
    | otherwise = do
        putStrLn "Opção inválida. Por favor, tente novamente."
        threadDelay 2500000
        list_gym "" 

pre_battle = list_gym ""
