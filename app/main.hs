import Pre_battle
-- import Pokedex
import Structs
import Pokedex (listaPokemons)

-- module Pokedex where1

-- data Pokemon = Pokemon {
--   id :: Int,
--   nome :: String,
--   primeiroTipo :: Int,
--   segundoTipo :: Int,
--   HP :: Int,
--   ataque :: Int
-- }


exibirPokemons :: [Pokemon] -> IO ()
exibirPokemons pokemons = mapM_ putStrLn [show i ++ ". " ++ nome ++ "\tTipo 1: " ++ show primeiroTipo ++ "\tTipo 2: " ++ show segundoTipo ++ "\tHP: " ++ show hp ++ "\tAtaque: " ++ show ataque | (i, Pokemon _ nome primeiroTipo segundoTipo hp ataque) <- zip [1..] pokemons]

main = do
    aux <- pre_battle
    exibirPokemons (pokemons aux)
    print (name aux)