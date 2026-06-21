; PureRGBnote: ADDED: trainers can have custom movesets by specifying that in their party data

	const_def 1
	const CHAMP_ARENA_ERIKA_MOVESET
	const CHAMP_ARENA_BLAINE_MOVESET
	const CHAMP_ARENA_SURGE_MOVESET
	const CHAMP_ARENA_SABRINA_MOVESET
	const CHAMP_ARENA_BRUNO_MOVESET
	const CHAMP_ARENA_MISTY_MOVESET
	const CHAMP_ARENA_LANCE_MOVESET
	const CHAMP_ARENA_KOGA_MOVESET
	const CHAMP_ARENA_LORELEI_MOVESET
	const CHAMP_ARENA_BROCK_MOVESET
	const CHAMP_ARENA_AGATHA_MOVESET
	const CHAMP_ARENA_GYM_GUIDE_MOVESET
	const CHAMP_ARENA_RIVAL1_MOVESET
	const CHAMP_ARENA_RIVAL2_MOVESET
	const CHAMP_ARENA_RIVAL3_MOVESET
	const ELITE_FOUR_LANCE_MOVESET
	const ELITE_FOUR_RIVAL1_MOVESET
	const ELITE_FOUR_RIVAL2_MOVESET
	const ELITE_FOUR_RIVAL3_MOVESET
	const METRONOME_GAMBLER_MOVESET
	const GYM_KOGA_MOVESET ; Sunsette: Fuchsia gym Koga's team relies on SHADOW GAME
	const GYM_GIOVANNI_MOVESET ; Sunsette: Viridian gym Giovanni's earthbound team runs CLAY ARMOR (FISSURE)
	const ELITE_FOUR_LORELEI_MOVESET ; Sunsette: Indigo Lorelei - AURORA MIST + AQUA RING showcase
	const ELITE_FOUR_BRUNO_MOVESET ; Sunsette: Indigo Bruno - CLAY ARMOR (+ METAMORPHIC on Onix) showcase
	const ELITE_FOUR_AGATHA_MOVESET ; Sunsette: Indigo Agatha - CLAY ARMOR / SUPERNOVA / AURORA MIST / AQUA RING spread
; Sunsette: badge-scaled gym leader tier movesets (sets 1-7 per leader). One per tier row in parties.asm.
	const BROCK_T1_SET
	const BROCK_T2_SET
	const BROCK_T3_SET
	const BROCK_T4_SET
	const BROCK_T5_SET
	const BROCK_T6_SET
	const BROCK_T7_SET
	const MISTY_T1_SET
	const MISTY_T2_SET
	const MISTY_T3_SET
	const MISTY_T4_SET
	const MISTY_T5_SET
	const MISTY_T6_SET
	const MISTY_T7_SET
	const SURGE_T1_SET
	const SURGE_T2_SET
	const SURGE_T3_SET
	const SURGE_T4_SET
	const SURGE_T5_SET
	const SURGE_T6_SET
	const SURGE_T7_SET
	const ERIKA_T1_SET
	const ERIKA_T2_SET
	const ERIKA_T3_SET
	const ERIKA_T4_SET
	const ERIKA_T5_SET
	const ERIKA_T6_SET
	const ERIKA_T7_SET
	const KOGA_T1_SET
	const KOGA_T2_SET
	const KOGA_T3_SET
	const KOGA_T4_SET
	const KOGA_T5_SET
	const KOGA_T6_SET
	const KOGA_T7_SET
	const SABRINA_T1_SET
	const SABRINA_T2_SET
	const SABRINA_T3_SET
	const SABRINA_T4_SET
	const SABRINA_T5_SET
	const SABRINA_T6_SET
	const SABRINA_T7_SET
	const BLAINE_T1_SET
	const BLAINE_T2_SET
	const BLAINE_T3_SET
	const BLAINE_T4_SET
	const BLAINE_T5_SET
	const BLAINE_T6_SET
	const BLAINE_T7_SET

SECTION "Custom Movesets", ROMX ; Sunsette: floated out of the full newCode bank into its own section

; input d = which moveset
LoadTrainerMoveSet:
	ld hl, MoveSetMappings
	dec d
	ld a, d
	call GetAddressFromPointerArray
	ld d, h
	ld e, l
	ld a, [wEnemyPartyCount]
	ld b, a
	ld hl, wEnemyMon1Moves
.pokemonLoop
	ld c, NUM_MOVES
	push hl
.moveLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .moveLoop
	pop hl
	dec b
	ret z
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	jr .pokemonLoop

MoveSetMappings:
	dw ChampArenaErikaMoveset
	dw ChampArenaBlaineMoveset
	dw ChampArenaSurgeMoveset
	dw ChampArenaSabrinaMoveset
	dw ChampArenaBrunoMoveset
	dw ChampArenaMistyMoveset
	dw ChampArenaLanceMoveset
	dw ChampArenaKogaMoveset
	dw ChampArenaLoreleiMoveset
	dw ChampArenaBrockMoveset
	dw ChampArenaAgathaMoveset
	dw ChampArenaGymGuideMoveset
	dw ChampArenaRivalMoveset1
	dw ChampArenaRivalMoveset2
	dw ChampArenaRivalMoveset3
	dw EliteFourLanceMoveset
	dw EliteFourRivalMoveset1
	dw EliteFourRivalMoveset2
	dw EliteFourRivalMoveset3
	dw MetronomeGamblerMoveset
	dw GymKogaMoveset
	dw GymGiovanniMoveset
	dw EliteFourLoreleiMoveset
	dw EliteFourBrunoMoveset
	dw EliteFourAgathaMoveset
	dw BrockT1Moveset
	dw BrockT2Moveset
	dw BrockT3Moveset
	dw BrockT4Moveset
	dw BrockT5Moveset
	dw BrockT6Moveset
	dw BrockT7Moveset
	dw MistyT1Moveset
	dw MistyT2Moveset
	dw MistyT3Moveset
	dw MistyT4Moveset
	dw MistyT5Moveset
	dw MistyT6Moveset
	dw MistyT7Moveset
	dw SurgeT1Moveset
	dw SurgeT2Moveset
	dw SurgeT3Moveset
	dw SurgeT4Moveset
	dw SurgeT5Moveset
	dw SurgeT6Moveset
	dw SurgeT7Moveset
	dw ErikaT1Moveset
	dw ErikaT2Moveset
	dw ErikaT3Moveset
	dw ErikaT4Moveset
	dw ErikaT5Moveset
	dw ErikaT6Moveset
	dw ErikaT7Moveset
	dw KogaT1Moveset
	dw KogaT2Moveset
	dw KogaT3Moveset
	dw KogaT4Moveset
	dw KogaT5Moveset
	dw KogaT6Moveset
	dw KogaT7Moveset
	dw SabrinaT1Moveset
	dw SabrinaT2Moveset
	dw SabrinaT3Moveset
	dw SabrinaT4Moveset
	dw SabrinaT5Moveset
	dw SabrinaT6Moveset
	dw SabrinaT7Moveset
	dw BlaineT1Moveset
	dw BlaineT2Moveset
	dw BlaineT3Moveset
	dw BlaineT4Moveset
	dw BlaineT5Moveset
	dw BlaineT6Moveset
	dw BlaineT7Moveset

