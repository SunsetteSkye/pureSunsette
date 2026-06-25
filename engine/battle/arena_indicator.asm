; Sunsette: ADDED - per-arena status indicator. During the idle action menu (FIGHT/ITEM/...), draw a
; 2-row x 4-tile glyph block in the bottom-left of the battle box (cols 1-4, rows 15-16) telegraphing
; the current map/area's "arena effect" (see engine/battle/volcano_battle_init.asm + critical_hit.asm
; + core.asm's Saffron item lock for the effects themselves). Uses the custom font glyphs in
; gfx/font/font.png rows 5-6 (tile IDs $c0-$df). callfar'd from DisplayBattleMenu right after the menu
; box is drawn, so it re-appears every time we return to idle (a battle message overwrites it; the
; next menu redraw restores it). Most maps have no effect and draw nothing.
;
; Self-contained floating SECTION: newCode (where the arena logic lives) is full, so this rides in any
; bank with room and is reached by callfar. Glyph legend ($c0-$df, font.png rows 5-6):
;   $c0 IT  $c1 EM  $c2 NO  $c3 CR  $c4 AC  $c5 IC  $c6 RG  $c7 BR
;   $c8 SH  $c9 OC  $ca GR  $cb OW  $cc TH  $cd DA  $ce RK  $cf WI
;   $d0 AT  $d1 K   $d2 DE  $d3 F   $d4 SP  $d5 D   $d6 C   $d7 FO
;   $d8 E   $d9 up  $da H2  $db O   $dc PS  $dd ND  $de ??  $df down
SECTION "Sunsette Arena Indicator", ROMX

DrawArenaBattleIndicator::
	ld a, [wBattleType]
	and a
	ret nz ; standard battle menu only (the safari ball-game + old-man tutorial have their own menus)
	call .pickStandard ; carry set + de -> 8-byte glyph block if this map has an indicator
	ret nc
	hlcoord 1, 15
	call .copyRow
	hlcoord 1, 16
.copyRow:
	ld c, 4
.copyLoop:
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .copyLoop
	ret

; carry set + de -> indicator block if the current map/area has one; carry clear = none.
.pickStandard:
	; 1) discrete arena maps (gyms / Elite Four / final rival / irradiated tower B1F)
	ld hl, ArenaIndicatorMapTable
	ld a, [wCurMap]
	ld b, a
.search:
	ld a, [hl]
	cp $FF
	jr z, .notInTable
	cp b
	jr z, .foundTable
	inc hl
	inc hl
	inc hl
	jr .search
.foundTable:
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	scf
	ret
.notInTable:
	; 2) volcano tileset -> BRN
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .volcano
	; 3) Pokemon Tower 3F-7F black mist -> PSN
	ld a, [wCurMap]
	cp POKEMON_TOWER_3F
	jr c, .notTower
	cp POKEMON_TOWER_7F + 1
	jr c, .towerPsn
.notTower:
	; 4) Silph Co. (any floor) -> CRAMPED!  (same piecewise range as CheckSilphDebuff)
	ld a, [wCurMap]
	cp SILPH_CO_1F
	jr z, .silph
	cp SILPH_CO_2F
	jr c, .notSilph
	cp SILPH_CO_8F + 1
	jr c, .silph
	cp SILPH_CO_9F
	jr c, .notSilph
	cp SILPH_CO_ELEVATOR + 1
	jr c, .silph
.notSilph:
	; 5) Safari Zone outdoor maps -> WIND (battle safari modes only; the classic ball-game uses
	;    BATTLE_TYPE_SAFARI and never reaches this picker)
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	jr c, .notSafari
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	jr c, .wind
.notSafari:
	; 6) surfing (non-volcano) -> H2O
	ld a, [wWalkBikeSurfState]
	cp 2
	jr z, .surf
	; 7) flash-off dark cave -> DARK / ACC down (full-dark == 6, Diglett half-dark == 3)
	ld a, [wDarkCaveSnapshot]
	cp 6
	jr z, .darkdn
	cp 3
	jr z, .darkdn
	and a ; nothing to draw
	ret
.volcano:
	ld de, ArenaInd_Brn
	scf
	ret
.towerPsn:
	ld de, ArenaInd_Psn
	scf
	ret
.silph:
	ld de, ArenaInd_Cramped
	scf
	ret
