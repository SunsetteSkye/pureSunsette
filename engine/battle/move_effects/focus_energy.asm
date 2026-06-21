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
	jpfar FocusEnergyDefenseBonus ; Sunsette: FOCUS ENERGY also raises the user's DEFENSE by 1 (for EVERYONE now). Only on a fresh use, so the "already active -> fails" rule still prevents stacking the boost.
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
