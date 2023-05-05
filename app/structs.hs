module Structs where

data Pokemon = Pokemon {
  nome :: String,
  primeiroTipo :: Int,
  segundoTipo :: Int,
  pontosDeVida :: Int,
  ataque :: Int
} deriving Show

data Gym = Gym { 
  name :: String, 
  pokemons :: [Pokemon]
}

data Trainer = Trainer {
  nome_treinador :: String,
  pokes :: [Pokemon]  
}
