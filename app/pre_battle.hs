module Pre_battle where
import System.Process
import System.IO
import Control.Concurrent
import System.Random
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
        mapM_ putStrLn [show i ++ ". " ++ nome ++ "\tTipo 1: " ++ show primeiroTipo ++ "\tTipo 2: " ++ show segundoTipo ++ "\tHP: " ++ show hp ++ "\tAtaque: " ++ show ataque | (i, Pokemon _ nome primeiroTipo segundoTipo hp ataque) <- zip [1..] (pokemons gym)]
        putStrLn "\n[1] Desafiar\n[2] Voltar"
        putStrLn "\n>> "
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
        putStrLn "\t\tGinásios"
        putStrLn "[1] Ginásio Pewter\n\tDificuldade: Fácil\n"
        putStrLn "[2] Ginásio Cerulean\n\tDificuldade: Médio\n"
        putStrLn "[3] Ginásio Vermilion\n\tDificuldade: Dificil" 
        putStr "\n>> "
        hFlush stdout 
        input <- getLine
        list_gym input

list_gym i
    | i == "1" = generate_gym primeiroGinasio
    | i == "2" = generate_gym segundoGinasio
    | i == "3" = generate_gym terceiroGinasio
    | otherwise = do
        putStrLn "Opção inválida. Por favor, tente novamente."
        threadDelay 2500000
        list_gym "" 

generate_gym :: Gym -> IO Gym
generate_gym gym = do
    randomNum <- getStdGen
    let indices = take 3 $ randomRs (0, length (pokemons gym) - 1) randomNum
    let gymPokemons = map ((pokemons gym)!!) indices
    let updatedGym = gym { pokemons = gymPokemons }
    return updatedGym

pre_battle = do
    gym <- list_gym ""
    show_gym gym "" 
