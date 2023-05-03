module Pre_battle where
import System.Process


verificaEntrada :: Int -> Int
verificaEntrada x
                |x==1=1
                |x==2=2
                |x==3=3
                |otherwise = 0;

le_input :: IO Int
le_input=
    do
        input <- readLn :: IO Int
        result <- return (verificaEntrada input)
        if result == 0
            then do
                putStrLn "Opção inválida. Por favor, tente novamente."
                le_input 
            else
                return result

list_gym :: IO Int
list_gym  = 
    do
        system "clear"
        putStrLn "\t\tGinásios\n\n"
        putStrLn "[1] Ginásio foo\n\tDificuldade: Fácil\n"
        putStrLn "[2] Ginásio bar\n\tDificuldade: Médio\n"
        putStrLn "[3] Ginásio xpto\n\tDificuldade: Dificil\n"
        ginasio<-le_input

        return ginasio



pre_battle = list_gym

