module Pre_battle where
import System.Process
import System.Exit (exitSuccess)
import System.IO
import Control.Concurrent
import System.Random
import System.Random.Shuffle (shuffle')
import Pokedex (primeiroGinasio, segundoGinasio, terceiroGinasio)
import Structs

show_gym :: Gym -> String -> IO Gym
show_gym gym a 
    | a == "" = do
        system "clear"
        putStr "Ginásio Selecionado: "
        hFlush stdout
        putStrLn (name gym) 
        putStrLn "\n\tPokemons adversários:"
        mapM_ putStrLn [". " ++ nome ++ "\tTipo 1: " ++ show primeiroTipo ++ "\tTipo 2: " ++ show segundoTipo ++ "\tHP: " ++ show hp ++ "\tAtaque: " ++ show ataque | (i, Pokemon nome primeiroTipo segundoTipo hp ataque) <- zip [1..] (pokemons gym)]
        putStrLn "\n[1] Desafiar\n[2] Voltar"
        putStr "\n>> "
        hFlush stdout
        input <- getLine
        show_gym gym input
    | a == "1" = return gym
    | a == "2" = do 
        new_gym <- list_gym ""
        show_gym new_gym ""     
    | otherwise = do 
        putStrLn "Opção inválida. Por favor, tente novamente."
        threadDelay 2500000
        show_gym gym ""
 
list_gym :: String -> IO Gym
list_gym "" = 
    do
        system "clear"
        putStrLn "[x] Sair\t\tGinásios:\n"
        putStrLn "[1] Ginásio Pewter\n\tDificuldade:\ESC[92m Fácil\ESC[0m\n"
        putStrLn "[2] Ginásio Cerulean\n\tDificuldade:\ESC[93m Médio\ESC[0m\n"
        putStrLn "[3] Ginásio Vermilion\n\tDificuldade:\ESC[91m Dificil\ESC[0m" 
        putStr "\n>> "
        hFlush stdout 
        input <- getLine
        list_gym input

list_gym i
    | i == "x" || i == "X" = exitSuccess
    | i == "1" = generate_gym primeiroGinasio
    | i == "2" = generate_gym segundoGinasio
    | i == "3" = generate_gym terceiroGinasio
    | otherwise = do
        putStrLn "Opção inválida. Por favor, tente novamente."
        threadDelay 2500000
        list_gym "" 

randomUnique :: RandomGen g => Int -> Int -> Int -> g -> [Int]
randomUnique n min max gen = do
    let allValues = [min..max]
    let shuffledValues = shuffle' allValues (length allValues) gen
    take n shuffledValues

generate_gym :: Gym -> IO Gym
generate_gym gym = do
    randomNum <- newStdGen
    let indices = randomUnique 3 0 (length (pokemons gym) - 1)  randomNum
    print indices
    --let indices = take 3 $ randomRs (0, (length (pokemons gym)) - 1) randomNum
    let gymPokemons = map ((pokemons gym)!!) indices
    let updatedGym = gym { pokemons = gymPokemons }
    return updatedGym

pre_battle = do
    gym <- list_gym ""
    show_gym gym "" 
