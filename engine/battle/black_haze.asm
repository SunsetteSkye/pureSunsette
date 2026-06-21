; Sunsette: SHADOW GAME (HAZE) field effect, floated into its own ROMX section because newCode (where the
; rest of the Haze dispatcher lives) is full. Reached via `callfar BlackHazeFieldEffect` from
; HazeFlinchEffect_, right after the standard HazeEffect_ reset has wiped every stat stage + VOLATILE status
; on BOTH active mons (the caller saves/restores the non-volatile status bytes, so permanent status like
; sleep/poison/burn survives). From that clean slate we blanket the field: badly poison BOTH mons (a mon
; that kept a permanent status is skipped by the already-statused guard) and raise BOTH mons'
; EVASION by 2. Gen 1 poison immunity is respected (a POISON-type or already-statused mon can't be
; poisoned), so a Poison-type user shrugs off its own toxin while the foe is left on a Toxic clock, both
; hidden in the same evasion fog. hWhoseTurn = the SHADOW GAME user; we save/restore it across the routine.
; Self-contained (no newCode-local calls) so the linker can drop this section into any bank with room.
SECTION "Sunsette Black Haze", ROMX

BlackHazeFieldEffect::
	ld hl, BlackHazeFogText
	rst _PrintText
	xor a                  ; enemy mon
	call BlackHazeBadlyPoisonSide
	ld a, 1                ; player mon
	call BlackHazeBadlyPoisonSide
	; raise EVASION +2 on BOTH sides; save the real hWhoseTurn (the helper repoints it) and restore it after
	ldh a, [hWhoseTurn]
	push af                ; save the SHADOW GAME user
	call BlackHazeRaiseEvasion   ; a = user side -> +2 the user's EVASION
	pop af
	push af
	xor 1                  ; the foe side
	call BlackHazeRaiseEvasion   ; +2 the foe's EVASION
	pop af
	ldh [hWhoseTurn], a    ; restore the SHADOW GAME user
	; refresh both HUDs so the new poison icons show
	callfar ReadPlayerMonCurHPAndStatus
	callfar DrawPlayerHUDAndHPBar
	callfar DrawEnemyHUDAndHPBar
	ret

; Badly-poison one side. a: 0 = enemy mon, nonzero = player mon. Skips a POISON- or GHOST-type (both are
; immune to poison) or an already-statused mon. Sets PSN + BADLY_POISONED + zeroes the Toxic counter
; (exactly what TOXIC does).
BlackHazeBadlyPoisonSide:
	and a
	jr nz, .player
	ld a, [wEnemyMonType1]
	cp POISON
	ret z
	cp GHOST
	ret z
	ld a, [wEnemyMonType2]
	cp POISON
	ret z
	cp GHOST
	ret z
	ld hl, wEnemyMonStatus
	ld de, wEnemyBattleStatus3
	ld bc, wEnemyToxicCounter
	jr .apply
.player
	ld a, [wBattleMonType1]
	cp POISON
	ret z
	cp GHOST
	ret z
	ld a, [wBattleMonType2]
	cp POISON
	ret z
	cp GHOST
	ret z
	ld hl, wBattleMonStatus
	ld de, wPlayerBattleStatus3
	ld bc, wPlayerToxicCounter