ChampArenaErikaMoveset:
	; victreebel
	db SLASH
	db EGG_BOMB
	db SUPERNOVA
	db RAZOR_LEAF
	; tangela
	db FLASH
	db SPORE
	db MEGA_DRAIN
	db RAZOR_LEAF
	; chansey
	db SEISMIC_TOSS
	db SOFTBOILED
	db PSYCHIC_M
	db THUNDER
	; pidgeot (Sunsette: was butterfree)
	db BRAVE_BIRD
	db RAZOR_LEAF
	db HURRICANE
	db BLITZ_STRIKE
	; venusaur
	db ADAPTATION
	db VENOM_LASH ; SIPHON_SNAG
	db SOLARBEAM ; SOLARBEAM
	db EARTHQUAKE
	; vileplume
	db SENBONZAKURA
	db EMETIC_PURGE
	db ADAPTATION
	db PSYCHIC_M

; Sunsette: Blaine's rematch showcases SUPERNOVA (SELFDESTRUCT) - for a FIRE user it's a no-recoil nuke that
; sheds its own FIRE type. Given to Ninetales, Volcanic Magmar, and Arcanine.
ChampArenaBlaineMoveset:
	; ninetales
	db FLAMETHROWER
	db SUPERNOVA
	db ILL_WIND
	db MIRAGE
	; electrode (Sunsette: was volcanic magmar)
	db THUNDERBOLT
	db SUPERNOVA
	db THUNDER
	db SWIFT
	; golem (Sunsette: was flareon)
	db ROCK_SLIDE
	db EARTHQUAKE
	db BLAZE_HAMMER
	db METAMORPHIC
	; rapidash
	db MIRAGE
	db HYPER_BEAM
	db METEOR_DRIVE
	db PISTON_KICK
	; arcanine
	db SUPERNOVA
	db FIRE_BLAST
	db MIRAGE
	db SOLARBEAM ; SOLARBEAM
	; moltres
	db FIRE_SPIN
	db BRAVE_BIRD
	db ROOST
	db FIRE_BLAST

ChampArenaSurgeMoveset:
	; electrode
	db SUPERNOVA
	db SWIFT
	db THUNDERBOLT
	db MEGA_DRAIN
	; magneton
	db TRI_ATTACK
	db ILL_WIND
	db CONVERSION
	db THUNDERBOLT
	; pinsir (Sunsette: was electabuzz)
	db EARTHQUAKE
	db COMBOBREAKER
	db EXTERMINATE
	db SWORDS_DANCE
	; hitmonchan (Sunsette: was jolteon)
	db BLAZE_HAMMER
	db FROST_FIST
	db ZAPPERCUT
	db COMBOBREAKER
	; raichu
	db SHELL_GAME
	db SURF
	db THUNDER
	db SWIFT
	; zapdos
	db AIR_DRILL
	db ROOST
	db THUNDER
	db SPIKE_CANNON

ChampArenaSabrinaMoveset:
	; hypno
	db HYPNOSIS
	db PSYCHIC_M
	db FROST_FIST
	db BLAZE_HAMMER
	; ninetales (Sunsette: was mr mime)
	db FLAMETHROWER
	db PHANTASM
	db PSYCHIC_M
	db CONFUSE_RAY
	; golduck
	db HYDRO_PUMP
	db TELEPORT
	db PSYBEAM
	db HI_JUMP_KICK
	; gengar (Sunsette: was alakazam 1)
	db PHANTASM
	db THUNDERBOLT
	db HYPNOSIS
	db SOULSTEALER
	; clefable (Sunsette: was butterfree)
	db PSYCHIC_M
	db TRI_ATTACK
	db ICE_BEAM
	db THUNDERBOLT
	; alakazam 2
	db AURORA_BEAM
	db PSYCHIC_M
	db VOID_MIND
	db RECOVER

ChampArenaBrunoMoveset:
	; hitmonchan
	db MACH_PUNCH
	db MOCKINGBIRD
	db SHADOW_BOX
	db CLAY_ARMOR
	; hitmonlee
	db HI_JUMP_KICK
	db CLAY_ARMOR
	db EARTHQUAKE
	db COMBOBREAKER
	; onix (Hardened Onix - GROUND, so CLAY ARMOR heals)
	db CLAY_ARMOR
	db CRABHAMMER
	db EARTHQUAKE
	db ROCK_SLIDE
	; marowak (GROUND - CLAY ARMOR heals)
	db CLAY_ARMOR
	db BONEMERANG
	db EARTHQUAKE
	db ROCK_SLIDE
	; primeape
	db CLAY_ARMOR
	db MACH_PUNCH
	db ILL_WIND
	db DEMOLISH
	; machamp
	db CLAY_ARMOR
	db MACH_PUNCH
	db SHADOW_BOX
	db EARTHQUAKE

; Sunsette: Misty's all-out offensive water rematch - the Hydro Pumps she warns you about, with AQUA RING
; on her bulky water sustain aces (Staryu, Vaporeon). WIGGLYTUFF stays as her deliberate off-type spoiler.
; Team order: STARYU, SEAKING, SEADRA, WIGGLYTUFF, VAPOREON, STARMIE.
ChampArenaMistyMoveset:
	; gyarados (Sunsette: was staryu)
	db RIPTIDE
	db HYDRO_PUMP
	db THUNDERBOLT
	db AQUA_RING
	; seaking
	db RIPTIDE
	db HYPER_BEAM
	db ICE_BEAM
	db AGILITY
	; seadra
	db HYDRO_PUMP
	db ICE_BEAM
	db AGILITY
	db SURF
	; wigglytuff (off-type spoiler)
	db HYPER_BEAM
	db ICE_BEAM
	db BODY_SLAM
	db RECOVER
	; kingler (Sunsette: was vaporeon)
	db CRABHAMMER
	db SURF
	db EARTHQUAKE
	db SWORDS_DANCE
	; starmie
	db HYDRO_PUMP
	db PSYCHIC_M
	db ICE_BEAM
	db RECOVER

ChampArenaLanceMoveset:
	; gyarados
	db SURF
	db EARTHQUAKE
	db THUNDERBOLT
	db BODY_SLAM
	; dragonair
	db TOXIC
	db ICE_BEAM
	db FLAMETHROWER
	db FLASH
	; seadra
	db WYRM_WRATH
	db RIPTIDE
	db FIRE_BLAST
	db CALM_MIND
	; dragonite 1
	db DEMOLISH
	db ROOST
	db HONE_EDGE
	db HURRICANE
	; aerodactyl
	db ROOST
	db METEOR_DRIVE
	db HURRICANE
	db SWORDS_DANCE
	; dragonite 2
	db HYPER_BEAM
	db THUNDER
	db ROOST
	db WYRM_WRATH

ChampArenaKogaMoveset:
	; tentacruel
	db MEGA_DRAIN
	db VENOM_LASH ; SIPHON_SNAG
	db SHADOW_GAME ; SHADOW GAME (was TOXIC)
	db SURF
	; scyther
	db TWINEEDLE
	db BRAVE_BIRD
	db SLASH
	db ROOST
	; muk
	db ADAPTATION
	db SHADOW_GAME ; SHADOW GAME (was MIASMA)
	db SHADOW_BOX
	db METAMORPHIC
	; parasect
	db SPORE
	db TWINEEDLE
	db SHADOW_GAME ; SHADOW GAME (Parasect is Bug/GHOST -> immune)
	db CRABHAMMER
	; venomoth
	db SLEEP_POWDER
	db SHADOW_GAME ; SHADOW GAME (was MOCKINGBIRD)
	db SLUDGE_BOMB
	db LEECH_LIFE
	; weezing
	db EGG_BOMB
	db SHADOW_GAME ; SHADOW GAME (was MIASMA)
	db ADAPTATION
	db FIRE_BLAST

