FocusEnergyEffect_:
	ld hl, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .notEnemy
	ld hl, wEnemyBattleStatus2
.notEnemy
	bit GETTING_PUMPED, [hl] ; is mon already using focus energy?
	jr nz, .alreadyUsing
	set GETTING_PUMPED, [hl] ; mon is now using focus energy
	callfar PlayCurrentMoveAnimation
	; Sunsette: PIKACHU/RAICHU coil their tail to ground themselves - "Its tail is coiled!" + ELECTRIC immunity
	; (the immunity is checked at damage time off GETTING_PUMPED + species, see CheckCoiledElectricImmunity).
	ld hl, GettingPumpedText
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .gotSpecies
	ld a, [wEnemyMonSpecies]
.gotSpecies
	cp PIKACHU
	jr z, .coiled
	cp RAICHU
	jr nz, .printText
.coiled
	ld hl, TailCoiledText
.printText
	call PrintText
	jpfar EkansLineFocusEnergyHeal ; Sunsette: FOCUS ENERGY no longer raises DEFENSE; the fresh-use path now only feeds the EKANS/ARBOK heal signature (no-op for every other species).
.alreadyUsing
	ld c, 50
	rst _DelayFrames
	jpfar PrintButItFailedText_

GettingPumpedText:
	text_pause
	text_far _GettingPumpedText
	text_end

TailCoiledText: ; Sunsette: PIKACHU/RAICHU FOCUS ENERGY signature
	text "Its tail is"
	line "coiled!"
	prompt
