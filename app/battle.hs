module Battle (iniciaBatalha) where 

import System.IO
import Data.Time
import Data.Time.Clock.POSIX (utcTimeToPOSIXSeconds)

import Structs

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
    | ataqueEscolhido >= 1 && ataqueEscolhido <= 2 = do
        if ataqueEscolhido == 1 then do
            let valorAtaque = ataque pokemonAtacante * 1
            let novaVida = pontosDeVida pokemonAlvo - valorAtaque
            putStrLn $ nome pokemonAtacante ++ " inflingiu " ++ show valorAtaque ++ " de dano e deixou " ++ nome pokemonAlvo ++ " com " ++ show novaVida ++ " pontos de pontosDeVida."
            hFlush stdout
            return Pokemon { primeiroTipo = primeiroTipo pokemonAlvo, segundoTipo = segundoTipo pokemonAlvo, nome = nome pokemonAlvo, pontosDeVida = novaVida, ataque = ataque pokemonAlvo }
        else do
            let currentTimeInSeconds = (round . utcTimeToPOSIXSeconds <$> getCurrentTime) :: IO Int
            currentTimeMod2 <- (`mod` 2) <$> currentTimeInSeconds
            if currentTimeMod2 == 0 then do
                let valorAtaque = ataque pokemonAtacante * 2
                let novaVida = pontosDeVida pokemonAlvo - valorAtaque
                putStrLn $ nome pokemonAtacante ++ " inflingiu " ++ show valorAtaque ++ " de dano e deixou " ++ nome pokemonAlvo ++ " com " ++ show novaVida ++ " pontos de pontosDeVida."
                hFlush stdout
                return Pokemon { primeiroTipo = primeiroTipo pokemonAlvo, segundoTipo = segundoTipo pokemonAlvo, nome = nome pokemonAlvo, pontosDeVida = novaVida, ataque = ataque pokemonAlvo }
            else do
                putStrLn $ nome pokemonAtacante ++ " ataca, porém o seu oponente desviou do ataque PODEROSO!!"
                hFlush stdout
                errouAtaque
                return pokemonAlvo
        
    | otherwise = do
        putStrLn "Opção inválida!"
        hFlush stdout
        funcaoAtaque pokemonAtacante pokemonAlvo ataqueEscolhido

-- Função para excluir pokemon de uma lista
excluirPokemon :: String -> [Pokemon] -> IO [Pokemon]
excluirPokemon nomePokemon listaPokemons = return $ filter (\pokemon -> nome pokemon /= nomePokemon) listaPokemons

-- Função para simular uma batalha entre dois pokémons
batalhar :: Pokemon -> Pokemon -> [Pokemon] -> [Pokemon] -> IO Bool
batalhar p1 p2 reservasTreinador reservasGinasio
    | pontosDeVida p1 <= 0 = do 
        putStrLn $ "Seu pokemon " ++ nome p1 ++ " foi derrotado!"
        hFlush stdout
        if null reservasTreinador then do
            do
                mensagemDerrota
                hFlush stdout
            return False
        else do
            pokemonEscolhido <- escolherPokemon reservasTreinador
            novaReservasTreinador <- excluirPokemon (nome pokemonEscolhido) reservasTreinador
            batalhar pokemonEscolhido p2 novaReservasTreinador reservasGinasio
    | pontosDeVida p2 <= 0 = do
        putStrLn $ "O pokemon " ++ nome p2 ++ " do ginásio foi derrotado!"
        hFlush stdout
        if null reservasGinasio then do
            do
                mensagemVitoria
                hFlush stdout
            return True
        else do
            let pokemonEscolhido = head reservasGinasio
            novaReservasGinasios <- excluirPokemon (nome pokemonEscolhido) reservasGinasio
            batalhar p1 pokemonEscolhido reservasTreinador novaReservasGinasios
    | otherwise = do
        putStrLn "1 - Ataque normal: Um ataque rápido e certeiro"
        putStrLn "2 - Ataque especial: Um ataque poderoso, porém lento, o oponente pode desviar!"
        hFlush stdout

        ataqueEscolhido <- getLine
        let escolhaNum = read ataqueEscolhido

        novoP2 <- funcaoAtaque p1 p2 escolhaNum
        if pontosDeVida novoP2 > 0 then do
            novoP1 <- funcaoAtaque p2 p1 1
            batalhar novoP1 novoP2 reservasTreinador reservasGinasio
        else do
            batalhar p1 novoP2 reservasTreinador reservasGinasio

        
