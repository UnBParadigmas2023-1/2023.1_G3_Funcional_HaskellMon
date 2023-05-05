module Pokedex (listaPokemons, primeiroGinasio, segundoGinasio, terceiroGinasio, treinador) where

import Structs

-- listaPokemons
listaPokemons :: [Pokemon] = [
    Pokemon "Bulbasaur" 3 7 450 65,
    Pokemon "Ivysaur" 3 7 600 80,
    Pokemon "Venusaur" 3 7 800 100,
    Pokemon "Charmander" 1 180 39 52,
    Pokemon "Charmeleon" 1 180 58 64,
    Pokemon "Charizard" 1 9 780 104,
    Pokemon "Squirtle" 2 18 440 48,
    Pokemon "Wartortle" 2 18 590 63,
    Pokemon "Blastoise" 2 18 790 103,
    Pokemon "Caterpie" 11 18 450 30,
    Pokemon "Metapod" 11 18 500 20,
    Pokemon "Butterfree" 11 90 600 45,
    Pokemon "Weedle" 11 7 400 35,
    Pokemon "Kakuna" 11 7 450 25,
    Pokemon "Beedrill" 11 7 650 90,
    Pokemon "Rattata" 0 18 300 56,
    Pokemon "Raticate" 0 18 550 81,
    Pokemon "Spearow" 0 9 400 60,
    Pokemon "Fearow" 0 9 650 90,
    Pokemon "Ekans" 7 18 350 60,
    Pokemon "Arbok" 7 18 600 85,
    Pokemon "Pikachu" 4 18 350 55,
    Pokemon "Raichu" 4 18 600 90,
    Pokemon "Sandshrew" 8 18 500 75,
    Pokemon "Sandslash" 8 18 750 100,
    Pokemon "Nidoran♀" 7 18 550 47,
    Pokemon "Nidorina" 7 18 700 62,
    Pokemon "Nidoqueen" 7 8 900 92,
    Pokemon "Nidoran♂" 7 18 460 57,
    Pokemon "Nidorino" 7 18 610 72,
    Pokemon "Nidoking" 7 8 810 102,
    Pokemon "Clefairy" 17 18 700 45,
    Pokemon "Clefable" 17 18 950 70,
    Pokemon "Vulpix" 1 18 380 41,
    Pokemon "Ninetales" 1 18 730 76,
    Pokemon "Jigglypuff" 0 17 500 45,
    Pokemon "Wigglytuff" 0 17 900 70,
    Pokemon "Zubat" 7 9 400 45,
    Pokemon "Venonat" 11 7 600 55,
    Pokemon "Venomoth" 11 7 700 90,
    Pokemon "Diglett" 8 18 100 55,
    Pokemon "Dugtrio" 8 18 350 80,
    Pokemon "Meowth" 0 18 400 45,
    Pokemon "Persian" 0 18 650 70,
    Pokemon "Psyduck" 2 18 500 65,
    Pokemon "Golduck" 2 18 800 95,
    Pokemon "Mankey" 6 18 400 80,
    Pokemon "Primeape" 6 18 650 105,
    Pokemon "Growlithe" 1 18 550 70,
    Pokemon "Arcanine" 1 18 900 110,
    Pokemon "Poliwag" 2 18 400 50,
    Pokemon "Poliwhirl" 2 18 650 65,
    Pokemon "Poliwrath" 2 6 900 85,
    Pokemon "Abra" 10 18 250 105,
    Pokemon "Kadabra" 10 18 400 120,
    Pokemon "Alakazam" 10 18 550 135,
    Pokemon "Machop" 6 18 700 80,
    Pokemon "Machoke" 6 18 800 100,
    Pokemon "Machamp" 6 18 900 130,
    Pokemon "Bellsprout" 3 7 500 75,
    Pokemon "Weepinbell" 3 7 650 90,
    Pokemon "Victreebel" 3 7 800 105,
    Pokemon "Tentacool" 2 7 400 50,
    Pokemon "Tentacruel" 2 7 800 80,
    Pokemon "Geodude" 12 8 400 80,
    Pokemon "Graveler" 12 8 550 95,
    Pokemon "Golem" 12 8 800 110,
    Pokemon "Ponyta" 1 18 500 85,
    Pokemon "Rapidash" 1 18 650 100,
    Pokemon "Slowpoke" 2 10 900 65,
    Pokemon "Slowbro" 2 10 950 100,
    Pokemon "Magnemite" 4 16 250 95,
    Pokemon "Magnetom" 4 16 500 120,
    Pokemon "Farfetch'd" 0 9 520 65,
    Pokemon "Doduo" 0 9 350 85,
    Pokemon "Dodrio" 0 9 600 110,
    Pokemon "Seel" 2 18 650 55,
    Pokemon "Dewgong" 2 5 900 70,
    Pokemon "Grimer" 7 18 800 80,
    Pokemon "Muk" 7 18 1050 105,
    Pokemon "Shellder" 2 18 300 65,
    Pokemon "Cloyster" 2 5 500 95,
    Pokemon "Gastly" 13 7 300 100,
    Pokemon "Haunter" 13 7 450 115,
    Pokemon "Gengar" 13 7 600 130,
    Pokemon "Onix" 12 8 350 45,
    Pokemon "Drowzee" 10 18 600 48,
    Pokemon "Hypno" 10 18 850 73,
    Pokemon "Krabby" 2 18 300 105,
    Pokemon "Kingler" 2 18 550 130,
    Pokemon "Voltorb" 4 18 400 55,
    Pokemon "Electrode" 4 18 500 80,
    Pokemon "Exeggcute" 3 10 600 60,
    Pokemon "Exeggutor" 3 10 950 125,
    Pokemon "Cubone" 8 18 500 50,
    Pokemon "Marowak" 8 18 600 80,
    Pokemon "Hitmonlee" 6 18 500 120,
    Pokemon "Hitmonchan" 6 18 500 105,
    Pokemon "Lickitung" 0 18 900 55,
    Pokemon "Koffing" 7 18 400 65,
    Pokemon "Weezing" 7 18 650 90,
    Pokemon "Rhyhorn" 8 12 800 85,
    Pokemon "Rhydon" 8 12 1050 130,
    Pokemon "Chansey" 0 18 2500 5,
    Pokemon "Tangela" 3 18 650 100,
    Pokemon "Kangaskhan" 0 18 1050 95,
    Pokemon "Horsea" 2 18 300 70,
    Pokemon "Seadra" 2 18 550 95,
    Pokemon "Goldeen" 2 18 450 67,
    Pokemon "Seaking" 2 18 800 92,
    Pokemon "Staryu" 2 18 300 70,
    Pokemon "Starmie" 2 10 600 100,
    Pokemon "Mr. Mime" 10 17 400 100,
    Pokemon "Scyther" 11 9 700 110,
    Pokemon "Jynx" 5 10 650 115,
    Pokemon "Electabuzz" 4 18 650 95,
    Pokemon "Magmar" 1 18 650 100,
    Pokemon "Pinsir" 11 18 650 125,
    Pokemon "Tauros" 0 18 750 100,
    Pokemon "Magikarp" 2 18 200 15,
    Pokemon "Gyarados" 2 9 950 125,
    Pokemon "Lapras" 2 5 1300 85,
    Pokemon "Ditto" 0 18 480 48,
    Pokemon "Eevee" 0 18 550 55,
    Pokemon "Vaporeon" 2 18 1300 110,
    Pokemon "Jolteon" 4 18 650 110,
    Pokemon "Flareon" 1 18 650 130,
    Pokemon "Porygon" 0 18 650 85,
    Pokemon "Omanyte" 12 2 350 90,
    Pokemon "Omastar" 12 2 700 115,
    Pokemon "Kabuto" 12 2 300 80,
    Pokemon "Kabutops" 12 2 600 115,
    Pokemon "Aerodactyl" 12 9 800 105,
    Pokemon "Snorlax" 0 18 1600 110,
    Pokemon "Articuno" 5 9 900 95,
    Pokemon "Zapdos" 4 9 900 125,
    Pokemon "Moltres" 1 9 900 125,
    Pokemon "Dratini" 14 18 1000 64,
    Pokemon "Dragonair" 14 18 610 84,
    Pokemon "Dragonite" 14 9 910 134,
    Pokemon "Mewtwo" 10 18 1060 154,
    Pokemon "Mew" 10 18 2000 100]

