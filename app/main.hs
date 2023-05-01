import System.IO

-- Definindo o tipo Pokemon
data Pokemon = Pokemon { vida :: Int
                       , ataque :: Int
                       } deriving (Show)

-- Criando os pokémons
pikachu :: Pokemon
pikachu = Pokemon { vida = 100, ataque = 50 }

charmander :: Pokemon
charmander = Pokemon { vida = 80, ataque = 70 }

squirtle :: Pokemon
squirtle = Pokemon { vida = 120, ataque = 40 }

bulbasaur :: Pokemon
bulbasaur = Pokemon { vida = 90, ataque = 60 }

-- Criando as listas de pokémons
treinador :: [Pokemon]
treinador = [pikachu, charmander, squirtle]

ginasio :: [Pokemon]
ginasio = [bulbasaur, charmander, pikachu]

-- Função para exibir uma lista numerada de pokémons
exibirPokemons :: [Pokemon] -> IO ()
exibirPokemons pokemons = mapM_ putStrLn [show i ++ ". " ++ show p | (i, p) <- zip [1..] pokemons]

-- Função para escolher um pokémon a partir de uma lista
escolherPokemon :: [Pokemon] -> IO Pokemon
escolherPokemon pokemons = do
  putStrLn "Escolha um pokémon:"
  hFlush stdout
  exibirPokemons pokemons
  hFlush stdout
  escolha <- getLine
  let escolhaNum = read escolha
  if escolhaNum > 0 && escolhaNum <= length pokemons
    then return $ pokemons !! (escolhaNum - 1)
    else do
      putStrLn "Escolha inválida!"
      hFlush stdout
      escolherPokemon pokemons

-- Função para simular uma batalha entre dois pokémons
batalhar :: Pokemon -> Pokemon -> IO ()
batalhar p1 p2
  | vida p2 <= 0 = putStrLn $ show p2 ++ " foi derrotado!"
  | otherwise = do
      let dano = ataque p1
      putStrLn $ show p1 ++ " atacou " ++ show p2 ++ " causando " ++ show dano ++ " de dano!"
      hFlush stdout
      let p2' = p2 { vida = vida p2 - dano }
      batalhar p2' p1

-- Função principal
main :: IO ()
main = do
  putStrLn "Bem-vindo ao jogo de Pokémon!"
  hFlush stdout
  pokemonEscolhido <- escolherPokemon treinador
  putStrLn $ "Você escolheu o pokémon: " ++ show pokemonEscolhido
  hFlush stdout
  batalhar pokemonEscolhido (head ginasio)