-- Função errou ataque
errouAtaque :: IO()
errouAtaque = do
    putStrLn"       ERROU! O ATAQUE      "
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⠀⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠸⣷⣮⣿⣿⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn"⠀⠀⠀⠀⢀⡠⠒⠉⠀⠀⠀⠀⠀⠀⠈⠁⠲⢖⠒⡀⠀⠀ "
    putStrLn"⠀⠀⠀⡠⠴⣏⠀⢀⡀⠀⢀⡀⠀⠀⠀⡀⠀⠀⡀⠱⡈⢄⠀"
    putStrLn"⠀⠀⢠⠁⠀⢸⠐⠁⠀⠄⠀⢸⠀⠀⢎⠀⠂⠀⠈⡄⢡⠀⢣"
    putStrLn"⠀⢀⠂⠀⠀⢸⠈⠢⠤⠤⠐⢁⠄⠒⠢⢁⣂⡐⠊⠀⡄⠀⠸"
    putStrLn"⠀⡘⠀⠀⠀⢸⠀⢠⠐⠒⠈⠀⠀⠀⠀⠀⠀⠈⢆⠜⠀⠀⢸"
    putStrLn"⠀⡇⠀⠀⠀⠀⡗⢺⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⡄⢀⠎"
    putStrLn"⠀⢃⠀⠀⠀⢀⠃⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠷⡃⠀"
    putStrLn"⠀⠈⠢⣤⠀⠈⠀⠀⠑⠠⠤⣀⣀⣀⣀⣀⡀⠤⠒⠁⠀⢡⠀"
    putStrLn"⡀⣀⠀⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⠀"
    putStrLn"⠑⢄⠉⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠀"
    putStrLn"⠀⠀⠑⠢⢱⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠁⠀"
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀"
    hFlush stdout

mensagemVitoria :: IO()
mensagemVitoria = do
    putStrLn " ██╗   ██╗██╗████████╗ ██████╗ ██████╗ ██╗ █████╗ "
    putStrLn " ██║   ██║██║╚══██╔══╝██╔═══██╗██╔══██╗██║██╔══██╗ "
    putStrLn " ██║   ██║██║   ██║   ██║   ██║██████╔╝██║███████║ "
    putStrLn " ╚██╗ ██╔╝██║   ██║   ██║   ██║██╔══██╗██║██╔══██║ "
    putStrLn "  ╚████╔╝ ██║   ██║   ╚██████╔╝██║  ██║██║██║  ██║ "
    putStrLn "   ╚═══╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝ "
    putStrLn " "
    putStrLn "                       ⣴⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⢀⣾⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⣾⠿⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                   ⡸⠁⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⡀⢀⠀⠀⠀⠀⠀⠀⢀⠔⠋⠁⠀⠀"
    putStrLn "                  ⢀⠇⠀⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠤⠒⠊⠉⠉⠁⣽⣿⣿⡿⠋⠀⠀⠀⠀⣠⠖⠁⠀⠀⠈⠀⠀"
    putStrLn "                  ⢸⠀⠀⢀⠇⢀⣀⣀⣀⣀⣀⠀⠀⠀⢀⡠⠔⠊⠁⠀⠀⠀⠀⠀⠀⢠⣿⡿⠋⠁⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⡄⠀"
    putStrLn "                  ⢸⣀⠴⠋⠉⠁⠀⠀⠀⠀⠀⠉⠙⠖⠉⠀⠀⠀⠀⠀⠀⠀⠀⣀⠴⠛⠁⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⢠⠀"
    putStrLn "                 ⢀⠞⠁⠀⠀⠀⠀⠀⠀⣾⢙⣶⡄⠀⠀⠰⢤⣠⡤⠤⠔⠒⠂⠉⠀⠀⠀⠀⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀"
    putStrLn "                 ⣮⣞⣹⠀⠀⠀⠀⠀⠀⠙⠿⠿⠃⠀⠀⠀⠀⠈⢳⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠼⠃  "
    putStrLn "                ⢰⠛⠿⠁⣈⣀⣀⣀⣤⠀⠀⠀⢠⠖⠒⠲⡄⠀⠀⠀⡆⠀⠀⠀⠀⠀⠀⠀⢰⠧⠤⠔⠂⠐⠈⠈⠀⠀⠀⣠⠔⠊⠁⠀⠀"
    putStrLn "               ⢠⡟⣇⠀⠉⢿⣿⣿⣿⣿⠀⠀⠀⢯⡐⠲⣠⡇⠀⠀⠀⢳⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠀⠀⠀⣠⠔⠋⠀⠀⠀⠀⠀⠀"
    putStrLn "               ⠸⣦⡟⠀⠀⠈⢿⠟⠛⢻⠀⠀⠀⠀⠙⠚⠋⠀⠀⠀⠀⠀⢇⠀⠀⠀⠀⠀⠀⠀⠘⡄⠀⠀⠀⠔⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                ⠹⣄⠀⠀⠀⠀⠳⣄⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠈⢆⠀⠀⠀⠀⠀⠀⠀⠹⡀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "               ⢀⣀⠬⠷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠚⠃⠢⢄⠀⠈⢣⡀⠀⠀⠀⠀⠀⢀⡽⠀⠀⢸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "              ⣤⠔⠊⠁⠀⠀⠀⠈⠳⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⢿⠁⠀⠀⠀⠈⠀⠀⠘⡿⢆⠀⠀⣠⠔⠉⠀⠀⣀⠜⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "           ⠐⡏⠸⠀⠀⠀⠀⠀⠀⠀⢢⠀⠈⠳⢄⣀⠀⠀⠀⠀⠈⢧⡀⠀⠀⠀⣀⡀⠀⠀⠀⠱⡈⠣⡀⠀⢠⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "             ⠻⠦⢤⣀⠀⠀⠀⠀⠀⠀⢣⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠛⠤⠼⠛⠁⠀⠀⠀⠀⠘⣆⠙⢶⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                   ⠉⠉⠙⠒⠒⠒⠒⢣⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠳⣾⣿⣿⡿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⠀⠀⠀ ⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⠀⠀⠀ ⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⠿⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⠀⠀⠀⠀⠸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⡘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⠀⠀⠀⠀⠀⠱⡀⠀⠀⠀⣀⡤⠔⠲⣶⣆⣀⡀⠀⠐⠤⠤⠔⠒⠉⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⠀⠀⠀⠀⠀⠀⠈⠒⠤⣥⠤⢴⠚⠉⠀⠀⠀⠈⠉⠒⠂⠤⠤⢤⡤⠞⢻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⠀⠀⠀⠀⠀⠀⠀⠀⢹⣾⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⣀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn "                    ⠀⠀⠀⠀⠀⠀⠀⠀⠈⢋⡁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    hFlush stdout

