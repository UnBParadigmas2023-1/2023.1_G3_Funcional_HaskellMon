import System.Exit (exitSuccess)
import System.IO ( stdout, hFlush )
import System.Process
import Control.Concurrent
import Pre_battle
import Structs
import Pokedex (listaPokemons, treinador)
import Battle (iniciaBatalha)

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
        ginasio <- pre_battle
        batalha <- iniciaBatalha (pokes treinador) (pokemons ginasio)
        putStrLn "Batalha encerrada."
    | i == "2" = do 
        putStrLn " 0/ Tchau!"
        exitSuccess
    | otherwise = do
        putStrLn "Escolha inválida, digite novamente"
        threadDelay 2500000
        menu ""
