module Pokedex (listaPokemons) where

import Structs

-- module Pokedex where1

-- data Pokemon = Pokemon {
--   id :: Int,
--   nome :: String,
--   primeiroTipo :: Int,
--   segundoTipo :: Int,
--   pontosDeVida :: Int,
--   ataque :: Int
-- }

-- listaPokemons
listaPokemons ::[Pokemon]= [
    Pokemon 1 "Bulbasaur" 3 7 45 65,
    Pokemon 2 "Ivysaur" 3 7 60 80,
    Pokemon 3 "Venusaur" 3 7 80 100,
    Pokemon 4 "Charmander" 1 18 39 52,
    Pokemon 5 "Charmeleon" 1 18 58 64,
    Pokemon 6 "Charizard" 1 9 78 104,
    Pokemon 7 "Squirtle" 2 18 44 48,
    Pokemon 8 "Wartortle" 2 18 59 63,
    Pokemon 9 "Blastoise" 2 18 79 103,
    Pokemon 10 "Caterpie" 11 18 45 30,
    Pokemon 11 "Metapod" 11 18 50 20,
    Pokemon 12 "Butterfree" 11 9 60 45,
    Pokemon 13 "Weedle" 11 7 40 35,
    Pokemon 14 "Kakuna" 11 7 45 25,
    Pokemon 15 "Beedrill" 11 7 65 90,
    Pokemon 19 "Rattata" 0 18 30 56,
    Pokemon 20 "Raticate" 0 18 55 81,
    Pokemon 21 "Spearow" 0 9 40 60,
    Pokemon 22 "Fearow" 0 9 65 90,
    Pokemon 23 "Ekans" 7 18 35 60,
    Pokemon 24 "Arbok" 7 18 60 85,
    Pokemon 25 "Pikachu" 4 18 35 55,
    Pokemon 26 "Raichu" 4 18 60 90,
    Pokemon 27 "Sandshrew" 8 18 50 75,
    Pokemon 28 "Sandslash" 8 18 75 100,
    Pokemon 29 "Nidoran♀" 7 18 55 47,
    Pokemon 30 "Nidorina" 7 18 70 62,
    Pokemon 31 "Nidoqueen" 7 8 90 92,
    Pokemon 32 "Nidoran♂" 7 18 46 57,
    Pokemon 33 "Nidorino" 7 18 61 72,
    Pokemon 34 "Nidoking" 7 8 81 102,
    Pokemon 35 "Clefairy" 17 18 70 45,
    Pokemon 36 "Clefable" 17 18 95 70,
    Pokemon 37 "Vulpix" 1 18 38 41,
    Pokemon 38 "Ninetales" 1 18 73 76,
    Pokemon 39 "Jigglypuff" 0 17 115 45,
    Pokemon 40 "Wigglytuff" 0 17 140 70,
    Pokemon 41 "Zubat" 7 9 40 45,
    Pokemon 48 "Venonat" 11 7 60 55,
    Pokemon 49 "Venomoth" 11 7 70 90,
    Pokemon 50 "Diglett" 8 18 10 55,
    Pokemon 51 "Dugtrio" 8 18 35 80,
    Pokemon 52 "Meowth" 0 18 40 45,
    Pokemon 53 "Persian" 0 18 65 70,
    Pokemon 54 "Psyduck" 2 18 50 65,
    Pokemon 55 "Golduck" 2 18 80 95,
    Pokemon 56 "Mankey" 6 18 40 80,
    Pokemon 57 "Primeape" 6 18 65 105,
    Pokemon 58 "Growlithe" 1 18 55 70,
    Pokemon 59 "Arcanine" 1 18 90 110,
    Pokemon 60 "Poliwag" 2 18 40 50,
    Pokemon 61 "Poliwhirl" 2 18 65 65,
    Pokemon 62 "Poliwrath" 2 6 90 85,
    Pokemon 63 "Abra" 10 18 25 105,
    Pokemon 64 "Kadabra" 10 18 40 120,
    Pokemon 65 "Alakazam" 10 18 55 135,
    Pokemon 66 "Machop" 6 18 70 80,
    Pokemon 67 "Machoke" 6 18 80 100,
    Pokemon 68 "Machamp" 6 18 90 130,
    Pokemon 69 "Bellsprout" 3 7 50 75,
    Pokemon 70 "Weepinbell" 3 7 65 90,
    Pokemon 71 "Victreebel" 3 7 80 105,
    Pokemon 72 "Tentacool" 2 7 40 50,
    Pokemon 73 "Tentacruel" 2 7 80 80,
    Pokemon 74 "Geodude" 12 8 40 80,
    Pokemon 75 "Graveler" 12 8 55 95,
    Pokemon 76 "Golem" 12 8 80 110,
    Pokemon 77 "Ponyta" 1 18 50 85,
    Pokemon 78 "Rapidash" 1 18 65 100,
    Pokemon 79 "Slowpoke" 2 10 90 65,
    Pokemon 80 "Slowbro" 2 10 95 100,
    Pokemon 81 "Magnemite" 4 16 25 95,
    Pokemon 82 "Magnetom" 4 16 50 120,
    Pokemon 83 "Farfetch'd" 0 9 52 65,
    Pokemon 84 "Doduo" 0 9 35 85,
    Pokemon 85 "Dodrio" 0 9 60 110,
    Pokemon 86 "Seel" 2 18 65 55,
    Pokemon 87 "Dewgong" 2 5 90 70,
    Pokemon 88 "Grimer" 7 18 80 80,
    Pokemon 89 "Muk" 7 18 105 105,
    Pokemon 90 "Shellder" 2 18 30 65,
    Pokemon 91 "Cloyster" 2 5 50 95,
    Pokemon 92 "Gastly" 13 7 30 100,
    Pokemon 93 "Haunter" 13 7 45 115,
    Pokemon 94 "Gengar" 13 7 60 130,
    Pokemon 95 "Onix" 12 8 35 45,
    Pokemon 96 "Drowzee" 10 18 60 48,
    Pokemon 97 "Hypno" 10 18 85 73,
    Pokemon 98 "Krabby" 2 18 30 105,
    Pokemon 99 "Kingler" 2 18 55 130,
    Pokemon 100 "Voltorb" 4 18 40 55,
    Pokemon 101 "Electrode" 4 18 50 80,
    Pokemon 102 "Exeggcute" 3 10 60 60,
    Pokemon 103 "Exeggutor" 3 10 95 125,
    Pokemon 104 "Cubone" 8 18 50 50,
    Pokemon 105 "Marowak" 8 18 60 80,
    Pokemon 106 "Hitmonlee" 6 18 50 120,
    Pokemon 107 "Hitmonchan" 6 18 50 105,
    Pokemon 108 "Lickitung" 0 18 90 55,
    Pokemon 109 "Koffing" 7 18 40 65,
    Pokemon 110 "Weezing" 7 18 65 90,
    Pokemon 111 "Rhyhorn" 8 12 80 85,
    Pokemon 112 "Rhydon" 8 12 105 130,
    Pokemon 113 "Chansey" 0 18 250 5,
    Pokemon 114 "Tangela" 3 18 65 100,
    Pokemon 115 "Kangaskhan" 0 18 105 95,
    Pokemon 116 "Horsea" 2 18 30 70,
    Pokemon 117 "Seadra" 2 18 55 95,
    Pokemon 118 "Goldeen" 2 18 45 67,
    Pokemon 119 "Seaking" 2 18 80 92,
    Pokemon 120 "Staryu" 2 18 30 70,
    Pokemon 121 "Starmie" 2 10 60 100,
    Pokemon 122 "Mr. Mime" 10 17 40 100,
    Pokemon 123 "Scyther" 11 9 70 110,
    Pokemon 124 "Jynx" 5 10 65 115,
    Pokemon 125 "Electabuzz" 4 18 65 95,
    Pokemon 126 "Magmar" 1 18 65 100,
    Pokemon 127 "Pinsir" 11 18 65 125,
    Pokemon 128 "Tauros" 0 18 75 100,
    Pokemon 129 "Magikarp" 2 18 20 15,
    Pokemon 130 "Gyarados" 2 9 95 125,
    Pokemon 131 "Lapras" 2 5 130 85,
    Pokemon 132 "Ditto" 0 18 48 48,
    Pokemon 133 "Eevee" 0 18 55 55,
    Pokemon 134 "Vaporeon" 2 18 130 110,
    Pokemon 135 "Jolteon" 4 18 65 110,
    Pokemon 136 "Flareon" 1 18 65 130,
    Pokemon 137 "Porygon" 0 18 65 85,
    Pokemon 138 "Omanyte" 12 2 35 90,
    Pokemon 139 "Omastar" 12 2 70 115,
    Pokemon 140 "Kabuto" 12 2 30 80,
    Pokemon 141 "Kabutops" 12 2 60 115,
    Pokemon 142 "Aerodactyl" 12 9 80 105,
    Pokemon 143 "Snorlax" 0 18 160 110,
    Pokemon 144 "Articuno" 5 9 90 95,
    Pokemon 145 "Zapdos" 4 9 90 125,
    Pokemon 146 "Moltres" 1 9 90 125,
    Pokemon 147 "Dratini" 14 18 41 64,
    Pokemon 148 "Dragonair" 14 18 61 84,
    Pokemon 149 "Dragonite" 14 9 91 134,
    Pokemon 150 "Mewtwo" 10 18 106 154,
    Pokemon 151 "Mew" 10 18 100 100]