mensagemDerrota :: IO()
mensagemDerrota = do
    putStrLn " ██████╗ ███████╗██████╗ ██████╗  ██████╗ ████████╗ █████╗ "
    putStrLn " ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗ "
    putStrLn " ██║  ██║█████╗  ██████╔╝██████╔╝██║   ██║   ██║   ███████║ "
    putStrLn " ██║  ██║██╔══╝  ██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══██║ "
    putStrLn " ██████╔╝███████╗██║  ██║██║  ██║╚██████╔╝   ██║   ██║  ██║"
    putStrLn " ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝ "
    putStrLn " "
    hFlush stdout


iniciaBatalha :: [Pokemon] -> [Pokemon] -> IO Bool
iniciaBatalha treinador ginasio = do 
    putStrLn "Bem-vindo à batalha de Pokémon! :O"
    putStrLn "                                  ,'\\"
    putStrLn "    _.----.        ____         ,'  _\\   ___    ___     ____"
    putStrLn "_,-'       `.     |    |  /`.   \\,-'    |   \\  /   |   |    \\  |`."
    putStrLn "\\      __    \\    '-.  | /   `.  ___    |    \\/    |   '-.   \\ |  |"
    putStrLn " \\.    \\ \\   |  __  |  |/    ,','_  `.  |          | __  |    \\|  |"
    putStrLn "   \\    \\/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |"
    putStrLn "    \\     ,-'/  /   \\    ,'   | \\/ / ,`.|         /  /   \\  |     |"
    putStrLn "     \\    \\ |   \\_/  |   `-.  \\    `'  /|  |    ||   \\_/  | |\\    |"
    putStrLn "      \\    \\ \\      /       `-.`.___,-' |  |\\  /| \\      /  | |   |"
    putStrLn "       \\    \\ `.__,'|  |`-._    `|      |__| \\/ |  `.__,'|  | |   |"
    putStrLn "        \\_.-'       |__|    `-._ |              '-.|     '-.| |   |"
    putStrLn "                                `'                            '-._|"
    hFlush stdout

    pokemonEscolhido <- escolherPokemon treinador
    reservasTreinador <- excluirPokemon (nome pokemonEscolhido) treinador

    putStrLn $ "Você escolheu o pokémon: " ++ show pokemonEscolhido
    hFlush stdout

    let pokemonEscolhidoGinasio = head ginasio
    reservasGinasio <- excluirPokemon (nome pokemonEscolhidoGinasio) ginasio

    resultadoBatalha <- batalhar pokemonEscolhido pokemonEscolhidoGinasio reservasTreinador reservasGinasio
    return resultadoBatalha