.wind:
	ld de, ArenaInd_Wind
	scf
	ret
.surf:
	ld de, ArenaInd_H2O
	scf
	ret
.darkdn:
	ld de, ArenaInd_DarkAcc
	scf
	ret

ArenaIndicatorMapTable:
	db PEWTER_GYM
	dw ArenaInd_FoeSpc
	db CERULEAN_GYM
	dw ArenaInd_H2OSpd
	db VERMILION_GYM
	dw ArenaInd_FoeAtk
	db CELADON_GYM
	dw ArenaInd_Psn
	db FUCHSIA_GYM
	dw ArenaInd_Huh
	db SAFFRON_GYM
	dw ArenaInd_NoItem
	db CINNABAR_GYM
	dw ArenaInd_FoeSpc
	db VIRIDIAN_GYM
	dw ArenaInd_FoeCrit
	db FIGHTING_DOJO
	dw ArenaInd_FoeDef
	db AGATHAS_ROOM
	dw ArenaInd_FoeSpc
	db LANCES_ROOM
	dw ArenaInd_Lance
	db BRUNOS_ROOM
	dw ArenaInd_NoCrit
	db LORELEIS_ROOM
	dw ArenaInd_Ice
	db CHAMPIONS_ROOM
	dw ArenaInd_FoeCrit
	db POKEMON_TOWER_B1F
	dw ArenaInd_Huh
	db VIRIDIAN_FOREST
	dw ArenaInd_ForestDef
	db $FF

; each block: 4 tiles top row (@ col1,row15) then 4 tiles bottom row (@ col1,row16); " " ($7f) = blank.
ArenaInd_FoeSpc:
	db $d7,$d8," "," " ; FO E
	db $d4,$d6,$d9," " ; SP C up
ArenaInd_FoeAtk:
	db $d7,$d8," "," " ; FO E
	db $d0,$d1,$d9," " ; AT K up
ArenaInd_H2OSpd:
	db $da,$db," "," " ; H2 O
	db $d4,$d5,$d9," " ; SP D up
ArenaInd_FoeCrit:
	db $d7,$d8," "," " ; FO E
	db $c3,$c0,$d9," " ; CR IT up
ArenaInd_FoeDef:
	db $d7,$d8," "," " ; FO E
	db $d2,$d3,$d9," " ; DE F up
ArenaInd_ForestDef:
	db $ca,$cb,$cc," " ; GR OW TH = GROWTH
	db $d2,$d3,$d9," " ; DE F up = DEF^
ArenaInd_Psn:
	db $dc,$dd," "," " ; PS ND = PSND
	db " "," "," "," "
ArenaInd_Huh:
	db $de," "," "," " ; ??
	db " "," "," "," "
ArenaInd_NoItem:
	db $c2,$c0,$c1," " ; NO IT EM
	db " "," "," "," "
ArenaInd_Ice:
	db $c5,$d8," "," " ; IC E
	db " "," "," "," "
ArenaInd_NoCrit:
	db $c2,$c3,$c0," " ; NO CR IT
	db $d7,$d8," "," " ; FO E
ArenaInd_Brn:
	db $c7,$dd," "," " ; BR ND = BRND
	db " "," "," "," "
ArenaInd_Lance:
	db $d7,$d8,$d4,$d5 ; FO E SP D
	db "+",$c4,$d6,$d9 ; + AC C up
ArenaInd_Cramped:
	db "CRAM"
	db "PED!"
ArenaInd_DarkAcc:
	db $cd,$ce," "," " ; DA RK = DARK
	db $c4,$d6,$df," " ; AC C down
ArenaInd_Wind:
	db $cf,$dd," "," " ; WI ND = WIND
	db " "," "," "," "
ArenaInd_H2O:
	db $da,$db," "," " ; H2 O
	db " "," "," "," "