pokedex = listaPokemons


-- listaPokemonsPrimario
listaPokemonsPrimario :: [Pokemon] = [
    Pokemon "Bulbasaur" 3 7 450 65,
    Pokemon "Charmander" 1 18 39 52,
    Pokemon "Squirtle" 2 18 44 48,
    Pokemon "Caterpie" 11 18 45 30,
    Pokemon "Weedle" 11 7 40 35,
    Pokemon "Rattata" 0 18 30 56,
    Pokemon "Spearow" 0 9 40 60,
    Pokemon "Ekans" 7 18 35 60,
    Pokemon "Pikachu" 4 18 35 55,
    Pokemon "Sandshrew" 8 18 50 75,
    Pokemon "Nidoran♀" 7 18 55 47,
    Pokemon "Nidoran♂" 7 18 46 57,
    Pokemon "Clefairy" 17 18 70 45,
    Pokemon "Vulpix" 1 18 38 41,
    Pokemon "Jigglypuff" 0 17 115 45,
    Pokemon "Zubat" 7 9 40 45,
    Pokemon "Oddish" 3 7 45 75,
    Pokemon "Paras" 11 3 35 70,
    Pokemon "Venonat" 11 7 60 55,
    Pokemon "Diglett" 8 18 10 55,
    Pokemon "Meowth" 0 18 40 45,
    Pokemon "Psyduck" 2 18 50 65,
    Pokemon "Mankey" 6 18 40 80,
    Pokemon "Growlithe" 1 18 55 70,
    Pokemon "Poliwag" 2 18 40 50,
    Pokemon "Abra" 10 18 25 105,
    Pokemon "Machop" 6 18 70 80,
    Pokemon "Bellsprout" 3 7 50 75,
    Pokemon "Tentacool" 2 7 40 50,
    Pokemon "Geodude" 12 8 40 80,
    Pokemon "Ponyta" 1 18 50 85,
    Pokemon "Slowpoke" 2 10 90 65,
    Pokemon "Magnemite" 4 16 25 95,
    Pokemon "Farfetch'd" 0 9 52 65,
    Pokemon "Doduo" 0 9 35 85,
    Pokemon "Seel" 2 18 65 55,
    Pokemon "Grimer" 7 18 80 80,
    Pokemon "Shellder" 2 18 30 65,
    Pokemon "Gastly" 13 7 30 100,
    Pokemon "Onix" 12 8 35 45,
    Pokemon "Drowzee" 10 18 60 48,
    Pokemon "Krabby" 2 18 30 105, 
    Pokemon "Voltorb" 4 18 40 55,
    Pokemon "Exeggcute" 3 10 60 60,
    Pokemon "Cubone" 8 18 50 50,
    Pokemon "Hitmonlee" 6 18 50 120,
    Pokemon "Hitmonchan" 6 18 50 105,
    Pokemon "Lickitung" 0 18 90 55,
    Pokemon "Koffing" 7 18 40 65,
    Pokemon "Rhyhorn" 8 12 80 85,
    Pokemon "Chansey" 0 18 250 5,
    Pokemon "Tangela" 3 18 65 100,
    Pokemon "Kangaskhan" 0 18 105 95,
    Pokemon "Horsea" 2 18 30 70,
    Pokemon "Goldeen" 2 18 45 67,
    Pokemon "Staryu" 2 18 30 70,
    Pokemon "Mr. Mime" 10 17 40 100,
    Pokemon "Scyther" 11 9 70 110,
    Pokemon "Jynx" 5 10 65 115,
    Pokemon "Electabuzz" 4 18 65 95,
    Pokemon "Magmar" 1 18 65 100,
    Pokemon "Pinsir" 11 18 65 125,
    Pokemon "Tauros" 0 18 75 100,
    Pokemon "Magikarp" 2 18 20 15,
    Pokemon "Lapras" 2 5 130 85,
    Pokemon "Ditto" 0 18 48 48,
    Pokemon "Eevee" 0 18 55 55,
    Pokemon "Porygon" 0 18 65 85,
    Pokemon "Omanyte" 12 2 35 90,
    Pokemon "Kabuto" 12 2 30 80,
    Pokemon "Aerodactyl" 12 9 80 105,
    Pokemon "Snorlax" 0 18 160 110,
    Pokemon "Dratini" 14 18 41 64]

