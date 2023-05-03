import Hw
import System.Exit (exitSuccess)
import System.IO

main = do
    putStrLn "Welcome to HaskellMon"
    menu

menu = do 
    putStrLn "1. Start"
    putStrLn "2. Quit"
    putStr "Please choose an option: "
    hFlush stdout -- limpa o buffer de saída
    choice <- getLine -- lê a escolha do usuário
    case choice of
        "1" -> do
            putStrLn "Starting HaskellMon..."
            -- aqui você pode colocar o código que inicia o jogo
        "2" -> do
            putStrLn "Goodbye!"
            exitSuccess
        _   -> do
            putStrLn "Invalid choice. Please choose again."
            menu
