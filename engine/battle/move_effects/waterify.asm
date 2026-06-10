; Sunsette: WATERIFY_EFFECT handler (Water Gun / Hydro Pump). Runs as the move's post-damage added
; effect, so it only fires when the target SURVIVED the hit (a fainted mon never reaches it, and its
; types would be reset on the next send-out anyway). Retypes the target to pure WATER; the type bytes
; are reloaded from species data on switch-in, so the change lasts "until it switches out".
WaterifyEffect_:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyMonType1 ; player's turn -> the defender is the enemy mon
	jr z, .gotTarget
	ld hl, wBattleMonType1 ; enemy's turn -> the defender is the player's mon
.gotTarget
	ld a, WATER
	ld [hli], a ; type1 = WATER
	ld [hli], a ; type2 = WATER, hl now -> the mon's Flags byte (the next byte after Type2 in the struct)
	set 1, [hl] ; bit 1 = force PAL_BLUEMON (soaked blue); preserves bit 0 (the alt-palette flag)
	call RunDefaultPaletteCommand ; re-apply SET_PAL_BATTLE so the blue shows immediately
	ld hl, WaterifiedText
	jp PrintText

WaterifiedText:
	text_far _WaterifiedText
	text_end
