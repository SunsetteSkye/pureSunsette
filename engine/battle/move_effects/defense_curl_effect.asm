; Sunsette: floated into its own ROMX section - the new ROCK ON effect is far too big for the full newCode
; bank it used to ride in. Reached from the DEFENSE_CURL_EFFECT dispatch (effects.asm) via jpfar/callfar.
SECTION "Sunsette Rock On", ROMX

; Sunsette: ROCK ON (was BUNKER DOWN, was DEFENSE CURL) - an escalating defensive status move keyed to the
; user's desperation stage (GetDesperationStage). It deals no damage; the point is to brace and stabilise, so
; it can get better reactively without also being offence (a damaging version was too dominant).
;   ALL stages : full reset of the user's own stat stages, then brace against the foe's LAST attack type (any
;                type; halves that type's damage until switch, reusing the ADAPTATION resist).
;   stage 1+   : + raise ACCURACY by 1 (everyone), and "no one can sleep" (the echoing-screeches flag).
;   stage 2-3  : + type-keyed defensive bulk - +1 SPECIAL for a special-category-or-GHOST user, else +2
;                DEFENSE (physical user) - and heal 1/4 (stage 2) or 1/2 (stage 3) of max HP.
; The full reset runs FIRST, so the +ACCURACY / +DEFENSE / +SPECIAL are pinned (spamming can't stack them, and
; any debuffs the user was carrying are wiped). Reached from the DEFENSE_CURL_EFFECT dispatch (ROCK ON is the
; sole user of that effect const).
_DefenseCurlEffect::
	callfar PlayCurrentMoveAnimation
	call RockOnReset
	call RockOnBrace
	callfar GetDesperationStage      ; e = stage
	ld a, e
	and a
	ret z                            ; stage 0 -> reset + brace only
	ld a, ACCURACY_UP1_EFFECT
	callfar RaiseUserStatViaSwap     ; stage 1+ -> +1 ACCURACY for everyone (shores up inaccurate moves)
	call RockOnNoSleep
	callfar GetDesperationStage      ; re-fetch (RaiseUserStatViaSwap clobbered e)
	ld a, e
	cp 2
	ret c                            ; stage 1 -> done
	call RockOnBulk                  ; stage 2-3 -> type-keyed bulk: +1 SPECIAL (special/GHOST) or +2 DEFENSE (else)
	call RockOnHeal
	ret

; stage 2-3 defensive bulk, keyed to the user's category (either type slot): a special-category type OR GHOST
; gets +1 SPECIAL (Special is both its offence and its bulk), every other user gets +2 DEFENSE (+2 because Def
; is single-purpose where Special does double duty, so this keeps the two buckets equal in value). Flat - the
; same at stage 2 and 3; only the heal scales. Pinned by the reset at the top of the effect.
RockOnBulk:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonType1
	jr z, .gotTypes
	ld hl, wEnemyMonType1
.gotTypes
	ld a, [hli]                      ; type 1
	call IsSpecialOrGhostType
	jr c, .special
	ld a, [hl]                       ; type 2
	call IsSpecialOrGhostType
	jr c, .special
	ld a, DEFENSE_UP2_EFFECT          ; physical user -> +2 DEFENSE
	jr .raise
.special
	ld a, SPECIAL_UP1_EFFECT          ; special/GHOST user -> +1 SPECIAL
.raise
	callfar RaiseUserStatViaSwap
	ret

; carry set if a (a type id) is a SPECIAL-category type (>= SPECIAL) or GHOST - the same "special + GHOST"
; bucket the ADAPTATION brace uses, so the player meets one consistent split across the move's two ends.
IsSpecialOrGhostType:
	cp GHOST
	jr z, .yes
	cp SPECIAL
	jr nc, .yes                      ; >= SPECIAL -> special category
	and a                            ; clear carry -> physical
	ret
.yes
	scf
	ret

; reset the user's own stat stages to neutral and recompute its battle stats from the unmodified copy
RockOnReset:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wPlayerMonAttackMod
	ld de, wPlayerMonUnmodifiedAttack
	ld bc, wBattleMonAttack
	jr z, .got
	ld hl, wEnemyMonAttackMod
	ld de, wEnemyMonUnmodifiedAttack
	ld bc, wEnemyMonAttack
.got
	push de
	push bc
	ld a, $7
	ld b, NUM_STAT_MODS
.mods
	ld [hli], a
	dec b
	jr nz, .mods
	pop hl                           ; battle-stat dest
	pop de                           ; unmodified-stat source
	ld b, (NUM_STATS - 1) * 2
.stats
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .stats
	ret

; brace against the foe's LAST attack type (any type - "you'll need TWO super effectives"), halving that
; type's damage until the user switches (reuses wPlayer/EnemyAdaptType, latest-wins like ADAPTATION)
RockOnBrace:
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyUser
	ld a, [wEnemyUsedMove]
	and a
	ret z                            ; foe hasn't attacked yet -> nothing to brace against
	ld a, [wEnemyMoveType]
	jr BraceUserAgainstType
.enemyUser
	ld a, [wPlayerUsedMove]
	and a
	ret z
	ld a, [wPlayerMoveType]
	; fall through to BraceUserAgainstType

; Sunsette: store `a` (a type id) as the USER's ADAPTATION brace - (type+1) into wPlayer/EnemyAdaptType
; (latest-wins) - then announce it ("It braced against <TYPE>!"). hWhoseTurn = the user. Exported so HEAT UP
; (newCode) and LEECH SEED callfar it; ROCK ON falls straight through after picking the foe's last-move type.
BraceUserAgainstType::
	inc a                            ; type + 1 (0 = none)
	ld b, a
	ldh a, [hWhoseTurn]
	and a
	ld a, b
	jr nz, .storeEnemy
	ld [wPlayerAdaptType], a
	jr .announce
.storeEnemy
	ld [wEnemyAdaptType], a
.announce
	ld a, b
	dec a
	ld e, a
	callfar AnnounceBrace            ; "It braced against <TYPE>!"
	ret

; "no one can sleep" - reuse the echoing-screeches flag (wBattleFunctionalFlags bit 2); SleepEffect checks it
RockOnNoSleep:
	ld hl, wBattleFunctionalFlags
	set 2, [hl]
	ret

; heal the user by 1/4 of max HP at stage 2, 1/2 at stage 3 (capped), then redraw its HP bar
RockOnHeal:
	; Sunsette: DUMMIED-OUT Brock zero-badge heal gate. It is a no-op for now (Rock On always heals). To soften
	; Brock's gym-1 Onix into something a no-badge team can break, check the badge count here and `ret` early.
	callfar GetDesperationStage      ; e = stage (2 or 3)
	ld a, 4
	sub e                            ; shift = 4 - stage: stage 2 -> 2 (maxHP/4), stage 3 -> 1 (maxHP/2)
	ld c, a
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonMaxHP
	jr z, .gotMax
	ld hl, wEnemyMonMaxHP
.gotMax
	ld a, [hli]
	ld d, a
	ld e, [hl]                       ; de = maxHP (big-endian)
.shiftLoop
	srl d
	rr e
	dec c
	jr nz, .shiftLoop                ; de = heal amount
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonHP
	jr z, .gotHP
	ld hl, wEnemyMonHP
.gotHP
	push hl                          ; save the HP pointer
	ld a, [hli]
	ld b, a
	ld c, [hl]                       ; bc = curHP
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld b, a                          ; bc = curHP + heal
	ldh a, [hWhoseTurn]
	and a
	ld hl, wBattleMonMaxHP
	jr z, .gotMax2
	ld hl, wEnemyMonMaxHP
.gotMax2
	ld a, [hli]
	ld d, a
	ld e, [hl]                       ; de = maxHP
	ld a, d
	cp b
	jr c, .cap                       ; maxHP < newHP -> cap
	jr nz, .noCap                    ; maxHP > newHP -> keep
	ld a, e
	cp c
	jr nc, .noCap                    ; maxHP low >= newHP low -> keep
.cap
	ld b, d
	ld c, e                          ; cap at maxHP
.noCap
	pop hl                           ; hl = HP pointer
	ld a, b
	ld [hli], a
	ld [hl], c                       ; store new HP (big-endian)
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemyBar
	callfar DrawPlayerHUDAndHPBar
	ret
.enemyBar
	callfar DrawEnemyHUDAndHPBar
	ret