ChampArenaLoreleiMoveset:
	; dewgong
	db AURORA_MIST
	db BLIZZARD
	db SURF
	db VENOM_LASH ; SIPHON_SNAG
	; slowbro
	db AQUA_RING
	db PSYCHIC_M
	db SURF
	db BLAZE_HAMMER
	; jynx
	db LOVELY_KISS
	db FROST_FIST
	db AURORA_MIST
	db PSYCHIC_M
	; winter dragonair
	db MEGA_DRAIN
	db SURF
	db ICE_BEAM
	db THUNDERBOLT
	; lapras
	db BLIZZARD
	db HYDRO_PUMP
	db SOLARBEAM ; SOLARBEAM
	db AQUA_RING
	; articuno
	db ROOST
	db ICE_BEAM
	db PSYCHIC_M
	db HURRICANE

ChampArenaBrockMoveset:
	; golem
	db ROCK_SLIDE
	db EARTHQUAKE
	db MOCKINGBIRD
	db PISTON_KICK
	; kangaskhan
	db DIZZY_PUNCH
	db MACH_PUNCH
	db BODY_SLAM
	db EARTHQUAKE
	; kabutops
	db TWINEEDLE
	db ROCK_SLIDE
	db LEECH_LIFE
	db SWORDS_DANCE
	; weezing (Sunsette: was omastar)
	db SLUDGE_BOMB
	db TOXIC
	db DISABLE
	db THUNDERBOLT
	; aerodactyl
	db ROOST
	db METEOR_DRIVE
	db HURRICANE
	db SLASH
	; onix
	db SHELL_GAME
	db SUPERNOVA
	db EARTHQUAKE
	db SPIKE_CANNON

; Sunsette: Brock badge-tier movesets. ROCK ON (his handout TM) rides the rock anchor; Koffing/Weezing
; wall with Disable (Koffing never Toxic). From T4 (L30+) the anchors favor the slightly-inaccurate but
; harder-hitting METEOR DRIVE (80% / 100 BP) over ROCK SLIDE - ROCK ON's +1 ACCURACY shores it up once the
; anchor is desperate (stage 1+), and its +2 DEFENSE / brace / heal make a low-HP Onix a real comeback wall.
; T1/T2 partials pad unused slots with NO_MOVE.
BrockT1Moveset: ; Geodude, Koffing, Onix
	db HARDEN, TACKLE, NO_MOVE, NO_MOVE
	db SMOG, DISABLE, TACKLE, NO_MOVE
	db ROCK_ON, WRAP, HARDEN, NO_MOVE
BrockT2Moveset: ; Graveler, Koffing, Onix
	db ROCK_THROW, DEMOLISH, ROCK_ON, NO_MOVE
	db ACID, SMOG, DISABLE, NO_MOVE
	db ROCK_THROW, ROCK_ON, WRAP, NO_MOVE
BrockT3Moveset: ; Graveler, Sandslash, Koffing, Onix
	db ROCK_SLIDE, DEMOLISH, EARTHQUAKE, ROCK_ON
	db EARTHQUAKE, ROCK_SLIDE, SLASH, SWORDS_DANCE
	db SLUDGE_BOMB, SMOG, DISABLE, SMOKESCREEN
	db ROCK_SLIDE, ROCK_ON, WRAP, EARTHQUAKE
BrockT4Moveset: ; Golem, Rhydon, Weezing, Onix
	db METEOR_DRIVE, EARTHQUAKE, ROCK_ON, BLAZE_HAMMER
	db EARTHQUAKE, ROCK_SLIDE, PISTON_KICK, ICE_BEAM
	db SLUDGE_BOMB, TOXIC, DISABLE, THUNDERBOLT
	db METEOR_DRIVE, ROCK_ON, EARTHQUAKE, ROCK_SLIDE
BrockT5Moveset: ; Golem, Rhydon, Aerodactyl, Weezing, Onix
	db METEOR_DRIVE, EARTHQUAKE, ROCK_ON, BLAZE_HAMMER
	db EARTHQUAKE, ROCK_SLIDE, PISTON_KICK, ICE_BEAM
	db METEOR_DRIVE, BRAVE_BIRD, EARTHQUAKE, FIRE_BLAST
	db SLUDGE_BOMB, TOXIC, DISABLE, THUNDERBOLT
	db METEOR_DRIVE, ROCK_ON, EARTHQUAKE, ROCK_SLIDE
BrockT6Moveset: ; Golem, Rhydon, Aerodactyl, Kabutops, Weezing, Hardened Onix
	db METEOR_DRIVE, EARTHQUAKE, ROCK_ON, BLAZE_HAMMER
	db EARTHQUAKE, ROCK_SLIDE, PISTON_KICK, ICE_BEAM
	db METEOR_DRIVE, BRAVE_BIRD, EARTHQUAKE, HYPER_BEAM
	db METEOR_DRIVE, LEECH_LIFE, SURF, SWORDS_DANCE
	db SLUDGE_BOMB, TOXIC, DISABLE, THUNDERBOLT
	db METEOR_DRIVE, EARTHQUAKE, ROCK_ON, SURF
BrockT7Moveset: ; Golem, Rhydon, Weezing, Kabutops, Aerodactyl, Hardened Onix
	db METEOR_DRIVE, EARTHQUAKE, ROCK_ON, BLAZE_HAMMER
	db EARTHQUAKE, ROCK_SLIDE, PISTON_KICK, ICE_BEAM
	db SLUDGE_BOMB, TOXIC, DISABLE, THUNDERBOLT
	db METEOR_DRIVE, LEECH_LIFE, SURF, SWORDS_DANCE
	db METEOR_DRIVE, BRAVE_BIRD, EARTHQUAKE, HYPER_BEAM
	db METEOR_DRIVE, EARTHQUAKE, ROCK_ON, SURF

ChampArenaAgathaMoveset:
	; golbat (Poison/Flying)
	db MAXIMIZE
	db SOULSTEALER
	db FLY
	db ROOST
	; mr mime
	db PSYCHIC_M
	db AURORA_MIST
	db TELEPORT
	db FROST_FIST
	; ninetales
	db FLAMETHROWER
	db SUPERNOVA
	db CONFUSE_RAY
	db SOLARBEAM ; SOLARBEAM
	; arbok
	db CLAY_ARMOR
	db LEECH_LIFE
	db SUPER_FANG
	db ACID
	; parasect (Bug/GHOST)
	db SPORE
	db MEGA_DRAIN
	db SHADOW_BALL
	db SLASH
	; gengar
	db SHADOW_BALL
	db FROST_FIST
	db MEGA_DRAIN
	db THUNDERBOLT

