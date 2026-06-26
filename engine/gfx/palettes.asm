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
	; Sunsette: during the intro the player's mon isn't loaded yet (wBattleMonSpecies == 0) - color the back
	; sprite (slot 2) from the override palette instead of treating 0 as a species.
	ld a, [wBattleMonSpecies]
	and a
	jr nz, .playerHasMon
	ld a, [wPlayerBackSpritePalette]
	ld b, a
	jr .override
.playerHasMon
	ld a, [wPlayerBattleStatus3]
	ld hl, wBattleMonSpecies
	call DeterminePaletteID
	ld b, a
	ld a, [wBattleMonFlags] ; Sunsette: bit 1 = WATERIFY soak -> PAL_CYANMON; bit 2 = CONVERSION recolor -> wPlayerConvertPalette
	bit 1, a
	jr z, .checkConvertPlayer
	ld b, PAL_CYANMON
	jr .override
.checkConvertPlayer
	bit 2, a
	jr z, .checkGrayPlayer
	ld a, [wPlayerConvertPalette]
	ld b, a
	jr .override
.checkGrayPlayer
	bit 3, a ; Sunsette: SKITTERMIND -> PAL_MINDWIPE (all-gray)
	jr z, .checkGlowPlayer
	ld b, PAL_MINDWIPE
	jr .override
.checkGlowPlayer
	bit 4, a ; Sunsette: transform moves (SUPERNOVA etc.) -> PAL_GAMEFREAK (super-saiyan glow); OROCLASM no longer glows
	jr z, .override
	ld b, PAL_GAMEFREAK
.override
	ld a, [wEnemyMonFlags]
	and 1 ; only the 1st bit of the flags determines alt palette
	ld [wIsAltPalettePkmn], a
	; Sunsette: while the enemy trainer pic is up (trainer battle + no enemy mon loaded, wEnemyMonSpecies2 == 0
	; - true during the intro AND the post-battle scroll) color slot 3 from the trainer-pic override.
	ld a, [wWasTrainerBattle]
	and a
	jr z, .enemyHasMon
	ld a, [wEnemyMonSpecies2]
	and a
	jr nz, .enemyHasMon
	ld a, [wEnemyTrainerPicPalette]
	ld c, a
	jr .gotEnemyPal
.enemyHasMon
	ld a, [wEnemyBattleStatus3]
	ld hl, wEnemyMonSpecies2
	call DeterminePaletteID
	ld c, a
	ld a, [wEnemyMonFlags] ; Sunsette: bit 1 = WATERIFY soak -> PAL_CYANMON; bit 2 = CONVERSION recolor -> wEnemyConvertPalette
	bit 1, a
	jr z, .checkConvertEnemy
	ld c, PAL_CYANMON
	jr .gotEnemyPal
.checkConvertEnemy
	bit 2, a
	jr z, .checkGrayEnemy
	ld a, [wEnemyConvertPalette]
	ld c, a
	jr .gotEnemyPal
.checkGrayEnemy
	bit 3, a ; Sunsette: SKITTERMIND -> PAL_MINDWIPE (all-gray)
	jr z, .checkGlowEnemy
	ld c, PAL_MINDWIPE
	jr .gotEnemyPal
.checkGlowEnemy
	bit 4, a ; Sunsette: transform moves (SUPERNOVA etc.) -> PAL_GAMEFREAK (super-saiyan glow); OROCLASM no longer glows
	jr z, .gotEnemyPal
	ld c, PAL_GAMEFREAK
.gotEnemyPal
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
; Sunsette: the player back-sprite (slot 2) is colored from wPlayerBackSpritePalette - PAL_PLAYER, or PAL_REDBAR
; in the volcano (lava suit) / PAL_BLUEMON in the scuba event - and the enemy trainer pic (slot 3) from
; wEnemyTrainerPicPalette (by raw class). SetPal_Battle uses these while no real mon is loaded, with no fake
; "species" sentinels squatting in species ID space. The overrides persist through slide-off / send-out via
; their wBattleMonSpecies==0 / wEnemyMonSpecies2==0 conditions there.
	ld a, [wCurMapTileset]
	cp VOLCANO
	ld a, PAL_REDBAR
	jr z, .gotBack
	CheckEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	ld a, PAL_BLUEMON
	jr nz, .gotBack
	ld a, PAL_PLAYER
.gotBack
	ld [wPlayerBackSpritePalette], a
	ld a, [wIsInBattle]
	cp $2
	jr nz, .doCommand
	call DetermineTrainerPaletteID
	ld [wEnemyTrainerPicPalette], a
.doCommand
	ld d, SET_PAL_BATTLE
	jp RunPaletteCommand

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

