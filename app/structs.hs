module Structs where

data Pokemon = Pokemon {
  id :: Int,
  nome :: String,
  primeiroTipo :: Int,
  segundoTipo :: Int,
  pontosDeVida :: Int,
  ataque :: Int
}

data Gym = Gym { 
  name :: String, 
  pokemons :: [Pokemon]
}
