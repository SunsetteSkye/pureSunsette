; Sunsette: the critical-hit routine + its helpers + the high-crit move table, floated out of the full
; "Battle Core" bank into their own ROMX section (Battle Core had only 3 bytes free). Callers use
; `callfar CriticalHitTest` - the routine only outputs to wCriticalHitOrOHKO (RAM), so the bankswitch's
; register clobber is harmless at the call sites. The one Battle-Core-local dependency, BattleRandom, is
; reached via FarBattleRandom (b = crit threshold is push/pop'd across the bankswitch). The HighCriticalMoves
; table rides along so CriticalHitTest can still read it inline with [hli] in this same bank.
SECTION "Sunsette Critical Hit", ROMX

; Azure Heights claims "the fastest pokémon (who are, not coincidentally,
; among the most popular) tend to CH about 20 to 25% of the time."
CriticalHitTest:
	xor a
	ld [wCriticalHitOrOHKO], a
	call DemolishBreakScreens ; Sunsette: DEMOLISH (DEMOLISH) shatters the target's screens pre-damage
	call CheckBrunoNoCrit ; Sunsette: BRUNO's room - his mons cannot be crit (overrides forced crits)
	ret c
	call CheckAutoCritVsStatus ; Sunsette: drain moves / VENOM LASH auto-crit a statused target
	jr nc, .normalCalc
	ld a, $1
	ld [wCriticalHitOrOHKO], a ; forced crit -> skip the probability roll
	ret
.normalCalc
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr nz, .handleEnemy
	ld a, [wBattleMonSpecies]
.handleEnemy
	ld [wCurSpecies], a
	call GetMonHeader
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMovePower
	ld de, wPlayerBattleStatus2
	jr z, .calcCriticalHitProbability
	ld hl, wEnemyMovePower
	ld de, wEnemyBattleStatus2
.calcCriticalHitProbability
	ld a, [hld]                  ; read base power from RAM
	and a
	ret z                        ; do nothing if zero
	dec hl
	ld c, [hl]                   ; read move id
; PureRGBnote: CHANGED: crit chance is now a quadratic curve of base Speed.
; threshold = baseSpeed^2 / 256, then x1.5 (normal) / x8 (high-crit) / x4 (focus energy), capped at 255.
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [wMonHBaseSpeed]
	ldh [hMultiplicand + 2], a
	ldh [hMultiplier], a
	push de
	call Multiply
	pop de
	ldh a, [hProduct + 2]        ; baseSpeed^2 / 256
	ld b, a
; Sunsette: halve Speed's contribution to crit rate unless the attacker is "important"
	call CheckFullCritSpeed
	jr nz, .fullCritSpeed
	srl b
.fullCritSpeed
; Sunsette: FIGHTING-type attackers crit at double the normal speed-based rate (vital-point strikes).
; Applied to the speed contribution before the Focus Energy / high-crit multipliers, so it compounds.
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotCritAtkType
	ld hl, wEnemyMonType1
.gotCritAtkType
	ld a, [hli]
	cp FIGHTING
	jr z, .doubleFighting
	ld a, [hl]
	cp FIGHTING
	jr nz, .afterFighting
.doubleFighting
	sla b
	jr nc, .afterFighting
	ld b, $ff ; cap
.afterFighting
; Sunsette: Articuno/Zapdos/Moltres/Mewtwo/Mew can only crit via Focus Energy or a high-crit move
	call CheckCritRestrictedSpecies
	jr nz, .critAllowed
	ld a, [de]
	bit GETTING_PUMPED, a        ; focus energy active -> crit allowed
	jr nz, .critAllowed
	ld hl, HighCriticalMoves
.restrictLoop
	ld a, [hli]
	cp c                         ; high-crit move -> crit allowed
	jr z, .critAllowed
	inc a                        ; FF terminates loop
	jr nz, .restrictLoop
	ld b, 0                      ; otherwise this legendary cannot crit at all
	jr .finishcalc
