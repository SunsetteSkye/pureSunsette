; PureRGBnote: CHANGED: ACID ARMOR and CONVERSION defense mode apply both light screen and reflect when used.
ReflectLightScreenEffect_:
	ld hl, wPlayerBattleStatus3
	ld de, wPlayerMoveEffect
	ldh a, [hWhoseTurn]
	and a
	jr z, .reflectLightScreenEffect
	ld hl, wEnemyBattleStatus3
	ld de, wEnemyMoveEffect
.reflectLightScreenEffect
	ld a, [de]
	cp ACID_ARMOR_EFFECT
	jr z, .acid_armor
	cp CONVERSION_EFFECT
	jr z, .acid_armor
	cp LIGHT_SCREEN_EFFECT
	jr nz, .reflect
	bit HAS_LIGHT_SCREEN_UP, [hl] ; is mon already protected by light screen?
	jr nz, .moveFailed
	set HAS_LIGHT_SCREEN_UP, [hl] ; mon is now protected by light screen
	call .cleanseUser
	ld hl, LightScreenProtectedText
	jr .playAnim
.reflect
	bit HAS_REFLECT_UP, [hl] ; is mon already protected by reflect?
	jr nz, .moveFailed
	set HAS_REFLECT_UP, [hl] ; mon is now protected by reflect
	call .cleanseUser
	ld hl, ReflectGainedArmorText
.playAnim
	push hl
	ld hl, PlayCurrentMoveAnimation
	call EffectCallBattleCore
	pop hl
.print
	rst _PrintText
	ret
.moveFailed
	ld c, 50
	rst _DelayFrames
	ld hl, PrintButItFailedText_
	jp EffectCallBattleCore
.acid_armor
	bit HAS_REFLECT_UP, [hl]
	jr z, .canUseAcidArmor
	bit HAS_LIGHT_SCREEN_UP, [hl]
	jr z, .canUseAcidArmor
	jr .moveFailed
.canUseAcidArmor
	set HAS_REFLECT_UP, [hl]
	set HAS_LIGHT_SCREEN_UP, [hl]
	ld a, [de]
	cp CONVERSION_EFFECT
	ld hl, AllDamageHalvedText
	jr z, .print
	ld hl, AcidArmorShieldText
	jr .playAnim

; PureRGBnote: ADDED: Reflect/Light Screen clear the user's confusion, leech seed, and
; disable, and reset the toxic counter to 1 (de-escalates Toxic; does not cure poison).
; Acid Armor deliberately does NOT call this.
.cleanseUser
	ldh a, [hWhoseTurn]
	and a
	jr nz, .cleanseEnemy
	ld hl, wPlayerBattleStatus1
	res CONFUSED, [hl]
	ld hl, wPlayerBattleStatus2
	res SEEDED, [hl]
	xor a
	ld [wPlayerConfusedCounter], a
	ld [wPlayerDisabledMove], a
	ld [wPlayerDisabledMoveNumber], a
	inc a
	ld [wPlayerToxicCounter], a
	ret
.cleanseEnemy
	ld hl, wEnemyBattleStatus1
	res CONFUSED, [hl]
	ld hl, wEnemyBattleStatus2
	res SEEDED, [hl]
	xor a
	ld [wEnemyConfusedCounter], a
	ld [wEnemyDisabledMove], a
	ld [wEnemyDisabledMoveNumber], a
	inc a
	ld [wEnemyToxicCounter], a
	ret

LightScreenProtectedText:
	text_far _LightScreenProtectedText
	text_end

ReflectGainedArmorText:
	text_far _ReflectGainedArmorText
	text_end

AcidArmorShieldText:
	text_far _AcidArmorLiquifiedText
	text_end

AllDamageHalvedText:
	text_far _AllDamageHalvedText
	text_end

EffectCallBattleCore:
	ld b, BANK(BattleCore)
	jp Bankswitch
