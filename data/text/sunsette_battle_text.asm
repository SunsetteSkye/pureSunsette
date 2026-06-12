; Sunsette: per-location battle-effect flavor lines, in their own floating text section so the
; near-full numbered text banks don't overflow. Referenced via text_far (bank-agnostic).

; Per-gym enemy-trainer mon buff lines (printed in place of the default "X's STAT rose!")
_PewterGymBuffText::
	text "The ROCKS here"
	line "are SPECIAL!"
	prompt

_VermilionGymBuffText::
	text "Shocking SPEED!"
	prompt

_FuchsiaGymBuffText::
	text "The enemy is"
	line "EVASIVE!"
	prompt

_FightingDojoBuffText::
	text "The enemy is"
	line "TOUGH!"
	prompt

_SaffronGymBuffText::
	text "SPEED of thought!"
	prompt

_CinnabarGymBuffText::
	text "They have SPECIAL"
	line "knowledge!"
	prompt

_ViridianGymBuffText::
	text "The enemy is"
	line "ACCURATE!"
	prompt

_CeruleanGymBuffText::
	text "The WATER"
	line "regenerates!"
	prompt

_CeladonGymBuffText::
	text "The air is full"
	line "of spores!"
	prompt

_LavenderTowerMistText::
	text "Black mist chokes"
	line "the air!"
	prompt

_SurfSpeedText::
	text "It's hard to move"
	line "in the water!"
	prompt

_SilphSpeedText::
	text "There's no room"
	line "to move!"
	prompt

_SilphSpecialText::
	text "There's nothing"
	line "natural here!"
	prompt

_TooDarkToSeeText::
	text "It's too dark"
	line "to see!"
	prompt

_ABitDarkToSeeText::
	text "It's a little dark"
	line "in here..."
	prompt

_FlashAttractsText::
	text "The FLASH drew out"
	line "a wild #MON!"
	prompt

_GrowthFieldText::
	text "Rare #MON are"
	line "drawn out here!"
	prompt

_UsedFlamethrowerText::
	text "The area went up"
	line "in flames!"
	prompt

; Sunsette: SAND ATTACK / MIST / HAZE / SMOKESCREEN field move (repel-like hiding)
_StartHidingText::
	text "You stirred up"
	line "cover! Wild"
	cont "#MON lose your"
	cont "trail!"
	prompt

_StoppedHidingText::
	text "The cover settled"
	line "and faded away..."
	prompt

_KeepHidingText::
	text "Keep hiding?"
	done

; Sunsette: WATERIFY_EFFECT (Water Gun / Hydro Pump retype the target to WATER)
_WaterifiedText::
	text "Drenched! It is"
	line "now a WATER type!"
	prompt

; Sunsette: CONVERSION retypes the user to match the move it just copied (Mimic + retype)
_ConvertedTypeText::
	text "Its body adapted"
	line "to the new move!"
	prompt

; Sunsette: SKITTERMIND (PSYWAVE) blanks the target's mind - retypes it to BUG (gray palette)
_MindwipedText::
	text "Its mind went"
	line "blank! It is now"
	cont "a BUG type!"
	prompt

; Sunsette: MOCKINGBIRD (was MIRROR MOVE) copies all the foe's stat-stage changes onto the user
_MockingbirdText::
	text "Mimicked the foe's"
	line "stat changes!"
	prompt

; Sunsette: a frozen mon thaws itself by using a burn-inflicting (heat) move
_SelfThawedText::
	text "The heat melted"
	line "the ice away!"
	prompt

; Sunsette: SolarBeam's non-fire charge turn (Mega-Drain-like; arms the release)
_SolarBeamChargeText::
	text "It took in"
	line "energy!"
	prompt

; Sunsette: Move Mystic entries for the legendary-bird move adjustments (relocated here
; out of the full "Text 3" bank). Epithets + mechanic descriptions.
_MoltresMoveMysticText::
	text_start
	line "blazing phoenix."
	prompt

_ZapdosMoveMysticText::
	text_start
	line "thunder tyrant."
	prompt

_ArticunoMoveMysticText::
	text_start
	line "glacial gale."
	prompt

; Sunsette: TANGELA's STRANGLEVINE signature (90 BP) - uses the generic power-increase info path
_TangelaMoveMysticText::
	text_start
	line "tangled terror."
	prompt

_MoveMysticMoltresText::
	text "Its wings burn"
	line "with living"
	cont "fire!"
	para "SKY ATTACK gains a"
	line "30% BURN, plus"
	cont "FLOURISH's regen!"
	done

_MoveMysticZapdosText::
	text "Static crackles"
	line "in its"
	cont "feathers!"
	para "DRILL PECK gains a"
	line "30% PARALYZE"
	cont "chance!"
	done

_MoveMysticArticunoText::
	text "Its gusts carry"
	line "a deathly"
	cont "chill!"
	para "HURRICANE gains a"
	line "30% FREEZE"
	cont "chance!"
	done

; Sunsette: KRABBY/KINGLER MOVE MYSTIC flavor + CRABHAMMER info (moved here; MoveMystic.asm's Text 3 bank was full)
_KrabbyMoveMysticText::
	text_start
	line "river ruffian."
	prompt

_KinglerMoveMysticText::
	text_start
	line "crushing claw."
	prompt

_MoveMysticKrabbyText::
	text "Its hardy pincer"
	line "strikes with"
	cont "surprising force!"
	para "CRABHAMMER's"
	line "POWER rises to"
	cont "75!"
	done

_MoveMysticKinglerText::
	text "Its giant pincer"
	line "crushes all in"
	cont "its grip!"
	para "CRABHAMMER's"
	line "POWER rises to"
	cont "100!"
	done

_SnorlaxMoveMysticText::
	text_start
	line "slumbering giant."
	prompt

_MoveMysticSnorlaxText::
	text "Its deep slumber"
	line "is restorative!"

	para "After a REST it"
	line "feeds on leftovers"
	cont "and gets a SPEED"
	cont "boost!"
	done

_MoveMysticArbokText::
	text "When it uses FOCUS"
	line "ENERGY, its SPEED"
	cont "surges too!"

	para "And its WRAP coils"
	line "on two rounds"
	cont "longer than most!"
	done
