InitBattleVariables:
	ld a, [wMapPalOffset] ; Sunsette: snapshot dark-cave state (==6) before it's cleared below
	ld [wDarkCaveSnapshot], a
	; Sunsette: clear any stale WATERIFY "force PAL_CYANMON" soak (bit 1) on both active-mon flag bytes at
	; the start of every battle. The send-out hooks only res it when a MON appears, which is AFTER the
	; trainer's intro pic is palette'd - so a leftover bit 1 from a prior battle was tinting the trainer
	; pic (and the player's back sprite) blue. Keep bit 0 (confuse-ray alt palette) intact.
	ld hl, wEnemyMonFlags
	res 1, [hl]
	res 2, [hl] ; Sunsette: also clear any stale CONVERSION recolor (bit 2)
	res 3, [hl] ; Sunsette: stale SKITTERMIND gray (bit 3)
	res 4, [hl] ; Sunsette: stale METAMORPHIC glow (bit 4)
	ld hl, wBattleMonFlags
	res 1, [hl]
	res 2, [hl]
	res 3, [hl]
	res 4, [hl]
	ldh a, [hTileAnimations]
	ld [wSavedTileAnimations], a
	ResetEvent FLAG_SKIP_STAT_ANIMATION
	xor a
	ld [wActionResultOrTookBattleTurn], a
	ld [wBattleResult], a
	ld hl, wPartyAndBillsPCSavedMenuItem
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wListScrollOffset], a
	ld [wCriticalHitOrOHKO], a
	ld [wBattleMonSpecies], a
	ld [wPartyGainExpFlags], a
	ld [wPlayerMonNumber], a
	ld [wEscapedFromBattle], a
	ld [wMapPalOffset], a
;;;;;;;;;; PureRGBnote: ADDED: clear various new AI-related variables.
	ld [wAIMoveSpamAvoider], a
	ld [wEnemyLastSelectedMove], a
	ld [wPlayerLastSelectedMove], a
	ld [wEnemyLastSelectedMoveDisable], a
	ld [wPlayerLastSelectedMoveDisable], a
	ld [wAITargetMonType1], a
	ld [wAITargetMonType2], a
	ld [wAITargetMonStatus], a
	ld [wPokedexDataFlags], a
	ld [wBattleFunctionalFlags], a
	ld [wRegionalStatRiseTextID], a ; Sunsette: ensure no stale custom stat-rise text at battle start
	ld a, [wAIWhichPokemonSentOutAlready]
	and $81	;clear bits 1 to 6 only by ANDing with 1000 0001
	ld [wAIWhichPokemonSentOutAlready], a
	xor a
;;;;;;;;;;
	ld hl, wPlayerHPBarColor
	ld [hli], a ; wPlayerHPBarColor
	ld [hl], a ; wEnemyHPBarColor
	ld hl, wCanEvolveFlags
	ld b, wMiscBattleDataEnd - wMiscBattleData
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	inc a ; POUND (PUMMEL)
	ld [wTestBattlePlayerSelectedMove], a
	ld a, [wCurMap]
	cp SAFARI_ZONE_EAST
	jr c, .notSafariBattle
	cp SAFARI_ZONE_CENTER_REST_HOUSE
	jr nc, .notSafariBattle
;;;;;;;;;; PureRGBnote: ADDED: we can be in the safari zone maps but without safari zone battles depending on the type of safari.
	ld a, [wSafariType]
	and a
	jr nz, .notSafariBattle ; only Classic safari type uses original safari battles
;;;;;;;;;;
	ld a, BATTLE_TYPE_SAFARI
	ld [wBattleType], a
.notSafariBattle
	jpfar PlayBattleMusic