.critAllowed
	ld a, [de]
	bit GETTING_PUMPED, a        ; test for focus energy
	jr z, .noFocusEnergyUsed
	sla b                        ; focus energy: x4 crit rate
	jr c, .capCritical
	sla b
	jr c, .capCritical
.noFocusEnergyUsed
	ld hl, HighCriticalMoves     ; table of high critical hit moves
.Loop
	ld a, [hli]                  ; read move from move table
	cp c                         ; does it match the move about to be used?
	jr z, .HighCritical          ; high critical hit ratio move
	inc a                        ; FF terminates loop
	jr nz, .Loop
	ld a, b                      ; normal move: x1.5 crit rate
	srl a
	add b
	jr c, .capCritical
	ld b, a
	jr .finishcalc
.HighCritical
	sla b                        ; x2
	jr c, .capCritical
	sla b                        ; x4
	jr c, .capCritical
	sla b                        ; x8 -> baseSpeed^2 / 32 (auto-crit near Speed 90)
	jr nc, .finishcalc
.capCritical
	ld b, $ff
.finishcalc
	call ApplyArenaCritScale     ; Sunsette: VIRIDIAN GYM / final RIVAL (Champion's room) - enemy crit rate x2
	push bc                      ; Sunsette: FarBattleRandom (callfar) clobbers b via the bankswitch; b is the crit threshold
	callfar FarBattleRandom      ; d = random value (survives the bankswitch)
	pop bc                       ; restore b = crit threshold
	ld a, d
	rlca
	rlca
	rlca
	cp b                         ; check a against calculated crit rate
	ret nc                       ; no critical hit if no borrow
	ld a, $1
	ld [wCriticalHitOrOHKO], a   ; set critical hit flag
	ret

; Sunsette: DEMOLISH (display name; const DEMOLISH) is Karate Chop with Brick Break's screen-break.
; Called at the very top of CriticalHitTest (pre-damage, and a high-crit move already passes through here, so
; this costs zero bytes in the full Battle Core / newCode banks). For any other move it returns immediately.
; For DEMOLISH it clears the TARGET's REFLECT + LIGHT SCREEN *before* damage is rolled, so the strike lands
; at full power and the screens are gone for the rest of the battle. (It also breaks on the rare 100%-acc miss;
; acceptable.) Clobbers a/hl/flags - fine, CriticalHitTest reloads everything after this returns.
DemolishBreakScreens:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld a, [wEnemyMoveNum]
.gotMove
	cp DEMOLISH
	jr z, .break                 ; DEMOLISH always shatters screens
	cp HYPER_BEAM
	ret nz                       ; only DEMOLISH and HYPER BEAM break screens
	callfar GetDesperationStage  ; Sunsette: HYPER BEAM only shatters them at desperation stage 2-3
	ld a, e
	cp 2
	ret c
.break
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus3   ; player attacking -> target = enemy
	jr z, .gotTarget
	ld hl, wPlayerBattleStatus3
.gotTarget
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jr nz, .hadScreen
	bit HAS_REFLECT_UP, [hl]
	ret z                        ; no screens up -> nothing to shatter, stay silent
.hadScreen
	res HAS_LIGHT_SCREEN_UP, [hl]
	res HAS_REFLECT_UP, [hl]
	ld hl, ScreenShatteredText
	jp PrintText

ScreenShatteredText:
	text "The barrier"
	line "shattered!"
	prompt

; Sunsette: carry SET if the move being used is a drain move (Absorb / Mega Drain / Leech Life)
; AND the TARGET currently has a status condition -> force a critical hit.
; SOULSTEALER is deliberately excluded (already strong). hWhoseTurn picks the user; target is the other side.
CheckAutoCritVsStatus:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonStatus       ; player's turn -> target = enemy
	ld a, [wPlayerMoveNum]
	jr z, .gotMove
	ld hl, wBattleMonStatus
	ld a, [wEnemyMoveNum]
.gotMove
	cp ABSORB
	jr z, .autoCritMove
	cp MEGA_DRAIN
	jr z, .autoCritMove
	cp LEECH_LIFE
	jr z, .autoCritMove
	and a                        ; not an auto-crit move -> carry clear
	ret
.autoCritMove
	ld a, [hl]                   ; target's status byte
	and a
	ret z                        ; no status -> a=0 clears carry -> no forced crit
	scf                          ; statused -> force crit
	ret

; Sunsette: returns nz if the attacker keeps its full Speed->crit contribution, z if it should be halved.
; Full for: the player while holding the EARTHBADGE; enemy gym leaders / Giovanni / the rival / the
; Elite Four. Uses only register a.
CheckFullCritSpeed:
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyTurn
; the player's mon is attacking
	ld a, [wObtainedBadges]
	bit BIT_EARTHBADGE, a
	ret ; nz (full) with the Earth Badge, z (halve) without
.enemyTurn
	ld a, [wIsInBattle]
	cp 2
	jr nz, .halve ; Sunsette: wild battles no longer grant a crit-speed exception
.enemyTrainer
	ld a, [wTrainerClass]
	cp RIVAL1
	jr z, .full
	cp GIOVANNI
	jr z, .full
	cp RIVAL2
	jr z, .full
	cp RIVAL3
	jr z, .full
	cp ROCKET_QUEEN ; Sunsette: the four ROCKET SISTERS also get unlocked (full base-Speed) crit
	jr z, .full
	cp LORELEI
	jr z, .full
	cp AGATHA
	jr z, .full
	cp LANCE
	jr z, .full
	cp BRUNO
	jr c, .halve ; below BRUNO -> ordinary trainer
	cp SABRINA + 1
	jr c, .full ; BRUNO..SABRINA (all gym leaders) -> full
.halve
	xor a ; z -> halve
	ret
.full
	or 1 ; nz -> full
	ret

; Sunsette: ARENA EFFECT - BRUNO's room: his Pokemon cannot be critically hit. Carry SET (suppress the
; crit, even forced ones) when the DEFENDER is the enemy mon, i.e. the player is attacking (hWhoseTurn 0)
; in BRUNOS_ROOM. The Champ Arena rematch is a different map, so it is unaffected. Uses register a.
CheckBrunoNoCrit:
	ld a, [wCurMap]
	cp BRUNOS_ROOM
	jr nz, .allow
	ldh a, [hWhoseTurn]
	and a                        ; player's turn -> target = enemy = Bruno's mon
	jr nz, .allow                ; enemy attacking the player -> ordinary crits
	scf
	ret
.allow
	or a
	ret

; Sunsette: ARENA EFFECT - VIRIDIAN GYM (vicious trainers) and CHAMPIONS_ROOM (the final rival) double
; the ENEMY's crit threshold (b). Only the enemy's attacks get the boost; map-gated so the Champ Arena
; rematches are untouched. b is the crit threshold computed in .finishcalc.
ApplyArenaCritScale:
	ldh a, [hWhoseTurn]
	and a
	ret z                        ; player attacking -> no arena boost
	ld a, [wCurMap]
	cp VIRIDIAN_GYM
	jr z, .double
	cp CHAMPIONS_ROOM
	ret nz
.double
	sla b                        ; x2 crit rate
	ret nc
	ld b, $ff                    ; cap
	ret

; Sunsette: returns z if the attacker (wCurSpecies) is one of the legendaries that can only crit
; via Focus Energy or a high-crit move (Articuno / Zapdos / Moltres / Mewtwo / Mew). Uses register a.
CheckCritRestrictedSpecies:
	ld a, [wCurSpecies]
	jp CheckLegendaryAffectionSpecies ; Sunsette: shared legendary check in home/pokemon.asm

INCLUDE "data/battle/critical_hit_moves.asm"