; Sunsette: WIND arena effect on the outdoor Safari Zone maps (the underlying effect for the WIND
; indicator above), active only in the battle safari modes (RANGER_HUNT / FREE_ROAM) - the CLASSIC
; ball-game has no real battle. An energizing wind buffs BOTH sides' mons by type, announced once at
; battle start: a FLYING/FLOATING mon rides it for +1 ACCURACY and +1 SPEED; a grounded mon soaks it
; up as the FLOURISH regen; a grounded GRASS mon drinks it in twice as hard (FLOURISH + DOUBLE_FLOURISH
; = 1/8-per-turn). CheckSafariWindEnemy is callfar'd from CheckInitSpecialBattleEffect (battle start -
; prints the line, buffs the wild mon); CheckSafariWindPlayer is callfar'd from each player send-out
; (silent, buffs your mon, so switch-ins ride the wind too). Lives here because newCode is full; the
; stat-ups go through StatModifierUpEffect (WRAM-driven) since callfar would clobber ApplyStatUpToTarget's
; b/c args.
CheckSafariWindEnemy::
	call WindGate
	ret nz
	ld hl, WindSeedsText
	rst _PrintText ; announce once (the wild mon appears before the player's first send-out)
	xor a ; target = enemy (wild mon)
	jr WindApplyToTarget

CheckSafariWindPlayer::
	call WindGate
	ret nz
	ld a, 1 ; target = player (silent - the line already fired at battle start)
	jr WindApplyToTarget

; z if the wind applies (wild battle, non-classic safari, an outdoor safari map); nz otherwise.
WindGate:
	ld a, [wIsInBattle]
	dec a ; wild battle == 1
	ret nz
	ld a, [wSafariType]
	and a
	jr z, .no ; SAFARI_TYPE_CLASSIC -> the ball-game has no real battle
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	jr c, .no
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	jr nc, .no
	xor a ; z = applies
	ret
.no
	or 1 ; nz = doesn't apply
	ret

; a = target (0 = enemy/wild mon, 1 = player mon). Applies the type-based wind buff to that mon, silently.
WindApplyToTarget:
	ld b, a ; b = target
	and a
	ld hl, wEnemyMonType1
	jr z, .gotTypes
	ld hl, wBattleMonType1
.gotTypes
	ld a, [hli]
	ld d, a ; type1
	ld a, [hl]
	ld e, a ; type2
	ld a, d
	cp FLYING
	jr z, .airborne
	cp FLOATING
	jr z, .airborne
	ld a, e
	cp FLYING
	jr z, .airborne
	cp FLOATING
	jr z, .airborne
.grounded
	; FLOURISH (BattleStatus3) on this side
	ld a, b
	and a
	ld hl, wEnemyBattleStatus3
	jr z, .gotS3
	ld hl, wPlayerBattleStatus3
.gotS3
	set FLOURISH, [hl]
	; a grounded GRASS mon also gets DOUBLE_FLOURISH (BattleStatus2) - the wind seeds it twice as hard
	ld a, d
	cp GRASS
	jr z, .grass
	ld a, e
	cp GRASS
	ret nz
.grass
	ld a, b
	and a
	ld hl, wEnemyBattleStatus2
	jr z, .gotS2
	ld hl, wPlayerBattleStatus2
.gotS2
	set DOUBLE_FLOURISH, [hl]
	ret
.airborne
	ld c, ACCURACY_UP1_EFFECT
	call WindStatUp
	ld c, SPEED_UP1_EFFECT
	; fall through to WindStatUp (b still = target)

; b = target (0 enemy/1 player), c = a *_UP1_EFFECT. Silent +1 stat via StatModifierUpEffect (no
; animation, default "rose!" line suppressed). Preserves b across the bankswitch.
WindStatUp:
	push bc
	ldh a, [hWhoseTurn]
	push af
	ld a, b
	and a
	jr nz, .player
	ld a, 1
	ldh [hWhoseTurn], a       ; enemy's turn -> StatModifierUpEffect raises the enemy's OWN stat
	xor a
	ld [wEnemyMoveNum], a      ; dodge the Minimize/substitute path
	ld a, c
	ld [wEnemyMoveEffect], a
	jr .apply
.player
	xor a
	ldh [hWhoseTurn], a        ; player's turn -> raises the player's OWN stat
	ld [wPlayerMoveNum], a
	ld a, c
	ld [wPlayerMoveEffect], a
.apply
	ld a, 1
	ld [wRegionalStatRiseTextID], a ; suppress the default "X's STAT rose!" line
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect
	xor a
	ld [wRegionalStatRiseTextID], a
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	pop bc
	ret

WindSeedsText:
	text_far _WindSeedsText
	text_end
