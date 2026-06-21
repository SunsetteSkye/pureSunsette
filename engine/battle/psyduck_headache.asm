; Sunsette: PSYDUCK's hidden signature - using a PSYCHIC move gives it a headache that costs 1/8 of its
; max HP (floored at 1, so it can't KO itself this way). It is NOT a RemappableMoves entry, so it never
; appears in the MOVE MYSTIC; the headache line stands in for the usual "Signature Move!" alert. Reached
; via callfar from the CheckRemapMoveData wrapper, pre-damage, for whichever side is attacking. Floated to
; its own SECTION because newCode is full. All reads are WRAM and the calls (PrintText home /
; UpdateCurMonHPBar callfar) are bank-agnostic, so this can live anywhere.
CheckPsyduckHeadache::
	ldh a, [hWhoseTurn]
	and a
	jr z, .player
	ld a, [wEnemyMonSpecies]
	cp PSYDUCK
	ret nz
	ld a, [wEnemyMoveType]
	cp PSYCHIC_TYPE
	ret nz
	ld hl, wEnemyMonHP
	jr .headache
.player
	ld a, [wBattleMonSpecies]
	cp PSYDUCK
	ret nz
	ld a, [wPlayerMoveType]
	cp PSYCHIC_TYPE
	ret nz
	ld hl, wBattleMonHP
.headache
; record max HP for the bar and compute damage = max HP / 8 (at least 1).
; hl = HP pointer (hi, lo); max HP is at hl + $E. wHPBar* vars are little-endian (lo, hi).
	push hl
	ld bc, $e
	add hl, bc
	ld a, [hli]          ; max HP hi
	ld [wHPBarMaxHP+1], a
	ld b, a
	ld a, [hl]           ; max HP lo
	ld [wHPBarMaxHP], a
	ld c, a              ; bc = max HP
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c                 ; bc = max HP / 8
	ld a, b
	or c
	jr nz, .nonZero
	inc c
.nonZero
	pop hl
; HP -= bc, recording old/new HP for the bar animation, floored at 1 (never self-faints mid-move)
	inc hl               ; -> HP lo
	ld a, [hl]
	ld [wHPBarOldHP], a
	sub c
	ld [hld], a          ; HP lo, hl -> HP hi
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	sbc b
	ld [hl], a           ; HP hi
	ld [wHPBarNewHP+1], a
	jr c, .floor
	ld a, [hl]
	inc hl
	or [hl]
	dec hl
	jr nz, .announce
.floor
	xor a
	ld [hli], a          ; HP hi = 0
	ld [wHPBarNewHP+1], a
	inc a
	ld [hld], a          ; HP lo = 1
	ld [wHPBarNewHP], a
.announce
	ld hl, PsyduckHeadacheText
	call PrintText
	callfar UpdateCurMonHPBar ; animate the HP bar down (uses hWhoseTurn + wHPBar* vars)
	ret

PsyduckHeadacheText:
	text_far _PsyduckHeadacheText
	text_end

; Sunsette: CLEFAIRY/CLEFABLE signature - using METRONOME also raises one of the user's stat stages (+1) at
; random (ATK/DEF/SPD/SPC) and trips the "Signature Move!" alert. Also reached via callfar from the
; CheckRemapMoveData wrapper. Gated on the move being METRONOME itself, so the move Metronome rolls (a
; different move id) never re-triggers it. Honors the world-option signature toggle.
CheckClefairyMetronome::
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMoveNum
	ld de, wBattleMonSpecies
	jr z, .got
	ld hl, wEnemyMoveNum
	ld de, wEnemyMonSpecies
.got
	ld a, [hl]
	cp METRONOME
	ret nz
	ld a, [de]
	cp CLEFAIRY
	jr z, .ok
	cp CLEFABLE
	ret nz
.ok
	CheckEvent FLAG_SIGNATURE_MOVES_TURNED_OFF
	ret nz ; signatures globally off -> plain Metronome
	ld hl, ClefairyMetronomeSignatureText
	rst _PrintText
.rollStat
	callfar FarBattleRandom ; random value returned in d
	ld a, d
	and 7
	cp 6 ; 0..5 -> ATTACK/DEFENSE/SPEED/SPECIAL/ACCURACY/EVASION _UP1_EFFECT; reroll 6/7
	jr nc, .rollStat
	add ATTACK_UP1_EFFECT
	callfar RaiseUserStatViaSwap ; raises the chosen stat on the user, self-restores the move effect/num
	ret

ClefairyMetronomeSignatureText:
	text_far _SignatureMoveText
	text_end