; Sunsette: ADDED (pass 2): per-species party-menu icon colors. For each visible
; party member, look up its ICON palette (icon shading, NOT the battle-sprite
; shading) from IconPalettes / IconPalettesAlt by dex number, and load it into an
; OBJ palette slot. A table entry of $FF means "use the mon's battle palette"
; (DeterminePaletteIDOutOfBattle). We use slots 2..7 (one per row, up to
; PARTY_LENGTH = 6) because GBPalNormal refreshes only OBJ slots 0/1 - so our icon
; colors survive it. Each row's 4 OAM sub-sprites are tagged with attr = that slot.
; GBC only; on DMG/SGB the OAM attrs stay $00 and icons keep the menu palette.
; Called from RedrawPartyMenu_ after GBPalNormal.
LoadPartyIconPalettes::
	ldh a, [hGBC]
	and a
	ret z
	ld a, [wPartyCount]
	and a
	ret z
	; Sunsette FIX: build each icon's CRAM with an IDENTITY OBP0 mapping so pixel
	; value v -> base color v. GBPalNormal (called just before us) leaves
	; rOBP0 = %11010000, which folds value 1 -> white and never selects shade 2 -
	; so base color 2 (the distinguishing accent) is discarded and every icon
	; washes to white/white/<color1>/black (e.g. Squirtle reads identical to
	; Charmander). DMGPalToGBCPal CONVERT_OBP0 reads the live rOBP0, so force the
	; identity here and restore it on exit (register has no direct GBC render
	; effect; this only governs the conversion + wLastOBP0 bookkeeping).
	ldh a, [rOBP0]
	push af
	ld a, %11100100 ; $E4 identity: value v -> shade v
	ldh [rOBP0], a
	xor a
	ldh [hPartyIconPalIdx], a
.loop
	; alt-palette flag from this mon's stored flags (bit 0) -> hIconAltFlag
	ld hl, wPartyMon1Flags
	ld bc, wPartyMon2Flags - wPartyMon1Flags
	ldh a, [hPartyIconPalIdx]
	call AddNTimes
	ld a, [hl]
	and 1
	ldh [hIconAltFlag], a
	; species index for this row -> hIconSpecies
	ld hl, wPartySpecies
	ldh a, [hPartyIconPalIdx]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ldh [hIconSpecies], a
	; species index -> dex number (for the icon tables)
	ld [wPokedexNum], a
	call IndexToPokedex
	ld a, [wPokedexNum]
	ld c, a
	ld b, 0
	; pick the table for this variant
	ld hl, IconPalettes
	ldh a, [hIconAltFlag]
	and a
	jr z, .gotTable
	ld hl, IconPalettesAlt
.gotTable
	add hl, bc
	ld a, [hl] ; icon PAL_*, or $FF = use battle palette
	cp $FF
	jr nz, .gotPal
	; battle fallback (honors alt flag + alt-palette option)
	ldh a, [hIconAltFlag]
	ld [wIsAltPalettePkmn], a
	ldh a, [hIconSpecies]
	call DeterminePaletteIDOutOfBattle
.gotPal
	call GetGBCBasePalAddress           ; de = base palette address
	ld a, CONVERT_OBP0
	call DMGPalToGBCPal                  ; wGBCPal = converted colors
	ldh a, [hPartyIconPalIdx]
	add 2                                ; OBJ slot = row + 2
	call TransferCurOBPData
	call SetPartyIconOAMAttr             ; tag this row's OAM sub-sprites
	ldh a, [hPartyIconPalIdx]
	inc a
	ldh [hPartyIconPalIdx], a
	ld b, a
	ld a, [wPartyCount]
	cp b
	jr nz, .loop
	pop af
	ldh [rOBP0], a ; restore the menu's OBP0 mapping
	ret

; Sunsette: write attr byte (= row+2, the OBJ palette slot) into the 4 OAM entries
; of party row [hPartyIconPalIdx], in both the live shadow OAM and the saved copy
; the icon animation flips between. Each row is OBJ_SIZE*4 = 16 bytes; attr is the
; 4th byte of each 4-byte entry.
SetPartyIconOAMAttr:
	ldh a, [hPartyIconPalIdx]
	swap a ; row * 16 (row is 0..5, so no high-nibble overflow)
	ld c, a
	ld b, 0
	ldh a, [hPartyIconPalIdx]
	add 2
	ld d, a ; attr value
	ld hl, wShadowOAM + 3
	add hl, bc
	call .write4
	ld hl, wMonPartySpritesSavedOAM + 3
	add hl, bc
.write4
	ld a, d
	ld [hl], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, d
	ld [hl], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, d
	ld [hl], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, d
	ld [hl], a
	ret

