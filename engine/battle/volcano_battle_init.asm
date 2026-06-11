; PureRGBnote: ADDED: function used in some special battles where some effect happens each turn.
; like in the volcano, each turn you have a non fire/rock/ground pokemon out they will get burned if they aren't burned.
CheckPerTurnSpecialBattleEffect::
	ld a, [wCurMapTileset]
	cp VOLCANO
	jp z, .volcano
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	; pokemon tower b1f code
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_IRRADIATED
	ret nz
.irradiated
	ldh a, [hWhoseTurn]
	push af
	call .checkPlayerPoisonable
	jr c, .radiationSpreads
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .dontPoisonIrradiated
.radiationSpreads
	ld hl, .radiationSpreadsText
	rst _PrintText
	ld a, RADIATION_ANIM
	call SpecialBattleEffectDoAnimation
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .dontPoisonIrradiated
	xor a
	ldh [hWhoseTurn], a
	set PSN, a
	ld [wEnemyMonStatus], a
	ld hl, .autoPoisonedEnemy
	rst _PrintText
	callfar DrawEnemyHUDAndHPBar
.dontPoisonIrradiated
	ld a, 1
	ldh [hWhoseTurn], a
	call .checkPlayerPoisonable
	jr nc, .noPoison
	; automatically badly poison the player
	ld hl, wBattleMonStatus
	set PSN, [hl]
	ld hl, wPlayerBattleStatus3
	set BADLY_POISONED, [hl]
	ld hl, wPlayerToxicCounter
	ld [hl], 0
	ld hl, .autoPoisoned
	rst _PrintText
	callfar ReadPlayerMonCurHPAndStatus
	callfar DrawPlayerHUDAndHPBar
.noPoison
	ld hl, .growsLarger
	rst _PrintText
	SetFlag FLAG_SKIP_STAT_ANIMATION
	call .random0to5
	ld b, a
	ld a, ATTACK_UP2_EFFECT
	add b ; random stat up 2 stages
	ld [wEnemyMoveEffect], a
	push bc
	callfar StatModifierUpEffect
	pop bc
.random0to5NotSameOne
	call .random0to5
	cp b
	jr z, .random0to5NotSameOne
	ld c, a
	ld a, ATTACK_DOWN1_EFFECT
	add c ; random stat down 1 stage
	ld [wPlayerMoveEffect], a
	ld a, $FF ; 100%
	ld [wPlayerMoveAccuracy], a
	xor a
	ldh [hWhoseTurn], a
	callfar StatModifierDownEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret
.checkPlayerPoisonable
	ld a, [wBattleMonStatus]
	and a
	jr nz, .no
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .no
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .no
	scf
	ret
.no
	and a
	ret
.random0to5
	call Random
	and %111 ; number between 0 and 7
	cp 6
	jr nc, .random0to5 ; reroll if the result was 6 or 7 because we want only 6 options
	ret
.volcano
	; in the volcano, the player pokemon is burned if it's not FIRE, GROUND or ROCK
	ld a, [wBattleMonType1]
	cp FIRE
	ret z
	cp GROUND
	ret z
	cp ROCK
	ret z
	ld a, [wBattleMonType2]
	cp FIRE
	ret z
	cp GROUND
	ret z
	cp ROCK
	ret z
	ld a, [wBattleMonStatus]
	and a
	ret nz ; don't do anything if already has a status
	ld hl, .volcanoTooHot
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	ld a, 1
	ldh [hWhoseTurn], a ; force enemy turn so player's stats are lowered
	ld de, wBattleMonStatus
	callfar AutoBurnEffect
	callfar ReadPlayerMonCurHPAndStatus
	pop af
	ldh [hWhoseTurn], a
	ret
.volcanoTooHot
	text_far _VolcanoBattleBurnText
	text_end
.autoPoisonedEnemy
	text_far _PoisonedText
	text_end
.autoPoisoned
	text_far _BadlyPoisonedText
	text_end
.radiationSpreadsText
	text_far _IrradiatedBattleInitText
	text_end
.growsLarger
	text_far _IrradiatedGrowsLarger
	text_end

; PureRGBnote: ADDED: when battle starts in special battles something can happen, for example moltres in the volcano gets powered up by magma.
CheckInitSpecialBattleEffect::
	call CheckWildGrowthHealingMap ; Sunsette: ADDED: growth-healing maps give wild mons the GROWING regen
	call CheckWildConfuseRayPalette ; Sunsette: ADDED: CONFUSE RAY makes the next wild mon use its alt palette
	call CheckWildSurfSpeedDebuff ; Sunsette: ADDED: SURF -1 SPEED on the wild mon (non-Water/Flying)
	call CheckWildDarknessAccuracyDebuff ; Sunsette: ADDED: dark-cave (Flash off) -2 ACCURACY on the wild mon
	call CheckDarkCaveBattleIntro ; Sunsette: ADDED: "It's too dark to see!" warning in flash-off dark caves
	ld a, [wCurMapTileset]
	cp VOLCANO
	jr z, .volcano
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
.pokemonTowerB1F
	ldh a, [hWhoseTurn]
	push af
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_TORCHED
	jr z, .torched
	cp SPIRIT_PAINLESS
	jr z, .painless
	; the maw
	jr .resetWhoseTurn
.painless
	ld hl, .painlessText
	rst _PrintText
	jr .resetWhoseTurn
.torched
	ld hl, .onFire
	rst _PrintText
	ld de, wEnemyMonStatus
	callfar AutoBurnEffect ; burn torched
	ld a, 1
	ldh [hWhoseTurn], a ; raise enemy mon's special
	call .maxSpecial
	jr .resetWhoseTurn
.volcano
	CheckEitherEventSet EVENT_BATTLING_VOLCANO_MAGMAR, EVENT_BATTLING_MOLTRES
	ret z ; returns if neither set
	; magmar gets buffs when the battle starts for a little bit more interesting battle
	ld hl, .poweredUp
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	ld a, FIRE_PILLAR_ANIM
	call SpecialBattleEffectDoAnimation
	ld a, 3 ; make it really hard to catch so you can't just catch the pokemon to proceed
	ld [wEnemyMonActualCatchRate], a
	; max out its special and defense
	call .maxSpecial
	ld a, MAX_STAT_LEVEL - 2
	ld [wEnemyMonDefenseMod], a
	ld a, DEFENSE_UP2_EFFECT
	ld [wEnemyMoveEffect], a
	callfar StatModifierUpEffect
.resetWhoseTurn
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret	
.maxSpecial
	SetFlag FLAG_SKIP_STAT_ANIMATION
	ld a, MAX_STAT_LEVEL - 2
	ld [wEnemyMonSpecialMod], a
	ld a, SPECIAL_UP2_EFFECT
	ld [wEnemyMoveEffect], a
	jpfar StatModifierUpEffect
.poweredUp
	text_far _MagmarBattleInit
	text_end
.onFire
	text_far _TorchedOnFire
	text_end
.painlessText
	text_far _PainlessBattleInitText
	text_end

