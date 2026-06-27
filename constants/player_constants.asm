DEF NUM_PLAYER_NAMES EQU 3

IF DEF(_RED)
DEF PLAYERNAME1 EQUS "Red"
DEF PLAYERNAME2 EQUS "Ash"
DEF PLAYERNAME3 EQUS "Merriam" ; Sunsette: third name fixed across versions

DEF RIVALNAME1 EQUS "Blue"
DEF RIVALNAME2 EQUS "Gary"
DEF RIVALNAME3 EQUS "Webster" ; Sunsette: third name fixed across versions
ENDC

IF DEF(_BLUE)
DEF PLAYERNAME1 EQUS "Blue"
DEF PLAYERNAME2 EQUS "Gary"
DEF PLAYERNAME3 EQUS "Merriam" ; Sunsette: third name fixed across versions

DEF RIVALNAME1 EQUS "Red"
DEF RIVALNAME2 EQUS "Ash"
DEF RIVALNAME3 EQUS "Webster" ; Sunsette: third name fixed across versions
ENDC

IF DEF(_GREEN) ; PureRGBnote: GREENBUILD: default names specific to pokemon green
DEF PLAYERNAME1 EQUS "Green"
DEF PLAYERNAME2 EQUS "Ash"
DEF PLAYERNAME3 EQUS "Merriam" ; Sunsette: third name fixed across versions

DEF RIVALNAME1 EQUS "Blue"
DEF RIVALNAME2 EQUS "Gary"
DEF RIVALNAME3 EQUS "Webster" ; Sunsette: third name fixed across versions
ENDC
