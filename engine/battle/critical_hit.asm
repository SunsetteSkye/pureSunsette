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

; Sunsette: carry SET if the move being used is a drain move (Absorb / Mega Drain / Leech Life) or
; VENOM LASH (CONSTRICT) AND the TARGET currently has a status condition -> force a critical hit.
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
	cp CONSTRICT                 ; VENOM LASH
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

; Sunsette: returns z if the attacker (wCurSpecies) is one of the legendaries that can only crit
; via Focus Energy or a high-crit move (Articuno / Zapdos / Moltres / Mewtwo / Mew). Uses register a.
CheckCritRestrictedSpecies:
	ld a, [wCurSpecies]
	jp CheckLegendaryAffectionSpecies ; Sunsette: shared legendary check in home/pokemon.asm

INCLUDE "data/battle/critical_hit_moves.asm"