; Sunsette: ADDED: on "growth-healing" maps, wild Pokemon enter battle with the GROWING
; status (Growth's leftovers-like 1/16-per-turn regen) and announce "It's full of energy!".
; Active on the 4 outdoor Safari Zone maps ($D9-$DC). Wild battles only (trainers unaffected).
CheckWildGrowthHealingMap:
	ld a, [wIsInBattle]
	dec a ; wild battle == 1
	ret nz
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	ret c
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	ret nc
.arm
	ld hl, wEnemyBattleStatus3
	set GROWING, [hl]
	; Sunsette: announce it here (after the flag is set). This runs in CheckInitSpecialBattleEffect,
	; which fires AFTER "Wild X appeared!" but before the battle menu - same slot as the volcano/tower
	; effect texts. (The earlier attempt in PrintBeginningBattleText ran before GROWING was set.)
	ld hl, .fullOfEnergyText
	rst _PrintText
	ret
.fullOfEnergyText
	text_far _FullOfEnergyText
	text_end

; Sunsette: ADDED: if CONFUSE RAY armed the current map (wUnusedMapVariable, set from the field
; menu and auto-cleared on map change), make this wild mon appear in its alternate palette by
; setting bit 0 of wEnemyMonFlags (read by SET_PAL_BATTLE -> AltMonsterPalettes). Consumes the
; flag so only this one encounter is affected. Note: the alt palette itself still respects the
; player's BIT_ALT_PKMN_PALETTES option. Wild battles only.
CheckWildConfuseRayPalette:
	ld a, [wIsInBattle]
	dec a ; wild battle == 1
	ret nz
	ld hl, wUnusedMapVariable
	bit 0, [hl] ; bit 0 = CONFUSE RAY armed
	ret z
	res 0, [hl] ; consume: next encounter only
	ld hl, wEnemyMonFlags
	set 0, [hl]
	ret

; Sunsette: ADDED: after the player sends out a mon at the START of battle, certain maps buff it.
; VIRIDIAN_FOREST: a Grass-type player mon gets +1 DEFENSE with the custom "The FOREST..." line.
; This affects the PLAYER's mon only (never wild/enemy mons). Battle-start send-out only; switching
; a mon in mid-battle does not re-trigger it. Called via callfar from StartBattle.
ApplyPlayerSendOutMapEffects::
	ld hl, wBattleMonFlags ; Sunsette: a freshly sent-out mon isn't WATERIFY-soaked; clear the blue flag (bit 1)
	res 1, [hl]
	res 2, [hl] ; and isn't CONVERSION-recolored (bit 2) - its types reset to natural on send-out
	res 3, [hl] ; and isn't MINDWIPE-grayed (bit 3)
	ld hl, wPlayerBattleStatus3
	res SOLARBEAM_PRIMED, [hl] ; Sunsette: switching out disarms a charged SolarBeam
	ld a, 1 ; target = player
	call CheckSurfSpeedDebuff ; Sunsette: SURF -1 SPEED on your mon (non-Water/Flying), any map while surfing
	ld a, 1 ; target = player
	call CheckSilphDebuff ; Sunsette: SILPH CO. -1 SPECIAL (Water/Grass) / -1 SPEED (Flying)
	ld a, 1 ; target = player
	call CheckDarknessAccuracyDebuff ; Sunsette: dark-cave (Flash off) -2 ACCURACY on your mon
	ld a, [wCurMap]
	cp VIRIDIAN_FOREST
	jr z, .viridianGrassDefense
	cp CELADON_GYM
	jr z, .celadonSpores
	; Pokemon Tower floors 3F-7F: black mist poisons the PLAYER's mon (the enemy mons here are
	; mostly Poison/Ghost = immune, so the hazard targets you instead).
	cp POKEMON_TOWER_3F
	ret c
	cp POKEMON_TOWER_7F + 1
	ret nc
	ld hl, BlackMistText
	jr .poisonPlayerWithText
.celadonSpores
	ld hl, SporesText
.poisonPlayerWithText
	push hl
	call PoisonPlayerMonIfAble
	pop hl
	ret nc ; immune / already statused -> no effect, no line
	rst _PrintText
	ret
.viridianGrassDefense
	ld a, [wBattleMonType1]
	cp GRASS
	jr z, .grassDefense
	ld a, [wBattleMonType2]
	cp GRASS
	ret nz
.grassDefense
	xor a
	ldh [hWhoseTurn], a       ; player's turn (so <USER> = the player's mon)
	ld [wPlayerMoveNum], a    ; avoid the MINIMIZE substitute path inside StatModifierUpEffect
	ld a, DEFENSE_UP1_EFFECT
	ld [wPlayerMoveEffect], a
	; print our own one-line message, and flag StatModifierUpEffect to skip its default "rose!" line
	ld a, 1
	ld [wRegionalStatRiseTextID], a
	ld hl, .forestDefenseText
	rst _PrintText
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect
	xor a
	ld [wRegionalStatRiseTextID], a ; clear (also covers the no-op/maxed path that skips the text check)
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	ret
.forestDefenseText
	text_far _ViridianForestDefenseText
	text_end

; Sunsette: poison the PLAYER's active mon unless it already has a status or is a POISON/GHOST
; type. Carry set if poison actually landed (so the caller only prints its hazard line when
; something happened). Used by the Celadon/Lavender hazards. We deliberately do NOT redraw the HUD
; here - forcing DrawPlayerHUDAndHPBar at this point in the send-out flow kicks the GBC palette/
; BG-transfer and causes infinite screen flicker. The PSN icon appears on the next natural HUD
; refresh; the poison damage itself ticks normally from the residual-damage loop.
PoisonPlayerMonIfAble:
	ld a, [wBattleMonStatus]
	and a
	jr nz, .no ; can't add a status to an already-statused mon
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .no
	cp GHOST
	jr z, .no
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .no
	cp GHOST
	jr z, .no
	ld hl, wBattleMonStatus
	set PSN, [hl]
	scf
	ret
.no
	and a
	ret

SporesText:
	text_far _CeladonGymBuffText
	text_end
BlackMistText:
	text_far _LavenderTowerMistText
	text_end

; Sunsette: SURF environmental debuff - while the player is surfing (wWalkBikeSurfState == 2), a mon
; entering battle loses 1 SPEED stage unless it is WATER- or FLYING-type. Applies to BOTH sides
; (each mon as it appears). Input a: 0 = debuff the ENEMY mon, 1 = debuff the PLAYER's mon.
CheckSurfSpeedDebuff:
	ld b, a
	ld a, [wWalkBikeSurfState]
	cp 2 ; surfing?
	ret nz
	ld a, [wCurMapTileset]
	cp VOLCANO
	ret z ; don't trigger on the volcano's lava "surfing"
	ld a, b
	and a
	ld hl, wEnemyMonType1
	jr z, .gotTypes
	ld hl, wBattleMonType1
.gotTypes
	ld a, [hli]
	cp WATER
	ret z
	cp FLYING
	ret z
	ld a, [hl]
	cp WATER
	ret z
	cp FLYING
	ret z
	ld c, SPEED_DOWN1_EFFECT
	ld hl, SurfSpeedText
	jp ApplyStatDownWithText

; Sunsette: print a themed ambiance line (hl), then apply a -1 stat-stage effect (c) to target b
; (0=enemy, 1=player). The engine's default "X's STAT fell!" still follows (the Battle Core bank is
; full, so we can't suppress it the way the stat-UP path does); the themed line + "fell" reads fine.
ApplyStatDownWithText:
	push bc
	rst _PrintText ; print the themed line in hl
	pop bc
	jp ApplyStatDownToTarget

; Sunsette: apply a -1 stat-stage effect (c = a *_DOWN1_EFFECT) to one mon (b: 0 = enemy, 1 = player),
; with no animation and bypassing the NPC 25% stat-down miss. NOTE: StatModifierDownEffect lowers the
; OPPONENT of hWhoseTurn, so to hit the ENEMY we run it as the player's turn, and to hit the PLAYER as
; the enemy's turn. hWhoseTurn is saved/restored.
ApplyStatDownToTarget:
	ldh a, [hWhoseTurn]
	push af
	ld a, b
	and a
	jr nz, .playerTarget
	xor a                 ; player's turn -> lowers the ENEMY
	ldh [hWhoseTurn], a
	ld a, c
	ld [wPlayerMoveEffect], a
	jr .apply
.playerTarget
	ld a, 1               ; enemy's turn -> lowers the PLAYER
	ldh [hWhoseTurn], a
	ld a, c
	ld [wEnemyMoveEffect], a
.apply
	SetFlag FLAG_SKIP_STAT_ANIMATION
	SetFlag FLAG_SKIP_NPC_STAT_DOWN_DEBUFF
	callfar StatModifierDownEffect
	ResetFlag FLAG_SKIP_NPC_STAT_DOWN_DEBUFF
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret

; Sunsette: MOCKINGBIRD (was MIRROR MOVE). Instead of copying the foe's last move, it now copies ALL
; of the foe's stat-stage changes onto the user (overwriting the user's stages), recomputes the user's
; battle stats from its OWN base stats with those stages, announces it, then drops the foe's SPECIAL by
; one stage. Reached via `callfar MockingbirdEffect_` from Battle Core (player + enemy move paths).
; hWhoseTurn = the MOCKINGBIRD user; the foe is the opposite side.
MockingbirdEffect_:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatMods ; player's turn -> foe = enemy (source of the stages to copy)
	ld de, wPlayerMonStatMods ; user = player (destination)
	jr z, .gotPtrs
	ld hl, wPlayerMonStatMods
	ld de, wEnemyMonStatMods