-- listaPokemonsSecundario
listaPokemonsSecundario :: [Pokemon] = [
    Pokemon "Ivysaur" 3 7 600 80,
    Pokemon "Charmeleon" 1 18 58 64,
    Pokemon "Wartortle" 2 18 59 63,
    Pokemon "Metapod" 11 18 50 20,
    Pokemon "Kakuna" 11 7 45 25,
    Pokemon "Raticate" 0 18 55 81,
    Pokemon "Fearow" 0 9 65 90,
    Pokemon "Arbok" 7 18 60 85,
    Pokemon "Raichu" 4 18 60 90,
    Pokemon "Sandslash" 8 18 75 100,
    Pokemon "Nidorina" 7 18 70 62,
    Pokemon "Nidorino" 7 18 61 72,
    Pokemon "Clefable" 17 18 95 70,
    Pokemon "Ninetales" 1 18 73 76,
    Pokemon "Wigglytuff" 0 17 140 70,
    Pokemon "Golbat" 7 9 75 80,
    Pokemon "Gloom" 3 7 60 85,
    Pokemon "Parasect" 11 3 60 95,
    Pokemon "Venomoth" 11 7 70 90,
    Pokemon "Dugtrio" 8 18 35 80,
    Pokemon "Persian" 0 18 65 70,
    Pokemon "Golduck" 2 18 80 95,
    Pokemon "Primeape" 6 18 65 105,
    Pokemon "Arcanine" 1 18 90 110,
    Pokemon "Poliwhirl" 2 18 65 65,
    Pokemon "Kadabra" 10 18 40 120,
    Pokemon "Machoke" 6 18 80 100,
    Pokemon "Weepinbell" 3 7 65 90,
    Pokemon "Tentacruel" 2 7 80 80,
    Pokemon "Graveler" 12 8 55 95,
    Pokemon "Rapidash" 1 18 65 100,
    Pokemon "Slowbro" 2 10 95 100,
    Pokemon "Magnetom" 4 16 50 120,
    Pokemon "Dodrio" 0 9 60 110,
    Pokemon "Dewgong" 2 5 90 70,
    Pokemon "Muk" 7 18 105 105,
    Pokemon "Cloyster" 2 5 50 95,
    Pokemon "Haunter" 13 7 45 115,
    Pokemon "Hypno" 10 18 85 73,
    Pokemon "Kingler" 2 18 55 130,
    Pokemon "Electrode" 4 18 50 80,
    Pokemon "Exeggutor" 3 10 95 125,
    Pokemon "Marowak" 8 18 60 80,
    Pokemon "Weezing" 7 18 65 90,
    Pokemon "Rhydon" 8 12 105 130,
    Pokemon "Seadra" 2 18 55 95,
    Pokemon "Seaking" 2 18 80 92,
    Pokemon "Starmie" 2 10 60 100,
    Pokemon "Gyarados" 2 9 95 125,
    Pokemon "Vaporeon" 2 18 130 110,
    Pokemon "Jolteon" 4 18 65 110,
    Pokemon "Flareon" 1 18 65 130,
    Pokemon "Omastar" 12 2 70 115,
    Pokemon "Kabutops" 12 2 60 115,
    Pokemon "Dragonair" 14 18 61 84]

