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
	callfar CheckSafariWindEnemy ; Sunsette: WIND arena effect on the wild mon (Safari battle modes); floated to arena_indicator.asm (newCode full)
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

; Sunsette: the WIND arena effect (Safari Zone outdoor maps, battle modes) lives in the floated
; engine/battle/arena_indicator.asm section: CheckSafariWindEnemy (callfar'd from
; CheckInitSpecialBattleEffect above) buffs the wild mon + prints the line, CheckSafariWindPlayer
; (callfar'd from ApplyPlayerSendOutMapEffects above) buffs your mon. newCode is full, hence the float.

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
	res 3, [hl] ; and isn't SKITTERMIND-grayed (bit 3)
	ld hl, wPlayerBattleStatus3
	res SOLARBEAM_PRIMED, [hl] ; Sunsette: switching out disarms a charged SolarBeam
	ld a, 1 ; target = player
	call CheckSurfSpeedDebuff ; Sunsette: SURF -1 SPEED on your mon (non-Water/Flying), any map while surfing
	ld a, 1 ; target = player
	call CheckSilphDebuff ; Sunsette: SILPH CO. -1 SPECIAL (Water/Grass) / -1 SPEED (Flying)
	ld a, 1 ; target = player
	call CheckDarknessAccuracyDebuff ; Sunsette: dark-cave (Flash off) -2 ACCURACY on your mon
	ld a, 1 ; target = player
	call CheckCeruleanWaterSpeed ; Sunsette: CERULEAN pool +1 SPEED on your WATER mon
	callfar CheckSafariWindPlayer ; Sunsette: WIND arena effect buffs YOUR mon too (Safari battle modes); floated to arena_indicator.asm
	ld a, 1 ; target = player
	call CheckViridianForestDefense ; Sunsette: VIRIDIAN FOREST +1 DEFENSE on your GRASS/BUG mon
	call CheckArenaFirstMonStatus ; Sunsette: LORELEI freeze / FUCHSIA confuse on your FIRST mon only
	ld a, [wCurMap]
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
; Sunsette: VIRIDIAN FOREST arena effect - a GRASS- or BUG-type mon entering battle gains +1 DEFENSE.
; BOTH sides (called from the player hook above with a=1 and from EnemyOnSendOut with a=0). The dense
; canopy hardens grass and bug alike. a: 0 = enemy, 1 = player.
CheckViridianForestDefense:
	ld b, a ; target
	ld a, [wCurMap]
	cp VIRIDIAN_FOREST
	ret nz
	ld a, b
	and a
	ld hl, wEnemyMonType1
	jr z, .gotTypes
	ld hl, wBattleMonType1
.gotTypes
	ld a, [hli]
	cp GRASS
	jr z, .buff
	cp BUG
	jr z, .buff
	ld a, [hl]
	cp GRASS
	jr z, .buff
	cp BUG
	ret nz
.buff
	ld c, DEFENSE_UP1_EFFECT
	ld hl, ViridianForestDefenseText
	jp ApplyStatUpWithText ; print the themed line, then +1 DEFENSE on target b (suppresses the default "rose!")
ViridianForestDefenseText:
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
; battle stats from its OWN base stats with those stages, announces it, then CONFUSES the foe. It is NOT
; a priority move. Reached via `callfar MockingbirdEffect_` from Battle Core (player + enemy move paths).
; hWhoseTurn = the MOCKINGBIRD user; the foe is the opposite side.
MockingbirdEffect_:
	callfar PlayCurrentMoveAnimation2 ; Sunsette: MOCKINGBIRD is 0-BP; nothing else plays its animation (it copies the foe's stat stages silently, then confuses the foe)
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
; then CONFUSE the foe (guaranteed, 2-5 turns). We reuse the engine's ConfusionSideEffectSuccess, which
; confuses the side opposite hWhoseTurn (the foe) and prints "became confused". It reads the in-flight move
; effect only to decide whether to replay the move animation, so we temporarily set the user's move effect
; to CONFUSION_SIDE_EFFECT (suppresses that replay - we already played MOCKINGBIRD's anim above), then
; restore MIRROR_MOVE_EFFECT. If the foe is already confused it no-ops silently.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .gotEffPtr
	ld hl, wEnemyMoveEffect
.gotEffPtr
	ld a, CONFUSION_SIDE_EFFECT
	ld [hl], a
	callfar ConfusionSideEffectSuccess ; set CONFUSED on the foe + a 2-5 turn counter
; restore MIRROR_MOVE_EFFECT so any post-move bookkeeping sees the real effect.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreEff
	ld hl, wEnemyMoveEffect
.restoreEff
	ld a, MIRROR_MOVE_EFFECT
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

; Sunsette: FLY and DIG charge turn (callfar'd from ChargeEffect in Battle Core, after "flew up!" /
; "dug a hole!"). First wipe the USER's OWN stat mods back to neutral (recomputing its battle stats from
; the unmodified copy, the same reset SENBONZAKURA uses), THEN raise EVASION: +2 for FLY (paired with its
; 90% accuracy, so the bigger dodge is bought with an unreliable dive), +1 for DIG (reliable 100%, smaller
; cushion). The reset is what keeps the per-cycle boost from climbing toward +6 (the old degenerate
; dodge-tank): evasion pins at exactly its move's value no matter how many Fly/Dig cycles, and any prior
; self-setup is spent on the dive. The boost reuses the engine's own StatModifierUpEffect by temporarily
; pointing the user's move effect at EVASION_UP2/1_EFFECT (and zeroing the move number, which dodges
; StatModifierUpEffect's Minimize/substitute path), with the stat-rise animation suppressed - then restores
; both so turn 2's charged attack still fires normally. hWhoseTurn is already the charging mon.
ChargeMoveEvasionBoost::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMonAttackMod         ; player's turn -> user = player
	ld de, wPlayerMonUnmodifiedAttack
	ld bc, wBattleMonAttack
	jr z, .gotUser
	ld hl, wEnemyMonAttackMod
	ld de, wEnemyMonUnmodifiedAttack
	ld bc, wEnemyMonAttack
.gotUser
	push de                            ; unmodified-stat source
	push bc                            ; battle-stat dest
	ld a, $7
	ld b, NUM_STAT_MODS
.resetModsLoop
	ld [hli], a
	dec b
	jr nz, .resetModsLoop
	pop hl                             ; hl = battle-stat dest
	pop de                             ; de = unmodified-stat source
	ld b, (NUM_STATS - 1) * 2
.resetStatsLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .resetStatsLoop
	; Sunsette: DIG no longer self-boosts EVASION. Its dive instead drops the TARGET's ACCURACY by 1 when the
	; dig-up hit connects (SpeciesMoveBonus .digAccDrop) - an unbounded debuff that compounds across patient Dig
	; cycles, rather than a bounded self-buff. So for DIG the stat reset above is the whole charge-turn effect.
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotChargeMove
	ld a, [wEnemyMoveNum]
.gotChargeMove
	cp DIG
	ret z                       ; DIG: reset only, no EVASION boost (the -ACC rider is on the hit)
	cp HYDROBATH
	ret z                       ; Sunsette: HYDROBATH: reset only, no EVASION pin (its payoff is the turn-2 SPEED/SPECIAL +2)
	; --- FLY only: now raise the USER's EVASION (no anim), AFTER the reset so it pins at exactly +2 ---
	; Sunsette: ChooseFlyEvasionEffect (floated bank) returns e = the EVASION_UP* effect - FLY by an already
	; FLYING/FLOATING user -> +2; a grounded FLY user -> +1 (the type-keep popup is the trade-off).
	callfar ChooseFlyEvasionEffect ; e = boost effect; read it into c BEFORE loading the move ptrs (which need de/hl)
	ld c, e
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
	ld a, c ; the chosen EVASION boost effect (UP1/UP2)
	ld [hl], a
	xor a
	ld [de], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect ; raise the user's EVASION (+2 FLY / +1 DIG), prints the standard "rose!" line
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

; Sunsette: carry set if the user (side = hWhoseTurn) is already FLYING or FLOATING in either type slot.
; Sunsette: move-keyed bonus applied AFTER certain damaging moves HIT (post-damage, target alive).
; callfar'd from Battle Core's player & enemy SpecialEffects tail; hWhoseTurn = the user. These fire
; for ANY user of the move (the legendary birds' dedicated signature moves - no species gate):
;   PHOENIX DIVE -> the FLOURISH regen state (like FLOURISH) + a 30% burn chance
;   STORM DRILL  -> a 30% paralyze chance
;   WINTER GALE  -> a 30% freeze chance
; The status reuses Battle Core's FreezeBurnParalyzeEffect by temporarily setting the user's move
; EFFECT to the matching *_SIDE_EFFECT2 (= 30%) and its move TYPE so the routine's same-type
; immunity check is right (burn<-FIRE so fire-types are immune, freeze<-ICE so ice-types are
; immune, paralyze<-NORMAL which that routine treats as "affects any type"), then restores both.
SpeciesMoveBonus::
	callfar WaterMoveCleansesTargetBurn ; Sunsette: a WATER move that connects (post-damage, target alive) washes the target's burn off
	callfar SunsettePostHitSelfEffects ; Sunsette: per-move post-hit self-effects (PSYCHOCRISIS recoil, SUPERPOWER self -ATK/-DEF); no-op otherwise. Floated to the status-immunities bank since newCode is full.
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
	; Sunsette: the legendary-bird effects now live on their OWN dedicated moves (PHOENIX DIVE / STORM
	; DRILL / WINTER GALE) and apply to ANY user - they are no longer a species-gated "signature" on the
	; generic WHIRLWIND/DRILL_PECK/SKY_ATTACK. (So e.g. PHOENIX DIVE burns+regens for whoever uses it.)
	cp PHOENIX_DIVE
	jp z, .sky ; Sunsette: JR->JP - the .shoryukenAtk/.pivotDef handlers pushed these targets past JR range
	cp STORM_DRILL
	jp z, .drill
	cp WINTER_GALE
	jp z, .whirl
	cp BLOOD_RUSH
	jp z, .strengthRage
	cp STRENGTH
	jp z, .strengthRage
	cp FIRE_SPIN
	jr z, .fireSpinBurn
	cp WRAP
	jr z, .trapSpeedDrop
	cp POWER_BIND
	jr z, .trapSpeedDrop
	cp CLAMP
	jp z, .clampDefUp ; Sunsette: JR->JP - the DIG/MUDSLIDE handlers pushed .clampDefUp out of jr range
	cp SURF
	jr z, .surf
	cp UNDERBUG
	jr z, .underbugConfuse ; Sunsette: comeback - stage-scaled confuse (0/30/100/100)
	cp SHORYUKEN
	jr z, .shoryukenAtk ; Sunsette: ~80% chance to raise the USER's ATTACK +1 (special DRAGON combo setup)
	cp DIG
	jp z, .digAccDrop ; Sunsette: -1 ACCURACY on the target when the dig-up hit lands (JR->JP: handler is out of range)
	cp MUDSLIDE
	jp z, .mudslideSpeed ; Sunsette: 50% chance to drop the target's SPEED (JR->JP: handler is out of range)
	cp POISON_FANG
	jp z, .poisonFang ; Sunsette: 50% chance to BADLY-poison (toxic) the target on a connecting hit
	ret ; Sunsette: FINISHER's old +1 DEF post-hit removed (it's a Focus-Punch-like nuke now)
.poisonFang
	jpfar PoisonFangToxic_ ; floated to black_haze (reuses BlackHazeBadlyPoisonSide); tail-call
.underbugConfuse
	jpfar UnderBugConfuse_
.shoryukenAtk ; Sunsette: SHORYUKEN - on a connecting hit, ~80% chance to raise the USER's ATTACK +1, so a
	; physical attacker can fire this special DRAGON uppercut to set up, then swing physically. RaiseUserAttackUp1
	; is in this same bank (near call); FarBattleRandom is callfar'd (d survives the bankswitch).
	callfar FarBattleRandom
	ld a, d
	cp 80 percent + 1
	ret nc ; ~20%: no boost this time
	call RaiseUserAttackUp1 ; +1 ATTACK ("ATTACK rose!" + recalc)
	ret
.surf ; Sunsette: SURF is a PIKACHU/RAICHU signature once the player has surfed at the Summer Beach
	; House (EVENT_SURFED_WITH_DUDE) - it WATERIFIES the target (post-damage, target alive, so it
	; matches WaterifyEffect_'s own assumptions). WaterifyEffect_ is in this same bank (a near jp).
	ld a, b ; user species (set at .gotBoth)
	cp PIKACHU
	jr z, .surfWaterify
	cp RAICHU
	ret nz
.surfWaterify
	CheckEvent EVENT_SURFED_WITH_DUDE
	ret z
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF ; honor the world-option signature toggle (like the announcement)
	ret nz
	jp WaterifyEffect_
.fireSpinBurn ; Sunsette: FIRE SPIN - 30% burn on the target (any user); reuses .applyStatus (BURN_SIDE_EFFECT2 = 30% roll). No FLOURISH (unlike PHOENIX DIVE's .sky).
	ld d, BURN_SIDE_EFFECT2
	ld e, FIRE
	jr .applyStatus
.trapSpeedDrop ; Sunsette: WRAP / POWER BIND - guaranteed -1 SPEED on the target (b = target side = hWhoseTurn)
	ldh a, [hWhoseTurn]
	ld b, a
	ld c, SPEED_DOWN1_EFFECT
	call ApplyStatDownToTarget
	ldh a, [hWhoseTurn] ; ApplyStatDownToTarget leaves the move effect as SPEED_DOWN1 (doesn't restore); put FLINCH_SIDE_EFFECT2 back
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreFlinch
	ld hl, wEnemyMoveEffect
.restoreFlinch
	ld [hl], FLINCH_SIDE_EFFECT2
	ret
.digAccDrop ; Sunsette: DIG - guaranteed -1 ACCURACY on the target when the dig-up hit connects (grit flung from
	; erupting). Unbounded: each patient Dig cycle stacks another -1. b = target side = hWhoseTurn.
	ldh a, [hWhoseTurn]
	ld b, a
	ld c, ACCURACY_DOWN1_EFFECT
	call ApplyStatDownToTarget
	ldh a, [hWhoseTurn] ; ApplyStatDownToTarget leaves the move effect as ACCURACY_DOWN1; put CHARGE_EFFECT back
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreDig
	ld hl, wEnemyMoveEffect
.restoreDig
	ld [hl], CHARGE_EFFECT
	ret
.mudslideSpeed ; Sunsette: MUDSLIDE - 50% chance to drop the TARGET's SPEED by 1 (a wave of mud bogs them down).
	callfar FarBattleRandom
	ld a, d
	cp 50 percent + 1
	ret nc ; 50%: no speed drop this time
	ldh a, [hWhoseTurn]
	ld b, a
	ld c, SPEED_DOWN1_EFFECT
	call ApplyStatDownToTarget
	ldh a, [hWhoseTurn] ; restore MUDSLIDE's effect (ApplyStatDownToTarget left it as SPEED_DOWN1)
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreMudslide
	ld hl, wEnemyMoveEffect
.restoreMudslide
	ld [hl], NO_ADDITIONAL_EFFECT
	ret
.clampDefUp ; Sunsette: CLAMP - guaranteed +1 DEFENSE on the user (RaiseUserStatViaSwap self-restores the move effect/num)
	ld a, DEFENSE_UP1_EFFECT
	jp RaiseUserStatViaSwap
.strengthRage
	; Sunsette: STRENGTH's capped +1 ATK (80-BP branch) and UNLEASH RAGE's on-hit status/confusion clear both
	; live in newCode3 (this bank is full); dispatched there by move number. Reached only post-damage with the
	; target alive (= "able to damage").
	callfar StrengthRagePostHit
	ret
.sky ; PHOENIX DIVE - burn + FLOURISH regen for the user (any species)
	call SetUserFlourish            ; the user always gains FLOURISH when PHOENIX DIVE lands
	ld d, BURN_SIDE_EFFECT2
	ld e, FIRE
	jr .applyStatus
.drill ; STORM DRILL - paralyze (any species)
	ld d, PARALYZE_SIDE_EFFECT2
	ld e, NORMAL
	jr .applyStatus
.whirl ; WINTER GALE - freeze (any species)
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

SetUserFlourish:
	ld hl, wPlayerBattleStatus3
	ldh a, [hWhoseTurn]
	and a
	jr z, .got
	ld hl, wEnemyBattleStatus3
.got
	set FLOURISH, [hl]
	ret

; Sunsette: SNORLAX's REST also grants the FLOURISH/FLOURISH regen state and +1 SPEED. Called from
; HealEffect_ (heal.asm) on the successful-REST branch; hWhoseTurn = the REST user. Honors the MOVE
; MYSTIC signature-move toggle. The SPEED boost borrows StatModifierUpEffect via JoltBoltEffect_'s
; temp-swap (set the effect to SPEED_UP1, zero the move num to dodge the Minimize/substitute path).
; Sunsette: FLOURISH's +1 SPECIAL. GrowthEffect (Battle Core) jpfar's here after setting the FLOURISH regen;
; the raise lives in this roomier bank since Battle Core is full.
FlourishSpecialUp::
	; Sunsette: GROWTH(FLOURISH) and AMNESIA are 0-BP, so the main flow never plays their move
	; animation, and RaiseUserStatViaSwap's +1 SPECIAL is silent (FLAG_SKIP_STAT_ANIMATION). Play it here.
	; Only these two 0-BP moves call FlourishSpecialUp; STRENGTH (+ATK) and SNORLAX REST (+SPEED) use
	; RaiseUserStatViaSwap directly and already animate via the main damage / heal flow.
	callfar PlayCurrentMoveAnimation2
	ld a, SPECIAL_UP1_EFFECT
	jr RaiseUserStatViaSwap

; Sunsette: +1 ATK wrapper (callfar-safe - callfar clobbers a, so the param is set HERE). Used by STRENGTH's
; 80-BP branch (StrengthRagePostHit, newCode3, callfar's this).
RaiseUserAttackUp1::
	ld a, ATTACK_UP1_EFFECT
	jr RaiseUserStatViaSwap

; Sunsette: raise the user's stat +1 via StatModifierUpEffect's temp-swap. a = the *_UP1 effect const. Saves
; the move effect+num, sets effect = a and zeroes the move num (dodging the Minimize/substitute path),
; callfar StatModifierUpEffect, then restores both. Shared by FLOURISH (+SPECIAL), SNORLAX's REST (+SPEED).
RaiseUserStatViaSwap:
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .ptrs
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.ptrs
	ld a, [hl]
	push af ; save real move effect
	ld a, [de]
	push af ; save real move num
	ld a, b
	ld [hl], a
	xor a
	ld [de], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	ldh a, [hWhoseTurn]
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

; Sunsette 2026-06-25 (Phase 2 / temp-swap centralization): lower the TARGET's stat by `a` (a *_DOWN*
; effect const) via StatModifierDownEffect's temp-swap. The DOWN counterpart of RaiseUserStatViaSwap above:
; save the real move effect, set effect = a with FLAG_SKIP_STAT_ANIMATION (so StatModifierDownEffect skips
; the accuracy test + the stat anim and always applies), callfar it, then RESTORE the real effect. hWhoseTurn
; is the user; StatModifierDownEffect acts on the opponent = the target. Self-restoring, so callers no longer
; hand-roll the save/set/restore (was duplicated verbatim in Swift/Gust/Flash; see the audit's temp-swap
; "doesn't self-restore" hazard). Does NOT zero the move num (the DOWN path doesn't take the Minimize branch).
LowerTargetStatViaSwap:
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .set
	ld hl, wEnemyMoveEffect
.set
	ld a, [hl]
	push af ; save the real move effect
	ld a, b
	ld [hl], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierDownEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	ldh a, [hWhoseTurn] ; callfar clobbered hl - re-derive to restore the effect
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restore
	ld hl, wEnemyMoveEffect
.restore
	pop af
	ld [hl], a ; restore the real move effect
	ret

; Sunsette: ADAPTATION (was the FLOURISH move; internal const GROWTH). 0-BP. GrowthEffect (Battle Core) sets
; the FLOURISH regen bit then jpfar's here: play the animation, CURE the user's major status (+recompute
; stats), then raise ATTACK by 1 via RaiseUserStatViaSwap (which self-restores the move effect/num).
; Sunsette: ADAPTATION (AdaptationEffect) moved to the floated "Sunsette Sleep Hit Reduction" section
; (newCode was full); it's co-located there with its damage-halving helper. CureUserStatus stays here and is
; reached from it via callfar.

; Sunsette: clear the USER's (hWhoseTurn side) major status condition - both the in-battle copy AND the
; party copy - then recompute its modified stats so any burn/paralysis/freeze penalty is undone. No-op (and
; skips the recompute) if the user has no status. Volatile statuses (confusion) are NOT touched here.
CureUserStatus::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonStatus
	jr z, .gotInBattle
	ld hl, wEnemyMonStatus
.gotInBattle
	ld a, [hl]
	and a
	ret z ; no status -> nothing to cure
	ld [hl], 0 ; clear the in-battle status
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPartyMon1Status
	ld a, [wPlayerMonNumber]
	jr z, .gotParty
	ld hl, wEnemyMon1Status
	ld a, [wEnemyMonPartyPos]
.gotParty
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], 0 ; clear the party copy too (full cure)
	ldh a, [hWhoseTurn]
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	ret

SnorlaxRestBonus::
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	cp SNORLAX
	ret nz
	call SetUserFlourish ; FLOURISH regen (FLOURISH) on the user
	ld a, SPEED_UP1_EFFECT
	jp RaiseUserStatViaSwap ; +1 SPEED (shared temp-swap helper)

; Sunsette 2026-06-25: HAZE_EFFECT's body. Was the `.haze` fallthrough of the old HazeFlinchEffect_ cp-chain
; trampoline (which re-decoded the move effect by hand to route ~25 effects sharing one Battle Core HazeEffect
; stub). That whole dispatcher is gone now: the far-pointer effect table (data/moves/effects_pointers.asm)
; targets each effect's body directly, so this is just HAZE_EFFECT's own self-contained handler.
;
; HAZE_EFFECT's body, extracted from the old HazeFlinchEffect_ `.haze` fallthrough into
; a standalone label so the far-dispatch table can target it directly (dba HazeResetFieldEffect_). Resets stat
; stages + volatile status on both sides, then drops the black-haze toxic fog. Self-contained; ends in ret.
HazeResetFieldEffect_::
	; Sunsette: SHADOW GAME must NOT wipe permanent (non-volatile) status. HazeEffect_ zeroes the TARGET's
	; status byte, so save BOTH mons' status bytes across the call and restore them afterward. Stat stages and
	; volatile statuses are still reset; only sleep/poison/burn/freeze/paralysis survive. (An already-statused
	; mon is then left alone by BlackHazeBadlyPoisonSide's already-statused guard.)
	ld a, [wBattleMonStatus]
	push af
	ld a, [wEnemyMonStatus]
	push af
	callfar HazeEffect_           ; stat-stage reset + volatile-status cleanup on BOTH sides
	pop af
	ld [wEnemyMonStatus], a
	pop af
	ld [wBattleMonStatus], a
	callfar BlackHazeFieldEffect  ; Sunsette: then drop the toxic fog (own floating section; no flinch, no priority)
	ret

; Sunsette: CALM MIND (AMNESIA, CALM_MIND_EFFECT) - reached here via the Haze trampoline. Raises the user's
; SPECIAL by 1 (FlourishSpecialUp's temp-swap) AND, if the user is currently CONFUSED, snaps it out of
; confusion. The pre-move confusion self-hit check is upstream and NOT bypassed: if it fires the user hurts
; itself and this never runs; if the move executes, the confusion is cleared here.
CalmMindEffect_::
	call FlourishSpecialUp ; +1 SPECIAL to the user (restores the move effect afterward)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .gotStatus
	ld hl, wEnemyBattleStatus1
.gotStatus
	bit CONFUSED, [hl]
	ret z ; not confused -> just the SPECIAL boost
	res CONFUSED, [hl]
	ld hl, CalmMindCalmedText
	rst _PrintText
	ret

CalmMindCalmedText:
	text_far _CalmMindCalmedText
	text_end

; FLASH's effect body (reached from HazeFlinchEffect_ above). Sunsette redesign: FLASH deals no damage and
; is NOT a priority move. The burst of light wipes the TARGET's stat stages back to neutral (a one-shot
; anti-setup, undoing any boosts it set up) and then drops the TARGET's ACCURACY by 2. No flinch - the
; value is the single, noticeable disruption, so it isn't worth spamming. hWhoseTurn is the FLASH user, so
; the TARGET is the opposite side. The stat reset mirrors HazeEffect_ but for one side only (stat mods ->
; neutral 7 + recompute the battle stats from the unmodified copy; statuses are left alone). The -2 ACCURACY
; borrows StatModifierDownEffect via ACCURACY_DOWN2_EFFECT + FLAG_SKIP_STAT_ANIMATION (guaranteed, no anim).
FlashEffect_::
	; Sunsette: FLASH is a 0-BP move, so the main flow never plays its animation. Play it once here.
	callfar PlayCurrentMoveAnimation2
	; pick the TARGET's stat-mod block, its unmodified-stat source, and its battle-stat dest
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonAttackMod        ; player's turn -> target = enemy
	ld de, wEnemyMonUnmodifiedAttack
	ld bc, wEnemyMonAttack
	jr z, .gotTarget
	ld hl, wPlayerMonAttackMod
	ld de, wPlayerMonUnmodifiedAttack
	ld bc, wBattleMonAttack
.gotTarget
	push de                          ; save unmodified-stat source
	push bc                          ; save battle-stat dest
	; reset the target's stat mods to neutral (7)
	ld a, $7
	ld b, NUM_STAT_MODS
.resetModsLoop
	ld [hli], a
	dec b
	jr nz, .resetModsLoop
	; recompute the target's battle stats from the unmodified copy (skips HP, like HazeEffect_'s ResetStats)
	pop hl                           ; hl = battle-stat dest
	pop de                           ; de = unmodified-stat source
	ld b, (NUM_STATS - 1) * 2
.resetStatsLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .resetStatsLoop
	; -2 ACCURACY on the target (self-restoring temp-swap; restores the borrowed effect byte, which is FLASH_EFFECT here)
	ld a, ACCURACY_DOWN2_EFFECT
	jp LowerTargetStatViaSwap

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
	ld a, EVASION_DOWN1_EFFECT
	jp LowerTargetStatViaSwap ; -1 EVASION on the target (self-restoring temp-swap)

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
	ld a, ACCURACY_DOWN1_EFFECT
	jp LowerTargetStatViaSwap ; -1 ACCURACY on the target (self-restoring temp-swap)

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
	; Sunsette CHARGE turn (power was 0 -> reached via ResidualEffects2, no damage): arm the release, grant
	; the FLOURISH regen state, print "took in sunlight!", and raise the user's SPECIAL by 1. The classic
	; charge-up animation already played (Battle Core's FLY/CHARGE anim path). hl -> this side's status3.
	set SOLARBEAM_PRIMED, [hl]
	set FLOURISH, [hl]
	ld hl, SolarBeamSunlightText
	rst _PrintText
	ld a, SPECIAL_UP1_EFFECT
	jp RaiseUserStatViaSwap ; +1 SPECIAL (self-restores the move effect/num)
.release
	res SOLARBEAM_PRIMED, [hl] ; the charge is spent
	call .burn
	jp .lowerUserSpecial
.fire
	farcall DefaultRecoilEffect_ ; 1/3 recoil to the FIRE user
	call .burn
	jp .lowerUserSpecial
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
; Sunsette: after firing, drop the USER's own SPECIAL by 1. ApplyStatDownToTarget b = NOT hWhoseTurn (the
; acting side). It leaves the move effect as SPECIAL_DOWN1, so restore SOLARBEAM_EFFECT afterward.
.lowerUserSpecial:
	ldh a, [hWhoseTurn]
	xor 1
	ld b, a
	ld c, SPECIAL_DOWN1_EFFECT
	call ApplyStatDownToTarget
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreSB
	ld hl, wEnemyMoveEffect
.restoreSB
	ld [hl], SOLARBEAM_EFFECT
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

SolarBeamSunlightText: ; Sunsette: SolarBeam's charge turn
	text_far _SolarBeamSunlightText
	text_end

; Sunsette: SolarBeamAnimSwap (the Mega-Drain charge-turn anim hack) was removed - the reworked SolarBeam
; charge turn plays the classic charge-up animation (Battle Core FLY/CHARGE path), not the beam.

; Sunsette: SHELL GAME (the WITHDRAW move; WITHDRAW_EFFECT repurposed - jpfar'd here from WithdrawEffect).
; Always WATERIFIES the opponent (retype to WATER), then shuffles: the PLAYER gets a "Switch?" Yes/No - YES
; switches out (flees in a wild battle), NO hunkers behind REFLECT. The enemy AI switches if it has a healthy
; benchwarmer, else takes REFLECT. 0-BP status move. Switch/flee flows mirror _TeleportEffect (teleport.asm).
ShellGameEffect_::
	callfar PlayCurrentMoveAnimation2 ; 0-BP move: play its animation here
	farcall WaterifyEffect_           ; retype the opponent to pure WATER (always, both branches)
	ldh a, [hWhoseTurn]
	and a
	jp nz, .enemy
; --- PLAYER: Switch? Yes/No ---
	ld hl, ShellGameSwitchPromptText
	rst _PrintText
	call YesNoChoice                  ; z = YES (switch/flee), nz = NO (Reflect)
	jr nz, .reflect
	ld a, [wIsInBattle]
	dec a
	jr z, .playerFlee                 ; wIsInBattle == 1 -> wild battle: flee
	; trainer battle: switch out (needs a healthy benchwarmer; else fall back to Reflect)
	callfar CheckCanForceSwitch       ; nz if there is a mon to switch to
	jr z, .reflect
	call SaveScreenTilesToBuffer1
	callfar ChooseNextMon
	xor a
	ld [wPlayerMoveNum], a
	ret
.playerFlee
	callfar ReadPlayerMonCurHPAndStatus
	xor a
	ld [wAnimationType], a
	inc a
	ld [wEscapedFromBattle], a        ; the main loop ends the battle after the move (fled)
	ld hl, ShellGameFledText
	rst _PrintText
	ret
.enemy
	callfar CheckCanForceSwitch       ; CheckCanForceSwitch derives the side from hWhoseTurn (enemy here)
	jr z, .reflect                    ; no healthy benchwarmer -> Reflect
	jpfar SwitchEnemyMonNoText
.reflect
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotRef
	ld hl, wEnemyBattleStatus3
.gotRef
	set HAS_REFLECT_UP, [hl]           ; hunker behind Reflect
	ld hl, ShellGameReflectText
	rst _PrintText
	ret

ShellGameSwitchPromptText:
	text_far _ShellGameSwitchPromptText
	text_end
ShellGameReflectText:
	text_far _ShellGameReflectText
	text_end
ShellGameFledText:
	text_far _ShellGameFledText
	text_end

; Sunsette: SKITTERMIND (PSYWAVE). No-damage PSYCHIC status move, reached via the Haze trampoline ->
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
	set 3, [hl] ; bit 3 = SKITTERMIND gray palette (preserves bits 0-2)
	call RunDefaultPaletteCommand ; re-apply SET_PAL_BATTLE so the gray shows immediately
	ld hl, MindwipedText
	rst _PrintText
	; Sunsette: then CONFUSE the target - the mind-scramble (the name/gray palette read as confusion, not
	; blurry vision). This restores the move's ORIGINAL confuse, but WITHOUT the old -1 SPECIAL rider that
	; made it overtuned: retype + confuse only. We reuse the engine's ConfusionSideEffectSuccess (confuses
	; the side opposite hWhoseTurn = the target, prints "became confused", 2-5 turn counter; no-ops if the
	; target is already confused). It reads the in-flight move effect only to decide whether to replay the
	; move animation, so temporarily set CONFUSION_SIDE_EFFECT (we already played SKITTERMIND's anim above),
	; then restore MINDWIPE_EFFECT for any post-move bookkeeping.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .gotEffPtr
	ld hl, wEnemyMoveEffect
.gotEffPtr
	ld a, CONFUSION_SIDE_EFFECT
	ld [hl], a
	callfar ConfusionSideEffectSuccess ; set CONFUSED on the target + a 2-5 turn counter
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
; refresh of the user to its NATURAL types + palette (curing SKITTERMIND's BUG / WATERIFY's WATER + their
; palettes), then strips FLYING/FLOATING for this turn (grounding it; NORMAL if that would leave it
; typeless, e.g. a CONVERSION'd pure-Flyer). The stripped types come back at the start of the user's next
; turn via RestoreRoostedTypes (callfar'd from the move preamble). hWhoseTurn = the ROOST user.
RoostEffect_::
	farcall HealEffect_          ; heal 1/2 + move animation + "regained health" (RAZOR_WIND move num -> 1/2)
	call RefreshUserNaturalTypes ; restore base types + clear the WATERIFY/CONVERSION/SKITTERMIND palette flags
	ldh a, [hWhoseTurn]          ; point hl at the ROOST USER's type1 for StripFlyingFloating
	and a
	ld hl, wBattleMonType1
	jr z, .roostStrip
	ld hl, wEnemyMonType1
.roostStrip
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
; This undoes any SKITTERMIND (BUG) / WATERIFY (WATER) / CONVERSION retype + their palettes. hWhoseTurn = user.
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
	res 3, [hl]                 ; SKITTERMIND gray
	jp RunDefaultPaletteCommand ; repaint to the natural palette (home; tail-call)

; Sunsette: remove FLYING ($02) and FLOATING ($12) from the TWO type bytes at hl (hl -> type1). If both are
; an air type (e.g. a CONVERSION'd pure-Flyer/Floater) the mon would be left typeless, so it becomes NORMAL;
; if only one is, the surviving type fills both slots (a clean mono-type). The CALLER sets hl to the side it
; wants: ROOST -> the user's type1, TEMPEST -> the target's type1. Returns carry SET if it changed
; something (there was an air type), carry CLEAR if neither byte was air (no change).
StripFlyingFloating:
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
	ret nc                      ; neither is air -> no change (carry clear)
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
	scf                         ; changed
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

; Sunsette: TEMPEST (was TWISTER) grounds the TARGET on a damaging hit - strips its FLYING ($02) / FLOATING
; ($12) type until it switches out or ROOSTs (RefreshUserNaturalTypes reloads natural types). Points hl at
; the TARGET's type1 (opponent of hWhoseTurn) and runs StripFlyingFloating directly on it. Only prints if a
; type was actually stripped. Reached via the effect dispatch (TEMPEST_EFFECT -> HazeFlinchEffect_, post-damage,
; target alive); the Fly-invuln reach is handled separately in CheckSemiInvulnBypass.
TempestGround:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1   ; player attacking -> target = enemy
	jr z, .gotType
	ld hl, wBattleMonType1
.gotType
	call StripFlyingFloating
	ret nc                  ; target had no FLYING/FLOATING -> nothing stripped, no message
	ld hl, TempestGroundText
	rst _PrintText
	ret

TempestGroundText:
	text_far _TempestGroundText
	text_end

; Sunsette: SHADOW BOX (GHOST 90/60-BP brace-counter). Post-damage rider reached via the Haze trampoline ->
; HazeFlinchEffect_ (so it fires after the move's own damage, like HOBBLE/Gust). hWhoseTurn = the SHADOW BOX
; user. It reads the FOE's SELECTED move for the turn (their intent) via FoeSelectedMoveIsSpecial:
;   foe's move is SPECIAL-typed -> you read it right: confuse the FOE.
;   foe's move is anything else -> you whiffed the read: confuse YOURSELF.
; (The damage tier 75/35 was already set pre-damage by ShadowBoxPowerModifier reading the same signal, and
; the "half damage from a Special hit" brace is applied in the damage path when the foe's Special move lands.)
; Sunsette: SAPPING COLD (ICE drain). Post-damage rider via the Haze trampoline. SAPPING COLD goes LAST, so
; by the time this runs the foe has acted: drain half the damage to the user (the Absorb half), then - if the
; user took NO direct damaging hit this turn (FINISHER_INTERRUPTED clear, shared with FINISHER) - freeze the
; target. FIRE/ICE targets and already-statused targets can't be frozen. hWhoseTurn = the SAPPING COLD user.
SappingColdEffect_:
	callfar DrainHPEffect_     ; heal 1/2 of wDamage to the user (+ "sucked health!" line)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus1
	jr z, .gotUser
	ld hl, wEnemyBattleStatus1
.gotUser
	bit FINISHER_INTERRUPTED, [hl]
	ret nz                     ; the user was struck this turn -> the cold doesn't set in
	; target = the side opposite hWhoseTurn
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus
	ld de, wEnemyMonType1
	jr z, .gotTarget
	ld hl, wBattleMonStatus
	ld de, wBattleMonType1
.gotTarget
	ld a, [hl]
	and a
	ret nz                     ; target already statused -> no freeze
	ld a, [de]
	cp FIRE
	ret z                      ; FIRE immune to freeze
	cp ICE
	ret z                      ; ICE immune to freeze
	inc de
	ld a, [de]
	cp FIRE
	ret z
	cp ICE
	ret z
	callfar ClearHyperBeam
	ld a, 1 << FRZ
	ld [hl], a                 ; freeze the target
	callfar HalveSpecialAndSpeedDueToFreeze
	jpfar PrintFrozenText      ; "frozen solid!" + redraw the target's HP bar

ShadowBoxEffect_:
	call FoeSelectedMoveIsSpecial ; e = 1 if the foe's selected move is special-typed
	ld a, e
	and a
	jr z, .whiffedRead
; read the foe's Special attack -> confuse the FOE (the side opposite the user)
	callfar ConfusionSideEffectSuccess
	ret
.whiffedRead
; swung at a shadow -> confuse YOURSELF (flip hWhoseTurn so the confusion target is the user, then restore)
	ldh a, [hWhoseTurn]
	push af
	xor 1
	ldh [hWhoseTurn], a
	callfar ConfusionSideEffectSuccess
	pop af
	ldh [hWhoseTurn], a
	ret

; Sunsette: carry/e verdict on whether the FOE's selected move this turn is special-typed (type >= SPECIAL,
; the same boundary the damage code uses - so GHOST, and NORMAL moves like HYPER BEAM / TRI ATTACK / EGG
; BOMB, all read as NON-special; it is purely type-based). hWhoseTurn = the SHADOW BOX user, so the foe is
; the opposite side. Loads the foe's move into the wMoveData scratch (FarCopyData, so the live move buffers
; are untouched) and reads its type. Returns e = 1 (special) / 0 (non-special). Clobbers a/bc/de/hl, wMoveData.
FoeSelectedMoveIsSpecial:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemySelectedMove] ; user = player -> foe = enemy
	jr z, .gotMove
	ld a, [wPlayerSelectedMove]
.gotMove
	and a
	jr z, .no                  ; no move selected (sleep/flinch) -> treat as non-special
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wMoveData
	ld a, BANK(Moves)
	call FarCopyData           ; copy the move's data into scratch (no clobber of the live move buffers)
	ld a, [wMoveData + MOVE_TYPE]
	cp SPECIAL
	jr c, .no                  ; type < SPECIAL -> non-special
	ld e, 1
	ret
.no
	ld e, 0
	ret

; Sunsette: BLOSSOM BLITZ (PETAL_DANCE) - 50% chance to raise the USER's SPEED by 1 (replaces the old confuse
; chance). Reached from the shared HazeEffect trampoline; in AlwaysHappen + SpecialEffects so it fires once,
; even on a KO (like JOLT BOLT). Reuses RaiseUserStatViaSwap (same bank) for the +1 SPEED.
; Sunsette: shared by BLOSSOM BLITZ (PETAL_DANCE) and RIPTIDE (WATERFALL): a 50% chance to raise the user's
; SPEED by 1. RIPTIDE is a guaranteed +1 SPEED when used by its signature species (GYARADOS / SEAKING /
; GOLDEEN) and signatures are ON; everyone else (and BLOSSOM BLITZ) rolls the 50%.
BlossomBlitzEffect_:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wBattleMonSpecies
	jr z, .gotMove
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyMonSpecies
.gotMove
	cp RIPTIDE ; RIPTIDE (internal const WATERFALL)?
	jr nz, .roll ; BLOSSOM BLITZ / any other user -> plain 50%
	ld a, [hl] ; user species
	cp GYARADOS
	jr z, .signature
	cp SEAKING
	jr z, .signature
	cp GOLDEEN
	jr nz, .roll
.signature
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	jr z, .raise ; signatures ON -> guaranteed +1 SPEED
	; signatures OFF -> fall through to the 50% roll
.roll
	callfar FarBattleRandom ; d = random byte (de survives the bankswitch)
	ld a, d
	cp 50 percent + 1
	ret nc ; 50%: no SPEED boost
.raise
	ld a, SPEED_UP1_EFFECT
	jp RaiseUserStatViaSwap ; +1 SPEED to the user

; Sunsette: UNDERBUG (Vicegrip) / METEOR SWEEP (Rolling Kick) signature - guaranteed -1 SPEED and -1
; EVASION to the TARGET on hit (post-damage; HOBBLE_EFFECT is kept out of SpecialEffects so it runs via
; .executeOtherEffects, i.e. only when the move connected and the target survived). Reached from the
; shared HazeEffect trampoline via HazeFlinchEffect_. We borrow StatModifierDownEffect twice by
; temporarily pointing the user's move effect at SPEED_DOWN1 then EVASION_DOWN1, each with
; FLAG_SKIP_STAT_ANIMATION (skips the accuracy/invuln re-test + the stat anim, so the drop is guaranteed)
; and FLAG_SKIP_NPC_STAT_DOWN_DEBUFF (so an enemy user isn't subject to the 25% stat-down miss). If the
; target has a substitute, StatModifierDownEffect bails to MoveMissed - harmless, the move already hit.
HobbleEffect_:
	SetFlag FLAG_SKIP_STAT_ANIMATION
	SetFlag FLAG_SKIP_NPC_STAT_DOWN_DEBUFF
	ld a, SPEED_DOWN1_EFFECT
	call .applyDrop ; -1 SPEED on the target ("fell" line, no anim, guaranteed)
	ld a, EVASION_DOWN1_EFFECT
	call .applyDrop ; -1 EVASION on the target
	ResetFlag FLAG_SKIP_NPC_STAT_DOWN_DEBUFF
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	; restore the real move effect (HOBBLE_EFFECT)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .restoreReal
	ld hl, wEnemyMoveEffect
.restoreReal
	ld a, HOBBLE_EFFECT
	ld [hl], a
	ret

; a = the temporary -1 stat-down effect to apply; StatModifierDownEffect re-derives its own side pointers
; from hWhoseTurn, so we only need to write the temp effect into the user's move-effect byte each time.
.applyDrop
	push af
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .gotPtr
	ld hl, wEnemyMoveEffect
.gotPtr
	pop af
	ld [hl], a
	callfar StatModifierDownEffect
	ret

; Sunsette: MAXIMIZE (MAXIMIZE_EFFECT, repurposed from the unused ACID_SIDE_EFFECT). A 0-BP self-buff in
; ResidualEffects2, reached via effects.asm's MaximizeEffect trampoline (jpfar). It maxes the user's
; ATTACK to +6 (Belly-Drum style: slam the stage straight to MAX_STAT_LEVEL and recompute), then drops the
; user's EVASION and SPEED by 2 each. A slowed copy of the user's own cry plays over the outward spiral.
; hWhoseTurn = the MAXIMIZE user throughout. MaximizeEffect_ ends in ret -> back to JumpMoveEffect's caller.
MaximizeEffect_::
	callfar PlayCurrentMoveAnimation2 ; 0-BP move: nothing else plays the outward spiral, so do it here
	call PlayMaximizeUserCry
	; --- ATTACK -> +6 ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMonStatMods
	jr z, .gotMods
	ld hl, wEnemyMonStatMods
.gotMods
	ld a, MAX_STAT_LEVEL
	ld [hl], a ; MOD_ATTACK is offset 0 in the stat-mod array (Attack, Defense, Speed, Special, Acc, Eva)
	; recompute the user's modified Atk/Def/Spd/Spc from its unmodified stats + the new stages
	ldh a, [hWhoseTurn]
	ld [wCalculateWhoseStats], a ; 0 = player, nonzero = enemy (same sense as hWhoseTurn)
	callfar CalculateModifiedStats
	; CalculateModifiedStats ignores the burn penalty, so reapply it to the now-maxed ATTACK.
	; HalveAttackDueToBurn acts on the OPPONENT of hWhoseTurn, so flip the turn around the call.
	ldh a, [hWhoseTurn]
	push af
	xor 1
	ldh [hWhoseTurn], a
	callfar HalveAttackDueToBurn
	pop af
	ldh [hWhoseTurn], a
	; player-only: reapply the badge ATTACK boost on top (parity with the normal stat-up moves)
	ldh a, [hWhoseTurn]
	and a
	jr nz, .announce
	ld a, MOD_ATTACK
	ld [wWhatStat], a
	callfar ApplyBadgeBoostsForSpecificStat
	ld a, $ff
	ld [wWhatStat], a ; no longer modifying a stat
.announce
	ld hl, MaximizeText
	rst _PrintText
	; --- SPEED -2 then EVASION -2 on the USER (b = the user's side: 0=enemy,1=player, i.e. NOT hWhoseTurn) ---
	ldh a, [hWhoseTurn]
	xor 1
	ld b, a
	ld c, SPEED_DOWN2_EFFECT
	call ApplyStatDownToTarget   ; "<user>'s SPEED sharply fell!"
	ldh a, [hWhoseTurn]
	xor 1
	ld b, a
	ld c, EVASION_DOWN2_EFFECT
	jp ApplyStatDownToTarget     ; "<user>'s EVASION sharply fell!" (tail call -> ret)

; Sunsette: play the MAXIMIZE user's own cry, but slowed (lower tempo) for a deep, swelling sound. GetCryData
; (home) returns the cry's sound id in a and seeds wFrequencyModifier/wTempoModifier from the mon's base cry;
; we override the tempo to drag it out. (A true pitch-DOWN isn't cleanly possible - the cry frequency
; modifier only ADDS to the channel period - so the slow tempo carries the "powering up" effect.)
PlayMaximizeUserCry:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	call GetCryData      ; a = cry sound id; seeds wFrequencyModifier / wTempoModifier from the base
	ld b, a              ; stash the sound id
	ld a, $28
	ld [wTempoModifier], a ; low tempo = slow, drawn-out cry (tunable; $28 noticeably slower than typical)
	ld a, b
	rst _PlaySound
	jp WaitForSoundToFinish

MaximizeText:
	text_far _MaximizeText
	text_end

; Sunsette: CheckSemiInvulnBypass + CheckReachAndAutoHit (the Fly/Dig/HYDROBATH reach + auto-hit hit-test
; helpers) were moved to their own floating section, engine/battle/semi_invuln_reach.asm, to free newCode space.
; Both are reached from the Battle Core only via callfar, so relocating their bank is safe.

; Sunsette: HEAT RUSH's effect body, floated here out of the full Battle Core (its trampoline HeatRushEffect
; jpfar's here) so the reclaimed bytes make room for HYDROBATH's charge hooks. Heat Rush deals damage and
; always raises the user's SPEED by one stage (Flame-Charge style). hWhoseTurn = the user.
HeatRushEffect_::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	jr z, .next
	ld hl, wEnemyMoveEffect
.next
	push hl
	ld [hl], SPEED_UP1_EFFECT
	callfar StatUpSideEffect
	pop hl
	ld [hl], HEAT_RUSH_EFFECT
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

; Sunsette: SECOND WIND also silently tops up technique - restore 1 PP to the active player mon's LOWEST
; non-full-PP move (ties -> lowest slot). No text. Called from SecondWindHeal right after the HP heal.
; GetMaxPP (wMonDataLocation = 4 -> in-battle mon, keyed by wCurrentMenuItem) gives each slot's true max PP
; (PP Ups included). curPP/best are kept across the GetMaxPP callfar on the stack (it clobbers a/bc/de/hl).
; Writes both wBattleMonPP and the party copy (skipping the party write when Transformed, like DecrementPP).
SecondWindRestorePP::
	ld d, $ff ; bestPP so far ($ff sentinel - any real current PP is lower)
	ld e, $ff ; bestSlot ($ff = none found yet)
	ld c, 0   ; slot index
.loop
	ld b, 0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next ; empty move slot
	ld hl, wBattleMonPP
	add hl, bc
	ld a, [hl]
	and PP_MASK ; a = this slot's current PP (drop the PP Up count bits)
	push de     ; save best (d=bestPP, e=bestSlot)
	push af     ; save curPP
	push bc     ; save slot
	ld a, c
	ld [wCurrentMenuItem], a
	ld a, 4 ; player's in-battle pokemon
	ld [wMonDataLocation], a
	callfar GetMaxPP ; -> wMaxPP (true max, PP Ups included)
	pop bc ; c = slot
	pop af ; a = curPP
	pop de ; d = bestPP, e = bestSlot
	ld b, a ; b = curPP
	ld a, [wMaxPP]
	cp b
	jr z, .next ; curPP == maxPP -> full, skip
	jr c, .next ; maxPP < curPP (shouldn't happen) -> skip
	ld a, d ; bestPP
	cp b
	jr c, .next ; bestPP < curPP -> not lower, keep current best
	jr z, .next ; tie -> keep the earlier slot
	ld d, b ; new lowest non-full PP
	ld e, c ; new best slot
.next
	inc c
	ld a, c
	cp NUM_MOVES
	jr c, .loop
	ld a, e
	cp $ff
	ret z ; every move full (or none) -> nothing to restore
	ld c, e ; +1 PP in the in-battle struct (curPP < max, so no carry into the PP Up bits)
	ld b, 0
	ld hl, wBattleMonPP
	add hl, bc
	inc [hl]
	ld a, [wPlayerBattleStatus3]
	bit TRANSFORMED, a
	ret nz ; transformed mons keep separate copied PP (see DecrementPP) - don't touch the party copy
	ld hl, wPartyMon1PP
	ld a, [wPlayerMonNumber]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld c, e
	ld b, 0
	add hl, bc
	inc [hl]
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
	res 3, [hl] ; and isn't SKITTERMIND-grayed (bit 3)
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
	xor a ; target = enemy
	call CheckCeruleanWaterSpeed ; Sunsette: CERULEAN pool +1 SPEED for a trainer's WATER mon
	xor a ; target = enemy
	call CheckViridianForestDefense ; Sunsette: VIRIDIAN FOREST +1 DEFENSE for a GRASS/BUG enemy mon
	ret

; Sunsette: ADDED: certain maps apply an effect to the ENEMY trainer's just-sent-out mon and print
; a flavor line. Two effect types (table-driven, add a row to extend):
;   ENEMYBUFF_STATUP  - +1 stat stage (param = the *_UP1_EFFECT). The line replaces the default
;                       "ENEMY X's STAT rose!" via the wRegionalStatRiseTextID skip.
;   ENEMYBUFF_FLOURISH - set the FLOURISH regen flag (param unused).
; Enemy stat mods reset to neutral per send-out (LoadEnemyMonData), so +1 is per-mon, no stacking.
; Runs for trainer battles only (wild mons aren't sent via EnemySendOutFirstMon). NOTE: the
; environmental POISON hazards (Celadon "spores", Lavender Tower "black mist") poison the PLAYER's
; mon, not the enemy (the enemy mons there are mostly Poison/Ghost = immune) - see
; ApplyPlayerSendOutMapEffects.
DEF ENEMYBUFF_STATUP   EQU 0
DEF ENEMYBUFF_FLOURISH EQU 1
DEF ENEMYBUFF_MESSAGE  EQU 2 ; Sunsette: print a flavor line only, no stat change (e.g. Bruno/Viridian/rival crit telegraphs)

ApplyEnemySendOutMapEffects:
	ld hl, EnemySendOutBuffTable
.search
	ld a, [hl]
	cp $FF
	ret z ; no (more) buff rows for this map
	ld b, a
	ld a, [wCurMap]
	cp b
	jr z, .found
	ld de, 5 ; entry size: db map, db type, db param, dw text
	add hl, de
	jr .search
.found
	push hl ; keep scanning after this row so one map can stack rows (LANCE = +SPEED then a silent +ACCURACY)
	inc hl
	ld a, [hli] ; effect type
	ld d, a
	ld a, [hli] ; param (the *_UP1 stat-up effect; ignored for non-STATUP rows)
	ld e, a
	ld c, [hl]
	inc hl
	ld b, [hl]  ; bc = flavor text pointer (0 = silent)
	ld a, d
	cp ENEMYBUFF_FLOURISH
	jr z, .growing
	cp ENEMYBUFF_MESSAGE
	jr z, .message
	; ENEMYBUFF_STATUP: e = the *_UP1 effect, bc = flavor text (0 = none, e.g. Lance's 2nd stat)
	call DoEnemyStatUp
	jr .next
.message
	ld h, b
	ld l, c
	rst _PrintText
	jr .next
.growing ; ENEMYBUFF_FLOURISH
	ld hl, wEnemyBattleStatus3
	set FLOURISH, [hl]
	ld h, b
	ld l, c
	rst _PrintText
.next
	pop hl
	ld de, 5
	add hl, de
	jr .search

; Sunsette: raise the enemy mon's stat +1 (e = the *_UP1_EFFECT), default "rose!" line suppressed; print
; the flavor line in bc first unless bc == 0 (Lance's silent 2nd stat). Preserves nothing.
DoEnemyStatUp:
	ld a, b
	or c
	jr z, .silent
	ld h, b
	ld l, c
	push de
	rst _PrintText
	pop de
.silent
	ld b, 0 ; target = enemy
	ld c, e ; the *_UP1 effect
	jp ApplyStatUpToTarget

; Sunsette: raise +1 stat (c = a *_UP1_EFFECT) on one mon (b: 0 = enemy, 1 = player), no animation, the
; default "rose!" line suppressed via wRegionalStatRiseTextID. StatModifierUpEffect raises hWhoseTurn's
; OWN mon, so raise the ENEMY as the enemy's turn and the PLAYER as the player's turn. hWhoseTurn saved.
ApplyStatUpToTarget:
	ldh a, [hWhoseTurn]
	push af
	ld a, b
	and a
	jr nz, .playerTarget
	ld a, 1
	ldh [hWhoseTurn], a
	xor a
	ld [wEnemyMoveNum], a ; avoid the MINIMIZE substitute path inside StatModifierUpEffect
	ld a, c
	ld [wEnemyMoveEffect], a
	jr .apply
.playerTarget
	xor a
	ldh [hWhoseTurn], a
	ld [wPlayerMoveNum], a
	ld a, c
	ld [wPlayerMoveEffect], a
.apply
	ld a, 1
	ld [wRegionalStatRiseTextID], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect
	xor a
	ld [wRegionalStatRiseTextID], a
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	pop af
	ldh [hWhoseTurn], a
	ret

; Sunsette: print a themed line (hl), then +1 stat (c) on target b. Mirror of ApplyStatDownWithText.
ApplyStatUpWithText:
	push bc
	rst _PrintText
	pop bc
	jp ApplyStatUpToTarget

; map, effect type, param, dw flavor text. Terminated by $FF. A map may appear on multiple rows (all of
; them apply, in order) - LANCE uses +1 SPEED then a silent +1 ACCURACY. Cerulean/Fuchsia/Saffron/Lorelei
; are NOT here (handled by CheckCeruleanWaterSpeed / CheckArenaFirstMonStatus / the Saffron item block).
EnemySendOutBuffTable:
	db PEWTER_GYM,     ENEMYBUFF_STATUP,  SPECIAL_UP1_EFFECT
	dw .pewterText
	db VERMILION_GYM,  ENEMYBUFF_STATUP,  ATTACK_UP1_EFFECT
	dw .vermilionText
	db FIGHTING_DOJO,  ENEMYBUFF_STATUP,  DEFENSE_UP1_EFFECT
	dw .dojoText
	db CINNABAR_GYM,   ENEMYBUFF_STATUP,  SPECIAL_UP1_EFFECT
	dw .cinnabarText
	db VIRIDIAN_GYM,   ENEMYBUFF_MESSAGE, 0 ; double crit (critical_hit.asm); this row just telegraphs it
	dw .viridianText
	db AGATHAS_ROOM,   ENEMYBUFF_STATUP,  SPECIAL_UP1_EFFECT
	dw .agathaText
	db LANCES_ROOM,    ENEMYBUFF_STATUP,  SPEED_UP1_EFFECT
	dw .lanceText
	db LANCES_ROOM,    ENEMYBUFF_STATUP,  ACCURACY_UP1_EFFECT
	dw 0 ; silent: the +1 SPEED row above already printed Lance's line
	db BRUNOS_ROOM,    ENEMYBUFF_MESSAGE, 0 ; cannot be crit (critical_hit.asm); this row telegraphs it
	dw .brunoText
	db CHAMPIONS_ROOM, ENEMYBUFF_MESSAGE, 0 ; final rival double crit (critical_hit.asm); telegraph
	dw .rivalText
	db $FF
.pewterText
	text_far _PewterGymBuffText
	text_end
.vermilionText
	text_far _VermilionGymBuffText
	text_end
.dojoText
	text_far _FightingDojoBuffText
	text_end
.cinnabarText
	text_far _CinnabarGymBuffText
	text_end
.viridianText
	text_far _ViridianGymBuffText
	text_end
.agathaText
	text_far _AgathaRoomBuffText
	text_end
.lanceText
	text_far _LanceRoomBuffText
	text_end
.brunoText
	text_far _BrunoRoomBuffText
	text_end
.rivalText
	text_far _ChampionRivalBuffText
	text_end

; Sunsette: ARENA EFFECT - CERULEAN GYM (swimming pool): a WATER-type mon entering battle gains +1 SPEED.
; BOTH sides (called from the player hook with a=1 and EnemyOnSendOut with a=0). a: 0 = enemy, 1 = player.
CheckCeruleanWaterSpeed:
	ld b, a
	ld a, [wCurMap]
	cp CERULEAN_GYM
	ret nz
	ld a, b
	and a
	ld hl, wEnemyMonType1
	jr z, .gotTypes
	ld hl, wBattleMonType1
.gotTypes
	ld a, [hli]
	cp WATER
	jr z, .buff
	ld a, [hl]
	cp WATER
	ret nz
.buff
	ld c, SPEED_UP1_EFFECT
	ld hl, CeruleanPoolText
	jp ApplyStatUpWithText
CeruleanPoolText:
	text_far _CeruleanGymBuffText
	text_end

; Sunsette: ARENA EFFECT - LORELEI freeze / FUCHSIA confuse, applied to the player's FIRST mon of a
; trainer battle ONLY (not switch-ins). wArenaFirstPlayerMonSent is cleared at battle start; we set it
; on the first player send-out (even on non-arena maps) so later switch-ins never trigger.
CheckArenaFirstMonStatus:
	ld a, [wArenaFirstPlayerMonSent]
	and a
	ret nz
	ld a, 1
	ld [wArenaFirstPlayerMonSent], a
	ld a, [wIsInBattle]
	cp 2
	ret nz ; trainer battles only
	ld a, [wCurMap]
	cp LORELEIS_ROOM
	jr z, .freeze
	cp FUCHSIA_GYM
	ret nz
.confuse
	ld hl, wPlayerBattleStatus1
	bit CONFUSED, [hl]
	ret nz
	set CONFUSED, [hl]
	call Random
	and %11
	add 2 ; 2-5 turns
	ld [wPlayerConfusedCounter], a
	ld hl, FuchsiaConfuseText
	rst _PrintText
	ret
.freeze
	ld hl, wBattleMonStatus
	ld a, [hl]
	and a
	ret nz ; don't overwrite an existing status
	set FRZ, [hl]
	ld hl, LoreleiFreezeText
	rst _PrintText
	ret
FuchsiaConfuseText:
	text_far _FuchsiaGymBuffText
	text_end
LoreleiFreezeText:
	text_far _LoreleiRoomFreezeText
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
	ld a, EMETIC_PURGE ; MIASMA
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