.apply
	ld a, [hl]
	and a
	ret nz                 ; already statused (shouldn't happen post-Haze, but stay safe)
	set PSN, [hl]
	ld a, [de]
	set BADLY_POISONED, a
	ld [de], a
	xor a
	ld [bc], a             ; reset the Toxic counter so damage ramps from 1/16
	ret

; Raise EVASION +2 on one side, no animation. a = which side acts as the "user" (0 = player, nonzero =
; enemy - same sense as hWhoseTurn). Self-contained version of RaiseUserStatViaSwap (which lives in the full
; newCode bank): point hWhoseTurn at the side, temp-swap its move effect/num so StatModifierUpEffect raises
; it (and dodges the Minimize/substitute path), then restore the move effect/num. hWhoseTurn is left on the
; raised side; the caller restores it.
BlackHazeRaiseEvasion:
	ldh [hWhoseTurn], a    ; StatModifierUpEffect raises hWhoseTurn's side
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .ptrs
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.ptrs
	ld a, [hl]
	push af                ; save real move effect
	ld a, [de]
	push af                ; save real move num
	ld a, EVASION_UP2_EFFECT
	ld [hl], a
	xor a
	ld [de], a
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	; callfar clobbered hl/de - re-derive the pointers from hWhoseTurn to restore
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .restore
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.restore
	pop af
	ld [de], a             ; restore move num
	pop af
	ld [hl], a             ; restore move effect
	ret

BlackHazeFogText:
	text_far _BlackHazeFogText
	text_end

; Sunsette: MIASMA (POISON_GAS). Priority, 0-BP, no flinch. Reached via the Haze trampoline ->
; HazeFlinchEffect_ (MIASMA_EFFECT, in ResidualEffects1 so it runs pre-damage; like Haze it does NOT run an
; accuracy test, so the clear always lands). A one-sided "revenge stat clear": resets ONLY the FOE's stat
; stages to neutral + recomputes its battle stats (Haze, foe only - ignores Substitute), then regular-poisons
; the foe (POISON/GHOST immune, already-statused unaffected; a Substitute eats the poison). hWhoseTurn = the
; user; the foe is the opposite side, and (player turn -> foe = enemy = side 0) so the foe-side arg = hWhoseTurn.
MiasmaEffect_::
	callfar PlayCurrentMoveAnimation2
	; --- reset the FOE's stat mods to neutral + recompute its battle stats from the unmodified copy ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonAttackMod        ; player's turn -> foe = enemy
	ld de, wEnemyMonUnmodifiedAttack
	ld bc, wEnemyMonAttack
	jr z, .gotFoe
	ld hl, wPlayerMonAttackMod
	ld de, wPlayerMonUnmodifiedAttack
	ld bc, wBattleMonAttack
.gotFoe
	push de                          ; unmodified-stat source
	push bc                          ; battle-stat dest
	ld a, $7
	ld b, NUM_STAT_MODS
.resetModsLoop
	ld [hli], a
	dec b
	jr nz, .resetModsLoop
	pop hl                           ; hl = battle-stat dest
	pop de                           ; de = unmodified-stat source
	ld b, (NUM_STATS - 1) * 2
.resetStatsLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .resetStatsLoop
	ld hl, MiasmaScatterText
	rst _PrintText
	; --- regular-poison the FOE, unless it has a Substitute (Sub eats the poison; the clear already landed) ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus2
	jr z, .gotSub
	ld hl, wPlayerBattleStatus2
.gotSub
	bit HAS_SUBSTITUTE_UP, [hl]
	ret nz
	ldh a, [hWhoseTurn]
	call MiasmaPoisonFoe             ; carry set if poison was applied
	ret nc
	callfar ReadPlayerMonCurHPAndStatus
	callfar DrawPlayerHUDAndHPBar
	callfar DrawEnemyHUDAndHPBar
	ld hl, MiasmaPoisonedText
	rst _PrintText
	ret

; Regular-poison the FOE. a = foe side (0 = enemy, nonzero = player). Returns carry SET if poison landed.
; Skips a POISON- or GHOST-type (immune) and an already-statused mon. Sets PSN only (regular, not toxic).
MiasmaPoisonFoe:
	and a
	jr nz, .player
	ld a, [wEnemyMonType1]
	cp POISON
	jr z, .immune
	cp GHOST
	jr z, .immune
	ld a, [wEnemyMonType2]
	cp POISON
	jr z, .immune
	cp GHOST
	jr z, .immune
	ld hl, wEnemyMonStatus
	jr .apply
.player
	ld a, [wBattleMonType1]
	cp POISON
	jr z, .immune
	cp GHOST
	jr z, .immune
	ld a, [wBattleMonType2]
	cp POISON
	jr z, .immune
	cp GHOST
	jr z, .immune
	ld hl, wBattleMonStatus
.apply
	ld a, [hl]
	and a
	jr nz, .immune                   ; already statused
	set PSN, [hl]
	scf
	ret
.immune
	and a                            ; clear carry
	ret

MiasmaScatterText:
	text_far _MiasmaScatterText
	text_end
MiasmaPoisonedText:
	text_far _MiasmaPoisonedText
	text_end

; Sunsette: SENBONZAKURA (PETAL_DANCE). Damaging GRASS move; reached post-damage (hit OR KO) via the Haze
; trampoline -> HazeFlinchEffect_ (SENBONZAKURA_EFFECT, in AlwaysHappen + SpecialEffects so it fires once,
; even on a KO). A self-effect on the USER only: reset the user's stat stages to neutral + recompute its
; battle stats from the unmodified copy (so any boosts OR drops it had are wiped), grant the FLOURISH regen
; state, then raise the user's EVASION by 1. The reset runs FIRST, so evasion always ends at exactly +1 - it
; can't be stacked turn over turn for dodge-tanking. The falling petals leave a clean slate and a single
; veil. hWhoseTurn = the user; the move's own damage animation already played, so we don't replay it.
; Self-contained (no newCode-local calls) so the linker can drop this section into any bank with room.
SenbonzakuraEffect_::
	; Sunsette: SENBONZAKURA's post-damage comeback rider. The FLOURISH regen scales with the desperation stage
	; (GetDesperationStage): stage 0 = plain strike (no regen), stage 1 = single FLOURISH (1/16 per turn), stages
	; 2-3 = DOUBLE_FLOURISH (1/8 per turn). Power scaling, the "desperate power!" line and the desperate animation
	; are all handled up front by the shared ComebackModifier; this is just the self-heal half. (The old stat
	; reset + EVASION +1 were dropped in the comeback rework.) Defensive, so it fires even on a miss/KO.
	callfar GetDesperationStage      ; e = desperation stage 0..3
	ld a, e
	and a
	ret z                            ; stage 0 -> no Flourish
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotS3
	ld hl, wEnemyBattleStatus3
.gotS3
	set FLOURISH, [hl]               ; stages 1-3 -> base regen
	ld a, e
	cp 2
	jr c, .announce                  ; stage 1 -> single Flourish only
	set DOUBLE_FLOURISH, [hl]        ; stages 2-3 -> doubled regen
.announce
	ld hl, SenbonzakuraText
	rst _PrintText
	ret

; Raise EVASION +1 on one side via the move-effect swap (no animation). a = side (0 = player, nonzero =
; enemy, same sense as hWhoseTurn). Mirrors BlackHazeRaiseEvasion but +1 instead of +2; hWhoseTurn is left
; on the raised side (= the caller's own side here, so no restore is needed).
SenbonzakuraRaiseEvasion:
	ldh [hWhoseTurn], a               ; StatModifierUpEffect raises hWhoseTurn's side
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .ptrs
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.ptrs
	ld a, [hl]
	push af                          ; save real move effect (SENBONZAKURA_EFFECT)
	ld a, [de]
	push af                          ; save real move num
	ld a, EVASION_UP1_EFFECT
	ld [hl], a
	xor a
	ld [de], a                       ; zero the move num to dodge the Minimize/substitute path
	SetFlag FLAG_SKIP_STAT_ANIMATION
	callfar StatModifierUpEffect
	ResetFlag FLAG_SKIP_STAT_ANIMATION
	; callfar clobbered hl/de - re-derive the pointers from hWhoseTurn to restore
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveEffect
	ld de, wPlayerMoveNum
	jr z, .restore
	ld hl, wEnemyMoveEffect
	ld de, wEnemyMoveNum
.restore
	pop af
	ld [de], a                       ; restore move num
	pop af
	ld [hl], a                       ; restore move effect
	ret

SenbonzakuraText:
	text_far _SenbonzakuraText
	text_end

; Sunsette: AQUA RING (ACID_ARMOR). 0-BP self-buff, reached via the Haze trampoline -> HazeFlinchEffect_
; (AQUA_RING_EFFECT, in ResidualEffects1). Grants the FLOURISH regen bit PLUS the DOUBLE_FLOURISH flag, so
; HandleGrowthRegen heals 1/8 of max HP per turn instead of 1/16. hWhoseTurn = the user. Both flags clear on
; switch-out (BattleStatus2/3 are cleared on send-out), so the ring ends when the mon leaves.
AquaRingEffect_::
	callfar PlayCurrentMoveAnimation2
	callfar SetUserFlourish          ; base FLOURISH regen bit (BattleStatus3) on the user
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus2
	jr z, .gotStatus
	ld hl, wEnemyBattleStatus2
.gotStatus
	set DOUBLE_FLOURISH, [hl]         ; doubles the regen to 1/8 per turn
	ld hl, AquaRingText
	rst _PrintText
	ret

AquaRingText:
	text_far _AquaRingText
	text_end

; Sunsette: CLAY ARMOR (FISSURE). 0-BP self-buff, reached via the Haze trampoline -> HazeFlinchEffect_
; (CLAY_ARMOR_EFFECT, in ResidualEffects1). Type-gated: the user must have an "earthbound body" type
; (FIGHTING / POISON / GROUND / ROCK / BUG) and must NOT be airborne (FLYING / FLOATING) - else it fails.
; On success it raises BOTH Reflect and Light Screen (the old ACID ARMOR dual-screen effect); a GROUND user
; additionally heals 1/2 of its max HP. Fails if a screen is already up (no recast / no stacking).
ClayArmorEffect_::
	; --- read the user's types (d = type1, e = type2) ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotTypes
	ld hl, wEnemyMonType1
.gotTypes
	ld a, [hli]
	ld d, a                          ; d = type1
	ld a, [hl]
	ld e, a                          ; e = type2
	; --- airborne disqualifier: FLYING or FLOATING on either type fails ---
	ld a, d
	cp FLYING
	jp z, .fail
	cp FLOATING
	jp z, .fail
	ld a, e
	cp FLYING
	jp z, .fail
	cp FLOATING
	jp z, .fail
	; --- eligibility: at least one type must be in the earthbound set ---
	ld a, d
	call IsClayArmorType
	jr c, .eligible
	ld a, e
	call IsClayArmorType
	jp nc, .fail
.eligible
	; --- screen-already-up guard (no recast while either screen is up) ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotS3
	ld hl, wEnemyBattleStatus3
.gotS3
	bit HAS_REFLECT_UP, [hl]
	jr nz, .fail
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jr nz, .fail
	set HAS_REFLECT_UP, [hl]
	set HAS_LIGHT_SCREEN_UP, [hl]
	callfar PlayCurrentMoveAnimation2
	ld hl, ClayArmorText
	rst _PrintText
	; --- GROUND user heals 1/2 of max HP ---
	ld a, d
	cp GROUND
	jr z, .heal
	ld a, e
	cp GROUND
	ret nz
.heal
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	jr z, .gotHealPtrs
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.gotHealPtrs
	ld a, [de]                       ; maxHP high
	ld [wHPBarMaxHP+1], a
	ld b, a
	inc de
	ld a, [de]                       ; maxHP low
	ld [wHPBarMaxHP], a
	ld c, a
	srl b
	rr c                             ; bc = maxHP / 2
	ld a, b
	or c
	jr nz, .nonZeroHeal
	inc c                            ; heal at least 1
.nonZeroHeal
	inc hl                           ; hl -> current HP low byte
	ld a, [hl]
	ld [wHPBarOldHP], a
	add c
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	adc b
	ld [hli], a
	ld [wHPBarNewHP+1], a
	ld a, [wHPBarMaxHP]              ; cap at max HP
	ld c, a
	ld a, [hld]
	sub c
	ld a, [wHPBarMaxHP+1]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .noOverfull
	ld a, b                          ; overfull: set HP to max
	ld [hli], a
	ld [wHPBarNewHP+1], a
	ld a, c
	ld [hl], a
	ld [wHPBarNewHP], a
.noOverfull
	callfar UpdateCurMonHPBar
	ld hl, ClayArmorHealText
	rst _PrintText
	ret
.fail
	ld hl, ClayArmorFailText
	rst _PrintText
	ret

; Returns carry SET if a (a type) is in the CLAY ARMOR earthbound set: FIGHTING/POISON/GROUND/ROCK/BUG.
IsClayArmorType:
	cp FIGHTING
	jr z, .yes
	cp POISON
	jr z, .yes
	cp GROUND
	jr z, .yes
	cp ROCK
	jr z, .yes
	cp BUG
	jr z, .yes
	and a                            ; clear carry
	ret
.yes
	scf
	ret

ClayArmorText:
	text_far _ClayArmorText
	text_end

ClayArmorHealText:
	text_far _ClayArmorHealText
	text_end

ClayArmorFailText:
	text_far _ButItFailedText
	text_end

; Sunsette: AURORA MIST (ETHEREAL, MIST_EFFECT). 0-BP, reached via the Haze trampoline. Always grants the
; classic Mist effect (STAT_DOWN_IMMUNITY: the user's stats can't be lowered) and removes the major status
; from BOTH active mons. The old NORMAL/DRAGON immunity is discarded. Then it branches on the user's type:
;   - NON-ICE user: retypes itself to pure ICE and takes on the cyan (PAL_CYANMON) coat. (So a non-Ice mon
;     spends its first cast becoming Ice, and a second cast to raise screens - "can be used twice".)
;   - ICE user: raises BOTH Reflect and Light Screen. Anti-recast guard: if a screen is already up, the whole
;     move fails (so an Ice mon can't spam it for the free status-clear).
AuroraMistEffect_::
	; --- up-front fail check: an ICE user whose screens are already up does nothing ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotTypePre
	ld hl, wEnemyMonType1
.gotTypePre
	ld a, [hli]
	cp ICE
	jr z, .iceUserPre
	ld a, [hl]
	cp ICE
	jr nz, .proceed          ; non-Ice user never fails
.iceUserPre
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotS3Pre
	ld hl, wEnemyBattleStatus3
.gotS3Pre
	bit HAS_REFLECT_UP, [hl]
	jr nz, .fail
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jr nz, .fail
.proceed
	callfar PlayCurrentMoveAnimation2
	; --- Mist: STAT_DOWN_IMMUNITY on the user (stats can't be lowered) ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus2
	jr z, .gotS2
	ld hl, wEnemyBattleStatus2
.gotS2
	set STAT_DOWN_IMMUNITY, [hl]
	; --- remove the major status from BOTH mons (reuses CureUserStatus, flipping hWhoseTurn for the foe) ---
	callfar CureUserStatus
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	callfar CureUserStatus
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	ld hl, AuroraMistText
	rst _PrintText
	; --- branch on the user's type (unchanged by the status clear) ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotType
	ld hl, wEnemyMonType1
.gotType
	ld a, [hli]
	cp ICE
	jr z, .iceUser
	ld a, [hl]
	cp ICE
	jr z, .iceUser
	; --- NON-ICE user: retype to pure ICE + CYANMON palette ---
	dec hl                   ; hl -> type1
	ld a, ICE
	ld [hli], a              ; type1 = ICE
	ld [hli], a              ; type2 = ICE, hl -> Flags
	set 1, [hl]              ; force PAL_CYANMON (preserves bit 0 = alt-palette flag)
	call RunDefaultPaletteCommand
	ld hl, AuroraMistFrozenText
	rst _PrintText
	ret
.iceUser
	; --- ICE user: raise both screens (guard above guarantees neither is up yet) ---
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerBattleStatus3
	jr z, .gotS3
	ld hl, wEnemyBattleStatus3
.gotS3
	set HAS_REFLECT_UP, [hl]
	set HAS_LIGHT_SCREEN_UP, [hl]
	ld hl, AuroraMistScreenText
	rst _PrintText
	ret
.fail
	ld hl, AuroraMistFailText
	rst _PrintText
	ret

AuroraMistText:
	text_far _AuroraMistText
	text_end

AuroraMistFrozenText:
	text_far _AuroraMistFrozenText
	text_end

AuroraMistScreenText:
	text_far _AuroraMistScreenText
	text_end

AuroraMistFailText:
	text_far _ButItFailedText
	text_end

; Sunsette: METAMORPHIC (EXPLOSION, METAMORPHIC_EFFECT). A damaging ROCK move; the Haze trampoline runs this
; as the post-damage effect, AND on a miss too (core.asm routes METAMORPHIC_EFFECT through .notDone like
; EXPLODE, so SpeciesMoveBonus still fires - the reckless user pays the cost + transforms even when it whiffs).
; It always costs the user a flat 1/4 of MAX HP (like SUBSTITUTE), floored at 1 so it never self-KOs. If the
; user is ROCK-type it then sheds ROCK (a mono-Rock mon - possible via Conversion - falls back to NORMAL),
; surges to +6 SPEED, and takes on the PAL_GAMEFREAK "super-saiyan" glow (Flags bit 4). A non-Rock user just
; pays the HP and gets no transformation.
MetamorphicEffect_::
	call MetamorphicSelfCost          ; 1/4 max-HP cost (SUBSTITUTE-style), floored at 1; animated HP drain
	; only ROCK-type users metamorphose
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .userType
	ld hl, wEnemyMonType1
.userType
	ld a, [hli]
	cp ROCK
	jr z, .isRock
	ld a, [hl]
	cp ROCK
	ret nz                           ; non-Rock user: just paid the HP cost, no transform
.isRock
	ld d, ROCK
	call ShedUserTypeD               ; shed ROCK (mono-Rock -> NORMAL)
	call MaxUserSpeed                ; SPEED -> +6
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonFlags
	jr z, .flags
	ld hl, wEnemyMonFlags
.flags
	set 4, [hl]                      ; PAL_GAMEFREAK glow
	call RunDefaultPaletteCommand
	ld hl, MetamorphicText
	rst _PrintText
	ret

; Sunsette: deduct 1/4 of the user's MAX HP (the SUBSTITUTE cost), flooring at 1 so METAMORPHIC never
; self-KOs, with an ANIMATED HP-bar drain (same wHPBar* / UpdateHPBar machinery the recoil effect uses).
; The MaxHP->HP offset is identical for the player and enemy battle structs, so one delta works either side.
MetamorphicSelfCost:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonMaxHP
	jr z, .got
	ld hl, wEnemyMonMaxHP
.got
	ld a, [hli]
	ld [wHPBarMaxHP + 1], a ; max HP high
	ld c, [hl]
	ld a, c
	ld [wHPBarMaxHP], a     ; max HP low
	ld a, [wHPBarMaxHP + 1]
	ld b, a
	srl b
	rr c
	srl b
	rr c                    ; bc = maxHP / 4 (b = 0 since maxHP <= 1023)
	ld de, wBattleMonHP - wBattleMonMaxHP
	add hl, de              ; hl -> current HP low byte
	ld a, [hl]
	ld [wHPBarOldHP], a
	sub c
	ld [hld], a             ; new HP low, hl -> HP high
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP + 1], a
	sbc b
	ld [hl], a             ; new HP high
	ld [wHPBarNewHP + 1], a
	jr nc, .animate
	; underflow -> floor at 1 HP (hl at HP high byte)
	xor a
	ld [hl], a
	ld [wHPBarNewHP + 1], a
	inc hl
	ld a, 1
	ld [hl], a
	ld [wHPBarNewHP], a
.animate
	hlcoord 10, 9
	ldh a, [hWhoseTurn]
	and a
	ld a, $1
	jr z, .updateBar
	hlcoord 2, 2
	xor a
.updateBar
	ld [wHPBarType], a
	predef UpdateHPBar      ; animate the bar draining from old to new
	jpfar DrawUserHPBar     ; fix the HP-bar colour after the drain

; Sunsette: CRYSTALLIZE's type-change (callfar'd from CrystallizeModifier in the full newCode bank). A
; Rock-like user (ROCK or CRYSTAL in either slot) refines its type1 to CRYSTAL; anyone else mineralizes
; its type1 to ROCK. The +2 DEFENSE rides the move's own DEFENSE_UP2_EFFECT, handled separately.
CrystallizeRetype::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotType
	ld hl, wEnemyMonType1
.gotType
	ld a, [hli] ; type1 (hl -> type2)
	cp ROCK
	jr z, .rockLike
	cp CRYSTAL
	jr z, .rockLike
	ld a, [hl] ; type2
	cp ROCK
	jr z, .rockLike
	cp CRYSTAL
	jr z, .rockLike
	ld a, ROCK ; non-Rock user -> type1 becomes ROCK
	jr .setType1
.rockLike
	ld a, CRYSTAL ; Rock-like user -> type1 refines to CRYSTAL
.setType1
	dec hl ; hl -> type1
	ld [hl], a
	ld hl, CrystallizeText
	rst _PrintText
	ret

CrystallizeText:
	text "It crystallized!"
	prompt

; Sunsette: SUPERNOVA (SELFDESTRUCT, SUPERNOVA_EFFECT). A damaging FIRE move; the Haze trampoline runs this as
; the post-damage effect (hit only). A FIRE user takes NO recoil, sheds its FIRE type (mono-Fire -> NORMAL),
; and burns out to the PAL_MINDWIPE gray. A NON-FIRE user takes heavy recoil (BigRecoilEffect_) and, if it
; survives, burns itself (guaranteed, unless it already has a major status).
SupernovaEffect_::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .userType
	ld hl, wEnemyMonType1
.userType
	ld a, [hli]
	cp FIRE
	jr z, .fireUser
	ld a, [hl]
	cp FIRE
	jr z, .fireUser
	; --- NON-FIRE user: heavy recoil + self-burn ---
	callfar BigRecoilEffect_
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonHP
	jr z, .nfHP
	ld hl, wEnemyMonHP
.nfHP
	ld a, [hli]
	or [hl]
	ret z                            ; user fainted from recoil
	call BurnUserSelf
	ret
.fireUser
	; --- FIRE user: no recoil; shed FIRE + PAL_MINDWIPE gray ---
	ld d, FIRE
	call ShedUserTypeD               ; shed FIRE (mono-Fire -> NORMAL)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonFlags
	jr z, .fFlags
	ld hl, wEnemyMonFlags
.fFlags
	set 3, [hl]                      ; PAL_MINDWIPE gray (shared with SKITTERMIND)
	call RunDefaultPaletteCommand
	ld hl, SupernovaCoolText
	rst _PrintText
	ret

; Shed type d from the hWhoseTurn user. b = type1, c = type2 (scratch). A mono-(d) mon becomes NORMAL/NORMAL;
; a dual mon collapses to a mono of its OTHER type. No-op if neither type is d.
ShedUserTypeD:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .got
	ld hl, wEnemyMonType1
.got
	ld a, [hl]                       ; type1
	ld b, a
	inc hl
	ld c, [hl]                       ; type2
	dec hl                           ; hl -> type1
	ld a, b
	cp d
	jr nz, .t1notShed
	; type1 == d
	ld a, c
	cp d
	jr nz, .t1shedKeep2               ; type1=d, type2=other -> mono(other)
	; both == d -> NORMAL/NORMAL
	ld a, NORMAL
	ld [hli], a
	ld [hl], a
	ret
.t1shedKeep2
	ld a, c                          ; type1 = type2 (the other type)
	ld [hl], a
	ret
.t1notShed
	ld a, c
	cp d
	ret nz                           ; neither slot is d -> nothing to shed
	; type1=other, type2=d -> mono(type1)
	inc hl                           ; hl -> type2
	ld [hl], b                       ; type2 = type1
	ret

; Raise the hWhoseTurn user's SPEED stat stage to +6 (MAX_STAT_LEVEL) and recompute its battle stats,
; reapplying the burn (attack) and paralysis (speed) penalties the recompute would otherwise undo, plus the
; player's badge SPEED boost.
MaxUserSpeed:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMonStatMods
	jr z, .mods
	ld hl, wEnemyMonStatMods
.mods
	ld bc, MOD_SPEED
	add hl, bc
	ld [hl], MAX_STAT_LEVEL
	ldh a, [hWhoseTurn]
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	; reapply burn + paralysis to the USER (both routines act on the OPPONENT of hWhoseTurn, so flip the turn)
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	callfar HalveAttackDueToBurn
	callfar QuarterSpeedDueToParalysis
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	; player-only: reapply the badge SPEED boost
	ldh a, [hWhoseTurn]
	and a
	ret nz
	ld a, MOD_SPEED
	ld [wWhatStat], a
	callfar ApplyBadgeBoostsForSpecificStat
	ld a, $ff
	ld [wWhatStat], a
	ret

; Burn the hWhoseTurn user (guaranteed) unless it already carries a major status. Sets BRN on both the
; in-battle and party status copies, recomputes the burn attack penalty, refreshes the user's HUD, and prints
; the self-burn line.
BurnUserSelf:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonStatus
	jr z, .stat
	ld hl, wEnemyMonStatus
.stat
	ld a, [hl]
	and a
	ret nz                           ; already statused -> can't burn
	set BRN, [hl]
	; party copy
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPartyMon1Status
	ld a, [wPlayerMonNumber]
	jr z, .party
	ld hl, wEnemyMon1Status
	ld a, [wEnemyMonPartyPos]
.party
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	set BRN, [hl]
	; recompute the user's attack so the burn halving takes effect
	ldh a, [hWhoseTurn]
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	callfar HalveAttackDueToBurn
	ldh a, [hWhoseTurn]
	xor 1
	ldh [hWhoseTurn], a
	; refresh the user's HUD so the BRN icon shows
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyHUD
	callfar DrawPlayerHUDAndHPBar
	jr .burnText
.enemyHUD
	callfar DrawEnemyHUDAndHPBar
.burnText
	ld hl, SupernovaBurnText
	rst _PrintText
	ret

MetamorphicText:
	text_far _MetamorphicText
	text_end

SupernovaCoolText:
	text_far _SupernovaCoolText
	text_end

SupernovaBurnText:
	text_far _SupernovaBurnText
	text_end