; Sunsette: load the FLY carrier's icon palette into OBJ slot 1 (the player's overworld sprite
; slot), so the fly-animation bird-icon renders in that species' colors. Mirrors one iteration
; of LoadPartyIconPalettes. GBC only. Reads wFlyCarrierMon.
LoadFlyCarrierOWPalette::
	ldh a, [hGBC]
	and a
	ret z
	ld a, [wFlyCarrierMon]
	cp PARTY_LENGTH
	ret nc ; $ff / invalid -> leave slot 1 as-is (defensive; caller guarantees validity)
	; alt-palette flag from this mon's stored flags (bit 0); a = party index = AddNTimes count
	ld hl, wPartyMon1Flags
	ld bc, wPartyMon2Flags - wPartyMon1Flags
	call AddNTimes
	ld a, [hl]
	and 1
	ld [wIsAltPalettePkmn], a
	; species index for this party row
	ld a, [wFlyCarrierMon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	; species -> dex number for the icon tables
	ld [wPokedexNum], a
	call IndexToPokedex
	ld a, [wPokedexNum]
	ld c, a
	ld b, 0
	ld hl, IconPalettes
	ld a, [wIsAltPalettePkmn]
	and a
	jr z, .gotTable
	ld hl, IconPalettesAlt
.gotTable
	add hl, bc
	ld a, [hl] ; icon PAL_*, or $FF = use battle palette
	cp $FF
	jr nz, .gotPal
	; battle fallback: re-read the carrier's species (honors wIsAltPalettePkmn, still set)
	ld a, [wFlyCarrierMon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	call DeterminePaletteIDOutOfBattle
.gotPal
	call GetGBCBasePalAddress
	ld a, CONVERT_OBP0
	call DMGPalToGBCPal
	ld a, 1
	jp TransferCurOBPData ; OBJ palette slot 1 = player overworld sprite

; Sunsette: restore the normal player overworld OBJ palette (slot 1) after a fly-in, so the
; landed player isn't left tinted in the flyer's colors. Fly-ins always land walking on an
; outdoor town, so PAL_PLAYEROW is correct (the volcano/surf player tints can't occur here).
RestorePlayerOWPalette::
	ldh a, [hGBC]
	and a
	ret z
	ld a, PAL_PLAYEROW
	call GetGBCBasePalAddress
	ld a, CONVERT_OBP0
	call DMGPalToGBCPal
	ld a, 1
	jp TransferCurOBPData

; Sunsette: per-dex icon palette tables (in this bank so LoadPartyIconPalettes can
; read them with a near load). $FF = use battle palette.
INCLUDE "data/pokemon/icon_palettes.asm"

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

; PureRGBnote: ADDED: palette for the ported Surfing Pikachu minigame (intro + gameplay).
; Ocean-blue sea (slot 0, drawn via rBGP) + Pikachu-yellow sprite (OBJ slots 1-3). Whole-screen
; block so the entire sea uses slot 0; the minigame remaps slot 0 via rBGP for its wave shading.
SetPal_SurfingPikachuMinigame:
	ld hl, PalPacket_SurfingPikachu
	ld de, BlkPacket_WholeScreen
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
	ld [wXfadeLastPal], a ; Sunsette: remember this map's palette so the next seam fade can pick its tween
	; Sunsette: player overworld OBJ color (slot 1): volcano = lava suit (PAL_REDBAR_OW); else
	; surfing = blue (PAL_BLUEMON_OW); else normal (PAL_PLAYEROW).
	ld a, [wCurMapTileset]
	cp VOLCANO
	ld a, PAL_REDBAR_OW
	jr z, .playerOWPal
	ld a, [wWalkBikeSurfState]
	cp 2 ; surfing?
	ld a, PAL_BLUEMON_OW
	jr z, .playerOWPal
	ld a, PAL_PLAYEROW
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
	; Sunsette: while on the bike outdoors, the whole overworld uses PAL_ROUTE (uniform - no per-area tint
	; and no transitions while you're zipping around). Getting off the bike reasserts the real area palette.
	; Sunsette: "bike outdoors -> PAL_ROUTE" is disabled (commented out); the world keeps its real
	; per-area palette on the bike. Re-enable this block (and the bike-toggle fade in item_effects, and
	; the bike/run snap in XfadeConnectionPalettePrep) to bring the bike palette behavior back.
;	ld a, [wWalkBikeSurfState]
;	cp BIKING
;	jr nz, .notBiking
;	ld a, [wStatusFlags6]
;	bit BIT_ALWAYS_ON_BIKE, a
;	jr nz, .notBiking ; forced-bike maps (Cycling Road) keep their own palette, not PAL_ROUTE
;	ld a, [wCurMap]
;	cp FIRST_INDOOR_MAP
;	jr nc, .notBiking ; indoors -> normal lookup
;	ld a, PAL_ROUTE
;	ret
.notBiking
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

;;;;;;;;;; Sunsette: connection-crossing palette CROSSFADE
; Sunsette: outdoor palette crossfade. At a connection cross, wCurMap is already the NEW map and slot 0
; still shows the OLD colors. Instead of snapping, we queue a fade (wXfadePending) and leave the old
; colors in slot 0; XfadeTick - driven once per frame from OverworldLoop - marches slot 0 toward the new
; palette WHILE the player keeps walking (non-blocking, no pause). LoadGBPal skips its per-frame BGP
; rebuild while rBGP is unchanged, so the marched slot isn't clobbered mid-fade.
; Sunsette: stamp wXfadeLastPal = the CURRENT overworld map's palette index, so the seam crossfade compare
; (XfadeStartToCurrentPalette) has the correct "leaving" palette to test against. Called every step from
; CheckMapConnections, where wCurMap is still the map being LEFT. SetPal_Overworld only stamps this on a full
; map load, so after a battle/menu it could go stale - and a stale value made a same-palette seam (Route 3
; <-> Route 4, both PAL_HIGHLAND) wrongly fade in one direction. Re-stamping each step keeps it accurate.
StampOverworldPaletteForXfade::
	call GetOverworldPalette
	ld [wXfadeLastPal], a
	ret

XfadeConnectionPalettePrep::
	; Sunsette: seam crossings always fade now - the only thing that disables it is the GBC FADE option
	; (checked inside XfadeStartToCurrentPalette). The bike/run "snap at speed" guard is commented out
	; below; re-enable it if the non-blocking fade reads as a stutter while moving fast.
	jp XfadeStartToCurrentPalette
;	ld a, [wWalkBikeSurfState]
;	cp BIKING
;	jr z, .forceSnap
;	ldh a, [hJoyHeld]
;	and PAD_B
;	jr z, XfadeStartToCurrentPalette ; not running -> normal fade-or-snap
;.forceSnap
;	xor a
;	ld [wXfadePending], a
;	ld d, SET_PAL_OVERWORLD
;	jp RunPaletteCommand

; Sunsette: queue a crossfade of slot 0 from its current colors to the CURRENT map's overworld palette
; (GetOverworldPalette). Snaps instead if the GBC FADE option is off or the palette is unchanged. Also
; called by the bike on/off toggle, so mounting/dismounting eases between the area palette and PAL_ROUTE.
XfadeStartToCurrentPalette::
	ld a, [wOptions2]
	bit BIT_GBC_FADE, a
	jr z, .snap
	call GetOverworldPalette
	ld [wXfadeTargetPal], a
	; Sunsette: if the map we're entering uses the SAME palette index as the one we're leaving (e.g. Route 3
	; <-> Route 4, both PAL_HIGHLAND), there's nothing to fade - snap. This index check is the reliable test:
	; the colour compare below pits the RAW SuperPalettes entry against the LIVE slot-0 buffer, but slot 0 is
	; the GBC-processed palette and never byte-matches the raw table, so same-palette seams would otherwise
	; "fade" by marching between two representations of identical colours (a visible flicker). wXfadeLastPal is
	; the palette of the map being left (stamped by SetPal_Overworld; the new map's hasn't run yet here).
	ld b, a
	ld a, [wXfadeLastPal]
	cp b
	jr z, .snap
	call XfadeTargetColorsPtr ; hl = target colors
	ld de, wBGPPalsBuffer ; current slot 0 (live)
	ld b, 8
.cmp
	ld a, [de]
	cp [hl]
	jr nz, .differ
	inc de
	inc hl
	dec b
	jr nz, .cmp
	; identical palette (or fade disabled) -> snap, no fade
.snap
	xor a
	ld [wXfadePending], a
	ld d, SET_PAL_OVERWORLD
	jp RunPaletteCommand
.differ
	ld a, 1
	ld [wXfadePending], a ; leave current colors in slot 0; XfadeTick marches them
	xor a
	ld [wXfadeParity], a   ; divider countdown 0 -> first tick marches immediately
	ld [wXfadePhase], a    ; default: no tween (phase 0 = march straight to the target)
	; Sunsette: look up a precomputed midpoint "tween" palette for this pair (leaving -> entering). If one
	; exists, the march goes current->tween->target (two vivid linear legs that approximate a hue arc),
	; avoiding the muddy gray straight-line midpoint. No match -> single straight march (graceful fallback).
	ld a, [wXfadeLastPal]
	ld b, a
	ld a, [wXfadeTargetPal]
	ld c, a
	call XfadeFindTween    ; carry set + hl = 8 tween colour bytes if the pair matched
	ret nc
	ld de, wXfadeTweenColors
	ld c, 8
.copyTween
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyTween
	ld a, 1
	ld [wXfadePhase], a    ; phase 1: ease to the tween first, then to the real target
	ret

; hl = &SuperPalettes[wXfadeTargetPal] (the new map's 4 colors, 8 bytes)
XfadeTargetColorsPtr:
	ld a, [wXfadeTargetPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl ; * 8 (PAL_SIZE)
	ld de, SuperPalettes
	add hl, de
	ret

; Sunsette: find the precomputed midpoint tween for a palette pair. In: b, c = the two palette IDs.
; Out: carry SET + hl -> the 8 tween colour bytes if the {b,c} pair (either order) is in the table; carry
; CLEAR if not. Each row = [palA, palB] then 8 colour bytes (RGB555 x4); table ends with db -1.
XfadeFindTween:
	ld hl, XfadeTweenTable
.row
	ld a, [hl]
	cp -1
	jr z, .none
	ld d, a       ; d = row palA
	inc hl
	ld e, [hl]    ; e = row palB
	inc hl        ; hl -> this row's 8 colour bytes
	ld a, d
	cp b
	jr nz, .swapped
	ld a, e
	cp c
	jr z, .found  ; (palA,palB) == (b,c)
	jr .nextRow
.swapped
	ld a, d
	cp c
	jr nz, .nextRow
	ld a, e
	cp b
	jr z, .found  ; (palA,palB) == (c,b)
.nextRow
	ld a, l       ; advance hl past the 8 colour bytes to the next row
	add 8
	ld l, a
	jr nc, .row
	inc h
	jr .row
.found
	scf
	ret
.none
	and a         ; clear carry
	ret

; NOTE: these RGB rows are NOT the palette-colour source. They are seam-fade
; tween midpoints only. Every live PAL_* colour lives in `SuperPalettes` in
; data/sgb/sgb_palettes.asm - that is THE ONLY file that matters for palette colours.
; Sunsette: precomputed HSV-midpoint "tween" palettes for the outdoor seams whose two zones differ in
; palette. The fade eases current -> tween -> target (two straight linear legs), so the colour follows the
; hue arc instead of the gray straight line. Hand-tunable DATA: edit any row's colours to taste, or delete
; a row to make that seam a plain straight dissolve. Row = [palA, palB] then RGB(colour0..3). Either order.
XfadeTweenTable:
	db PAL_PALLET, PAL_ROUTE
	RGB 31,31,31, 31,28,24, 16,27,29, 00,00,00
	db PAL_VIRIDIAN, PAL_HIGHLAND
	RGB 31,31,31, 22,27,15, 19,21,14, 00,00,00
	db PAL_VIRIDIAN, PAL_PEWTER
	RGB 31,31,31, 22,25,18, 10,19,19, 00,00,00
	db PAL_PEWTER, PAL_HIGHLAND ; routed through green (not magenta)
	RGB 31,31,31, 22,24,19, 15,25,15, 00,00,00
	db PAL_CERULEAN, PAL_ROUTE
	RGB 31,31,31, 19,30,26, 13,27,20, 00,00,00
	db PAL_CERULEAN, PAL_HIGHLAND
	RGB 31,31,31, 17,28,20, 25,27,16, 00,00,00
	db PAL_ROUTE, PAL_VERMILION
	RGB 31,31,31, 25,30,11, 16,27,29, 00,00,00
	db PAL_HIGHLAND, PAL_LAVENDER ; through purple (heading into a purple town)
	RGB 31,31,31, 20,28,19, 28,15,26, 00,00,00
	db PAL_LAVENDER, PAL_VERMILIONGOLD
	RGB 31,31,31, 20,31,12, 16,22,30, 00,00,00
	db PAL_LAVENDER, PAL_ROUTE
	RGB 31,31,31, 22,31,23, 12,22,28, 00,00,00
	db PAL_ROUTE, PAL_CELADON
	RGB 31,31,31, 19,30,21, 16,27,29, 00,00,00
	db PAL_ROUTE, PAL_FUCHSIA
	RGB 31,31,31, 31,28,19, 16,27,29, 00,00,00
	db PAL_VERMILIONGOLD, PAL_FUCHSIA
	RGB 31,31,31, 31,12,09, 20,26,31, 00,00,00
	db PAL_FUCHSIA, PAL_VERMILION
	RGB 31,31,31, 30,08,07, 20,26,31, 00,00,00
	db PAL_VERMILION, PAL_CINNABAR
	RGB 31,31,31, 28,12,03, 20,26,31, 00,00,00
	db PAL_CINNABAR, PAL_FUCHSIA
	RGB 31,31,31, 28,10,13, 20,26,31, 00,00,00
	db PAL_FUCHSIA, PAL_PALLET
	RGB 31,31,31, 31,20,27, 20,26,31, 00,00,00
	db -1

; Sunsette: advance the queued crossfade by ONE step (LINEAR RGB channel march), called from OverworldLoop
; right after DelayFrame - i.e. in VBlank, so the direct slot-0 write needs no busy-wait. Marches each of
; slot 0's 12 colour channels one notch toward the current phase's target, writes slot 0 straight to rBGPD.
; TWO-PHASE when a tween exists: phase 1 marches current->tween, phase 0 marches ->the real new palette;
; each linear leg is a vivid chord of the hue arc, so the pair never crosses the muddy gray straight line.
; (The HSV hue-blend variant is shelved in _attempts/; the HSV helpers below are now unused.)
DEF XFADE_FRAME_DIVIDER EQU 6 ; advance one step every N overworld frames (higher = slower)
XfadeTick::
	ld a, [wXfadeParity] ; frame-divider countdown
	and a
	jr z, .march
	dec a
	ld [wXfadeParity], a
	ret ; skip this frame
.march
	ld a, XFADE_FRAME_DIVIDER - 1
	ld [wXfadeParity], a
	ld hl, wBGPPalsBuffer ; current slot 0 -> wBuffer[0..11]
	ld de, wBuffer
	call XfadeUnpack4
	; pick this phase's target: phase 1 = the tween palette, phase 0 = the real new palette
	ld a, [wXfadePhase]
	and a
	jr z, .toTarget
	ld hl, wXfadeTweenColors
	jr .gotTarget
.toTarget
	call XfadeTargetColorsPtr
.gotTarget
	ld de, wBuffer + 12
	call XfadeUnpack4 ; target -> wBuffer[12..23]
	call XfadeMarchChannels ; one notch per channel; a (z) = converged
	push af
	ld hl, wBuffer
	ld de, wBGPPalsBuffer
	call XfadeRepack4 ; update slot 0 in the buffer so it persists between frames
	xor a
	or $80 ; auto-increment, BG palette index 0
	ldh [rBGPI], a
	ld hl, wBGPPalsBuffer
	ld c, PAL_SIZE
.write
	ld a, [hli]
	ldh [rBGPD], a
	dec c
	jr nz, .write
	pop af
	and a
	ret nz ; this phase not converged yet - next frame continues
	; this phase converged
	ld a, [wXfadePhase]
	and a
	jr z, .finalize
	xor a
	ld [wXfadePhase], a ; phase 1 done (reached the tween) -> now march to the real new palette
	ret
.finalize
	; converged on the real palette: end the fade and snap every slot to it
	xor a
	ld [wXfadePending], a
	ld d, SET_PAL_OVERWORLD
	jp RunPaletteCommand

; march each of the 12 channels in wBuffer[0..11] one step toward wBuffer[12..23]. a (z) = none changed.
XfadeMarchChannels:
	ld hl, wBuffer ; current channels
	ld de, wBuffer + 12 ; target channels
	ld c, 12
	ld b, 0 ; "something changed" flag
.ch
	ld a, [de]
	cp [hl]
	jr z, .next
	jr c, .dec ; target < current
	inc [hl]
	ld b, 1
	jr .next
.dec
	dec [hl]
	ld b, 1
.next
	inc hl
	inc de
	dec c
	jr nz, .ch
	ld a, b
	and a
	ret

; unpack 4 packed 15-bit colors (hl, 8 bytes) into 12 channel bytes R,G,B per color (de)
XfadeUnpack4:
	call XfadeUnpackColor
	call XfadeUnpackColor
	call XfadeUnpackColor
	jp XfadeUnpackColor
XfadeUnpackColor: ; hl=src(lo,hi)+=2 ; de=dst(R,G,B)+=3 ; color = %0BBBBBGGGGGRRRRR
	ld a, [hli]
	ld c, a ; lo
	ld a, [hli]
	ld b, a ; hi
	ld a, c
	and $1F ; R = lo & $1F
	ld [de], a
	inc de
	inc de ; -> B slot
	ld a, b
	srl a
	srl a
	and $1F ; B = (hi >> 2) & $1F
	ld [de], a
	dec de ; -> G slot
	ld a, b
	and $03
	add a
	add a
	add a ; (hi & 3) << 3
	ld b, a
	ld a, c
	srl a
	srl a
	srl a
	srl a
	srl a ; lo >> 5
	or b ; G
	ld [de], a
	inc de
	inc de ; -> next color
	ret

; repack 12 channel bytes (hl) into 4 packed colors (de, 8 bytes)
XfadeRepack4:
	call XfadeRepackColor
	call XfadeRepackColor
	call XfadeRepackColor
	jp XfadeRepackColor
XfadeRepackColor: ; hl=src(R,G,B)+=3 ; de=dst(lo,hi)+=2
	ld a, [hli]
	ld c, a ; R
	ld a, [hli]
	ld b, a ; G
	and $07
	swap a
	rlca ; (G & 7) << 5
	or c ; | R
	ld [de], a ; lo
	inc de
	ld a, [hl] ; B
	add a
	add a ; B << 2
	ld c, a
	ld a, b
	srl a
	srl a
	srl a ; G >> 3
	or c ; (B << 2) | (G >> 3)
	ld [de], a ; hi
	inc de
	inc hl ; -> next color
	ret
;;;;;;;;;;

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
	db OAKS_LAB, PAL_PEWTER ; Sunsette: Oak's Lab uses Pewter City's palette
	db MT_MOON_B2F, PAL_MTMOONB2F ; Sunsette: only B2F; B1F/1F fall through to the CAVERN tileset's PAL_CAVE, so it clears when you go back up
	; Sunsette: Safari Zone (the 4 outdoor encounter areas) use PAL_SAFFRON
	db SAFARI_ZONE_EAST, PAL_SAFFRON
	db SAFARI_ZONE_NORTH, PAL_SAFFRON
	db SAFARI_ZONE_WEST, PAL_SAFFRON
	db SAFARI_ZONE_CENTER, PAL_SAFFRON
;;;;;;;;;; Sunsette: environment palette overhaul
	; Forest palette
	db ROUTE_2, PAL_VIRIDIAN ; Sunsette: Route 2 shares VIRIDIAN CITY's palette (no crossfade at the Viridian/Route 2 seam)
	db VIRIDIAN_FOREST, PAL_FOREST
	db CELADON_GYM, PAL_FOREST
	; Highland palette
	db ROUTE_3, PAL_HIGHLAND
	db ROUTE_4, PAL_HIGHLAND ; Sunsette: Mt. Moon sits in the MIDDLE of Route 4, so Route 4 is highland too
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
	db ROUTE_19, PAL_VERMILION
	db ROUTE_20, PAL_VERMILION
	; Vermilion-gold palette (Vermilion w/ Saffron's gold instead of orange)
	db ROUTE_12, PAL_VERMILIONGOLD
	db ROUTE_13, PAL_VERMILIONGOLD
	db ROUTE_14, PAL_VERMILIONGOLD
	db ROUTE_15, PAL_VERMILIONGOLD
	; Fuchsia palette
	db ROUTE_21, PAL_FUCHSIA
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
	cp $FE ; Sunsette: $FE = PAL_SHADOW (evolution morph silhouette)
	ld a, PAL_SHADOW
	jr z, .next
	ld a, e
	call DeterminePaletteIDOutOfBattle
.next
	ld [wPalPacket + 1], a
	ld hl, wPalPacket
	ld de, BlkPacket_WholeScreen
	ret

; Sunsette: like SetPal_PokemonWholeScreen, but only the TOP of the screen gets the mon palette (slot 0,
; selector in e: species / $FF=PAL_BLACK / $FE=PAL_SHADOW). The bottom textbox rows get a fixed
; PAL_EVOTEXTBOX (slot 1, white bg + black lines) via BlkPacket_EvolutionSplit, so the textbox never
; palette-jumps as the morph swaps slot 0. (PAL_BLACK's mid shade is gray, which made the box frame gray.)
; Self-contained (farcall-safe, arg in e survives the bankswitch).
_SetPalEvolutionSplit::
	ld a, [wOnSGB]
	and a
	ret z
	push de
	ld hl, PalPacket_Empty
	ld de, wPalPacket
	ld bc, $10
	rst _CopyData
	pop de
	ld a, e
	cp $FF
	ld a, PAL_BLACK
	jr z, .gotMonPal
	ld a, e
	cp $FE
	ld a, PAL_SHADOW
	jr z, .gotMonPal
	ld a, e
	call DeterminePaletteIDOutOfBattle
.gotMonPal
	ld [wPalPacket + 1], a ; slot 0 = mon (top)
	ld a, PAL_EVOTEXTBOX ; Sunsette: white bg + black lines (PAL_BLACK's mid shade is gray, which made the box frame gray)
	ld [wPalPacket + 3], a ; slot 1 = fixed textbox palette (bottom)
	ld hl, wPalPacket
	ld de, BlkPacket_EvolutionSplit
	jp SendSGBPackets

; Sunsette: evolution morph palette cycle - recolour ONLY slot 0 (the mon area; the textbox keeps its
; PAL_BLACK slot 1) through a short list of bright palettes for a "superstar invincibility" strobe while
; the silhouette flips. Cheap: no full packet resend, no rBGP/brightness change - just overwrite the 8
; bytes of slot 0 in wBGPPalsBuffer and push them V-blank-safe via TransferBGPPals. The step index lives
; in wEvoMorphPalIndex (advanced + wrapped each call). The morph's region/attribute map was already set by
; the initial EvolutionSetWholeScreenPalette, so the colours land on the morphing mon.
DEF EVOLUTION_MORPH_NUM_PALS EQU 4
EvolutionMorphCyclePalette::
	ld a, [wEvoMorphPalIndex]
	inc a
	cp EVOLUTION_MORPH_NUM_PALS
	jr c, .store
	xor a
.store
	ld [wEvoMorphPalIndex], a
	; hl = EvolutionMorphPalettes + index -> PAL_* for this step
	ld e, a
	ld d, 0
	ld hl, EvolutionMorphPalettes
	add hl, de
	ld a, [hl]
	; hl = SuperPalettes + a * PAL_SIZE
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl ; * 8 (PAL_SIZE)
	ld de, SuperPalettes
	add hl, de
	; copy the 8 bytes into slot 0 of the live BG buffer
	ld de, wBGPPalsBuffer
	ld c, PAL_SIZE
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	jp TransferBGPPals ; V-blank-safe flush of all 4 slots (only slot 0 changed)

; bright palettes the morph rotates through (rainbow-ish, superstar feel); colour index 0 of each is
; white so the .done white-out flash still reads as white.
EvolutionMorphPalettes:
	db PAL_YELLOWMON
	db PAL_PINKMON
	db PAL_CYANMON
	db PAL_GREENMON

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
	; PureRGBnote: ADDED: SET_PAL_CELADON ($13) is defined but never used and had no
	; table slot; this placeholder keeps the table parallel with the constants so the
	; two Surfing Pikachu entries land on their correct indices.
	dw SetPal_Generic                ; SET_PAL_CELADON (unused placeholder)
	dw SetPal_SurfingPikachuMinigame ; SET_PAL_SURFING_PIKACHU_TITLE
	dw SetPal_SurfingPikachuMinigame ; SET_PAL_SURFING_PIKACHU_MINIGAME

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
; Sunsette (trainer/species decouple): this table is now SPECIES-only (the SPIRIT_* special mons). Trainer
; palettes moved to TrainerCustomPalettes (keyed by raw class), and the player-back-sprite intro palette is no
; longer a fake "species" sentinel - it's resolved directly into wPlayerBackSpritePalette. This keeps the
; species ID space clean so it can grow.
NonMonCustomPalettes:
	db SPIRIT_TORCHED, PAL_VOLCANO
	db SPIRIT_CHUNKY, PAL_MEWMON
	db SPIRIT_PAINLESS, PAL_PINKMON ; whitemon?
	db SPIRIT_IRRADIATED, PAL_SAFARIBALL
	db SPIRIT_THE_MAW, PAL_REALLY_REDMON
	db -1

; Sunsette: enemy trainer intro/scroll pic palettes, keyed by RAW trainer class. Classes not listed here
; default to PAL_MEWMON (see DetermineTrainerPaletteID), the generic "most people" trainer color (Giovanni/
; Bruno/Oak + all generic trainers). Battle order [white, light, dark, black], same as their fronts.
TrainerCustomPalettes:
	db BROCK, PAL_BROCK
	db MISTY, PAL_REDBAR
	db LT_SURGE, PAL_GREENBAR
	db ERIKA, PAL_REDBAR
	db KOGA, PAL_KOGA
	db SABRINA, PAL_REDBAR
	db BLAINE, PAL_REDBAR
	db LORELEI, PAL_REDBAR
	db AGATHA, PAL_GRAYMON
	db LANCE, PAL_REDBAR
	db RIVAL1, PAL_RIVAL
	db RIVAL2, PAL_RIVAL
	db RIVAL3, PAL_RIVAL
	db ROCKET_QUEEN, PAL_ROCKETSISTER
	db -1

; Sunsette: resolve the enemy trainer pic palette (slot 3) from the RAW trainer class in wTrainerClass.
; Unlisted classes -> PAL_MEWMON. Replaces feeding class+OPP_ID_OFFSET through the species palette resolver.
DetermineTrainerPaletteID:
	ld a, [wTrainerClass]
	ld hl, TrainerCustomPalettes
	ld de, 2
	call IsInArray
	jr nc, .default
	inc hl
	ld a, [hl]
	ret
.default
	ld a, PAL_MEWMON
	ret

SpecialMonCustomPalettes:
	db HARDENED_ONIX, PAL_CRYSTALMON, PAL_AMBERMON
	db WINTER_DRAGONAIR, PAL_CYANMON, PAL_BLUSHMON
	db ARMORED_MEWTWO, PAL_ARMORMON, PAL_GAMEFREAK
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
	ld a, [wPokedexNum]    ; Sunsette: anything past the species index range is a non-mon palette request
	cp NUM_POKEMON_INDEXES + 1 ; (was cp OPP_ID_OFFSET; trainer classes no longer reach here - they use DetermineTrainerPaletteID)
	jr nc, .trainerDefault ; -> default PAL_MEWMON; rises automatically as NUM_POKEMON_INDEXES grows
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
	dw BlkPacket_EvolutionSplit ; Sunsette: first entry -> reverse-maps to BGMapAttributesPointers index 12
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
TransferAnimPal:: ; Sunsette: like TransferMonPal, but wCurPartySpecies holds a RAW palette ID (no
; NUM_POKEMON_INDEXES+2 offset). That offset overflows the 1-byte var for high palette IDs (the ball
; palettes), which then get read as a Pokemon species -> wrong colors. d = CONVERT_*, e = pal slot.
	ldh a, [hGBC]
	and a
	ret z
	ld a, e
	push af
	ld a, d
	push af
	ld a, [wCurPartySpecies]
	jr TransferMonPal.back

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

; Sunsette: the full per-mon/per-map colour set lives in SuperPalettes (above).
; The two tables below are the ONLY thing the old data/gbc/gbc_palettes.asm held,
; so they were inlined here (where they're used) and that file was deleted.
; They are the original "duochromatic" GBC colours displayed with no per-object
; coloring: one palette for BG + OBJ1, one for OBJ0. Loaded by the routines just
; above and below this point (search GBC_OGPalettes_*).
GBC_OGPalettes_BGOBJ1:
IF DEF(_RED)
	RGB 31,31,31, 31,16,16, 18,07,07, 00,00,00 ; BG, OBJ1
ENDC
IF DEF(_BLUE)
	RGB 31,31,31, 12,20,31, 00,00,31, 00,00,00 ; BG, OBJ1
ENDC
IF DEF(_GREEN)
	RGB 31,31,31, 15,31,06, 00,16,00, 00,00,00 ; BG, OBJ1
ENDC

GBC_OGPalettes_OBJ0:
IF DEF(_RED)
	RGB 31,31,31, 15,31,06, 00,16,00, 00,00,00 ; OBJ0
ENDC
IF DEF(_BLUE)
	RGB 31,31,31, 31,16,16, 18,07,07, 00,00,00 ; OBJ0
ENDC
IF DEF(_GREEN)
	RGB 31,31,31, 12,20,31, 00,00,31, 00,00,00 ; OBJ0
ENDC
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