_RunPaletteCommand::
	ld a, d
	cp SET_PAL_DEFAULT
	jr nz, .not_default
	ld a, [wDefaultPaletteCommand]
.not_default
	cp SET_PAL_PARTY_MENU_HP_BARS
	jp z, UpdatePartyMenuBlkPacket
	ld l, a
	ld h, 0
	add hl, hl
	push de
	ld de, SetPalFunctions
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de ; e = optional argument to function
	call hl_caller
	jp SendSGBPackets

SetPal_BattleBlack:
	ld hl, PalPacket_Black
	ld de, BlkPacket_Battle
	ret

; PureRGBnote: ADDED: updated function to allow alternate palette pokemon based on loaded data.
; uses PalPacket_Empty to build a packet based on mon IDs and health color
SetPal_Battle:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	ld a, [wGenericPaletteOverride]
	and a
	jr z, .continue
	ld b, a
	xor a
	ld [wGenericPaletteOverride], a
	jr .override
.continue
	ld a, [wBattleMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette
	ld [wIsAltPalettePkmn], a
	ld a, [wPlayerBattleStatus3]
	ld hl, wBattleMonSpecies
	call DeterminePaletteID
	ld b, a
.override
	ld a, [wEnemyMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette
	ld [wIsAltPalettePkmn], a
	ld a, [wEnemyBattleStatus3]
	ld hl, wEnemyMonSpecies2
	call DeterminePaletteID
	ld c, a
	ld hl, wPalPacket + 1
	ld a, [wPlayerHPBarColor]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	ld a, [wEnemyHPBarColor]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a
	inc hl
	ld a, c
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_Battle
	ld a, SET_PAL_BATTLE
	ld [wDefaultPaletteCommand], a
	ret

; Sunsette: SET_PAL_BATTLE, but for trainer battles temporarily restore the enemy trainer's OPP
; class into wEnemyMonSpecies2 first so the intro pic gets its class palette (NonMonCustomPalettes,
; unlisted classes default to PAL_MEWMON), then re-clear it. Wild battles are unchanged.
SetEnemyTrainerIntroPalette:
;;;;;;;;;; Sunsette: feed the player back-sprite sentinel species into wBattleMonSpecies so the
; SAME SET_PAL_BATTLE colors slot 2 (the back-sprite body) directly - PAL_PLAYER, or PAL_REDBAR
; in the volcano (lava suit) / PAL_BLUEMON in the scuba event - with no MEWMON flash. The real
; player mon species is saved and restored around the command.
	ld a, [wCurMapTileset]
	cp VOLCANO
	ld a, PLAYER_BACK_LAVA
	jr z, .gotBackSentinel
	CheckEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	ld a, PLAYER_BACK_SCUBA
	jr nz, .gotBackSentinel
	ld a, PLAYER_BACK_NORMAL
.gotBackSentinel
	ld b, a
	ld a, [wBattleMonSpecies]
	push af
	ld a, b
	ld [wBattleMonSpecies], a
;;;;;;;;;;
	ld a, [wIsInBattle]
	cp $2
	jr nz, .wildPal
	ld a, [wTrainerClass]
	add OPP_ID_OFFSET
	ld [wEnemyMonSpecies2], a
	ld d, SET_PAL_BATTLE
	call RunPaletteCommand
	xor a
	ld [wEnemyMonSpecies2], a
	jr .restorePlayer
.wildPal
	ld d, SET_PAL_BATTLE
	call RunPaletteCommand
.restorePlayer
	pop af
	ld [wBattleMonSpecies], a ; restore the real player mon species
	ret

; Sunsette: write the red/white PAL_POKEBALL directly into OBJ palette slots 0 and 1 (the team-
; size HUD balls), bypassing the HP-bar colors normally derived there. The balls are shown before
; the HP bars, so this holds through the intro; a later battle palette refresh restores 0/1 for
; the HP bars. Converted via OBP0 so it renders the ball tiles the same way the green did.
SetPokeballPalette::
	ldh a, [hGBC]
	and a
	ret z
	ld a, PAL_POKEBALL
	call GetGBCBasePalAddress
	ld a, CONVERT_OBP0
	call DMGPalToGBCPal
	xor a
	call TransferCurOBPData ; OBJ palette slot 0 (player balls)
	ld a, 1
	call TransferCurOBPData ; OBJ palette slot 1 (enemy balls)
	ret

SetPal_TownMap:
	ld hl, PalPacket_TownMap
	ld de, BlkPacket_WholeScreen
	ret

; PureRGBnote: ADDED: updated function to allow alternate palette pokemon based on loaded data.
; uses PalPacket_Empty to build a packet based the mon ID
SetPal_StatusScreen:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	ld a, [wCurPartySpecies]
	cp NUM_POKEMON_INDEXES + 1
	jr c, .pokemon
	ld a, $1 ; not pokemon
	jr .notPokemon
.pokemon
	push af
	;if it's a pokemon we may have to load the alt color palette based on the pokemon data
	ld a, [wLoadedMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette, zero the other ones
	ld [wIsAltPalettePkmn], a
	pop af
.notPokemon
	call DeterminePaletteIDOutOfBattle
	push af
	ld hl, wPalPacket + 1
	ld a, [wStatusScreenHPBarColor]
	add PAL_GREENBAR
	ld [hli], a
	inc hl
	pop af
	ld [hli], a
	inc hl
	push hl
	ld a, [wLoadedMonFlags]
	rra
	rra
	rra
	and %11111 ; ball Data ID, decides color
	ld e, a
	callfar FarGetBallDataPalette
	ld a, e
	pop hl
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_StatusScreen
	ret

SetPal_PartyMenu:
	ld hl, PalPacket_PartyMenu
	ld de, wPartyMenuBlkPacket
	ret

SetPal_Pokedex:
	ld hl, PalPacket_Pokedex
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	ld a, [wCurPartySpecies]
	; no alt palette colors when viewing pokedex entries
	call DeterminePaletteIDOutOfBattle
	ld hl, wPalPacket + 3
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_Pokedex
	ret

; PureRGBnote: ADDED: new function for setting the palette including the type icon color on the movedex data page
SetPal_Movedex:
	ld hl, PalPacket_Movedex
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	ld a, [wCurPartySpecies]
	ld d, a
	callfar GetTypePalette
	ld a, d
	ld hl, wPalPacket + 3
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_Pokedex
	ret

; PureRGBnote: ADDED: function that sets the palette on the pokemon sprite boxes 
;                     that appear in the pewter museum or the route 15 left binoculars
SetPal_MiddleScreenMonBox:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData

	call GetOverworldPalette
	ld hl, wPalPacket + 1
	ld [hl], a
	
	ld a, [wCurPartySpecies]
	; no alt palette pkmn colors in this case
	call DeterminePaletteIDOutOfBattle
	ld hl, wPalPacket + 3
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_PokemonMiddleScreenBox
	ret

; PureRGBnote: ADDED: function that sets the palette on the color changer NPC's "before and after" screen
SetPal_ColorBeforeAfter:
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	; before picture
	ld a, [wLoadedMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette, zero the other ones
	ld c, a
	ld [wIsAltPalettePkmn], a
	ld a, [wCurPartySpecies]
	call DeterminePaletteIDOutOfBattle
	ld b, a
	; after picture
	ld a, c
	xor 1 ; second palette should always be alternate one
	ld [wIsAltPalettePkmn], a
	ld a, [wCurPartySpecies]
	call DeterminePaletteIDOutOfBattle
	ld c, a
	ld hl, wPalPacket + 1
	ld [hl], a
	ld hl, wPalPacket + 3
	ld a, b
	ld [hl], a
	ld hl, wPalPacket
	ld de, BlkPacket_Pokedex
	ret

SetPal_Slots:
	ld hl, PalPacket_Slots
	ld de, BlkPacket_Slots
	ret

SetPal_TitleScreen:
	ldh a, [hGBC]
	and a
	ld de, BlkPacket_PureTitlescreen ; gbc works with always using these packets
	jr nz, .normalPalPacket
	ld a, [wSpriteOptions2]
	bit BIT_NEW_TITLE_SCREEN, a
	ld hl, PalPacket_PureTitlescreen_SGB
	jr nz, .next
	; on SGB we need to use the original block packet on the original title screen
	; on GB, doesn't matter which since there is no color
	ld de, BlkPacket_Titlescreen
.normalPalPacket
	ld hl, PalPacket_Titlescreen
.next
	ret

; used mostly for menus and the Oak intro
SetPal_Generic:
	ld hl, PalPacket_Generic
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	ld hl, wPalPacket
	ld de, BlkPacket_WholeScreen
	ld a, [wGenericPaletteOverride]
	and a
	jr z, .noSpecialPal
	ld [wPalPacket + 1], a
.noSpecialPal
	xor a
	ld [wGenericPaletteOverride], a
	ret

SetPal_NidorinoIntro:
	ld hl, PalPacket_NidorinoIntro
	ld de, BlkPacket_NidorinoIntro
	ret

SetPal_GameFreakIntro:
	ld hl, PalPacket_GameFreakIntro
	ld de, BlkPacket_GameFreakIntro
	ld a, SET_PAL_GENERIC
	ld [wDefaultPaletteCommand], a
	ret

; PureRGBnote: CHANGED: abstracted code to a function called GetOverworldPalette for reusability.
; also switched to using a lookup table instead of many comparisons.
; uses PalPacket_Empty to build a packet based on the current map
SetPal_Overworld:
	CheckEvent EVENT_CELADON_RAINBOW_COLORS_ACTIVE
	jr z, .notCeladon
	ld a, [wCurMap]
	cp CELADON_CITY
	jr z, .rainbow
	cp FIRST_INDOOR_MAP
	jr c, .notCeladon
	ld a, [wLastMap]
	cp CELADON_CITY
	jr nz, .notCeladon
	ld a, [wCurMap]
	ld hl, NoRainbowCeladonMaps
	call IsInSingleByteArray
	jr nc, .rainbow
.notCeladon
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	call GetOverworldPalette
	ld [wPalPacket + 1], a ; active palette 0 = map BG palette
	ld a, [wCurMapTileset] ; Sunsette: lava-suited player (volcano) uses PAL_REDBAR_OW; else normal
	cp VOLCANO
	ld a, PAL_PLAYEROW
	jr nz, .playerOWPal
	ld a, PAL_REDBAR_OW
.playerOWPal
	ld [wPalPacket + 3], a ; active palette 1 = player overworld OBJ color (slot 1)
	ld a, PAL_HUMANSPRITE  ; active palette 2 = generic human NPC color (slot 2)
	ld [wPalPacket + 5], a
	farcall ScanSlot3Palette ; Sunsette: active palette 3 = map's special NPC palette (writes wPalPacket+7)
	ld hl, wPalPacket      ; hl must point to the pal packet (SendSGBPackets reads it via InitGBCPalettesNew)
	ld de, BlkPacket_WholeScreen
	ld a, SET_PAL_OVERWORLD
	ld [wDefaultPaletteCommand], a
	ret
.rainbow
	ld hl, PalPacket_Celadon
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	ld hl, PalPacket_Celadon
	ld de, BlkPacket_Celadon
	ld a, SET_PAL_OVERWORLD
	ld [wDefaultPaletteCommand], a
	ret

; some maps look weird with the celadon rainbow so don't use it in them even if turned on.
NoRainbowCeladonMaps:
	db CELADON_GYM
	db GAME_CORNER
	db ROCKET_HIDEOUT_B1F
	db ROCKET_HIDEOUT_B2F
	db ROCKET_HIDEOUT_B3F
	db ROCKET_HIDEOUT_B4F
	db ROCKET_HIDEOUT_ELEVATOR
	db -1

; PureRGBnote: CHANGED: abstracted into its own function, removed some redundant code
; stores the palette used for the current map in a
GetOverworldPalette:
	; first check if the current map has a custom palette
	ld a, [wCurMap]
	ld hl, MapPalettesJumpTable
	ld de, 2
	call IsInArray
	jr c, .foundPalette
	; next check if the map has its own palette function
	ld a, [wCurMap]
	ld hl, MapPalettesSpecialFunctionTable
	ld de, 3
	call IsInArray
	jr nc, .noSpecialMapPaletteFunction
	; special function found
	inc hl
	hl_deref
	jp hl
.noSpecialMapPaletteFunction
	; lastly check if the tileset has its own map palette
	ld a, [wCurMapTileset]
	ld hl, MapTilesetPalettesTable
	ld de, 2
	call IsInArray
	jr c, .foundPalette
	; next, if it's a town or route, use the town palette or route palette
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP
	jr c, .townOrRoute
	; otherwise, use the last overworld map's palette for this indoor map
.normalDungeonOrBuilding
	ld a, [wLastMap] ; town or route that current dungeon or building is located
.townOrRoute
	cp NUM_CITY_MAPS
	jr c, .town
	ld a, PAL_ROUTE - 1
.town
	inc a ; a town's palette ID is its map ID + 1
	ret
.foundPalette
	inc hl
	ld a, [hl]
	ret

LoreleiPalettes:
	call GetPalettes
	ld a, PAL_0F
	ret nc
	; PureRGBnote: CHANGED: lorelei's room uses a bluish purple palette instead of light green on SGB colors.
	ld a, PAL_PALLET
	ret

DiamondMinePalettes:
; PureRGBnote: ADDED: in the diamond mine area, we use a different palette depending on where you are in the map.
	ld a, [wXCoord]
	cp 10
	ld a, PAL_CAVE
	ret c
	ld a, [wYCoord]
	cp 10
	ld a, PAL_CAVE
	ret nc
	ld a, PAL_BLUEMON
	ret

BallDesignerPalettes:
	xor a
	ld [wMapPalOffset], a
	ld a, [wXCoord]
	cp 14
	ld a, PAL_CERULEAN
	ret c
	ld a, 3
	ld [wMapPalOffset], a
	ld a, PAL_REALLY_REDMON
	ret

MapPalettesSpecialFunctionTable:
	dbw DIAMOND_MINE, DiamondMinePalettes
	dbw LORELEIS_ROOM, LoreleiPalettes
	dbw CERULEAN_BALL_DESIGNER, BallDesignerPalettes
	db -1

MapTilesetPalettesTable:
	db CEMETERY, PAL_GRAYMON
	db SECRET_LAB_TS, PAL_SECRETLAB
	db VOLCANO, PAL_VOLCANO
	db UNDERGROUND, PAL_ROUTE
	db CAVERN, PAL_CAVE
	db -1

MapPalettesJumpTable:
	db SEAFOAM_ISLANDS_1F, PAL_0F
	db SEAFOAM_ISLANDS_B1F, PAL_0F
	db SEAFOAM_ISLANDS_B2F, PAL_0F
	db SEAFOAM_ISLANDS_B3F, PAL_0F
	db SEAFOAM_ISLANDS_B4F, PAL_0F
	db FUCHSIA_GOOD_ROD_HOUSE, PAL_FUCHSIA
	db CERULEAN_ROCKET_HOUSE_B1F, PAL_REDMON
;;;;;;;;;; Sunsette: environment palette overhaul
	; Forest palette
	db ROUTE_2, PAL_FOREST
	db VIRIDIAN_FOREST, PAL_FOREST
	db CELADON_GYM, PAL_FOREST
	; Highland palette
	db ROUTE_3, PAL_HIGHLAND
	db ROUTE_9, PAL_HIGHLAND
	db ROUTE_10, PAL_HIGHLAND
	db ROUTE_22, PAL_HIGHLAND
	db ROUTE_23, PAL_HIGHLAND
	; Safari Ball palette
	db ROCKET_HIDEOUT_B1F, PAL_SAFARIBALL
	db ROCKET_HIDEOUT_B2F, PAL_SAFARIBALL
	db ROCKET_HIDEOUT_B3F, PAL_SAFARIBALL
	db ROCKET_HIDEOUT_B4F, PAL_SAFARIBALL
	db ROCKET_HIDEOUT_ELEVATOR, PAL_SAFARIBALL
	db VIRIDIAN_GYM, PAL_SAFARIBALL
	; Pewter City palette
	db BRUNOS_ROOM, PAL_PEWTER
	db UNDERGROUND_PATH_NORTH_SOUTH, PAL_PEWTER
	db UNDERGROUND_PATH_WEST_EAST, PAL_PEWTER
	db SILPH_CO_1F, PAL_PEWTER
	db SILPH_CO_2F, PAL_PEWTER
	db SILPH_CO_3F, PAL_PEWTER
	db SILPH_CO_4F, PAL_PEWTER
	db SILPH_CO_5F, PAL_PEWTER
	db SILPH_CO_6F, PAL_PEWTER
	db SILPH_CO_7F, PAL_PEWTER
	db SILPH_CO_8F, PAL_PEWTER
	db SILPH_CO_9F, PAL_PEWTER
	db SILPH_CO_10F, PAL_PEWTER
	db SILPH_CO_11F, PAL_PEWTER
	db SILPH_CO_ELEVATOR, PAL_PEWTER
	; Brownmon palette
	db PEWTER_GYM, PAL_BROWNMON
	; Vermilion palette
	db ROUTE_11, PAL_VERMILION
	db ROUTE_12, PAL_VERMILION
	db ROUTE_13, PAL_VERMILION
	db ROUTE_14, PAL_VERMILION
	db ROUTE_15, PAL_VERMILION
	; Aqua palette (white + standard water blue)
	db LORELEIS_ROOM, PAL_AQUA
	db CERULEAN_GYM, PAL_AQUA
	; Greenbar palette
	db VERMILION_GYM, PAL_GREENBAR
	; Dusk palette
	db AGATHAS_ROOM, PAL_DUSK
	db POKEMON_TOWER_1F, PAL_DUSK
	db POKEMON_TOWER_2F, PAL_DUSK
	db POKEMON_TOWER_3F, PAL_DUSK
	db POKEMON_TOWER_4F, PAL_DUSK
	db POKEMON_TOWER_5F, PAL_DUSK
	db POKEMON_TOWER_6F, PAL_DUSK
	db POKEMON_TOWER_7F, PAL_DUSK
	db POKEMON_TOWER_B1F, PAL_DUSK
	db POWER_PLANT, PAL_DUSK
	db POWER_PLANT_ROOF, PAL_DUSK
	db POKEMON_MANSION_1F, PAL_DUSK
	db POKEMON_MANSION_2F, PAL_DUSK
	db POKEMON_MANSION_3F, PAL_DUSK
	db POKEMON_MANSION_B1F, PAL_DUSK
	; Saffron Gym uses 0F
	db SAFFRON_GYM, PAL_0F
	; Fuchsia Gym uses Mewmon
	db FUCHSIA_GYM, PAL_MEWMON
	; Cinnabar Gym uses Redbar
	db CINNABAR_GYM, PAL_REDBAR
	; Saffron palette (League finale rooms)
	db LANCES_ROOM, PAL_SAFFRON
	db CHAMPIONS_ROOM, PAL_SAFFRON
	db HALL_OF_FAME, PAL_SAFFRON
	; Mystic palette (Cerulean Cave / Unknown Dungeon)
	db CERULEAN_CAVE_1F, PAL_MYSTIC
	db CERULEAN_CAVE_2F, PAL_MYSTIC
	db CERULEAN_CAVE_B1F, PAL_MYSTIC
;;;;;;;;;;
	db -1

; PureRGBnote: ADDED: updated function to allow alternate palette pokemon based on loaded data.
; used when a Pokemon is the only thing on the screen
; such as evolution, trading and the Hall of Fame
SetPal_PokemonWholeScreen:
	ld a, [wLoadedMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette, zero the other ones
	ld [wIsAltPalettePkmn], a
SetPal_PokemonWholeScreenTrade:
	push de
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	pop de
	ld a, e
	cp $FF
	ld a, PAL_BLACK
	jr z, .next
	ld a, e
	call DeterminePaletteIDOutOfBattle
.next
	ld [wPalPacket + 1], a
	ld hl, wPalPacket
	ld de, BlkPacket_WholeScreen
	ret

SetPal_TrainerCard:
	ld hl, BlkPacket_TrainerCard
	ld de, wTrainerCardBlkPacket
	ld bc, $40
	rst _CopyData
	ld de, BadgeBlkDataLengths
	ld hl, wTrainerCardBlkPacket + 2
	ld a, [wObtainedBadges]
	ld c, NUM_BADGES
.badgeLoop
	srl a
	push af
	jr c, .haveBadge
; The player doesn't have the badge, so zero the badge's blk data.
	push bc
	ld a, [de]
	ld c, a
	xor a
.zeroBadgeDataLoop
	ld [hli], a
	dec c
	jr nz, .zeroBadgeDataLoop
	pop bc
	jr .nextBadge
.haveBadge
; The player does have the badge, so skip past the badge's blk data.
	ld a, [de]
.skipBadgeDataLoop
	inc hl
	dec a
	jr nz, .skipBadgeDataLoop
.nextBadge
	pop af
	inc de
	dec c
	jr nz, .badgeLoop
	ld hl, PalPacket_TrainerCard
	ld de, wTrainerCardBlkPacket
	ret

SetPalFunctions:
; entries correspond to SET_PAL_* constants
	dw SetPal_BattleBlack
	dw SetPal_Battle
	dw SetPal_TownMap
	dw SetPal_StatusScreen
	dw SetPal_Pokedex
	dw SetPal_Slots
	dw SetPal_TitleScreen
	dw SetPal_NidorinoIntro
	dw SetPal_Generic
	dw SetPal_Overworld
	dw SetPal_PartyMenu
	dw SetPal_PokemonWholeScreen
	dw SetPal_PokemonWholeScreenTrade
	dw SetPal_GameFreakIntro
	dw SetPal_TrainerCard
	dw SetPal_ColorBeforeAfter
	dw SetPal_MiddleScreenMonBox
	dw SetPal_Movedex

; The length of the blk data of each badge on the Trainer Card.
; The Rainbow Badge has 3 entries because of its many colors.
BadgeBlkDataLengths:
	db 6     ; Boulder Badge
	db 6     ; Cascade Badge
	db 6     ; Thunder Badge
	db 6 * 3 ; Rainbow Badge
	db 6     ; Soul Badge
	db 6     ; Marsh Badge
	db 6     ; Volcano Badge
	db 6     ; Earth Badge

;;;;; PureRGBnote: ADDED: some opponents or variant pokemon get special palettes instead of the default for their species.
; Sunsette: sentinel "species" values for the player back-sprite intro palette (slot 2). Above the
; trainer OPP range, below $FF; caught by NonMonCustomPalettes before the trainer default.
DEF PLAYER_BACK_NORMAL EQU 251
DEF PLAYER_BACK_LAVA EQU 252
DEF PLAYER_BACK_SCUBA EQU 253
NonMonCustomPalettes:
	db SPIRIT_TORCHED, PAL_VOLCANO
	db SPIRIT_CHUNKY, PAL_MEWMON
	db SPIRIT_PAINLESS, PAL_PINKMON ; whitemon?
	db SPIRIT_IRRADIATED, PAL_SAFARIBALL
	db SPIRIT_THE_MAW, PAL_REALLY_REDMON
;;;;;;;;;; Sunsette: trainer front-sprite palettes (keyed by OPP class). Trainers not listed
; here default to PAL_MEWMON via DeterminePaletteIDOutOfBattle (so Giovanni/Bruno/Oak + all
; generic trainers = Mewmon). Battle order [white, light, dark, black], same as their fronts.
	db OPP_BROCK, PAL_BROCK
	db OPP_MISTY, PAL_REDBAR
	db OPP_LT_SURGE, PAL_GREENBAR
	db OPP_ERIKA, PAL_REDBAR
	db OPP_KOGA, PAL_KOGA
	db OPP_SABRINA, PAL_REDBAR
	db OPP_BLAINE, PAL_REDBAR
	db OPP_LORELEI, PAL_REDBAR
	db OPP_AGATHA, PAL_GRAYMON
	db OPP_LANCE, PAL_REDBAR
	db OPP_RIVAL1, PAL_RIVAL
	db OPP_RIVAL2, PAL_RIVAL
	db OPP_RIVAL3, PAL_RIVAL
;;;;;;;;;;
;;;;;;;;;; Sunsette: player back-sprite (slot 2) intro palette sentinels (no MEWMON flash)
	db PLAYER_BACK_NORMAL, PAL_PLAYER
	db PLAYER_BACK_LAVA,   PAL_REDBAR
	db PLAYER_BACK_SCUBA,  PAL_BLUEMON
;;;;;;;;;;
	db -1

SpecialMonCustomPalettes:
	db HARDENED_ONIX, PAL_BLACKMON, PAL_WHITEMON
	db WINTER_DRAGONAIR, PAL_CYANMON, PAL_PINKMON
	db -1
;;;;;

DeterminePaletteID:
	bit TRANSFORMED, a ; a is battle status 3
	ld a, DEX_DITTO	;ld a, PAL_GRAYMON  ; shinpokerednote: FIXED: if the mon has used Transform, use Ditto's palette
	jr nz, DeterminePaletteIDOutOfBattle.ditto ;ret nz
	ld a, [hl]
DeterminePaletteIDOutOfBattle:
	push bc
	ld [wPokedexNum], a
	and a ; is the mon index 0?
	jr z, .skipDexNumConversion
	ld hl, NonMonCustomPalettes
	ld de, 2
	call IsInArray
	inc hl
	jr c, .gotPalette
	ld a, [wPokedexNum]
	ld hl, SpecialMonCustomPalettes
	ld de, 3
	call IsInArray
	jr c, .specialMonPalette
	ld a, [wPokedexNum]    ; Sunsette: trainer class (index >= OPP offset) not listed above?
	cp OPP_ID_OFFSET
	jr nc, .trainerDefault ; -> default trainer color PAL_MEWMON ("most people")
	call IndexToPokedex
	ld a, [wPokedexNum]
	; 0 = missingno is a valid value here
.skipDexNumConversion
	pop bc
.ditto
	ld e, a
	ld d, 0
;;;;;;;;;; PureRGBnote: ADDED: show an alternate palette pokemon if the flag is set. Then immediately clear the flag.
	ld a, [wIsAltPalettePkmn]
	and a
	jr z, .defaultPalette
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr z, .defaultPalette ; if not show default palettes always
	ld hl, AltMonsterPalettes ; not just for Pokemon, Trainers use it too
	jr .usePalette
.defaultPalette
	ld hl, MonsterPalettes ; not just for Pokemon, Trainers use it too
.usePalette
	add hl, de
.gotPalette2
	xor a
	ld [wIsAltPalettePkmn], a ; always reset this value after displaying a pokemon sprite
;;;;;;;;;;
	ld a, [hl]
	ret
.trainerDefault
	pop bc
	xor a
	ld [wIsAltPalettePkmn], a
	ld a, PAL_MEWMON
	ret
.gotPalette
	pop bc
	jr .gotPalette2
;;;;;;;;;; PureRGBnote: ADDED: certain mons have other palettes
.specialMonPalette
	inc hl
	ld a, [wIsAltPalettePkmn]
	and a
	jr z, .gotPalette
	ld a, [wOptions2]
	bit BIT_ALT_PKMN_PALETTES, a ; do we have alt palettes enabled
	jr z, .gotPalette ; if not show default palettes always
	inc hl
	jr .gotPalette
;;;;;;;;;;

InitPartyMenuBlkPacket:
	ld hl, BlkPacket_PartyMenu
	ld de, wPartyMenuBlkPacket
	ld bc, $30
	jp CopyData

UpdatePartyMenuBlkPacket:
; Update the blk packet with the palette of the HP bar that is
; specified in [wWhichPartyMenuHPBar].
	ld hl, wPartyMenuHPBarColors
	ld a, [wWhichPartyMenuHPBar]
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	and a
	ld e, (1 << 2) | 1 ; green
	jr z, .next
	dec a
	ld e, (2 << 2) | 2 ; yellow
	jr z, .next
	ld e, (3 << 2) | 3 ; red
.next
	push de
	ld hl, wPartyMenuBlkPacket + 8 + 1
	ld bc, 6
	ld a, [wWhichPartyMenuHPBar]
	call AddNTimes
	pop de
	ld [hl], e
	ret

LoadSGB::
; Sunsette: SGB support removed. GBC is treated as color-capable (wOnSGB=1); anything
; else (a real DMG) stays grayscale (wOnSGB=0). No SGB detection, border, or packet
; transfer - those paths were never reached on GBC anyway.
	ldh a, [hGBC]
	and a
	ld a, 1
	ld [wOnSGB], a
	ret nz ; GBC: color-capable, done
	xor a
	ld [wOnSGB], a ; not GBC: grayscale DMG (SGB no longer detected)
	ret


SendSGBPackets:
; Sunsette: GBC-only now (SGB removed). On a real DMG this returns and the existing
; rBGP/rOBP grayscale registers are used directly.
	ldh a, [hGBC]
	and a
	ret z
	push de
	call InitGBCPalettesNew
	pop hl
	call InitGBCPalettesNew
	ldh a, [rLCDC]
	and LCDC_ON
	ret z
	CheckAndResetEvent FLAG_SKIP_DELAY_IN_GBC_PALETTE_FUNC
	ret nz
	jp Delay3

; PureRGBnote: ADDED: figure out if we have SGB or GBC palettes selected in the options.
GetPalettes:
; Sunsette: the palette-set option was removed - always use the SGB1 (SuperPalettes) set on every
; hardware. GBC reads the same 15-bit RGB values via its register path. de = table base, carry clear.
	ld de, SuperPalettes
	and a
	ret


InitGBCPalettesNew:	;shinpokerednote: gbcnote: updating this to work with the Yellow code
	ld a, [hl]
	and $f8
	cp $20	;check to see if hl points to a blk pal packet
	jp z, TranslatePalPacketToBGMapAttributes	;jump if so
	;otherwise hl points to a different pal packet or wPalPacket
	inc hl
	; Sunsette: three V-blank-batched passes, all reusing wBGPPalsBuffer (32 bytes) so no extra
	; WRAM is needed. Pass 1 traverses the packet, records each base palette pointer, and flushes
	; the BG palettes; passes 2/3 reconvert from the stored pointers for OBP0 (slots 0-3) and OBP1
	; (slots 4-7). Previously the OBJ palettes were written per-H-blank, which tore across the
	; visible frame once the overworld used distinct OBJ colors (the returned "infinite flicker").
	; Pass 1: BG palettes
DEF index = 0
	REPT NUM_ACTIVE_PALS
		IF index > 0
			pop hl
		ENDC

		ld a, [hli]	;get palette ID into 'A'
		inc hl

		IF index < (NUM_ACTIVE_PALS + -1)
			push hl
		ENDC

		call GetGBCBasePalAddress	;get palette address into de
		ld a, e
		ld [wGBCBasePalPointers + index * 2], a
		ld a, d
		ld [wGBCBasePalPointers + index * 2 + 1], a

		ld a, CONVERT_BGP
		call DMGPalToGBCPal
		ld a, index
		call BufferBGPPal
DEF index = index + 1
	ENDR
	call TransferBGPPals

	; Pass 2: OBP0 palettes -> OBJ slots 0-3 (reusing the BG buffer)
DEF index = 0
	REPT NUM_ACTIVE_PALS
		ld a, [wGBCBasePalPointers + index * 2]
		ld e, a
		ld a, [wGBCBasePalPointers + index * 2 + 1]
		ld d, a
		ld a, CONVERT_OBP0
		call DMGPalToGBCPal
		ld a, index
		call BufferBGPPal
DEF index = index + 1
	ENDR
	xor a
	call TransferOBPPalsFromBuffer

	; Pass 3: OBP1 palettes -> OBJ slots 4-7
DEF index = 0
	REPT NUM_ACTIVE_PALS
		ld a, [wGBCBasePalPointers + index * 2]
		ld e, a
		ld a, [wGBCBasePalPointers + index * 2 + 1]
		ld d, a
		ld a, CONVERT_OBP1
		call DMGPalToGBCPal
		ld a, index
		call BufferBGPPal
DEF index = index + 1
	ENDR
	ld a, 4
	call TransferOBPPalsFromBuffer
	ret

GetGBCBasePalAddress:: ;shinpokerednote: gbcnote: new function
; Input: a = palette ID
; Output: de = palette address
	push hl
	ld l, a
	xor a
	ld h, a
	add hl, hl
	add hl, hl
	add hl, hl
;;;;;;;;;; PureRGBnote: ADDED: optional toggle between original SGB palettes and GBC palettes when playing on SGB
	call GetPalettes
;;;;;;;;;;
	add hl, de
	ld a, l
	ld e, a
	ld a, h
	ld d, a
	pop hl
	ret
	
DMGPalToGBCPal::	;shinpokerednote: gbcnote: new function
; Populate wGBCPal with colors from a base palette, selected using one of the
; DMG palette registers.
; Input:
; a = which DMG palette register
; de = address of GBC base palette
	and a
	jr nz, .notBGP
;;;;;;;;;; PureRGBnote: ADDED: on GBC we will use the original duochromatic colors if the option is selected.
	ld a, [wOptions2]
	and %11 
	jr nz, .notOG1 ; if this value is non-zero we're not using OG palettes on GBC
	ld de, GBC_OGPalettes_BGOBJ1
.notOG1
;;;;;;;;;; 
	ldh a, [rBGP]
	ld [wLastBGP], a
	jr .convert
.notBGP
	dec a
	jr nz, .notOBP0
;;;;;;;;;; PureRGBnote: ADDED: on GBC we will use the original duochromatic colors if the option is selected.
	ld a, [wOptions2]
	and %11 
	jr nz, .notOG2 ; if this value is non-zero we're not using OG palettes on GBC
	ld de, GBC_OGPalettes_OBJ0
.notOG2
;;;;;;;;;;
	ldh a, [rOBP0]
	ld [wLastOBP0], a
	jr .convert
.notOBP0
;;;;;;;;;; PureRGBnote: ADDED: on GBC we will use the original duochromatic colors if the option is selected.
	ld a, [wOptions2]
	and %11 
	jr nz, .notOG3 ; if this value is non-zero we're not using OG palettes on GBC
	ld de, GBC_OGPalettes_BGOBJ1
.notOG3
;;;;;;;;;;
	ldh a, [rOBP1]
	ld [wLastOBP1], a
.convert
;"A" now holds the palette data
DEF color_index = 0
	REPT NUM_COLORS
		ld b, a	;"B" now holds the palette data
		and %11	;"A" now has just the value for the shade of palette color 0
		call .GetColorAddress
		push de
		;get the palett color value in de
		ld a, [hli]
		ld e, a
		ld a, [hl]
		ld d, a
		;now load the value that HL points to into wGBCPal offset by the loop
		ld a, e
		ld [wGBCPal + color_index * 2], a
		ld a, d
		ld [wGBCPal + color_index * 2 + 1], a
		pop de

		IF color_index < (NUM_COLORS + -1)
			ld a, b	;restore the palette data back into "A"
			;rotate the palette data bits twice to the right so the next color in line becomes color 0
			rrca
			rrca
		ENDC
DEF color_index = color_index + 1
	ENDR
	ret
.GetColorAddress:
	add a	;double the value of the shade in "A"
	ld l, a	;load 2x shade value into "L"
	xor a	;zero "A"
	ld h, a	;and load it to "H", so HL is now [00|2x shade]
	add hl, de	;HL now holds the base palette address offset by 2x shade in bytes (base, base+2, base+4, or base+6)
	ret

TransferCurBGPData:: ;shinpokerednote: gbcnote: code from pokemon yellow
; a = indexed offset of wGBCBasePalPointers
	push de
	;multiply index by 8 since each index represents 8 bytes worth of data
	add a
	add a
	add a
	or $80 ; set auto-increment bit of rBGPI
	ldh [rBGPI], a
	ld de, rBGPD
	ld hl, wGBCPal
	ldh a, [rLCDC]
	and LCDC_ON
	jr nz, .lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDDisabled
	endr
	jr .done
.lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDEnabled
	endr
.done
	pop de
	ret	

BufferBGPPal:: ;shinpokerednote: gbcnote: code from pokemon yellow
; Copy wGBCPal to palette a in wBGPPalsBuffer.
; a = indexed offset of wGBCBasePalPointers
	push de
	;multiply index by 8 since each index represents 8 bytes worth of data
	add a
	add a
	add a
	ld l, a
	xor a
	ld h, a
	ld de, wBGPPalsBuffer
	add hl, de	;hl now points to wBGPPalsBuffer + 8*index
	ld de, wGBCPal
	ld c, PAL_SIZE
.loop	;copy the 8 bytes of wGBCPal to its indexed spot in wBGPPalsBuffer
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	pop de
	ret
	
TransferBGPPals:: ;shinpokerednote: gbcnote: code from pokemon yellow
; Transfer the buffered BG palettes.
	ldh a, [rLCDC]
	and LCDC_ON
	jr z, .lcdDisabled
	; have to wait until LCDC is disabled
	; LCD should only ever be disabled during the V-blank period to prevent hardware damage
	di	;disable interrupts
.waitLoop
	ldh a, [rLY]
	cp 144	;V-blank can be confirmed when the value of LY is greater than or equal to 144
	jr c, .waitLoop
.lcdDisabled
	call .DoTransfer
	reti	;enable interrupts
.DoTransfer:
	xor a
	or $80 ; set the auto-increment bit of rBPGI
	ldh [rBGPI], a
	ld de, rBGPD
	ld hl, wBGPPalsBuffer
	ld c, 4 * PAL_SIZE
.loop
	ld a, [hli]
	ld [de], a
	dec c
	jr nz, .loop
	ret

; Sunsette: flush the 4 palettes currently in wBGPPalsBuffer to OBJ palette slots starting at
; index a (0 = OBP0 set, 4 = OBP1 set), in a single V-blank. InitGBCPalettesNew reuses the BG
; buffer for OBP0 then OBP1 after the BG flush, so the overworld's distinct OBJ palettes no
; longer tear across the visible frame (the returned "infinite flicker").
TransferOBPPalsFromBuffer:: ; a = starting OBJ palette index (0 or 4)
	add a
	add a
	add a
	or $80 ; auto-increment bit of rOBPI
	ldh [rOBPI], a
	ldh a, [rLCDC]
	and LCDC_ON
	jr z, .lcdDisabled
	di
.waitLoop
	ldh a, [rLY]
	cp 144
	jr c, .waitLoop
.lcdDisabled
	call .DoTransfer
	reti
.DoTransfer:
	ld de, rOBPD
	ld hl, wBGPPalsBuffer
	ld c, NUM_ACTIVE_PALS * PAL_SIZE
.loop
	ld a, [hli]
	ld [de], a
	dec c
	jr nz, .loop
	ret

TransferCurOBPData:: ;shinpokerednote: gbcnote: code from pokemon yellow
; a = indexed offset of wGBCBasePalPointers
	push de
	;multiply index by 8 since each index represents 8 bytes worth of data
	add a
	add a
	add a
	or $80 ; set auto-increment bit of OBPI
	ldh [rOBPI], a
	ld de, rOBPD
	ld hl, wGBCPal
	ldh a, [rLCDC]
	and LCDC_ON
	jr nz, .lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDDisabled
	endr
	jr .done
.lcdEnabled
	rept NUM_COLORS
	call TransferPalColorLCDEnabled
	endr
.done
	pop de
	ret	

TransferPalColorLCDEnabled: ;shinpokerednote: gbcnote: code from pokemon yellow
; Transfer a palette color while the LCD is enabled.
; In case we're already in H-blank or V-blank, wait for it to end. This is a
; precaution so that the transfer doesn't extend past the blanking period.
	ldh a, [rSTAT]
	and %10 ; mask for non-V-blank/non-H-blank STAT mode
	jr z, TransferPalColorLCDEnabled	;repeat if still in h-blank or v-blank
; Wait for H-blank or V-blank to begin.
.notInBlankingPeriod
	ldh a, [rSTAT]
	and %10 ; mask for non-V-blank/non-H-blank STAT mode
	jr nz, .notInBlankingPeriod
; fall through
TransferPalColorLCDDisabled:
; Transfer a palette color while the LCD is disabled.
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	ld [de], a
	ret
	
_UpdateGBCPal_BGP:: ;shinpokerednote: gbcnote: code from pokemon yellow
	;prevent the BGmap from updating during vblank 
	;because this is going to take a frame or two in order to fully run
	;otherwise a partial update (like during a screen whiteout) can be distracting
	ld hl, hFlagsFFFA
	set 1, [hl]
	ld hl, wGBCBasePalPointers
	ld b, NUM_ACTIVE_PALS
	ld c, 0
.loopBuffer
	push hl
	push bc
	ld d, 0
	ld e, c
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	xor a ; CONVERT_BGP
	call DMGPalToGBCPal
	pop bc
	push bc
	ld a, c
	call BufferBGPPal	; Copy wGBCPal to palette indexed in wBGPPalsBuffer.
	pop bc
	pop hl
	inc c
	dec b
	jr nz, .loopBuffer
	call TransferBGPPals	;Transfer wBGPPalsBuffer contents to rBGPD
	ld hl, hFlagsFFFA	;re-allow BGmap updates
	res 1, [hl]
	ret

; d = which one
;_UpdateSpecificGBCPal_BGP::
;	ld hl, hFlagsFFFA
;	set 1, [hl]
;	ld c, d
;	ld hl, wGBCBasePalPointers
;	ld d, 0
;	ld e, c
;	add hl, de
;	add hl, de
;	ld a, [hli]
;	ld e, a
;	ld d, [hl]
;	xor a ; CONVERT_BGP
;	push bc
;	call DMGPalToGBCPal
;	pop bc
;	ld a, c
;	call BufferBGPPal	; Copy wGBCPal to palette indexed in wBGPPalsBuffer.
;	call TransferBGPPals	;Transfer wBGPPalsBuffer contents to rBGPD
;	ld hl, hFlagsFFFA	;re-allow BGmap updates
;	res 1, [hl]
;	ret

_UpdateGBCPal_OBP:: ;shinpokerednote: gbcnote: code from pokemon yellow
; d then c = CONVERT_OBP0 or CONVERT_OBP1
; Sunsette: buffer all 4 OBJ palettes, then flush in a SINGLE V-blank (was per-H-blank
; TransferCurOBPData, ~16 scanlines/frame of tearing whenever this fired with the overworld's
; now-distinct OBJ palettes -> the random "infinite flicker" + extreme slowdown).
	ld a, d
	ld c, a
DEF index = 0
	REPT NUM_ACTIVE_PALS
		ld a, [wGBCBasePalPointers + index * 2]
		ld e, a
		ld a, [wGBCBasePalPointers + index * 2 + 1]
		ld d, a
		ld a, c
		call DMGPalToGBCPal
		push bc ; BufferBGPPal clobbers c (its byte counter); preserve the OBP0/OBP1 convert mode
		ld a, index
		call BufferBGPPal
		pop bc
DEF index = index + 1
	ENDR
	ld a, c
	dec a
	rlca
	rlca ; a = 0 (OBP0 -> OBJ slots 0-3) or 4 (OBP1 -> OBJ slots 4-7)
	call TransferOBPPalsFromBuffer
	ret
	
;shinpokerednote: gbcnote: new function
TranslatePalPacketToBGMapAttributes::
; translate the SGB pals for blk packets into something usable for the GBC
	push hl
	pop de
	ld hl, PalPacketPointers
	ld a, [hli]
	ld c, a
.loop
	ld a, e
.innerLoop
	cp [hl]
	jr z, .checkHighByte
	inc hl
	inc hl
	dec c
	jr nz, .innerLoop
	ret
.checkHighByte
; the low byte of pointer matched, so check the high byte
	inc hl
	ld a, d
	cp [hl]
	jr z, .foundMatchingPointer
	inc hl
	dec c
	jr nz, .loop
	ret
.foundMatchingPointer
	push de
	ld d, c
	callfar LoadBGMapAttributes
	pop de
	ret

;shinpokerednote: gbcnote: pointers from pokemon yellow
PalPacketPointers::
	db (palPacketPointersEnd - palPacketPointers) / 2
palPacketPointers:
	dw BlkPacket_WholeScreen
	dw BlkPacket_Battle
	dw BlkPacket_StatusScreen
	dw BlkPacket_Pokedex
	dw BlkPacket_Slots
	dw BlkPacket_PureTitlescreen
	dw BlkPacket_NidorinoIntro
	dw wPartyMenuBlkPacket
	dw wTrainerCardBlkPacket
	dw BlkPacket_GameFreakIntro
	dw BlkPacket_Celadon
	dw BlkPacket_PokemonMiddleScreenBox
palPacketPointersEnd:

; Sunsette: CopySGBBorderTiles removed (SGB border 2BPP->4BPP conversion).

;shinpokerednote: gbcnote: This function loads the palette for a given pokemon index in wCurPartySpecies into a specified palette register on the GBC
;d = CONVERT_OBP0, CONVERT_OBP1, or CONVERT_BGP
;e = palette register # (0 to 7)
;if wCurPartySpecies has bit 7 set, then it the address holds a specific palette instead of a 'mon
TransferMonPal:
	ldh a, [hGBC]
	and a
	ret z 
	ld a, e
	push af
	ld a, d
	push af
	ld a, [wCurPartySpecies]
	cp NUM_POKEMON_INDEXES+2
	jr c, .isMon
	sub NUM_POKEMON_INDEXES+2
.back	
	call GetGBCBasePalAddress
	pop af
	cp CONVERT_BGP
	push af
	call DMGPalToGBCPal
	pop af
	jr z, .do_bgp
	pop af
	jp TransferCurOBPData
.do_bgp
	pop af
	jp TransferCurBGPData
.isMon	
	call DeterminePaletteIDOutOfBattle
	jr .back



INCLUDE "data/sgb/sgb_packets.asm"

INCLUDE "data/pokemon/palettes.asm"
INCLUDE "data/pokemon/alt_palettes.asm"

INCLUDE "data/sgb/sgb_palettes.asm"
; Sunsette: SGB2 and both GBC base-palette tables removed - everything uses SuperPalettes (SGB1) now.
; gbc_palettes.asm is kept only for its GBC_OGPalettes duochromatic defaults.
INCLUDE "data/gbc/gbc_palettes.asm"
; Sunsette: data/sgb/sgb_border.asm removed (SGB border graphics + palettes)

;shinpokerednote: ADDED: This is a function specifically for translating the default pokeyellow pals into the GBC color buffer
;DE is passed-in containing the address of a pal pattern...like FadePal4 or something
BufferAllPokeyellowColorsGBC::
	call .BGP0to3Loop
	call .OBP0to3Loop
	jp .OBP4to7Loop	
	
.BGP0to3Loop
	ld hl, wGBCFullPalBuffer
	xor a
.BGP0to3Loop_back
	call .readwriteinc
	cp 16
	jr c, .BGP0to3Loop_back
	ret

.OBP0to3Loop
	ld hl, wGBCFullPalBuffer+64
	ld a, 32
	inc de
.OBP0to3Loop_back
	call .readwriteinc
	cp 48
	jr c, .OBP0to3Loop_back
	ret

.OBP4to7Loop
	ld hl, wGBCFullPalBuffer+96
	ld a, 48
	inc de
.OBP4to7Loop_back
	call .readwriteinc
	cp 64
	jr c, .OBP4to7Loop_back
	ret

.readwriteinc
	ld [wGBCColorControl], a
	push de
	push hl
	call .ReadMasterPals	;get the color into DE
	pop hl
	ld a, 2
	ldh [rWBK], a ; switch to gbc wram bank 2 (wGBCFulPalBuffer is stored in gbc wram bank 2 instead of the default one)
	ld a, d
	ld [hli], a		;buffer high byte
	ld a, e
	ld [hli], a		;buffer low byte	
	xor a
	ldh [rWBK], a ; switch back to default wram bank
	pop de
	ld a, [wGBCColorControl]
	inc a
	ret

.ReadMasterPals
;first grab the correct base palette from wGBCBasePalPointers
;the offset of the correct pointer corresponds to double the value of bits 2 and 3 of the wGBCColorControl value
	push de ;need the value in DE for later because it holds the pal pattern like FadePal4 or something

	and %00001100
	rrca
	rrca
	ld d, 0
	ld e, a
	ld a, [wOptions2]
	and %11
	jr nz, .notOG
	ld a, [wGBCColorControl]
	bit 5, a
	ld hl, GBC_OGPalettes_BGOBJ1
	jr z, .gotPointer
	ld a, [wGBCColorControl]
	and %11100
	cp %100
	jr z, .gotPointer
	ld hl, GBC_OGPalettes_OBJ0
	jr .gotPointer
.notOG
	ld hl, wGBCBasePalPointers
	add hl, de
	add hl, de
	
;load the low byte of the pointer address
	ld a, [hli]
	ld e, a
;load the high byte of the pointer address
	ld a, [hli]
	ld d, a
;point HL to the base pal address
	ld h, d
	ld l, e
.gotPointer
	
	pop de ;get the pal pattern back
	ld a, [de]
	;now put the pattern in E and make D zero
	ld d, 0
	ld e, a

;need to look at the last two bits of wGBCColorControl to determine which hardware pal color is desired
	ld a, [wGBCColorControl]
	and %00000011
	jr z, .zero
	cp 1
	jr z, .one
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	
;roll the bits to get the correct base pal color number for the hardware pal color number
.zero
	sla e
	rl d
	sla e
	rl d
.one
	sla e
	rl d
	sla e
	rl d
.two
	sla e
	rl d
	sla e
	rl d
.three
	sla e
	rl d
	sla e
	rl d

;mask out all but the last two bits of D to get the base pal color number in A
	ld a, d
	and %00000011
	
;colors are 2 bytes, so double A to make it an offset and store back into DE
	add a
	ld d, 0
	ld e, a

;add DE to HL to make HL point to the desired base pal color number
	add hl, de

;load the low byte of the color
	ld a, [hli]
	ld e, a
;load the high byte of the color
	ld a, [hli]
	ld d, a
	
	ret