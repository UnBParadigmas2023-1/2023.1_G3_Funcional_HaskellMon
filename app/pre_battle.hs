module Pre_battle where
import System.Process
import System.IO
import Control.Concurrent
import System.Random

import Pokedex (primeiroGinasio, segundoGinasio, terceiroGinasio)
import Structs


-- random_id :: Int
-- random_id = randomRIO (0::Int, 150::Int) :: Int


list_gym :: String -> IO Gym
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
    | i == "x" || i == "X" = generate_gym primeiroGinasio
    | i == "1" = generate_gym primeiroGinasio
    | i == "2" = generate_gym segundoGinasio
    | i == "3" = generate_gym terceiroGinasio
    | otherwise = do
        putStrLn "Opção inválida. Por favor, tente novamente."
        threadDelay 2500000
        list_gym "" 


-- generate_gym :: IO Gym
-- generate_gym = do
--     let gym = Gym { name = "foo", pokemons = [] }
--     add_pokemon gym

generate_gym:: [Pokemon] -> IO Gym
generate_gym selected_gym = do
    let gym = Gym { name = "foo", pokemons = [] }
    add_pokemon gym selected_gym


add_pokemon :: Gym -> [Pokemon] -> IO Gym
add_pokemon gym selected_gym = do
    randomNum <- getStdGen
    let indices = take 3 $ randomRs (0, length selected_gym - 1) randomNum
    let gymPokemons = map (selected_gym!!) indices
    let updatedGym = gym { pokemons = gymPokemons }
    return updatedGym


{-generate_gym 2 = do
    id <- random_id
    gym = Gym "bar" [pokedex!!id ]
    return gym
    
generate_gym 3 = do    
    id <- random_id
    gym::Gym = Gym  "xpto" [pokedex!!id ]
    return gym-}



pre_battle = list_gym ""
