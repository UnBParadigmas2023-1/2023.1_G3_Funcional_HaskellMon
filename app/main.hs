import System.Exit (exitSuccess)
import System.IO ( stdout, hFlush )
import System.Process
import Control.Concurrent
import Pre_battle
import Structs
import Pokedex (listaPokemons)

exibirPokemons :: [Pokemon] -> IO ()
exibirPokemons pokemons = mapM_ putStrLn [show i ++ ". " ++ nome ++ "\tTipo 1: " ++ show primeiroTipo ++ "\tTipo 2: " ++ show segundoTipo ++ "\tHP: " ++ show hp ++ "\tAtaque: " ++ show ataque | (i, Pokemon _ nome primeiroTipo segundoTipo hp ataque) <- zip [1..] pokemons]

main :: IO ()
main = menu ""

menu :: String -> IO ()
menu "" = do 
    
    system "clear"    
    putStrLn "\n  ██╗  ██╗ █████╗ ███████╗██╗  ██╗███████╗██╗     ██╗     ███╗   ███╗ ██████╗ ███╗   ██╗ "
    putStrLn "  ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██║     ██║     ████╗ ████║██╔═══██╗████╗  ██║ "
    putStrLn "  ███████║███████║███████╗█████╔╝ █████╗  ██║     ██║     ██╔████╔██║██║   ██║██╔██╗ ██║ "
    putStrLn "  ██╔══██║██╔══██║╚════██║██╔═██╗ ██╔══╝  ██║     ██║     ██║╚██╔╝██║██║   ██║██║╚██╗██║ "
    putStrLn "  ██║  ██║██║  ██║███████║██║  ██╗███████╗███████╗███████╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║ "
    putStrLn "  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ \n"
    putStrLn "\t\tBem-vindo(a) ao HaskellMonn\n"
    putStrLn "[1] Iniciar"
    putStrLn "[2] Sair\n"
    putStr ">> "
    
    hFlush stdout -- limpa o buffer de saída
    choice <- getLine -- lê a escolha do usuário
    menu choice

menu i 
    | i == "1" = do
         putStrLn "Iniciando HakellMon..."
         threadDelay 2500000
         aux <- pre_battle
         --exibirPokemons (pokemons aux)
         print (name aux)       
    | i == "2" = do 
         putStrLn " 0/ Tchau!"
         exitSuccess
    | otherwise = do
         putStrLn "Escolha inválida, digite novamente"
         threadDelay 2500000
         menu ""
