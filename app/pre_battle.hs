module Pre_battle where
import System.Process
import System.IO
import Control.Concurrent
import System.Random

import Pokedex
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
    | i == "x" || i == "X" = return (generate_gym 1)
    | i == "1" = return (generate_gym 1)
    | i == "2" = return (generate_gym 1)
    | i == "3" = return (generate_gym 1)
    | otherwise = do
        putStrLn "Opção inválida. Por favor, tente novamente."
        threadDelay 2500000
        list_gym "" 


generate_gym :: Int -> Gym
generate_gym x = do
    -- id <- random_id
    let gym = Gym { name = "foo", pokemons = [listaPokemons!!0] }
    gym
    
{-generate_gym 2 = do
    id <- random_id
    gym = Gym "bar" [pokedex!!id ]
    return gym
    
generate_gym 3 = do    
    id <- random_id
    gym::Gym = Gym  "xpto" [pokedex!!id ]
    return gym-}



pre_battle = list_gym ""