ChampArenaGymGuideMoveset:
	; chansey
	db REFLECT
	db SEISMIC_TOSS
	db SOFTBOILED
	db ICE_BEAM
	; snorlax
	db BODY_SLAM
	db BULK_UP
	db REST
	db EARTHQUAKE
	; cloyster
	db SURF ; Sunsette: CLOYSTER cannot learn CRABHAMMER (Krabby/Kingler move); SURF is its learnable Water STAB
	db BLIZZARD
	db SHELL_GAME
	db SPIKE_CANNON ; Sunsette: was GLARE (now EXPLOSION); CLOYSTER's signature spike barrage + Rock coverage
	; alakazam
	db PSYCHIC_M
	db VOID_MIND
	db RECOVER
	db DISABLE
	; tauros
	db SLASH
	db BLIZZARD
	db EARTHQUAKE
	db VENOM_DRILL
	; missingno
	db ROOST
	db HI_JUMP_KICK
	db EARTHQUAKE
	db HYPER_BEAM

ChampArenaRivalMoveset1:
	; gengar (Ghost/Poison)
	db SHADOW_BALL
	db PSYCHIC_M
	db THUNDERBOLT
	db FROST_FIST
	; snorlax (Normal)
	db BODY_SLAM
	db EARTHQUAKE
	db HYPER_BEAM
	db REST
	; kabutops (Rock/Water)
	db EXTERMINATE
	db ROCK_SLIDE
	db SWORDS_DANCE
	db SURF
	; tangela (Grass)
	db HYDRO_PUMP
	db MEGA_DRAIN
	db SHELL_GAME
	db VENOM_LASH
	; electabuzz (Electric)
	db THUNDERBOLT
	db FROST_FIST
	db DIZZY_PUNCH
	db HI_JUMP_KICK
	; charizard
	db ROOST
	db FLAMETHROWER
	db BRAVE_BIRD
	db SUPERNOVA ; SUPERNOVA (FIRE ace: no-recoil nuke)

ChampArenaRivalMoveset2:
	; porygon (Normal)
	db TRI_ATTACK
	db ICE_BEAM
	db THUNDERBOLT
	db SHADOW_BALL
	; floating magneton (Electric)
	db THUNDERBOLT
	db TRI_ATTACK
	db FLASH
	db SWIFT
	; rhydon (Ground/Rock)
	db EARTHQUAKE
	db ROCK_SLIDE
	db ROCK_ON
	db PISTON_KICK
	; exeggutor (Grass/Psychic)
	db PSYCHIC_M
	db SOLARBEAM ; SOLARBEAM
	db SLEEP_POWDER
	db EGG_BOMB
	; arcanine (Fire)
	db FIRE_BLAST
	db BLITZ_STRIKE
	db DIG
	db TWISTER
	; blastoise
	db HYDRO_PUMP
	db SHELL_GAME
	db AQUA_RING ; AQUA RING (WATER ace sustain)
	db ICE_BEAM

ChampArenaRivalMoveset3:
	; fearow (Normal/Flying)
	db AIR_DRILL
	db HYPER_BEAM
	db MOCKINGBIRD
	db SHADOW_BALL
	; kangaskhan (Normal)
	db BODY_SLAM
	db EARTHQUAKE
	db DIZZY_PUNCH
	db MACH_PUNCH
	; golem (Rock/Ground)
	db EARTHQUAKE
	db ROCK_SLIDE
	db BODY_SLAM
	db PISTON_KICK
	; kingler (Water)
	db CRABHAMMER
	db EARTHQUAKE
	db SPIKE_CANNON
	db UNDERBUG
	; rapidash (Fire)
	db FIRE_BLAST
	db PISTON_KICK
	db METEOR_DRIVE
	db PSYCHIC_M
	; venusaur
	db SLEEP_POWDER
	db RAZOR_LEAF
	db SLUDGE_BOMB
	db AQUA_RING ; AQUA RING (GRASS ace sustain)

EliteFourLanceMoveset:
	; gyarados
	db HYPER_BEAM
	db HYDRO_PUMP
	db FLAMETHROWER
	db WYRM_WRATH
	; dragonair
	db HYPER_BEAM
	db WYRM_WRATH
	db TOXIC
	db BODY_SLAM
	; seadra
	db MEGA_DRAIN
	db SHADOW_BALL
	db WYRM_WRATH
	db HYDRO_PUMP
	; dragonite
	db WYRM_WRATH
	db ICE_BEAM
	db THUNDERBOLT
	db FLAMETHROWER
	; aerodactyl
	db SWORDS_DANCE
	db METEOR_DRIVE
	db EARTHQUAKE
	db HURRICANE
	; dragonite
	db HYPER_BEAM
	db HURRICANE
	db ROOST
	db WYRM_WRATH

EliteFourRivalMoveset1:
	; gengar (Ghost/Poison)
	db SHADOW_BALL
	db PSYCHIC_M
	db THUNDERBOLT
	db FROST_FIST
	; snorlax (Normal)
	db BODY_SLAM
	db EARTHQUAKE
	db HYPER_BEAM
	db REST
	; kabutops (Rock/Water)
	db EXTERMINATE
	db ROCK_SLIDE
	db SWORDS_DANCE
	db SURF
	; tangela (Grass)
	db HYDRO_PUMP
	db MEGA_DRAIN
	db SHELL_GAME
	db VENOM_LASH
	; electabuzz (Electric)
	db THUNDERBOLT
	db FROST_FIST
	db DIZZY_PUNCH
	db HI_JUMP_KICK
	; charizard
	db ZAPPERCUT
	db SUPERNOVA ; SUPERNOVA (FIRE ace: no-recoil nuke)
	db FLAMETHROWER
	db BRAVE_BIRD

EliteFourRivalMoveset2:
	; porygon (Normal)
	db TRI_ATTACK
	db ICE_BEAM
	db THUNDERBOLT
	db SHADOW_BALL
	; floating magneton (Electric)
	db THUNDERBOLT
	db TRI_ATTACK
	db FLASH
	db SWIFT
	; rhydon (Ground/Rock)
	db EARTHQUAKE
	db ROCK_SLIDE
	db ROCK_ON
	db PISTON_KICK
	; exeggutor (Grass/Psychic)
	db PSYCHIC_M
	db SOLARBEAM ; SOLARBEAM
	db SLEEP_POWDER
	db EGG_BOMB
	; arcanine (Fire)
	db FIRE_BLAST
	db BLITZ_STRIKE
	db DIG
	db TWISTER
	; blastoise
	db SHELL_GAME
	db AQUA_RING ; AQUA RING (WATER ace sustain)
	db ICE_BEAM
	db HYDRO_PUMP

EliteFourRivalMoveset3:
	; fearow (Normal/Flying)
	db AIR_DRILL
	db HYPER_BEAM
	db MOCKINGBIRD
	db SHADOW_BALL
	; kangaskhan (Normal)
	db BODY_SLAM
	db EARTHQUAKE
	db DIZZY_PUNCH
	db MACH_PUNCH
	; golem (Rock/Ground)
	db EARTHQUAKE
	db ROCK_SLIDE
	db BODY_SLAM
	db PISTON_KICK
	; kingler (Water)
	db CRABHAMMER
	db MUD_BOMB
	db EARTHQUAKE
	db SPIKE_CANNON
	; rapidash (Fire)
	db FIRE_BLAST
	db PISTON_KICK
	db METEOR_DRIVE
	db PSYCHIC_M
	; venusaur
	db RAZOR_LEAF
	db SLEEP_POWDER
	db ADAPTATION
	db AQUA_RING ; AQUA RING (GRASS ace sustain)

MetronomeGamblerMoveset:
	; meowth
	db METRONOME
	db NO_MOVE
	db NO_MOVE
	db NO_MOVE
	; kadabra
	db METRONOME
	db NO_MOVE
	db NO_MOVE
	db NO_MOVE
	; machoke
	db METRONOME
	db NO_MOVE
	db NO_MOVE
	db NO_MOVE

