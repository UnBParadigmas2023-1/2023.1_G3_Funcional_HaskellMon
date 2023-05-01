import System.IO

-- Definindo o tipo Pokemon
data Pokemon = Pokemon { nome :: String
                       , vida :: Int
                       , ataque :: Int
                       } deriving (Show)

-- Criando os pokémons
pikachu :: Pokemon
pikachu = Pokemon { nome = "Pikachu", vida = 100, ataque = 50 }

charmander :: Pokemon
charmander = Pokemon { nome = "Charmander", vida = 80, ataque = 70 }

squirtle :: Pokemon
squirtle = Pokemon { nome = "Squirtle", vida = 120, ataque = 40 }

bulbasaur :: Pokemon
bulbasaur = Pokemon { nome = "Bulbasaur", vida = 90, ataque = 60 }

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

-- Função ataque
funcaoAtaque :: Pokemon -> Pokemon -> Int -> IO Pokemon
funcaoAtaque pokemonAtacante pokemonAlvo ataqueEscolhido
    | ataqueEscolhido >= 1 && ataqueEscolhido <= 3 = do
        let valorAtaque = ataque pokemonAtacante * ataqueEscolhido -- Random adicionar 
        let novaVida = vida pokemonAlvo - valorAtaque
        putStrLn $ nome pokemonAtacante ++ " inflingiu " ++ show valorAtaque ++ " de dano e deixou " ++ nome pokemonAlvo ++ " com " ++ show novaVida ++ " pontos de vida."
        hFlush stdout
        return Pokemon { nome = nome pokemonAlvo, vida = novaVida, ataque = ataque pokemonAlvo }
    | otherwise = do
        putStrLn "Opção inválida!"
        hFlush stdout
        funcaoAtaque pokemonAtacante pokemonAlvo ataqueEscolhido

-- Função para excluir pokemon de uma lista
excluirPokemon :: String -> [Pokemon] -> IO [Pokemon]
excluirPokemon nomePokemon listaPokemons = return $ filter (\pokemon -> nome pokemon /= nomePokemon) listaPokemons

-- Função para simular uma batalha entre dois pokémons
batalhar :: Pokemon -> Pokemon -> [Pokemon] -> [Pokemon] -> IO ()
batalhar p1 p2 reservasTreinador reservasGinasio
    | vida p1 <= 0 = do 
        putStrLn $ "Seu pokemon " ++ nome p1 ++ " foi derrotado!"
        hFlush stdout
        if null reservasTreinador then do
            putStrLn $ "Você perdeu :'("
            hFlush stdout
        else do
            pokemonEscolhido <- escolherPokemon reservasTreinador
            novaReservasTreinador <- excluirPokemon (nome pokemonEscolhido) reservasTreinador
            batalhar pokemonEscolhido p2 novaReservasTreinador reservasGinasio
    | vida p2 <= 0 = do
        putStrLn $ "O pokemon " ++ nome p2 ++ " do ginásio foi derrotado!"
        hFlush stdout
        if null reservasGinasio then do
            putStrLn $ "Você ganhou! Parabains! **clap clap**"
            hFlush stdout
        else do
            let pokemonEscolhido = head reservasGinasio
            novaReservasGinasios <- excluirPokemon (nome pokemonEscolhido) reservasGinasio
            batalhar p1 pokemonEscolhido reservasTreinador novaReservasGinasios
    | otherwise = do
        putStrLn "Opções de ataque: 1, 2, 3"
        hFlush stdout

        ataqueEscolhido <- getLine
        let escolhaNum = read ataqueEscolhido

        novoP2 <- funcaoAtaque p1 p2 escolhaNum
        if vida novoP2 > 0 then do
            novoP1 <- funcaoAtaque p2 p1 1
            batalhar novoP1 novoP2 reservasTreinador reservasGinasio
        else do
            batalhar p1 novoP2 reservasTreinador reservasGinasio

        


-- Função principal
main :: IO ()
main = do
    putStrLn "Bem-vindo ao jogo de Pokémon!"
    hFlush stdout

    pokemonEscolhido <- escolherPokemon treinador
    reservasTreinador <- excluirPokemon (nome pokemonEscolhido) treinador

    putStrLn $ "Você escolheu o pokémon: " ++ show pokemonEscolhido
    hFlush stdout

    let pokemonEscolhidoGinasio = head ginasio
    reservasGinasio <- excluirPokemon (nome pokemonEscolhidoGinasio) ginasio

    batalhar pokemonEscolhido pokemonEscolhidoGinasio reservasTreinador reservasGinasio