.gotPtrs
	ld c, 6 ; the 6 stat stages: Attack, Defense, Speed, Special, Accuracy, Evasion (NUM_STAT_MODS is 8 - it counts 2 trailing padding bytes we don't want to copy)
.copyLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copyLoop
; recompute the USER's modified battle stats (Atk/Def/Spd/Spc) from its OWN unmodified stats + the
; copied stages. wCalculateWhoseStats: 0 = player, nonzero = enemy - same sense as hWhoseTurn.
	ldh a, [hWhoseTurn]
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	ld hl, MockingbirdCopiedText
	rst _PrintText
; then drop the FOE's SPECIAL by 1 (guaranteed, recomputes its stats, prints "fell!"). b = the foe
; side for ApplyStatDownToTarget (0 = enemy, 1 = player): on player's turn the foe is the enemy (0).
	ldh a, [hWhoseTurn]
	and 1 ; 0 on player's turn -> foe = enemy; 1 on enemy's turn -> foe = player
	ld b, a
	ld c, SPECIAL_DOWN1_EFFECT
	call ApplyStatDownToTarget
; ApplyStatDownToTarget left the in-flight move effect as SPECIAL_DOWN1; restore MIRROR_MOVE_EFFECT
; (MOCKINGBIRD) so any post-move bookkeeping sees the real effect.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreEff
	ld hl, wEnemyMoveEffect
.restoreEff
	ld a, MIRROR_MOVE_EFFECT ; MOCKINGBIRD
	ld [hl], a
	ret

MockingbirdCopiedText:
	text_far _MockingbirdText
	text_end

; Sunsette: wild-only wrapper - debuff the wild enemy mon (trainer enemy mons are handled per
; send-out in EnemyOnSendOut, so this stays wild-only to avoid double-hitting a trainer's first mon).
CheckWildSurfSpeedDebuff:
	ld a, [wIsInBattle]
	dec a ; wild battle == 1
	ret nz
	xor a ; target = enemy
	jp CheckSurfSpeedDebuff

; Sunsette: SILPH CO. environmental debuff - on any Silph Co. floor, a mon entering battle that is
; WATER- or GRASS-type loses 1 SPECIAL stage; a FLYING-type loses 1 SPEED stage. BOTH sides. Silph
; has trainers + the player (no wild), so this is called from the player hook and EnemyOnSendOut.
; Input a: 0 = enemy mon, 1 = player mon.
CheckSilphDebuff:
	ld b, a
	ld a, [wCurMap]
	cp SILPH_CO_1F
	jr z, .inSilph
	cp SILPH_CO_2F
	jr c, .notSilph
	cp SILPH_CO_8F + 1
	jr c, .inSilph
	cp SILPH_CO_9F
	jr c, .notSilph
	cp SILPH_CO_ELEVATOR + 1
	jr c, .inSilph
.notSilph
	ret
.inSilph
	ld a, b
	and a
	ld hl, wEnemyMonType1
	jr z, .gotTypes
	ld hl, wBattleMonType1
.gotTypes
	ld a, [hli]
	ld d, a ; type1
	ld a, [hl]
	ld e, a ; type2
	; FLYING takes precedence -> -1 SPEED. A Flying mon does NOT also take the Water/Grass Special drop.
	ld a, d
	cp FLYING
	jr z, .speed
	ld a, e
	cp FLYING
	jr z, .speed
	; otherwise WATER/GRASS -> -1 SPECIAL
	ld a, d
	cp WATER
	jr z, .special
	cp GRASS
	jr z, .special
	ld a, e
	cp WATER
	jr z, .special
	cp GRASS
	jr z, .special
	ret
.special
	ld c, SPECIAL_DOWN1_EFFECT
	ld hl, SilphSpecialText
	jp ApplyStatDownWithText
.speed
	ld c, SPEED_DOWN1_EFFECT
	ld hl, SilphSpeedText
	jp ApplyStatDownWithText

SurfSpeedText:
	text_far _SurfSpeedText
	text_end
SilphSpeedText:
	text_far _SilphSpeedText
	text_end
SilphSpecialText:
	text_far _SilphSpecialText
	text_end

; Sunsette: dark-cave debuff (any Flash-required map - see DarkMaps in overworld.asm) - if the player is in flash-off darkness
; at battle start (wDarkCaveSnapshot == 6; snapshotted from wMapPalOffset in InitBattleVariables), a
; mon entering battle takes -2 ACCURACY unless it is ZUBAT/GOLBAT or a FIGHTING/GROUND/BUG type. BOTH
; sides. Accuracy is a pure stat-mod stage (no recalc), so we set the mod directly (neutral 7 -> 5,
; floored at 1). The debuff is SILENT here (the "It's too dark to see!" warning is printed once per
; battle by CheckDarkCaveBattleIntro - the per-mon debuff would otherwise rarely announce itself,
; since Rock Tunnel's mons - Zubat/Geodude/Onix/Machop - are mostly exempt). Input a: 0 = enemy, 1 = player.
CheckDarknessAccuracyDebuff:
	ld b, a
	ld a, [wDarkCaveSnapshot]
	cp 6 ; full-dark cave -> -2 ACC
	jr z, .isDarkCave
	cp 3 ; Diglett's Cave is only half-dark -> -1 ACC
	ret nz
.isDarkCave
	; exemptions: ZUBAT/GOLBAT species, or FIGHTING/GROUND type (of the target mon)
	ld a, b
	and a
	jr z, .enemy
	ld a, [wBattleMonSpecies]
	ld hl, wBattleMonType1
	jr .checkExempt
.enemy
	ld a, [wEnemyMonSpecies]
	ld hl, wEnemyMonType1
.checkExempt
	cp ZUBAT
	ret z
	cp GOLBAT
	ret z
	ld a, [hli]
	cp FIGHTING
	ret z
	cp GROUND
	ret z
	cp BUG ; Sunsette: BUG types navigate the dark fine too (Viridian Forest dwellers etc.)
	ret z
	ld a, [hl]
	cp FIGHTING
	ret z
	cp GROUND
	ret z
	cp BUG
	ret z
	; -2 in a full-dark cave, -1 in Diglett's half-dark cave (floor at 1)
	ld a, [wDarkCaveSnapshot]
	cp 6
	ld c, 2
	jr z, .gotDebuffAmount
	ld c, 1
.gotDebuffAmount
	ld a, b
	and a
	ld hl, wEnemyMonStatMods
	jr z, .gotMods
	ld hl, wPlayerMonStatMods
.gotMods
	ld de, MOD_ACCURACY
	add hl, de
	ld a, [hl]
	sub c
	jr c, .floor
	jr nz, .store
.floor
	ld a, 1
.store
	ld [hl], a
	ret

CheckWildDarknessAccuracyDebuff:
	ld a, [wIsInBattle]
	dec a ; wild battle == 1
	ret nz
	xor a ; target = enemy
	jr CheckDarknessAccuracyDebuff

; Sunsette: dark-cave (Flash off) battle-start warning, printed once per battle regardless of which
; mons are exempt. Called from CheckInitSpecialBattleEffect (all battles).
CheckDarkCaveBattleIntro:
	ld a, [wDarkCaveSnapshot]
	cp 6
	jr z, .tooDark
	cp 3 ; Diglett's Cave half-dark
	ret nz
	ld hl, ABitDarkText
	rst _PrintText
	ret
.tooDark
	ld hl, TooDarkText
	rst _PrintText
	ret

TooDarkText:
	text_far _TooDarkToSeeText
	text_end

ABitDarkText:
	text_far _ABitDarkToSeeText
	text_end

; Sunsette: FLY and DIG raise the USER's EVASION by 1 on the charge turn (callfar'd from ChargeEffect
; in Battle Core, after "flew up!" / "dug a hole!"). We reuse the engine's own StatModifierUpEffect by
; temporarily pointing the user's move effect at EVASION_UP1_EFFECT (and zeroing the move number, which
; dodges StatModifierUpEffect's Minimize/substitute path), with the stat-rise animation suppressed - then
; restore both so turn 2's charged attack still fires normally. hWhoseTurn is already the charging mon.
ChargeMoveEvasionBoost::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .gotPtrs
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.gotPtrs
	ld a, [hl]
	push af ; save the real move effect (FLY_EFFECT / CHARGE_EFFECT)
	ld a, [de]
	push af ; save the real move number
	ld a, EVASION_UP1_EFFECT
	ld [hl], a
	xor a
	ld [de], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect ; +1 EVASION to the user, prints the standard "rose!" line
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	; callfar clobbered hl/de - re-derive the same pointers to restore the saved values
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .restore
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.restore
	pop af
	ld [de], a ; restore move number
	pop af
	ld [hl], a ; restore move effect
	ret

; Sunsette: species-specific bonus applied AFTER certain damaging moves HIT (post-damage, target
; alive). callfar'd from Battle Core's player & enemy SpecialEffects tail; hWhoseTurn = the user.
;   MOLTRES  + SKY_ATTACK -> the GROWING regen state (like FLOURISH) + a 30% burn chance
;   ZAPDOS   + DRILL_PECK -> a 30% paralyze chance
;   ARTICUNO + WHIRLWIND  -> a 30% freeze chance
; The status reuses Battle Core's FreezeBurnParalyzeEffect by temporarily setting the user's move
; EFFECT to the matching *_SIDE_EFFECT2 (= 30%) and its move TYPE so the routine's same-type
; immunity check is right (burn<-FIRE so fire-types are immune, freeze<-ICE so ice-types are
; immune, paralyze<-NORMAL which that routine treats as "affects any type"), then restores both.
SpeciesMoveBonus::
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemy
	ld a, [wBattleMonSpecies]
	ld b, a
	ld a, [wPlayerMoveNum]
	jr .gotBoth
.enemy
	ld a, [wEnemyMonSpecies]
	ld b, a
	ld a, [wEnemyMoveNum]
.gotBoth
	; a = move number, b = user species
	cp SKY_ATTACK
	jr z, .sky
	cp DRILL_PECK
	jr z, .drill
	cp WHIRLWIND
	jr z, .whirl
	ret
.sky
	ld a, b
	cp MOLTRES
	ret nz
	call SetUserGrowing            ; Moltres always gains GROWING when Sky Attack lands
	ld d, BURN_SIDE_EFFECT2
	ld e, FIRE
	jr .applyStatus
.drill
	ld a, b
	cp ZAPDOS
	ret nz
	ld d, PARALYZE_SIDE_EFFECT2
	ld e, NORMAL
	jr .applyStatus
.whirl
	ld a, b
	cp ARTICUNO
	ret nz
	ld d, FREEZE_SIDE_EFFECT2
	ld e, ICE
.applyStatus
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld bc, wPlayerMoveType
	jr z, .gotPtrs
	ld hl, wEnemyMoveEffect
	ld bc, wEnemyMoveType
.gotPtrs
	ld a, [hl]
	push af                        ; save real move effect
	ld a, [bc]
	push af                        ; save real move type
	ld a, d
	ld [hl], a                     ; set the *_SIDE_EFFECT2 status
	ld a, e
	ld [bc], a                     ; set the immunity-check type
	farcall FreezeBurnParalyzeEffect ; 30% roll + status + anim/text
	; farcall clobbered registers - re-derive pointers to restore
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveType
	ld de, wPlayerMoveEffect
	jr z, .restore
	ld hl, wEnemyMoveType
	ld de, wEnemyMoveEffect
.restore
	pop af
	ld [hl], a                     ; restore move type
	pop af
	ld [de], a                     ; restore move effect
	ret

SetUserGrowing:
	ld hl, wPlayerBattleStatus3
	ldh a, [hWhoseTurn]
	and a
	jr z, .got
	ld hl, wEnemyBattleStatus3
.got
	set GROWING, [hl]
	ret

; Sunsette: shared body for HAZE_EFFECT and FLASH_EFFECT - both point at Battle Core's HazeEffect
; trampoline (Battle Core is full, so we can't afford a second one), which jpfar's here. We dispatch on
; the active move effect: FLASH_EFFECT branches to the Flash body below; otherwise it's Haze.
; HAZE: clear all stat changes/statuses via the engine's own HazeEffect_, then roll a 30% flinch. (BLACK HAZE)
; FlinchSideEffect reads the move effect to choose its chance and picks 30% for anything that isn't
; FLINCH_SIDE_EFFECT1 (HAZE_EFFECT qualifies). Tail-jumps, so the final ret returns to HazeEffect's caller.
HazeFlinchEffect_::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .gotEffect
	ld a, [wEnemyMoveEffect]
.gotEffect
	cp FLASH_EFFECT
	jr z, FlashEffect_
	cp SWIFT_EFFECT
	jp z, SwiftEffect_
	cp ACCURACY_DOWN_SIDE_EFFECT
	jp z, GustAccuracyEffect_
	cp SOLARBEAM_EFFECT
	jp z, SolarBeamEffect_
	cp MINDWIPE_EFFECT
	jp z, MindwipeEffect_
	cp ROOST_EFFECT
	jp z, RoostEffect_
	cp JOLT_BOLT_EFFECT
	jp z, JoltBoltEffect_
	callfar HazeEffect_
	jpfar FlinchSideEffect

; FLASH's effect body (reached from HazeFlinchEffect_ above). FLASH deals no damage; the burst of light
; lowers the TARGET's EVASION by 3 stages - a visible -2 ("sharply fell!") through the engine's
; StatModifierDownEffect (with FLAG_SKIP_STAT_ANIMATION so it's guaranteed + skips the anim/accuracy test),
; then a silent -1 poked straight into the target's evasion stat-mod byte (floored at MIN). The 30% flinch
; that follows simulates being momentarily blinded. hWhoseTurn is the FLASH user, so the TARGET is the
; opposite side; FlinchSideEffect reads the move effect to pick its chance, and FLASH_EFFECT (not
; FLINCH_SIDE_EFFECT1) yields 30%, so we restore the real effect before tail-jumping into it.
FlashEffect_::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .gotEffectPtr
	ld hl, wEnemyMoveEffect
.gotEffectPtr
	ld a, EVASION_DOWN2_EFFECT
	ld [hl], a
	SetFlagHL FLAG_SKIP_STAT_ANIMATION ; hl-form (cheaper); hl is free here - the effect was just written, and we re-derive it after the callfar
	callfar StatModifierDownEffect ; -2 EVASION on the target ("sharply fell!" line, no anim, no accuracy check)
	ResetEvent FLAG_SKIP_STAT_ANIMATION
	ldh a, [hWhoseTurn] ; callfar clobbered hl/de - re-derive: effect ptr (user side, in de) + target's evasion mod (in hl)
	and a
	ld de, wPlayerMoveEffect
	ld hl, wEnemyMonEvasionMod ; player's turn -> target is the enemy
	jr z, .restoreEffect
	ld de, wEnemyMoveEffect
	ld hl, wPlayerMonEvasionMod
.restoreEffect
	ld a, FLASH_EFFECT ; restore so FlinchSideEffect rolls 30% (not the 10% of FLINCH_SIDE_EFFECT1)
	ld [de], a
	ld a, [hl] ; silent -1 EVASION to reach -3 total, floored at MIN_STAT_LEVEL (1)
	cp 2
	jr c, .evasionMinned ; already at 1 - can't go lower
	dec [hl]
.evasionMinned
	jpfar FlinchSideEffect

; Sunsette: SWIFT_EFFECT auto-hit moves (Surf/Earthquake/Blizzard/Swift) also get a 30% chance to drop the
; TARGET's EVASION by 1. Reached from the shared HazeEffect trampoline via the HazeFlinchEffect_ dispatcher;
; runs as a post-damage side effect (SWIFT_EFFECT was removed from SpecialEffects so JumpMoveEffect fires).
; We borrow StatModifierDownEffect by temporarily pointing the move effect at EVASION_DOWN1, with
; FLAG_SKIP_STAT_ANIMATION so it skips the accuracy test (guaranteed) + the stat anim. If the target has a
; substitute, StatModifierDownEffect bails to MoveMissed - harmless here, the move already hit so it no-prints.
SwiftEffect_::
	callfar FarBattleRandom ; d = random byte (de survives the bankswitch)
	ld a, d
	cp 30 percent + 1
	ret nc ; 70%: no evasion drop
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .gotPtr
	ld hl, wEnemyMoveEffect
.gotPtr
	ld a, [hl]
	push af ; save the real effect (SWIFT_EFFECT)
	ld a, EVASION_DOWN1_EFFECT
	ld [hl], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierDownEffect ; -1 EVASION on the target ("fell" line, no anim, no accuracy check)
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	ldh a, [hWhoseTurn] ; callfar clobbered hl - re-derive to restore the effect
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restore
	ld hl, wEnemyMoveEffect
.restore
	pop af
	ld [hl], a ; restore SWIFT_EFFECT
	ret

; Sunsette: GUST's post-damage side effect - 30% chance to drop the TARGET's ACCURACY by 1. Mirrors
; SwiftEffect_ exactly but borrows ACCURACY_DOWN1 instead of EVASION_DOWN1. Reached from the shared
; HazeEffect trampoline via HazeFlinchEffect_ (ACCURACY_DOWN_SIDE_EFFECT is kept out of SpecialEffects so
; JumpMoveEffect fires after Gust's damage). Gust is NOT in the SWIFT never-miss list, so it keeps its
; 100% accuracy. Substitute -> StatModifierDownEffect bails to MoveMissed harmlessly (Gust already hit).
GustAccuracyEffect_::
	callfar FarBattleRandom ; d = random byte (de survives the bankswitch)
	ld a, d
	cp 30 percent + 1
	ret nc ; 70%: no accuracy drop
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .gotPtr
	ld hl, wEnemyMoveEffect
.gotPtr
	ld a, [hl]
	push af ; save the real effect (ACCURACY_DOWN_SIDE_EFFECT)
	ld a, ACCURACY_DOWN1_EFFECT
	ld [hl], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierDownEffect ; -1 ACCURACY on the target ("fell" line, no anim, no accuracy check)
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	ldh a, [hWhoseTurn] ; callfar clobbered hl - re-derive to restore the effect
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreGust
	ld hl, wEnemyMoveEffect
.restoreGust
	pop af
	ld [hl], a ; restore ACCURACY_DOWN_SIDE_EFFECT
	ret

; Sunsette: SolarBeam (pseudo-charge). Reached post-damage via the Haze trampoline -> HazeFlinchEffect_.
; The live power was already set by SolarBeamPowerModifier (60/120/90), so the damage step is done; here
; we only handle the after-effects + the priming bit. hWhoseTurn = the user.
;   FIRE-type user           -> 1/3 recoil to the user (DefaultRecoilEffect_) + a 30% burn. Never primes.
;   non-fire, primed         -> the release: a 30% burn, then disarm the primed bit.
;   non-fire, not primed     -> the charge: drain 1/2 of the damage (DrainHPEffect_, "took in energy!"),
;                               then arm the primed bit so the NEXT SolarBeam is the release.
; (Self-thaw on both turns is handled earlier by SelfThawOnBurnMove via BurnInflictingEffects.)
SolarBeamEffect_::
	call .userIsFire
	jr c, .fire
	; non-fire path: branch on the primed bit (this side's status3)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotStatus
	ld hl, wEnemyBattleStatus3
.gotStatus
	bit SOLARBEAM_PRIMED, [hl]
	jr nz, .release
	; charge turn: arm, then drain 1/2 (DrainHPEffect_ prints the "took in energy!" line via the move-num check)
	set SOLARBEAM_PRIMED, [hl]
	farcall DrainHPEffect_
	ret
.release
	res SOLARBEAM_PRIMED, [hl] ; the charge is spent
	jr .burn
.fire
	farcall DefaultRecoilEffect_ ; 1/3 recoil to the FIRE user
	; fall through to .burn
.burn:
	; 30% burn, but only if the target is still standing (this runs even on a KO)
	call .targetAlive
	ret z
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .gotEff
	ld hl, wEnemyMoveEffect
.gotEff
	ld a, [hl]
	push af ; save SOLARBEAM_EFFECT
	ld a, BURN_SIDE_EFFECT2
	ld [hl], a ; 30% roll; FreezeBurnParalyzeEffect's own SOLARBEAM branch uses FIRE for the immunity check
	farcall FreezeBurnParalyzeEffect
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreEff
	ld hl, wEnemyMoveEffect
.restoreEff
	pop af
	ld [hl], a ; restore SOLARBEAM_EFFECT
	ret
; carry set if the SolarBeam user is FIRE-type
.userIsFire
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotUserType
	ld hl, wEnemyMonType1
.gotUserType
	ld a, [hli]
	cp FIRE
	jr z, .yesFire
	ld a, [hl]
	cp FIRE
	jr z, .yesFire
	and a ; clear carry
	ret
.yesFire
	scf
	ret
; z set if the target (the opponent of hWhoseTurn) has fainted
.targetAlive
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonHP
	jr z, .gotTargetHP
	ld hl, wBattleMonHP
.gotTargetHP
	ld a, [hli]
	or [hl]
	ret

; Sunsette: when the SolarBeam MOVE animation is about to play, a non-fire user that hasn't yet
; "charged" (SOLARBEAM_PRIMED clear) shows the MEGA DRAIN animation instead - so the charge turn reads
; as gathering energy and the release shows the real beam. FIRE users (one-shot) and the primed release
; keep the SOLARBEAM animation. Called via callfar from PlayMoveAnimation right after it stores
; wAnimationID; hWhoseTurn = the acting mon. The primed bit is read here at PRE-effect time (same as
; SolarBeamPowerModifier), so the anim matches the power: charge=MegaDrain/60, release=SolarBeam/120.
; Because the animation engine's SetMoveDexSeen keys off wAnimationID, when we repoint the ID we first
; mark SOLARBEAM seen ourselves and consume the seen-flag so SetMoveDexSeen won't credit MEGA DRAIN.
SolarBeamAnimSwap::
	ld a, [wAnimationID]
	cp SOLARBEAM
	ret nz ; not the SolarBeam move animation - leave it alone (covers non-move anim IDs too)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotType
	ld hl, wEnemyMonType1
.gotType
	ld a, [hli]
	cp FIRE
	ret z ; FIRE user fires the beam in one shot - keep SOLARBEAM
	ld a, [hl]
	cp FIRE
	ret z
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotStatus
	ld hl, wEnemyBattleStatus3
.gotStatus
	bit SOLARBEAM_PRIMED, [hl]
	ret nz ; primed -> this is the release -> keep the SOLARBEAM beam
	; charge turn: mark SOLARBEAM seen now + consume the flag so SetMoveDexSeen won't mark MEGA DRAIN
	ld a, [wBattleFunctionalFlags]
	bit 0, a
	jr z, .swap
	res 0, a
	ld [wBattleFunctionalFlags], a
	ld c, SOLARBEAM - 1
	ld b, FLAG_SET
	ld hl, wMovedexSeen
	call FlagAction
.swap
	ld a, MEGA_DRAIN
	ld [wAnimationID], a
	ret

; Sunsette: MINDWIPE (PSYWAVE). No-damage PSYCHIC status move, reached via the Haze trampoline ->
; HazeFlinchEffect_ (it's in ResidualEffects1, so it's dispatched before damage and runs its own
; accuracy test). It RETYPES the target to NORMAL with a gray "wiped" palette (the WATERIFY flag path,
; bit 3 of the target's Flags byte), drops the target's SPECIAL by 1, and confuses it. A Substitute
; blocks the whole move. hWhoseTurn = the user; the target is the opposite side. The NORMAL type + gray
; persist until the target switches out (types reload + the send-out hooks res the flag).
MindwipeEffect_::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2 ; player's turn -> target = enemy
	jr z, .gotSub
	ld hl, wPlayerBattleStatus2
.gotSub
	bit HAS_SUBSTITUTE_UP, [hl]
	jr nz, .didntAffect
	callfar MoveHitTest ; 0-power moves skip the engine accuracy test, so run it ourselves
	ld a, [wMoveMissed]
	and a
	jr nz, .didntAffect
	callfar PlayCurrentMoveAnimation
	; retype the target to BUG and arm its gray palette (bit 3 of the Flags byte after Type2)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1
	jr z, .gotType
	ld hl, wBattleMonType1
.gotType
	ld a, BUG
	ld [hli], a ; type1 = BUG
	ld [hli], a ; type2 = BUG; hl -> Flags byte
	set 3, [hl] ; bit 3 = MINDWIPE gray palette (preserves bits 0-2)
	call RunDefaultPaletteCommand ; re-apply SET_PAL_BATTLE so the gray shows immediately
	ld hl, MindwipedText
	rst _PrintText
	; -1 ACCURACY to the target (ApplyStatDownToTarget b: 0 = enemy, 1 = player = hWhoseTurn for "the foe").
	; (Tuned down from the original confuse + -1 SPECIAL: the retype alone is already strong.)
	ldh a, [hWhoseTurn]
	and 1
	ld b, a
	ld c, ACCURACY_DOWN1_EFFECT
	call ApplyStatDownToTarget
	; ApplyStatDownToTarget left the in-flight effect as ACCURACY_DOWN1; restore MINDWIPE_EFFECT
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreEff
	ld hl, wEnemyMoveEffect
.restoreEff
	ld [hl], MINDWIPE_EFFECT
	ret
.didntAffect
	ld c, 50
	rst _DelayFrames
	jpfar PrintDidntAffectText

MindwipedText:
	text_far _MindwipedText
	text_end

; Sunsette: ROOST (RAZOR_WIND). No-damage status move (ResidualEffects1 -> Haze trampoline). It heals
; 1/2 (reusing HealEffect_, which heals 1/2 for RAZOR_WIND's move num + plays the anim), then does a full
; refresh of the user to its NATURAL types + palette (curing MINDWIPE's BUG / WATERIFY's WATER + their
; palettes), then strips FLYING/FLOATING for this turn (grounding it; NORMAL if that would leave it
; typeless, e.g. a CONVERSION'd pure-Flyer). The stripped types come back at the start of the user's next
; turn via RestoreRoostedTypes (callfar'd from the move preamble). hWhoseTurn = the ROOST user.
RoostEffect_::
	farcall HealEffect_          ; heal 1/2 + move animation + "regained health" (RAZOR_WIND move num -> 1/2)
	call RefreshUserNaturalTypes ; restore base types + clear the WATERIFY/CONVERSION/MINDWIPE palette flags
	call StripFlyingFloating     ; ground the user (remove FLYING/FLOATING; NORMAL fallback)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotS3
	ld hl, wEnemyBattleStatus3
.gotS3
	set ROOSTED, [hl]
	ret

; Sunsette: at the start of the user's next turn, if it ROOSTED last turn, refresh its natural types
; (FLYING/FLOATING come back) and clear the flag. callfar'd from the move-execution preamble (next to
; SelfThawOnBurnMove) for both sides. Re-running the palette refresh is harmless.
RestoreRoostedTypes::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotS3
	ld hl, wEnemyBattleStatus3
.gotS3
	bit ROOSTED, [hl]
	ret z
	res ROOSTED, [hl]
	; fall through to RefreshUserNaturalTypes

; Sunsette: reload the user's NATURAL types from its species header (same source as send-out:
; GetMonHeader -> wMonHTypes -> copy -> TryRemapTyping) and clear its type-change palette flags + repaint.
; This undoes any MINDWIPE (BUG) / WATERIFY (WATER) / CONVERSION retype + their palettes. hWhoseTurn = user.
RefreshUserNaturalTypes:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	ld de, wEnemyMonType
	jr nz, .gotSide
	ld a, [wBattleMonSpecies]
	ld de, wBattleMonType
.gotSide
	ld [wCurSpecies], a
	push de
	call GetMonHeader           ; home; loads wMonHTypes for wCurSpecies
	pop de
	ld hl, wMonHTypes
	ld a, [hli]
	ld [de], a                  ; type1
	push de
	inc de
	ld a, [hl]
	ld [de], a                  ; type2
	pop de                      ; de -> type1 (TryRemapTyping wants this + wCurSpecies)
	call TryRemapTyping         ; same bank (newCode); applies the per-species OriginalTypings override
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonFlags
	jr z, .gotFlags
	ld hl, wEnemyMonFlags
.gotFlags
	res 1, [hl]                 ; WATERIFY blue
	res 2, [hl]                 ; CONVERSION recolor
	res 3, [hl]                 ; MINDWIPE gray
	jp RunDefaultPaletteCommand ; repaint to the natural palette (home; tail-call)

; Sunsette: remove FLYING ($02) and FLOATING ($12) from the user's two type bytes. If both are an air
; type (e.g. a CONVERSION'd pure-Flyer/Floater) the user would be left typeless, so it becomes NORMAL;
; if only one is, the surviving type fills both slots (a clean mono-type). hWhoseTurn = user.
StripFlyingFloating:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotType
	ld hl, wEnemyMonType1
.gotType
	ld a, [hl]
	ld b, a                     ; b = type1
	inc hl
	ld a, [hl]
	ld c, a                     ; c = type2 ; hl -> type2
	dec hl                      ; hl -> type1
	ld a, b
	call .isAir
	jr c, .t1Air
	; type1 is a real type
	ld a, c
	call .isAir
	ret nc                      ; neither is air -> no change (not a normal ROOST user)
	; only type2 is air -> mono type1
	ld a, b
	jr .setBoth
.t1Air
	ld a, c
	call .isAir
	jr c, .bothAir
	; only type1 is air -> mono type2
	ld a, c
	jr .setBoth
.bothAir
	ld a, NORMAL                ; typeless -> NORMAL safety
.setBoth
	ld [hli], a                 ; type1
	ld [hl], a                  ; type2
	ret
.isAir
	cp FLYING
	jr z, .yesAir
	cp FLOATING
	jr z, .yesAir
	and a
	ret
.yesAir
	scf
	ret

; Sunsette: JOLT BOLT (POUND) post-damage side effect - a 50% chance to raise the USER's EVASION by 1.
; Reached via the Haze trampoline -> HazeFlinchEffect_. = SwiftEffect_'s 50% roll + ChargeMoveEvasionBoost's
; evasion-up: temp-swap the user's move effect to EVASION_UP1_EFFECT and zero its move num (dodges
; StatModifierUpEffect's Minimize/substitute path), SetFlag FLAG_SKIP_STAT_ANIMATION, callfar
; StatModifierUpEffect (prints the "rose!" line), then restore both. hWhoseTurn = the JOLT BOLT user.
JoltBoltEffect_:
	callfar FarBattleRandom ; d = random byte (de survives the bankswitch)
	ld a, d
	cp 50 percent + 1
	ret nc ; 50%: no evasion boost
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .gotPtrs
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.gotPtrs
	ld a, [hl]
	push af ; save the real move effect (JOLT_BOLT_EFFECT)
	ld a, [de]
	push af ; save the real move num (POUND)
	ld a, EVASION_UP1_EFFECT
	ld [hl], a
	xor a
	ld [de], a ; zero move num -> dodge the Minimize/substitute path
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect ; +1 EVASION to the user
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	ldh a, [hWhoseTurn] ; callfar clobbered hl/de - re-derive to restore
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .restore
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.restore
	pop af
	ld [de], a ; restore move num
	pop af
	ld [hl], a ; restore move effect
	ret

; Sunsette: stores the SecondWind heal (de = new HP, passed through the callfar from SecondWindHeal in
; bank3 - Bankswitch preserves de) and animates the player's in-battle HP bar filling like a Potion,
; instead of snapping it. On entry wBattleMonHP still holds the OLD HP, which we capture as wHPBarOldHP.
; The wHPBar* vars are little-endian (low byte at +0, high at +1); mon HP/MaxHP are big-endian. Player
; battle bar = coord 10,9 with wHPBarType 1 (cf. UpdateCurMonHPBar). predef works from any bank.
SecondWindHealApply::
	ld a, [wBattleMonHP]
	ld [wHPBarOldHP + 1], a
	ld a, [wBattleMonHP + 1]
	ld [wHPBarOldHP], a
	ld a, d
	ld [wBattleMonHP], a
	ld [wHPBarNewHP + 1], a
	ld a, e
	ld [wBattleMonHP + 1], a
	ld [wHPBarNewHP], a
	ld a, [wBattleMonMaxHP]
	ld [wHPBarMaxHP + 1], a
	ld a, [wBattleMonMaxHP + 1]
	ld [wHPBarMaxHP], a
	hlcoord 10, 9
	ld a, 1
	ld [wHPBarType], a
	predef UpdateHPBar
	ret

; Sunsette: shared failure message for Disable / Cut / Submission (DISABLE family). Battle Core's
; DisableEffectCore.moveMissed jpfar's here instead of printing "But, it failed!" inline, so we can
; pick the right line with no Battle Core cost (it was full). We re-derive the target's disabled-move
; slot from hWhoseTurn: if the target already has a move disabled, say so; otherwise it's a genuine
; miss/no-PP failure. (An accuracy miss against an already-disabled target also lands on the "already
; DISABLED" line, which is acceptable - it's still true.) Tail-rets to DisableEffectCore's caller.
SmartDisableFail_::
	ld c, 50
	rst _DelayFrames
	ld de, wEnemyDisabledMove
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotSlot
	ld de, wPlayerDisabledMove
.gotSlot
	ld a, [de]
	and a
	ld hl, .alreadyDisabledText
	jr nz, .print
	ld hl, .failedText
.print
	rst _PrintText
	ret
.alreadyDisabledText
	text_far _AlreadyDisabledText
	text_end
.failedText
	text_far _ButItFailedText
	text_end

; Sunsette: ADDED: enemy-trainer send-out hook. Routed through the send-out-ONLY call site
; (EnemySendOutFirstMon in core.asm, which used to `callfar AutoWakeUpScreechEnemy` directly).
; We keep that wake-up behavior, then apply any per-map enemy buff. NOT reached from the mid-battle
; heal path that also calls AutoWakeUpScreechEnemy, so gym buffs only fire on actual send-outs.
EnemyOnSendOut::
	ld hl, wEnemyMonFlags ; Sunsette: a fresh enemy mon isn't WATERIFY-soaked; clear bit 1 (keep bit 0 = confuse-ray alt palette)
	res 1, [hl]
	res 2, [hl] ; and isn't CONVERSION-recolored (bit 2) - types reset to natural on send-out
	res 3, [hl] ; and isn't MINDWIPE-grayed (bit 3)
	ld hl, wEnemyBattleStatus3
	res SOLARBEAM_PRIMED, [hl] ; Sunsette: switching out disarms a charged SolarBeam
	callfar AutoWakeUpScreechEnemy ; preserve original on-send-out behavior
	call ApplyEnemySendOutMapEffects
	xor a ; target = enemy
	call CheckSurfSpeedDebuff ; Sunsette: SURF -1 SPEED for a trainer's mon sent out while you surf
	xor a ; target = enemy
	call CheckSilphDebuff ; Sunsette: SILPH CO. -1 SPECIAL (Water/Grass) / -1 SPEED (Flying)
	xor a ; target = enemy
	call CheckDarknessAccuracyDebuff ; Sunsette: dark-cave (Flash off) -2 ACCURACY for a trainer's mon
	ret

; Sunsette: ADDED: certain maps apply an effect to the ENEMY trainer's just-sent-out mon and print
; a flavor line. Two effect types (table-driven, add a row to extend):
;   ENEMYBUFF_STATUP  - +1 stat stage (param = the *_UP1_EFFECT). The line replaces the default
;                       "ENEMY X's STAT rose!" via the wRegionalStatRiseTextID skip.
;   ENEMYBUFF_GROWING - set the GROWING regen flag (param unused).
; Enemy stat mods reset to neutral per send-out (LoadEnemyMonData), so +1 is per-mon, no stacking.
; Runs for trainer battles only (wild mons aren't sent via EnemySendOutFirstMon). NOTE: the
; environmental POISON hazards (Celadon "spores", Lavender Tower "black mist") poison the PLAYER's
; mon, not the enemy (the enemy mons there are mostly Poison/Ghost = immune) - see
; ApplyPlayerSendOutMapEffects.
DEF ENEMYBUFF_STATUP  EQU 0
DEF ENEMYBUFF_GROWING EQU 1

ApplyEnemySendOutMapEffects:
	ld a, [wCurMap]
	ld b, a
	ld hl, EnemySendOutBuffTable
.search
	ld a, [hl]
	cp $FF
	ret z ; no buff for this map
	cp b
	jr z, .found
	ld de, 5 ; entry size: db map, db type, db param, dw text
	add hl, de
	jr .search
.found
	inc hl
	ld a, [hli] ; effect type
	push af
	ld a, [hli] ; param (stat-up effect for STATUP; ignored otherwise)
	ld [wEnemyMoveEffect], a
	ld a, [hli] ; text ptr lo
	ld c, a
	ld b, [hl]  ; text ptr hi
	pop af      ; effect type
	and a
	jr z, .statUp
.growing ; ENEMYBUFF_GROWING
	ld hl, wEnemyBattleStatus3
	set GROWING, [hl]
	ld h, b
	ld l, c
	rst _PrintText
	ret
.statUp ; ENEMYBUFF_STATUP
	ldh a, [hWhoseTurn]
	push af
	ld a, 1
	ldh [hWhoseTurn], a    ; enemy's turn
	xor a
	ld [wEnemyMoveNum], a  ; avoid the MINIMIZE substitute path inside StatModifierUpEffect
	inc a                  ; a = 1
	ld [wRegionalStatRiseTextID], a ; tell StatModifierUpEffect to skip its default rose line
	ld h, b
	ld l, c
	rst _PrintText         ; print our flavor line in its place
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect
	xor a
	ld [wRegionalStatRiseTextID], a
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret

; map, effect type, param, dw flavor text. Terminated by $FF.
EnemySendOutBuffTable:
	db PEWTER_GYM,    ENEMYBUFF_STATUP, SPECIAL_UP1_EFFECT
	dw .pewterText
	db VERMILION_GYM, ENEMYBUFF_STATUP, SPEED_UP1_EFFECT
	dw .vermilionText
	db FUCHSIA_GYM,   ENEMYBUFF_STATUP, EVASION_UP1_EFFECT
	dw .fuchsiaText
	db FIGHTING_DOJO, ENEMYBUFF_STATUP, DEFENSE_UP1_EFFECT
	dw .dojoText
	db SAFFRON_GYM,   ENEMYBUFF_STATUP, SPEED_UP1_EFFECT
	dw .saffronText
	db CINNABAR_GYM,  ENEMYBUFF_STATUP, SPECIAL_UP1_EFFECT
	dw .cinnabarText
	db VIRIDIAN_GYM,  ENEMYBUFF_STATUP, ACCURACY_UP1_EFFECT
	dw .viridianText
	db CERULEAN_GYM,  ENEMYBUFF_GROWING, 0
	dw .ceruleanText
	db $FF
.pewterText
	text_far _PewterGymBuffText
	text_end
.vermilionText
	text_far _VermilionGymBuffText
	text_end
.fuchsiaText
	text_far _FuchsiaGymBuffText
	text_end
.dojoText
	text_far _FightingDojoBuffText
	text_end
.saffronText
	text_far _SaffronGymBuffText
	text_end
.cinnabarText
	text_far _CinnabarGymBuffText
	text_end
.viridianText
	text_far _ViridianGymBuffText
	text_end
.ceruleanText
	text_far _CeruleanGymBuffText
	text_end

; a = which animation
SpecialBattleEffectDoAnimation:
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a
	inc a
	ldh [hWhoseTurn], a
	jpfar PlayBattleAnimationGotID

; PureRGBnote: ADDED: in specific battles we may modify the data (accuracy/power) of the move the player chose based on the current state of battle.
CheckSpecialBattleMoveModifiersPlayer:
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_PAINLESS
	jr z, .painless
	ret
.painless
	ld hl, wPlayerMovePower
	ld a, [hl]
	cp 2
	ret c
	ld [hl], 1 ; set all moves with power > 1 to 1 when fighting PAINLESS
	ret

; PureRGBnote: ADDED: in special battles the opponent's moves may get new effects / different data.
CheckSpecialBattleMoveModifiersEnemy:
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	jr z, .maw
	ret
.maw
	ld a, [wEnemyMoveNum]
	cp HYPER_BEAM
	jr nz, .noTypeRemap
	ld hl, wEnemyMoveType
	ld [hl], GHOST ; hyper beam becomes ghost type for THE MAW
	ld hl, wEnemyMoveAccuracy
	ld [hl], 100 percent ; 100% accuracy on hyper beam
.noTypeRemap
	ld hl, wEnemyMovePower
	ld a, [hl]
	and a
	ret z ; has 0 power, do nothing
	call IsBattleMonGhostCubone
	ret nc
	ld [hl], 1 ; set all moves with power > 0 to 1 when fighting ghost cubone
	ret

IsBattleMonGhostCubone:
	ld a, [wBattleMonSpecies]
	cp CUBONE
	jr nz, .no
	ld a, [wBattleMonFlags]
	bit 0, a ; is it alt palette cubone
	jr z, .no
	scf
	ret
.no
	and a
	ret

; PureRGBnote: ADDED: This function runs when sending out a pokemon, in case we want to trigger a special event or effect when you
; send out every mon or a specific mon. Example: Sending out CUBONE vs THE MAW powers up Cubone.
CheckOnSendOutSpecialEffect::
	callfar AutoWakeUpSleepScreechPlayer
	call ApplyPlayerSendOutMapEffects ; Sunsette: per-map buffs for the just-sent-out player mon (e.g. VIRIDIAN_FOREST Grass +1 DEF)
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	ret nz
	call IsBattleMonGhostCubone
	jr nc, .checkResetMusic
	CheckAndSetEvent EVENT_CUBONE_FIGHTING_THE_MAW
	ret nz
	ld a, [wOptions2]
	bit BIT_MUSIC, a
	jr nz, .playMusic1
	ld hl, Music_TitleScreen
	ld c, BANK(Music_TitleScreen)
	call PlaySpecialBattleMusic
	jr .cubonePowerUp
.playMusic1
	ld hl, Music_GRChallengeCup
	ld c, BANK(Music_GRChallengeCup)
	call PlaySpecialBattleMusic
	ld hl, wMusicTempo + 1
	ld [hl], 0
	ld a, 3
	ld hl, wChannelTranspositions
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .cubonePowerUp
.checkResetMusic
	CheckAndResetEvent EVENT_CUBONE_FIGHTING_THE_MAW
	ret z
	ld a, [wOptions2]
	bit BIT_MUSIC, a
	jr nz, .playMusic2
	ld hl, Music_GymLeaderBattle
	ld c, BANK(Music_GymLeaderBattle)
	jp PlaySpecialBattleMusic3
.playMusic2
	ld hl, Music_GengarInTheGraveyard
	ld c, BANK(Music_GengarInTheGraveyard)
	jp PlaySpecialBattleMusic
.cubonePowerUp
	ld hl, .cubonePowerUpText
	rst _PrintText
	ldh a, [hWhoseTurn]
	push af
	xor a
	ldh [hWhoseTurn], a
	ld a, DIVINE_PROTECTION_ANIM
	ld [wAnimationID], a
	xor a
	ld [wAnimationType], a
	callfar PlayBattleAnimationGotID
	ld hl, .ultimateProtection
	rst _PrintText
	ld a, [wBattleMonLevel]
	cp 50
	jr nc, .normalBoosts
	; give it +4 attack in the end instead of just +2 if it's lower level
	ld a, MAX_STAT_LEVEL - 4
	ld [wPlayerMonAttackMod], a
.normalBoosts
	SetFlag FLAG_SKIP_STAT_ANIMATION
	ld a, ATTACK_UP2_EFFECT
	ld [wPlayerMoveEffect], a
	jpfar StatModifierUpEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret
.cubonePowerUpText
	text_far _CubonePoweredUp
	text_end
.ultimateProtection
	text_far _CuboneGainedUltimateProtection
	text_end

;;;;; PureRGBnote: ADDED: in some cases, we don't want to display "Opponent fainted!" after defeating a wild pokemon.
;;;;; Such as when fighting static Snorlax, since it doesn't faint, it leaves once losing the fight.
CheckSpecialFaintText::
	CheckEitherEventSet EVENT_FIGHT_ROUTE16_SNORLAX, EVENT_FIGHT_ROUTE12_SNORLAX
	jr nz, .yes
	CheckEvent EVENT_BATTLING_VOLCANO_MAGMAR
	jr nz, .yes
	CheckEvent EVENT_DRAGONAIR_EVENT_BATTLING_CLOYSTER
	jr nz, .yes
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	jr z, .yes
	and a
	ret
.yes
	ld hl, EnemyMonWasDefeatedText
	scf
	ret
;;;;;


; PureRGBnote: ADDED: when facing THE MAW specifically, it has rudimentary AI to choose a good move to use on your pokemon.
; On CUBONE it just uses random moves.
TheMawChooseMove::
; to make it harder to win without using cubone, the maw will use attacks depending on your pokemon's types
	ld a, [wCurMap]
	cp POKEMON_TOWER_B1F
	ret nz
	ld a, [wEnemyMonSpecies]
	cp SPIRIT_THE_MAW
	ret nz
	CheckEvent EVENT_CUBONE_FIGHTING_THE_MAW
	ret nz ; choose moves randomly against cubone
	ld a, [wEnemySelectedMove]
	cp STRUGGLE
	ret z ; don't do anything if they are using struggle
	ld a, [wAIMoveSpamAvoider]
	cp 2 ; if we switched mons
	ld hl, wAITargetMonType1
	jr z, .gotTypes
	ld hl, wBattleMonType1
.gotTypes
	call .checkType
	jr c, .gotMove
	inc hl
	call .checkType
	jr c, .gotMove
	ret
.checkType
	ld a, [hl]
	cp PSYCHIC_TYPE
	jr z, .leechLife
	cp ROCK
	jr z, .megaDrain
	cp CRYSTAL
	jr z, .megaDrain
	cp NORMAL
	jr z, .poisonGas
	cp GHOST
	jr z, .hyperBeam
	cp POISON
	jr z, .hyperBeam
	cp GROUND
	jr z, .hyperBeam
	cp FIRE
	jr z, .hyperBeam
	cp FLYING
	jr z, .hyperBeam
	and a ; clear carry
	ret
.megaDrain
	; use mega drain on rock pokemon
	ld a, [wBattleMonSpecies]
	cp AERODACTYL
	jr z, .hyperBeam
	ld de, wEnemyMonPP + 2 ; mega drain pp pointer
	call .checkPPNotZero
	ret z
	ld a, MEGA_DRAIN
	ld b, 2
	scf
	ret
.hyperBeam
	; use hyper beam on most pokemon
	ld a, [wBattleMonSpecies]
	cp MISSINGNO
	jr z, .megaDrain
	cp RAPIDASH
	jr z, .poisonGas
	cp SANDSLASH
	jr z, .megaDrain
	ld de, wEnemyMonPP + 1
	call .checkPPNotZero
	ret z
	ld a, HYPER_BEAM
	ld b, 1
	scf
	ret
.leechLife
	ld de, wEnemyMonPP
	call .checkPPNotZero
	ret z
	ld a, LEECH_LIFE
	ld b, 0
	scf
	ret
.poisonGas
	ld de, wEnemyMonPP + 3
	call .checkPPNotZero
	ret z
	ld a, POISON_GAS ; MIASMA
	ld b, 3
	scf
	ret
.gotMove
	push af
	call .isPPActive
	jr z, .noPP2
	call .getPPPointer
	inc [hl] ; increment move we would have used's PP back to normal
.noPP2
	pop af
	ld [wEnemySelectedMove], a
	ld a, b
	ld [wEnemyMoveListIndex], a
	call .isPPActive
	ret z
	call .getPPPointer
	dec [hl] ; decrement the move's pp that we intend to use
	ret
.getPPPointer
	ld a, [wEnemyMoveListIndex]
	ld hl, wEnemyMonPP
	ld d, 0
	ld e, a
	add hl, de
	ret
.isPPActive
	ld a, 1 ; Sunsette: NPC PP is always on
	and a
	ret
.checkPPNotZero
	call .isPPActive
	jr z, .noPP
	ld a, [de]
	and a
	ret
.noPP
	and a
	inc a
	ret