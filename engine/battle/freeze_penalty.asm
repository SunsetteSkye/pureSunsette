; Sunsette: FREEZE no longer skips the victim's turn (see CheckPlayerStatusConditions). Instead it
; HALVES the frozen mon's Special and Speed, modeled exactly on QuarterSpeedDueToParalysis /
; HalveAttackDueToBurn: it bakes the penalty into the in-battle stat copies. Applied at switch-in
; (ApplyBurnAndParalysisPenalties) and the moment freeze is inflicted (FreezeBurnParalyzeEffect's
; .freeze branches). hWhoseTurn picks the mon the SAME way the burn/paralysis penalties do:
; 0 -> operate on the enemy mon, nonzero -> operate on the player's mon.
HalveSpecialAndSpeedDueToFreeze::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wEnemyMonStatus]
	ld hl, wEnemyMonSpeed + 1
	jr z, .gotTurn
	ld a, [wBattleMonStatus]
	ld hl, wBattleMonSpeed + 1
.gotTurn
	and 1 << FRZ
	ret z ; not frozen -> no penalty
	call .halve ; halve Speed (hl -> Speed low byte)
	inc hl
	inc hl ; -> Special low byte (Special is the stat right after Speed)
	; fall through to halve Special, then ret
.halve: ; halve the big-endian 2-byte stat at hl (hl -> low byte); minimum 1; leaves hl at the low byte
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .store
	inc b ; never drop a stat below 1
.store
	ld [hl], b
	ret

; Sunsette: a FROZEN mon that uses a burn-inflicting (heat) move thaws ITSELF as it acts, and a stat
; routine undoes the Special/Speed halving. Called from ExecutePlayer/EnemyMove right after the move
; is loaded (so wPlayer/EnemyMoveEffect is valid). hWhoseTurn = the user (0 = player, 1 = enemy).
; The qualifying effects are the heat moves only - NOT Conversion.
SelfThawOnBurnMove::
	call WaterMoveCleansesUserBurn ; Sunsette: a WATER move also washes the user's own burn off (folded in here to avoid a 2nd Battle Core callfar)
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonStatus
	jr z, .haveStatus
	ld hl, wEnemyMonStatus
.haveStatus
	bit FRZ, [hl]
	ret z ; the user isn't frozen
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .haveEffect
	ld a, [wEnemyMoveEffect]
.haveEffect
	ld c, a
	ld hl, BurnInflictingEffects
.scan
	ld a, [hli]
	cp -1
	ret z ; the move can't inflict burn -> no self-thaw
	cp c
	jr nz, .scan
; frozen user + heat move -> thaw it and fix its stats
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonStatus
	ld a, [wPlayerMonNumber]
	jr z, .gotWho
	ld hl, wEnemyMonStatus
	ld a, [wEnemyMonPartyPos]
.gotWho
	ld [hl], 0 ; clear the in-battle status (thaw); a = the user's party index
	push af
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPartyMon1Status
	jr z, .gotPartyBase
	ld hl, wEnemyMon1Status
.gotPartyBase
	pop af ; a = party index
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], 0 ; clear the matching PARTY status so it doesn't re-freeze on a later switch
; fix the stat problem: recompute the user's modified stats (un-halves the frozen Special/Speed,
; keeping any stat-stage changes), since FRZ is now clear.
	ldh a, [hWhoseTurn]
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	ld hl, .thawedText
	rst _PrintText
	ret
.thawedText
	text_far _SelfThawedText
	text_end

BurnInflictingEffects:
	db BURN_SIDE_EFFECT1, BURN_SIDE_EFFECT2, HEAT_RUSH_EFFECT, TRI_ATTACK_EFFECT
	db SOLARBEAM_EFFECT ; Sunsette: both SolarBeam turns are "heat" enough to thaw the user
	db DRAIN_HP_EFFECT ; Sunsette: absorbing/draining the foe's energy also thaws the user (Absorb/Mega Drain/Leech Life/Soulstealer/Counter); OK that GHOST drainers thaw too
	db -1

; Sunsette: WATER washes off BURN. A mon that USES a water move self-cleanses (WaterMoveCleansesUserBurn,
; folded into SelfThawOnBurnMove's preamble); a mon HIT by a water move cleanses too
; (WaterMoveCleansesTargetBurn, folded into SpeciesMoveBonus = post-damage, target alive). Both are folded
; into existing far-called routines rather than added as fresh Battle Core callfars (that bank is full).
; Both confirm the active move's type is WATER, then fully cure that side's BRN (in-battle + party copies,
; like the thaw) and recompute its modified stats so the burn attack-halving is undone. hWhoseTurn = attacker.
WaterMoveCleansesUserBurn::
	call CurMoveIsWater
	ret nc
	ldh a, [hWhoseTurn] ; user = the mon whose turn it is (0 player, 1 enemy)
	jr CleanseBurnFromSide

WaterMoveCleansesTargetBurn::
	call CurMoveIsWater
	ret nc
	ldh a, [hWhoseTurn]
	xor 1 ; target = the OTHER side
	; fall through

; a = 0 -> cleanse the player's mon, 1 -> the enemy's mon
CleanseBurnFromSide:
	and 1
	ld e, a ; e = which side, preserved across the routine
	and a
	ld hl, wBattleMonStatus
	jr z, .gotInBattle
	ld hl, wEnemyMonStatus
.gotInBattle
	bit BRN, [hl]
	ret z ; not burned -> nothing to wash off
	res BRN, [hl] ; clear the in-battle burn
	ld a, e
	and a
	ld hl, wPartyMon1Status
	ld a, [wPlayerMonNumber]
	jr z, .gotParty
	ld hl, wEnemyMon1Status
	ld a, [wEnemyMonPartyPos]
.gotParty
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	res BRN, [hl] ; clear the matching PARTY burn (full cure, survives a later switch)
	ld a, e ; recompute this side's modified stats -> un-halve the burned attack
	ld [wCalculateWhoseStats], a
	callfar CalculateModifiedStats
	ld hl, .washedText
	rst _PrintText
	ret
.washedText
	text_far _WaterWashedBurnText
	text_end

; carry SET if the move being executed this turn is WATER-typed; hWhoseTurn picks the side's move data.
CurMoveIsWater:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveType]
	jr z, .gotType
	ld a, [wEnemyMoveType]
.gotType
	cp WATER
	jr z, .yes
	and a ; clear carry -> not water
	ret
.yes
	scf
	ret
