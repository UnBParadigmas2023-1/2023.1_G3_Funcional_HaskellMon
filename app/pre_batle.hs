module Pre_batle where

import System.Process

list_gym =
    do
        system "clear"
        putStrLn "\t\tGinásios\n\n"
        putStrLn "[1] Ginásio foo\n\tDificuldade: Fácil\n"
        putStrLn "[2] Ginásio bar\n\tDificuldade: Médio\n"
        putStrLn "[3] Ginásio xpto\n\tDificuldade: Dificil\n"

pre_batle = list_gym
