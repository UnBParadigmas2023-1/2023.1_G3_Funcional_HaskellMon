import Hw
import System.Exit (exitSuccess)
import System.IO ( stdout, hFlush )
import System.Process

main :: IO ()
main = do
    
    menu


clearScreen :: IO ()
clearScreen = system "cls" >> return ()

menu :: IO ()
menu = do 
    
    putStrLn "=========================================="
    putStrLn "\tBem-vindo(a) ao HaskellMon"
    putStrLn "=========================================="
    putStrLn " "
    putStrLn "1. Iniciar"
    putStrLn "2. Sair"
    putStr "Escolha uma opcao: "
    
    hFlush stdout -- limpa o buffer de saída
    choice <- getLine -- lê a escolha do usuário
    case choice of
        "1" -> do
            putStrLn "Iniciando HaskellMon..."
            
        "2" -> do
            putStrLn "Tchau!"
            exitSuccess
        _   -> do
            clearScreen
            putStrLn "Escolha inválida, digite novamente"
            menu