pokedex=listaPokemons


ginasio = filter(\p -> pontosDeVida p + ataque p > 100) listaPokemons





-- pokedex = lista


{- bulbasaur = Pokemon 1 "Bulbasaur" 3 7 45 65
ivysaur = Pokemon 2 "Ivysaur" 3 7 60 80
venusaur = Pokemon 3 "Venusaur" 3 7 80 100
charmander = Pokemon 4 "Charmander" 1 18 39 52
charmeleon = Pokemon 5 "Charmeleon" 1 18 58 64
charizard = Pokemon 6 "Charizard" 1 9 78 104
squirtle = Pokemon 7 "Squirtle" 2 18 44 48
wartortle = Pokemon 8 "Wartortle" 2 18 59 63
blastoise = Pokemon 9 "Blastoise" 2 18 79 103
caterpie = Pokemon 10 "Caterpie" 11 18 45 30
metapod = Pokemon 11 "Metapod" 11 18 50 20
butterfree = Pokemon 12 "Butterfree" 11 9 60 45
weedle = Pokemon 13 "Weedle" 11 7 40 35
kakuna = Pokemon 14 "Kakuna" 11 7 45 25
beedrill = Pokemon 15 "Beedrill" 11 7 65 90
rattata = Pokemon 19 "Rattata"  0 18 30 56
raticate = Pokemon 20 "Raticate"  0 18 55 81
spearow = Pokemon 21 "Spearow" 0 9 40 60
fearow = Pokemon 22 "Fearow"  0 9 65 90
ekans = Pokemon 23 "Ekans" 7 18 35 60
arbok = Pokemon 24 "Arbok" 7 18 60 85
pikachu = Pokemon 25 "Pikachu" 4 18 35 55
raichu = Pokemon 26 "Raichu" 4 18 60 90
sandshrew = Pokemon 27 "Sandshrew" 8 18 50 75
sandslash = Pokemon 28 "Sandslash" 8 18 75 100
nidoranF = Pokemon 29 "Nidoran♀" 7 18 55 47
nidorina = Pokemon 30 "Nidorina" 7 18 70 62
nidoqueen = Pokemon 31 "Nidoqueen" 7 8 90 92
nidoranM = Pokemon 32 "Nidoran♂" 7 18 46 57
nidorino = Pokemon 33 "Nidorino" 7 18 61 72
nidoking = Pokemon 34 "Nidoking" 7 8 81 102
clefairy = Pokemon 35 "Clefairy" 17 18 70 45
clefable = Pokemon 36 "Clefable" 17 18 95 70
vulpix = Pokemon 37 "Vulpix" 1 18 38 41
ninetales = Pokemon 38 "Ninetales" 1 18 73 76
jigglypuff = Pokemon 39 "Jigglypuff" 0 17 115 45
wigglytuff = Pokemon 40 "Wigglytuff" 0 17 140 70
zubat = Pokemon 41 "Zubat" 7 9 40 45
golbat = Pokemon 42 "Golbat" 7 9 75 80
oddish = Pokemon 43 "Oddish" 3 7 45 75
gloom = Pokemon 44 "Gloom" 3 7 60 85 
vileplume = Pokemon 45 "Vileplume" 3 7 75 100
paras = Pokemon 46 "Paras" 11 3 35 70
parasect = Pokemon 47 "Parasect" 11 3 60 95
venonat = Pokemon 48 "Venonat" 11 7 60 55
venomoth = Pokemon 49 "Venomoth" 11 7 70 90
diglett = Pokemon 50 "Diglett" 8 18 10 55
dugtrio = Pokemon 51 "Dugtrio" 8 18 35 80
meowth = Pokemon 52 "Meowth" 0 18 40 45
persian = Pokemon 53 -- #endregion
"Machop" 6 18 70 80
machoke = Pokemon 67 "Machoke" 6 18 80 100
machamp = Pokemon 68 "Machamp" 6 18 90 130
bellsprout = Pokemon 69 "Bellsprout" 3 7 50 75
weepinbell = Pokemon 70 "Weepinbell" 3 7 65 90
victreebell = Pokemon 71 "Victreebell" 3 7 80 105
tentatcool = Pokemon 72 "Tentacool" 2 7 40 50
tentacruel = Pokemon 73 "Tentacruel" 2 7 80 80
geodude = Pokemon 74 "Geodude" 12 8 40 80
graveler = Pokemon 75 "Graveler" 12 8 55 95
golem = Pokemon 76 "Golem" 12 8 80 110
ponyta = Pokemon 77 "Ponyta" 1 18 50 85
rapidash = Pokemon 78 "Rapidash" 1 18 65 100
slowpoke = Pokemon 79 "Slowpoke" 2 10 90 65
slowbro = Pokemon 80 "Slowbro" 2 10 95 100
magnemite = Pokemon 81 "Magnemite" 4 16 25 95
magnetom = Pokemon 82 "Magnetom" 4 16 50 120
farfetchd = Pokemon 83 "Farfetch'd" 0 9 52 65
doduo = Pokemon 84 "Doduo" 0 9 35 85
dodrio = Pokemon 85 "Dodrio" 0 9 60 110
seel = Pokemon 86 "Seel" 2 18 65 55
dewgong = Pokemon 87 "Dewgong" 2 5 90 70
grimer = Pokemon 88 "Grimer" 7 18 80 80
muk = Pokemon 89 "Muk" 7 18 105 105
shellder = Pokemon 90 "Shellder" 2 18 30 65
cloyster = Pokemon 91 "Cloyster" 2 5 50 95
gastly = Pokemon 92 "Gastly" 13 7 30 100
haunter = Pokemon 93 "Haunter" 13 7 45 115
gengar = Pokemon 94 "Gengar" 13 7 60 130
onix = Pokemon 95 "Onix" 12 8 35 45
drowzee = Pokemon 96 "Drowzee" 10 18 60 48
hypno = Pokemon 97 "Hypno" 10 18 85 73
krabby = Pokemon 98 "Krabby" 2 18 30 105
kingler = Pokemon 99 "Kingler" 2 18 55 130
voltorb = Pokemon 100 "Voltorb" 4 18 40 55
electrode = Pokemon 101 "Electrode" 4 18 50 80
exeggcute = Pokemon 102 "Exeggcute" 3 10 60 60
exeggutor = Pokemon 103 "Exeggutor" 3 10 95 125
cubone = Pokemon 104 "Cubone" 8 18 50 50
marowak = Pokemon 105 "Marowak" 8 18 60 80
hitmonlee = Pokemon 106 "Hitmonlee" 6 18 50 120
hitmonchan = Pokemon 107 "Hitmonchan" 6 18 50 105
lickitung = Pokemon 108 "Lickitung" 0 18 90 55
koffing = Pokemon 109 "Koffing" 7 18 40 65
weezing = Pokemon 110 "Weezing" 7 18 65 90
rhyhorn = Pokemon 111 "Rhyhorn" 8 12 80 85
rhydon = Pokemon 112 "Rhydon" 8 12 105 130
chansey = Pokemon 113 "Chansey" 0 18 250 5
tangela = Pokemon 114 "Tangela" 3 18 65 100
kangaskhan = Pokemon 115 "Kangaskhan"0 18 105 95
horsea = Pokemon 116 "Horsea" 2 18 30 70
seadra = Pokemon 117 "Seadra" 2 18 55 95
goldeen = Pokemon 118 "Goldeen" 2 18 45 67
seaking = Pokemon 119 "Seaking" 2 18 80 92
staryu = Pokemon 120 "Staryu" 2 18 30 70
starmie = Pokemon 121 "Starmie" 2 10 60 100
mrmime = Pokemon 122 "Mr. Mime" 10 17 40 100
scyther = Pokemon 123 "Scyther" 11 9 70 110
jynx = Pokemon 124 "Jynx" 5 10 65 115
electabuzz = Pokemon 125 "Electabuzz" 4 18 65 95
magmar = Pokemon 126 "Magmar" 1 18 65 100
pinsir = Pokemon 127 "Pinsir" 11 18 65 125
tauros = Pokemon 128 "Tauros" 0 18 75 100
magikarp = Pokemon 129 "Magikarp" 2 18 20 15
gyarados = Pokemon 130 "Gyarados" 2 9 95 125
lapras = Pokemon 131 "Lapras" 2 5 130 85
ditto = Pokemon 132 "Ditto" 0 18 48 48
eevee = Pokemon 133 "Eevee" 0 18 55 55
vaporeon = Pokemon 134 "Vaporeon" 2 18 130 110
jolteon = Pokemon 135 "Jolteon" 4 18 65 110
flareon = Pokemon 136 "Flareon" 1 18 65 130
porygon = Pokemon 137 "Porygon" 0 18 65 85
omanyte = Pokemon 138 "Omanyte" 12 2 35 90
omastar = Pokemon 139 "Omastar" 12 2 70 115
kabuto = Pokemon 140 "Kabuto" 12 2 30 80
kabutops = Pokemon 141 "Kabutops" 12 2 60 115
aerodactyl = Pokemon 142 "Aerodactyl" 12 9 80 105
snorlax = Pokemon 143 "Snorlax" 0 18 160 110
articuno = Pokemon 144 "Articuno" 5 9 90 95
zapdos = Pokemon 145 "Zapdos" 4 9 90 125
moltres = Pokemon 146 "Moltres" 1 9 90 125
dratini = Pokemon 147 "Dratini" 14 18 41 64
dragonair = Pokemon 148 "Dragonair" 14 18 61 84
dragonite = Pokemon 149 "Dragonite" 14 9 91 134
mewtwo = Pokemon 150 "Mewtwo" 10 18 106 154
mew = Pokemon 151 "Mew" 10 18 100 100
-}