; Sunsette: Fuchsia gym Koga's team leans on SHADOW GAME (his TM). His POISON mons are immune to its toxic
; fog, so they wield it; SCYTHER (Bug/Flying) would poison itself, so it runs its blades instead - showing
; off the immunity. Team order matches KogaData: Tentacruel, Muk, Venomoth, Scyther, Weezing.
GymKogaMoveset:
	; tentacruel
	db SHADOW_GAME
	db SURF
	db VENOM_LASH
	db MEGA_DRAIN
	; muk
	db SHADOW_GAME
	db SLUDGE_BOMB
	db MINIMIZE
	db BODY_SLAM
	; venomoth
	db SHADOW_GAME
	db PSYCHIC_M
	db SLEEP_POWDER
	db STUN_SPORE
	; scyther (not Poison -> can't safely use SHADOW GAME; runs its blades)
	db SLASH
	db WING_ATTACK
	db TWINEEDLE
	db SWORDS_DANCE
	; weezing
	db SHADOW_GAME
	db SLUDGE_BOMB
	db METAMORPHIC
	db FIRE_BLAST

; Sunsette: Viridian gym Giovanni's earthbound team showcases CLAY ARMOR (FISSURE) - his TM. Every GROUND
; mon raises both screens AND heals half its HP off it; the lone airborne DODRIO (Fighting/Flying) can't use
; it, so it runs its own kit. Team order matches GiovanniData's Viridian entry: Kingler, Dodrio, Dugtrio,
; Nidoqueen, Nidoking, Rhydon.
GymGiovanniMoveset:
	; kingler (Water/Ground - Clay Armor heals)
	db CRABHAMMER
	db CLAY_ARMOR
	db SURF
	db EXTERMINATE
	; dodrio (Fighting/Flying - airborne, can't use CLAY ARMOR)
	db AIR_DRILL
	db TRI_ATTACK
	db AGILITY
	db HYPER_BEAM
	; dugtrio (Ground)
	db EARTHQUAKE
	db CLAY_ARMOR
	db ROCK_SLIDE
	db SLASH
	; nidoqueen (Poison/Ground)
	db EARTHQUAKE
	db CLAY_ARMOR
	db ICE_BEAM
	db BODY_SLAM
	; nidoking (Poison/Ground)
	db EARTHQUAKE
	db CLAY_ARMOR
	db THUNDERBOLT
	db BODY_SLAM
	; rhydon (Ground/Rock)
	db EARTHQUAKE
	db CLAY_ARMOR
	db ROCK_SLIDE
	db BODY_SLAM

; Sunsette: Indigo LORELEI - Ice/Water. Showcases AURORA MIST (MIST) on her ICE mons (Dewgong/Jynx/Lapras)
; and AQUA RING (ACID_ARMOR) on her bulky WATER mons (Slowbro/Vaporeon). Order: Dewgong, Cloyster, Slowbro,
; Jynx, Vaporeon, Lapras.
EliteFourLoreleiMoveset:
	; dewgong
	db AURORA_MIST
	db SURF
	db ICE_BEAM
	db REST
	; cloyster
	db SPIKE_CANNON
	db BLIZZARD
	db SURF
	db CLAMP
	; slowbro
	db AQUA_RING
	db PSYCHIC_M
	db SURF
	db CALM_MIND
	; jynx
	db AURORA_MIST
	db ICE_BEAM
	db PSYCHIC_M
	db LOVELY_KISS
	; vaporeon
	db AQUA_RING
	db HYDRO_PUMP
	db ICE_BEAM
	db SURF
	; lapras
	db AURORA_MIST
	db BLIZZARD
	db HYDRO_PUMP
	db BODY_SLAM

; Sunsette: Indigo BRUNO - Fighting. CLAY ARMOR (FISSURE) on every earthbound fighter (screens; ONIX and
; MAROWAK also heal as GROUND types) and METAMORPHIC (EXPLOSION) on ONIX, his lone ROCK mon (sheds ROCK,
; +6 SPEED). Order: Hitmonchan, Hitmonlee, Onix, Marowak, Primeape, Machamp.
EliteFourBrunoMoveset:
	; hitmonchan
	db MACH_PUNCH
	db CLAY_ARMOR
	db FROST_FIST
	db SHADOW_BOX
	; hitmonlee
	db HI_JUMP_KICK
	db CLAY_ARMOR
	db EARTHQUAKE
	db COMBOBREAKER
	; onix
	db METAMORPHIC
	db EARTHQUAKE
	db ROCK_SLIDE
	db CLAY_ARMOR
	; marowak (GROUND - CLAY ARMOR heals)
	db CLAY_ARMOR
	db BONEMERANG
	db EARTHQUAKE
	db ROCK_SLIDE
	; primeape
	db CLAY_ARMOR
	db MACH_PUNCH
	db DEMOLISH
	db SHADOW_BOX
	; machamp
	db COMBOBREAKER
	db MACH_PUNCH
	db EARTHQUAKE
	db CLAY_ARMOR

; Sunsette: Indigo AGATHA - a spread of the new moves across her mixed team: CLAY ARMOR (FISSURE) on Arbok
; (POISON, screens), SUPERNOVA (SELFDESTRUCT) on Ninetales (FIRE, no recoil), AURORA MIST (MIST) on Mr. Mime.
; Golbat is a MAXIMIZE (+6 ATK) sweeper with SOULSTEALER/FLY/ROOST; Parasect (Bug/GHOST) leans into her
; ghost theme with SHADOW BALL. Order: Golbat, Mr. Mime, Ninetales, Arbok, Parasect, Gengar.
EliteFourAgathaMoveset:
	; golbat (Poison/Flying)
	db MAXIMIZE
	db SOULSTEALER
	db FLY
	db ROOST
	; mr mime
	db AURORA_MIST
	db PSYCHIC_M
	db FROST_FIST
	db TELEPORT
	; ninetales
	db FLAMETHROWER
	db SUPERNOVA
	db CONFUSE_RAY
	db SOLARBEAM ; SOLARBEAM
	; arbok
	db CLAY_ARMOR
	db ACID
	db HYPNOSIS ; Sunsette: was GLARE (now EXPLOSION); ARBOK's hypnotic gaze
	db SUPER_FANG
	; parasect (Bug/GHOST)
	db SPORE
	db MEGA_DRAIN
	db SHADOW_BALL
	db SLASH
	; gengar
	db SHADOW_BALL
	db PHANTASM
	db THUNDERBOLT
	db FROST_FIST

SECTION "Gym Tier Movesets", ROMX ; Sunsette: own floating section so 49 badge-tier movesets pack into any bank with room

; ====================================================================================
; Sunsette: badge-scaled gym-leader TIER movesets. Each block's mon order MUST match the
; matching parties.asm $FD row. T1/T2 pad unused slots with NO_MOVE. Renamed-move notes:
; BIDE=BULK UP, ACID_ARMOR=AQUA RING, WATERFALL=RIPTIDE, SELFDESTRUCT=SUPERNOVA, HAZE=SHADOW GAME,
; PSYWAVE=SKITTERMIND, PETAL_DANCE=SENBONZAKURA, NIGHT_SHADE=PHANTASM, CONSTRICT=VENOM LASH,
; SKY_ATTACK=BRAVE BIRD, WHIRLWIND=HURRICANE, THRASH=OUTRAGE, DRAGON_RAGE=WYRM WRATH, SLAM=TWISTER,
; MEGA_KICK=PISTON KICK, SKULL_BASH=METEOR DRIVE, FIRE_PUNCH=BLAZE HAMMER, TAKE_DOWN=HEAT RUSH,
; AMNESIA=CALM MIND, DREAM_EATER=SOULSTEALER, EXPLOSION=METAMORPHIC, QUICK_ATTACK=BLITZ_STRIKE,
; SUBMISSION=FULL NELSON, RAZOR_WIND=ROOST.
; ====================================================================================

MistyT1Moveset: ; Goldeen, Farfetch'd, Staryu
	db SUPER_SOAK, TACKLE, NO_MOVE, NO_MOVE
	db PECK, VINE_WHIP, NO_MOVE, NO_MOVE
	db SUPER_SOAK, AQUA_RING, NO_MOVE, NO_MOVE
MistyT2Moveset: ; Goldeen, Farfetch'd, Starmie
	db WATER_PULSE, METEOR_HORN, TAIL_WHIP, NO_MOVE
	db RAZOR_LEAF, WING_ATTACK, SWORDS_DANCE, NO_MOVE
	db WATER_PULSE, SWIFT, AQUA_RING, NO_MOVE
MistyT3Moveset: ; Seaking, Farfetch'd, Seadra, Starmie
	db RIPTIDE, SURF, ICE_BEAM, BODY_SLAM
	db RAZOR_LEAF, BRAVE_BIRD, SWORDS_DANCE, FLY
	db HYDRO_PUMP, SURF, ICE_BEAM, SMOKESCREEN
	db SURF, PSYCHIC_M, ICE_BEAM, AQUA_RING
MistyT4Moveset: ; Seaking, Farfetch'd, Kingler, Starmie
	db RIPTIDE, SURF, ICE_BEAM, BODY_SLAM
	db RAZOR_LEAF, BRAVE_BIRD, SWORDS_DANCE, FLY
	db CRABHAMMER, SURF, EARTHQUAKE, SWORDS_DANCE
	db SURF, PSYCHIC_M, ICE_BEAM, AQUA_RING
MistyT5Moveset: ; Seaking, Seadra, Wigglytuff, Kingler, Starmie
	db RIPTIDE, SURF, ICE_BEAM, BODY_SLAM
	db HYDRO_PUMP, SURF, ICE_BEAM, SMOKESCREEN
	db BODY_SLAM, ICE_BEAM, THUNDERBOLT, SOFTBOILED
	db CRABHAMMER, SURF, EARTHQUAKE, SWORDS_DANCE
	db SURF, PSYCHIC_M, ICE_BEAM, AQUA_RING
MistyT6Moveset: ; Gyarados, Seaking, Seadra, Wigglytuff, Kingler, Starmie
	db RIPTIDE, HYDRO_PUMP, THUNDERBOLT, AQUA_RING
	db RIPTIDE, SURF, ICE_BEAM, BODY_SLAM
	db HYDRO_PUMP, SURF, ICE_BEAM, SMOKESCREEN
	db BODY_SLAM, ICE_BEAM, THUNDERBOLT, SOFTBOILED
	db CRABHAMMER, SURF, EARTHQUAKE, SWORDS_DANCE
	db SURF, PSYCHIC_M, ICE_BEAM, AQUA_RING
MistyT7Moveset: ; Gyarados, Seaking, Seadra, Wigglytuff, Kingler, Starmie
	db RIPTIDE, HYDRO_PUMP, THUNDERBOLT, AQUA_RING
	db RIPTIDE, SURF, ICE_BEAM, BODY_SLAM
	db HYDRO_PUMP, SURF, ICE_BEAM, SMOKESCREEN
	db BODY_SLAM, ICE_BEAM, THUNDERBOLT, SOFTBOILED
	db CRABHAMMER, SURF, EARTHQUAKE, SWORDS_DANCE
	db SURF, PSYCHIC_M, ICE_BEAM, AQUA_RING

SurgeT1Moveset: ; Voltorb, Machop, Pikachu
	db THUNDERSHOCK, THUNDER_WAVE, NO_MOVE, NO_MOVE
	db DOUBLE_KICK, SEISMIC_TOSS, NO_MOVE, NO_MOVE
	db THUNDERBOLT, THUNDERSHOCK, THUNDER_WAVE, NO_MOVE
SurgeT2Moveset: ; Voltorb, Machop, Raichu
	db SWIFT, THUNDERSHOCK, THUNDER_WAVE, NO_MOVE
	db LOW_KICK, DEMOLISH, SEISMIC_TOSS, NO_MOVE
	db THUNDERBOLT, SWIFT, THUNDER_WAVE, NO_MOVE
SurgeT3Moveset: ; Voltorb, Magnemite, Pinsir, Raichu
	db THUNDERBOLT, SWIFT, THUNDER_WAVE, SUPERNOVA
	db THUNDERBOLT, TRI_ATTACK, THUNDER_WAVE, ILL_WIND
	db EARTHQUAKE, COMBOBREAKER, EXTERMINATE, SWORDS_DANCE
	db THUNDERBOLT, THUNDER, BODY_SLAM, SURF
SurgeT4Moveset: ; Electrode, Magneton, Pinsir, Raichu
	db THUNDERBOLT, THUNDER, SUPERNOVA, THUNDER_WAVE
	db THUNDERBOLT, THUNDER, TRI_ATTACK, THUNDER_WAVE
	db EARTHQUAKE, COMBOBREAKER, EXTERMINATE, SWORDS_DANCE
	db THUNDERBOLT, THUNDER, BODY_SLAM, SURF
SurgeT5Moveset: ; Electrode, Magneton, Pinsir, Jolteon, Raichu
	db THUNDERBOLT, THUNDER, SUPERNOVA, THUNDER_WAVE
	db THUNDERBOLT, THUNDER, TRI_ATTACK, THUNDER_WAVE
	db EARTHQUAKE, COMBOBREAKER, EXTERMINATE, SWORDS_DANCE
	db THUNDERBOLT, THUNDER, PIN_MISSILE, SWIFT
	db THUNDERBOLT, THUNDER, BODY_SLAM, SURF
SurgeT6Moveset: ; Electrode, Floating Magneton, Electabuzz, Jolteon, Pinsir, Raichu
	db THUNDERBOLT, THUNDER, SUPERNOVA, THUNDER_WAVE
	db THUNDERBOLT, THUNDER, TRI_ATTACK, THUNDER_WAVE
	db THUNDERBOLT, ZAPPERCUT, FROST_FIST, SEISMIC_TOSS
	db THUNDERBOLT, THUNDER, PIN_MISSILE, SWIFT
	db EARTHQUAKE, COMBOBREAKER, EXTERMINATE, SWORDS_DANCE
	db THUNDERBOLT, THUNDER, BODY_SLAM, SURF
SurgeT7Moveset: ; Electrode, Floating Magneton, Electabuzz, Pinsir, Hitmonchan, Raichu
	db THUNDERBOLT, THUNDER, SUPERNOVA, THUNDER_WAVE
	db THUNDERBOLT, THUNDER, TRI_ATTACK, THUNDER_WAVE
	db THUNDERBOLT, ZAPPERCUT, FROST_FIST, SEISMIC_TOSS
	db EARTHQUAKE, COMBOBREAKER, EXTERMINATE, SWORDS_DANCE
	db BLAZE_HAMMER, FROST_FIST, ZAPPERCUT, COMBOBREAKER
	db THUNDERBOLT, THUNDER, BODY_SLAM, SURF

; Sunsette: Erika showcases ADAPTATION (her handout TM) on her bulky pivots - Tangela every tier and
; Vileplume from T4 - while her grass OFFENSE scales with level: ABSORB/VINE_WHIP early, MEGA_DRAIN mid,
; RAZOR_LEAF then SOLARBEAM/SENBONZAKURA late. The aces (Victreebel/Venusaur) carry the heavy hitter.
ErikaT1Moveset: ; Bellsprout, Dratini, Tangela
	db VINE_WHIP, POISONPOWDER, NO_MOVE, NO_MOVE
	db WRAP, THUNDER_WAVE, NO_MOVE, NO_MOVE
	db ABSORB, ADAPTATION, WRAP, NO_MOVE
ErikaT2Moveset: ; Weepinbell, Dratini, Tangela
	db MEGA_DRAIN, ACID, SLEEP_POWDER, NO_MOVE
	db WRAP, THUNDER_WAVE, NO_MOVE, NO_MOVE
	db MEGA_DRAIN, ADAPTATION, ABSORB, NO_MOVE
ErikaT3Moveset: ; Weepinbell, Dratini, Gloom, Tangela
	db RAZOR_LEAF, SLUDGE_BOMB, SLEEP_POWDER, STUN_SPORE
	db WYRM_WRATH, TWISTER, BODY_SLAM, THUNDER_WAVE
	db MEGA_DRAIN, SLUDGE_BOMB, SLEEP_POWDER, ACID
	db RAZOR_LEAF, ADAPTATION, MEGA_DRAIN, SURF
ErikaT4Moveset: ; Victreebel, Tangela, Dragonair, Vileplume
	db RAZOR_LEAF, SLUDGE_BOMB, SOLARBEAM, SLEEP_POWDER
	db RAZOR_LEAF, ADAPTATION, MEGA_DRAIN, SURF
	db OUTRAGE, ICE_BEAM, THUNDERBOLT, WYRM_WRATH
	db SLUDGE_BOMB, SENBONZAKURA, ADAPTATION, PHANTASM
ErikaT5Moveset: ; Victreebel, Tangela, Pidgeot, Venusaur, Vileplume
	db RAZOR_LEAF, SLUDGE_BOMB, SOLARBEAM, SLEEP_POWDER
	db RAZOR_LEAF, ADAPTATION, MEGA_DRAIN, SURF
	db BRAVE_BIRD, RAZOR_LEAF, HURRICANE, BLITZ_STRIKE
	db RAZOR_LEAF, SOLARBEAM, SLUDGE_BOMB, EARTHQUAKE
	db SLUDGE_BOMB, SENBONZAKURA, ADAPTATION, PHANTASM
ErikaT6Moveset: ; Victreebel, Tangela, Pidgeot, Butterfree, Venusaur, Vileplume
	db RAZOR_LEAF, SLUDGE_BOMB, SOLARBEAM, SLEEP_POWDER
	db RAZOR_LEAF, ADAPTATION, MEGA_DRAIN, SURF
	db BRAVE_BIRD, RAZOR_LEAF, HURRICANE, BLITZ_STRIKE
	db PSYCHIC_M, SLEEP_POWDER, MEGA_DRAIN, ROOST
	db RAZOR_LEAF, SOLARBEAM, SLUDGE_BOMB, EARTHQUAKE
	db SLUDGE_BOMB, SENBONZAKURA, ADAPTATION, PHANTASM
ErikaT7Moveset: ; Victreebel, Tangela, Pidgeot, Chansey, Venusaur, Vileplume
	db SENBONZAKURA, SLUDGE_BOMB, SOLARBEAM, SLEEP_POWDER
	db RAZOR_LEAF, ADAPTATION, MEGA_DRAIN, SURF
	db BRAVE_BIRD, RAZOR_LEAF, HURRICANE, BLITZ_STRIKE
	db SEISMIC_TOSS, ICE_BEAM, THUNDERBOLT, SOFTBOILED
	db RAZOR_LEAF, SOLARBEAM, SLUDGE_BOMB, EARTHQUAKE
	db SLUDGE_BOMB, SENBONZAKURA, ADAPTATION, PHANTASM

KogaT1Moveset: ; Grimer, Zubat, Koffing
	db SMOG, MINIMIZE, NO_MOVE, NO_MOVE
	db ABSORB, CONFUSE_RAY, NO_MOVE, NO_MOVE
	db SMOG, SHADOW_GAME, DISABLE, NO_MOVE
KogaT2Moveset: ; Grimer, Golbat, Koffing
	db ACID, SHADOW_GAME, MINIMIZE, NO_MOVE
	db WING_ATTACK, BITE, CONFUSE_RAY, NO_MOVE
	db SMOG, SHADOW_GAME, DISABLE, NO_MOVE
KogaT3Moveset: ; Tentacool, Golbat, Venonat, Koffing
	db ACID, WATER_PULSE, SHADOW_GAME, VENOM_LASH
	db LEECH_LIFE, WING_ATTACK, SHADOW_GAME, CONFUSE_RAY
	db PSYBEAM, LEECH_LIFE, SLEEP_POWDER, NO_MOVE
	db SLUDGE_BOMB, SMOG, SHADOW_GAME, DISABLE
KogaT4Moveset: ; Tentacruel, Muk, Scyther, Weezing
	db SURF, SHADOW_GAME, ICE_BEAM, VENOM_LASH
	db SLUDGE_BOMB, SHADOW_GAME, BODY_SLAM, VENOM_LASH
	db SLASH, WING_ATTACK, BRAVE_BIRD, SWORDS_DANCE
	db SLUDGE_BOMB, SHADOW_GAME, DISABLE, FIRE_BLAST
KogaT5Moveset: ; Tentacruel, Muk, Venomoth, Scyther, Weezing
	db SURF, SHADOW_GAME, ICE_BEAM, VENOM_LASH
	db SLUDGE_BOMB, SHADOW_GAME, BODY_SLAM, VENOM_LASH
	db PSYCHIC_M, SLUDGE_BOMB, SLEEP_POWDER, SHADOW_GAME
	db SLASH, WING_ATTACK, BRAVE_BIRD, SWORDS_DANCE
	db SLUDGE_BOMB, SHADOW_GAME, DISABLE, FIRE_BLAST
KogaT6Moveset: ; Tentacruel, Muk, Venomoth, Scyther, Parasect, Weezing
	db SURF, SHADOW_GAME, ICE_BEAM, VENOM_LASH
	db SLUDGE_BOMB, SHADOW_GAME, BODY_SLAM, VENOM_LASH
	db PSYCHIC_M, SLUDGE_BOMB, SLEEP_POWDER, SHADOW_GAME
	db SLASH, WING_ATTACK, BRAVE_BIRD, SWORDS_DANCE
	db SPORE, LEECH_LIFE, PHANTASM, SOLARBEAM
	db SLUDGE_BOMB, SHADOW_GAME, DISABLE, FIRE_BLAST
KogaT7Moveset: ; Tentacruel, Muk, Venomoth, Scyther, Parasect, Floating Weezing
	db SURF, SHADOW_GAME, ICE_BEAM, VENOM_LASH
	db SLUDGE_BOMB, SHADOW_GAME, BODY_SLAM, VENOM_LASH
	db PSYCHIC_M, SLUDGE_BOMB, SLEEP_POWDER, SHADOW_GAME
	db SLASH, WING_ATTACK, BRAVE_BIRD, SWORDS_DANCE
	db SPORE, LEECH_LIFE, PHANTASM, SOLARBEAM
	db SLUDGE_BOMB, SHADOW_GAME, THUNDERBOLT, FIRE_BLAST

SabrinaT1Moveset: ; Abra, Psyduck, Drowzee
	db SEISMIC_TOSS, DISABLE, REFLECT, NO_MOVE
	db SUPER_SOAK, DISABLE, NO_MOVE, NO_MOVE
	db POISON_STING, DISABLE, NO_MOVE, NO_MOVE
SabrinaT2Moveset: ; Kadabra, Psyduck, Hypno
	db PSYBEAM, DISABLE, REFLECT, NO_MOVE
	db CONFUSION, SUPER_SOAK, DISABLE, NO_MOVE
	db CONFUSION, SKITTERMIND, TOXIC, NO_MOVE
SabrinaT3Moveset: ; Kadabra, Golduck, Slowpoke, Hypno
	db PSYBEAM, PSYCHIC_M, RECOVER, DISABLE
	db SURF, PSYCHIC_M, ICE_BEAM, CALM_MIND
	db CONFUSION, SURF, CALM_MIND, NO_MOVE
	db PSYCHIC_M, SKITTERMIND, FROST_FIST, TOXIC
SabrinaT4Moveset: ; Kadabra, Golduck, Mr.Mime, Hypno
	db PSYBEAM, PSYCHIC_M, RECOVER, DISABLE
	db SURF, PSYCHIC_M, ICE_BEAM, CALM_MIND
	db PSYCHIC_M, SKITTERMIND, THUNDERBOLT, PHANTASM
	db PSYCHIC_M, SKITTERMIND, FROST_FIST, TOXIC
SabrinaT5Moveset: ; Alakazam, Golduck, Mr.Mime, Slowbro, Hypno
	db PSYCHIC_M, SKITTERMIND, RECOVER, FROST_FIST
	db SURF, PSYCHIC_M, ICE_BEAM, CALM_MIND
	db PSYCHIC_M, SKITTERMIND, THUNDERBOLT, PHANTASM
	db PSYCHIC_M, SURF, ICE_BEAM, CALM_MIND
	db PSYCHIC_M, SKITTERMIND, FROST_FIST, TOXIC
SabrinaT6Moveset: ; Hypno, Mr.Mime, Golduck, Clefable, Gengar, Alakazam
	db PSYCHIC_M, SKITTERMIND, FROST_FIST, TOXIC
	db PSYCHIC_M, SKITTERMIND, THUNDERBOLT, PHANTASM
	db SURF, PSYCHIC_M, ICE_BEAM, CALM_MIND
	db PSYCHIC_M, TRI_ATTACK, ICE_BEAM, THUNDERBOLT
	db PHANTASM, THUNDERBOLT, HYPNOSIS, SOULSTEALER
	db PSYCHIC_M, SKITTERMIND, RECOVER, FROST_FIST
SabrinaT7Moveset: ; Hypno, Ninetales, Golduck, Gengar, Clefable, Alakazam
	db PSYCHIC_M, SKITTERMIND, FROST_FIST, TOXIC
	db FLAMETHROWER, PHANTASM, PSYCHIC_M, CONFUSE_RAY
	db SURF, PSYCHIC_M, ICE_BEAM, CALM_MIND
	db PHANTASM, THUNDERBOLT, HYPNOSIS, SOULSTEALER
	db PSYCHIC_M, TRI_ATTACK, ICE_BEAM, THUNDERBOLT
	db PSYCHIC_M, SKITTERMIND, RECOVER, FROST_FIST

BlaineT1Moveset: ; Vulpix (throwaway/unreachable T1 stub)
	db EMBER, NO_MOVE, NO_MOVE, NO_MOVE
BlaineT2Moveset: ; Ponyta, Voltorb, Growlithe
	db HEAT_RUSH, CONFUSION, EMBER, NO_MOVE
	db SWIFT, THUNDERSHOCK, THUNDER_WAVE, NO_MOVE
	db SUPERNOVA, HEAT_RUSH, EMBER, NO_MOVE
BlaineT3Moveset: ; Ponyta, Voltorb, Vulpix, Growlithe
	db FIRE_BLAST, FIRE_SPIN, PSYCHIC_M, HEAT_RUSH
	db THUNDERBOLT, SWIFT, SUPERNOVA, THUNDER_WAVE
	db FLAMETHROWER, CONFUSE_RAY, PHANTASM, BLITZ_STRIKE
	db FLAMETHROWER, BODY_SLAM, HEAT_RUSH, BITE
BlaineT4Moveset: ; Rapidash, Electrode, Ninetales, Magmar
	db FIRE_BLAST, PISTON_KICK, METEOR_DRIVE, FIRE_SPIN
	db THUNDERBOLT, SUPERNOVA, THUNDER, SWIFT
	db FLAMETHROWER, SUPERNOVA, PHANTASM, CONFUSE_RAY
	db BLAZE_HAMMER, FIRE_BLAST, PSYCHIC_M, SUPERNOVA
BlaineT5Moveset: ; Rapidash, Electrode, Ninetales, Magmar, Arcanine
	db FIRE_BLAST, PISTON_KICK, METEOR_DRIVE, MIRAGE
	db THUNDERBOLT, SUPERNOVA, THUNDER, SWIFT
	db FLAMETHROWER, SUPERNOVA, PHANTASM, MIRAGE
	db BLAZE_HAMMER, FIRE_BLAST, PSYCHIC_M, SUPERNOVA
	db FLAMETHROWER, FIRE_BLAST, BODY_SLAM, SUPERNOVA
BlaineT6Moveset: ; Ninetales, Magmar, Electrode, Rapidash, Golem, Arcanine
	db FLAMETHROWER, SUPERNOVA, PHANTASM, MIRAGE
	db BLAZE_HAMMER, FIRE_BLAST, PSYCHIC_M, SUPERNOVA
	db THUNDERBOLT, SUPERNOVA, THUNDER, SWIFT
	db FIRE_BLAST, PISTON_KICK, METEOR_DRIVE, MIRAGE
	db ROCK_SLIDE, EARTHQUAKE, BLAZE_HAMMER, METAMORPHIC
	db FLAMETHROWER, FIRE_BLAST, BODY_SLAM, SUPERNOVA
BlaineT7Moveset: ; Ninetales, Magmar, Electrode, Rapidash, Golem, Arcanine
	db FLAMETHROWER, SUPERNOVA, PHANTASM, MIRAGE
	db BLAZE_HAMMER, FIRE_BLAST, PSYCHIC_M, SUPERNOVA
	db THUNDERBOLT, SUPERNOVA, THUNDER, SWIFT
	db FIRE_BLAST, PISTON_KICK, METEOR_DRIVE, MIRAGE
	db ROCK_SLIDE, EARTHQUAKE, BLAZE_HAMMER, METAMORPHIC
	db FLAMETHROWER, FIRE_BLAST, BODY_SLAM, SUPERNOVA
