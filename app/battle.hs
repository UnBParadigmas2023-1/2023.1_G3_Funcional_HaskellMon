module Battle (iniciaBatalha) where 
import System.Process
import System.IO
import Data.Time
import Data.Time.Clock.POSIX (utcTimeToPOSIXSeconds)
import Structs
import Control.Concurrent

-- Função para exibir uma lista numerada de pokémons
exibirPokemons :: [Pokemon] -> IO ()
exibirPokemons pokemons = mapM_ putStrLn [show i ++ ". " ++ show p | (i, p) <- zip [1..] pokemons]

-- Função para escolher um pokémon a partir de uma lista
escolherPokemon :: [Pokemon] -> IO Pokemon
escolherPokemon pokemons = do
  exibirPokemons pokemons
  putStr "\nEscolha um pokémon: "
  hFlush stdout
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
            putStrLn $ nome pokemonAtacante ++ " inflingiu \ESC[91m" ++ show valorAtaque ++ "\ESC[0m de dano e deixou " ++ nome pokemonAlvo ++ " com \ESC[92m" ++ show novaVida ++ "\ESC[0m pontos de pontosDeVida."
            hFlush stdout       
            return Pokemon { primeiroTipo = primeiroTipo pokemonAlvo, segundoTipo = segundoTipo pokemonAlvo, nome = nome pokemonAlvo, pontosDeVida = novaVida, ataque = ataque pokemonAlvo }
        else do
            let currentTimeInSeconds = (round . utcTimeToPOSIXSeconds <$> getCurrentTime) :: IO Int
            currentTimeMod2 <- (`mod` 2) <$> currentTimeInSeconds
            if currentTimeMod2 == 0 then do
                let valorAtaque = ataque pokemonAtacante * 2
                let novaVida = pontosDeVida pokemonAlvo - valorAtaque
                putStrLn $ nome pokemonAtacante ++ " inflingiu \ESC[91m" ++ show valorAtaque ++ "\ESC[0m de dano e deixou " ++ nome pokemonAlvo ++ " com \ESC[92m" ++ show novaVida ++ "\ESC[0m pontos de pontosDeVida."
                hFlush stdout
                return Pokemon { primeiroTipo = primeiroTipo pokemonAlvo, segundoTipo = segundoTipo pokemonAlvo, nome = nome pokemonAlvo, pontosDeVida = novaVida, ataque = ataque pokemonAlvo }
            else do
                putStrLn $ "\ESC[91m" ++ nome pokemonAtacante ++ " ataca, porém o seu oponente desviou do ataque PODEROSO!!\ESC[0m"
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
        putStrLn $ "\ESC[91mSeu pokemon " ++ nome p1 ++ " foi derrotado!\ESC[0m"
        hFlush stdout
        threadDelay 3000000

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
        putStrLn $ "\ESC[92mO pokemon " ++ nome p2 ++ " do ginásio foi derrotado!\ESC[0m"
        hFlush stdout
        threadDelay 3000000

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
        system "clear"
        let ptsHpPoke = pontosDeVida p1
        let ptsHpAd = pontosDeVida p2
        putStrLn $ "Seu pokemon: " ++ nome p1 ++ " -> HP: \ESC[92m" ++ show ptsHpPoke ++ "\ESC[0m"
        putStrLn $ "Adversário: " ++ nome p2 ++ " -> HP: \ESC[93m" ++ show ptsHpAd ++ "\ESC[0m\n"
        putStrLn "\n[1] - Ataque normal: Um ataque rápido e certeiro"
        putStrLn "[2] - Ataque especial: Um ataque poderoso, porém lento, o oponente pode desviar!"
        putStr "\n>> "
        hFlush stdout

        ataqueEscolhido <- getLine
        let escolhaNum = read ataqueEscolhido

        novoP2 <- funcaoAtaque p1 p2 escolhaNum
        if pontosDeVida novoP2 > 0 then do
            novoP1 <- funcaoAtaque p2 p1 1
            threadDelay 3000000
            batalhar novoP1 novoP2 reservasTreinador reservasGinasio
        else do
            batalhar p1 novoP2 reservasTreinador reservasGinasio

        
-- Função errou ataque
errouAtaque :: IO()
errouAtaque = do
    putStrLn"\ESC[91m       ERROU! O ATAQUE      \ESC[0m\n"
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠀⣤⡀⠀⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣆⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠸⣷⣮⣿⣿⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀"
    putStrLn"⠀⠀⠀⠀⢀⡠⠒⠉⠀⠀⠀⠀⠀⠀⠈⠁⠲⢖⠒⡀⠀  "
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
    putStrLn"⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀\n"
    hFlush stdout

mensagemVitoria :: IO()
mensagemVitoria = do
    system "clear"
    putStrLn "\n ██╗   ██╗██╗████████╗ ██████╗ ██████╗ ██╗ █████╗ "
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
    system "clear"
    putStrLn "\n ██████╗ ███████╗██████╗ ██████╗  ██████╗ ████████╗ █████╗ "
    putStrLn " ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗ "
    putStrLn " ██║  ██║█████╗  ██████╔╝██████╔╝██║   ██║   ██║   ███████║ "
    putStrLn " ██║  ██║██╔══╝  ██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══██║ "
    putStrLn " ██████╔╝███████╗██║  ██║██║  ██║╚██████╔╝   ██║   ██║  ██║"
    putStrLn " ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝ "
    putStrLn " "
    hFlush stdout


iniciaBatalha :: [Pokemon] -> [Pokemon] -> IO Bool
iniciaBatalha treinador ginasio = do 
    system "clear"
    putStrLn "\nBem-vindo à batalha de Pokémon! :O"
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
