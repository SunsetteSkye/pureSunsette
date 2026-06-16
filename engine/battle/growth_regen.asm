; PureRGBnote: ADDED: Growth's leftovers-like regen. Heals 1/16 of max HP each turn while the
; user has the FLOURISH flag set. Lives in its own bank so the Battle Core bank doesn't overflow.
; Self-derives the current mon's HP pointer from hWhoseTurn; skips fainted mons; caps at max HP.
SECTION "Growth Regen", ROMX

HandleGrowthRegen::
	ld hl, wBattleMonHP
	ld de, wPlayerBattleStatus3
	ldh a, [hWhoseTurn]
	and a
	jr z, .gotPointers
	ld hl, wEnemyMonHP
	ld de, wEnemyBattleStatus3
.gotPointers
	ld a, [de]
	bit FLOURISH, a
	ret z
	ld a, [hl]      ; don't regen a fainted mon
	inc hl
	or [hl]
	dec hl
	ret z
	push hl         ; bc = max HP, also stored to wHPBarMaxHP
	ld bc, $e
	add hl, bc
	ld a, [hli]
	ld [wHPBarMaxHP+1], a
	ld b, a
	ld a, [hl]
	ld [wHPBarMaxHP], a
	ld c, a
	pop hl          ; hl = current HP (high byte)
	srl b
	rr c
	srl b
	rr c
	srl c
	srl c           ; c = max HP/16 (assumes HP < 1024, like the poison code)
	ld a, c
	and a
	jr nz, .nonZeroHeal
	inc c           ; heal at least 1
.nonZeroHeal
	ld b, 0         ; bc = heal amount
	inc hl          ; hl -> current HP low byte
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
	ld a, [wHPBarMaxHP] ; cap at max HP
	ld c, a
	ld a, [hld]
	sub c
	ld a, [wHPBarMaxHP+1]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .noOverfull
	ld a, b         ; overfull: set HP to max
	ld [hli], a
	ld [wHPBarNewHP+1], a
	ld a, c
	ld [hl], a
	ld [wHPBarNewHP], a
.noOverfull
	callfar UpdateCurMonHPBar
	ret
