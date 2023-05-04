import Hw
import System.Exit (exitSuccess)
import System.IO ( stdout, hFlush )
import System.Process
import Control.Concurrent

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
    | i == "1" = putStrLn "Iniciando HakellMon..."
    | i == "2" = do 
         putStrLn " 0/ Tchau!"
         exitSuccess
    | otherwise = do
         putStrLn "Escolha inválida, digite novamente"
         threadDelay 2500000
         menu ""