-- listaPokemonsTerciario
listaPokemonsTerciario :: [Pokemon] = [
    Pokemon "Venusaur" 3 7 800 100,
    Pokemon "Charizard" 1 9 78 104,
    Pokemon "Blastoise" 2 18 79 103,
    Pokemon "Butterfree" 11 9 60 45,
    Pokemon "Beedrill" 11 7 65 90,  
    Pokemon "Nidoqueen" 7 8 90 92,
    Pokemon "Nidoking" 7 8 81 102,
    Pokemon "Vileplume" 3 7 75 100,
    Pokemon "Poliwrath" 2 6 90 85,
    Pokemon "Alakazam" 10 18 55 135,
    Pokemon "Machamp" 6 18 90 130,
    Pokemon "Victreebel" 3 7 80 105,
    Pokemon "Golem" 12 8 80 110,
    Pokemon "Gengar" 13 7 60 130,
    Pokemon "Dragonite" 14 9 91 134,
    Pokemon "Articuno" 5 9 90 95,
    Pokemon "Zapdos" 4 9 90 125,
    Pokemon "Moltres" 1 9 90 125,
    Pokemon "Mewtwo" 10 18 106 154,
    Pokemon "Mew" 10 18 100 100]


treinador:: Trainer
treinador = Trainer { nome_treinador = "Treinador", pokes = [listaPokemonsPrimario!!0, listaPokemonsSecundario!!0, listaPokemonsTerciario!!0]}

segundoGinasio:: Gym
segundoGinasio = Gym { name = "Cerulean", pokemons = filter(\p -> pontosDeVida p + ataque p > 120 && pontosDeVida p + ataque p < 170) pokedex }

terceiroGinasio:: Gym
terceiroGinasio = Gym { name = "Vermilion", pokemons = filter(\p -> pontosDeVida p + ataque p >= 170) pokedex }

primeiroGinasio :: Gym
primeiroGinasio = Gym { name = "Pewter", pokemons = filter(\p -> pontosDeVida p + ataque p <= 120) pokedex }

