_MoveMysticIntro::
	text "I am the Move Mystic!"
	para "Certain <Pokemon> have hidden talents!"
	para "I can scry for their secrets in my crystal ball!"
	para "But only if you've seen the <Pokemon> before!"
	prompt

_MoveMysticAgain::
	text "You've returned to the Move Mystic!"
	prompt

_MoveMysticQuestion::
	text "What <Pokemon> shall I divine the secrets of?"
	prompt

_MoveMysticLookDeep::
	text "Look deep into"
	line "my crystal ball!"
	prompt

_MoveMysticAhYes::
	text "Ah yes<...>"
	line "I see it."
	para "@"
	text_ram_stringbuffer
	text ", the@"
	text_end

_BeedrillMoveMysticText::
	text_start
	line "hypodermic"
	cont "hornet."
	prompt

_ArbokMoveMysticText::
	text_start
	line "venomous viper."
	prompt

_EkansMoveMysticText::
	text_start
	line "sneaky serpent."
	prompt

_GolemMoveMysticText::
	text_start
	line "rolling rock."
	prompt

_ElectabuzzMoveMysticText::
	text_start
	line "voltaic vanguard."
	prompt

_MagmarMoveMysticText::
	text_start
	line "pyroclastic"
	cont "punisher."
	prompt

_JynxMoveMysticText::
	text_start
	line "glacial goddess."
	prompt

_HypnoMoveMysticText::
	text_start
	line "hypnotic horror."
	prompt

_DragoniteMoveMysticText::
	text_start
	line "mystical monarch."
	prompt

_SeakingMoveMysticText::
	text_start
	line "fabulous fish."
	prompt

; Sunsette: _GoldeenMoveMysticText / _GyaradosMoveMysticText live in data/text/sunsette_battle_text.asm
; (this Text 3 bank is full).

; Sunsette: _LickitungMoveMysticText removed - LICK is no longer a signature move (VENOM LASH covers it).

_OmastarMoveMysticText::
	text_start
	line "ancient ammonite."
	prompt

_JigglypuffMoveMysticText::
	text_start
	line "spherical"
	cont "songstress."
	prompt

_WigglytuffMoveMysticText::
	text_start
	line "globular glory."
	prompt

_GolduckMoveMysticText::
	text_start
	line "dangerous duck."
	prompt

_PidgeotMoveMysticText::
	text_start
	line "tempest talon."
	prompt

_BlastoiseMoveMysticText::
	text_start
	line "cannon colossus."
	prompt

; Sunsette: KRABBY/KINGLER MOVE MYSTIC texts were removed - CRABHAMMER is a flat 100-BP move now,
; no longer their signature.

_MoveMysticMasterOfMoveText::
	text "It's a master"
	line "of @"
	text_ram_namebuffer
	text "!"
	prompt

_MoveMysticTalentOfMoveText::
	text "@"
	text_ram_namebuffer
	text ""
	line "is its talent!"
	prompt

_MoveMysticSoulCallsForMoveText::
	text "Its soul calls"
	line "for @"
	text_ram_namebuffer
	text "!"
	prompt

_MoveMysticLovesMoveText::
	text "It loves to use"
	line "@"
	text_ram_namebuffer
	text "!"
	prompt

_MoveMysticBeedrillText::
	text "Its venom runs thick and potent!"
	para "Its Twineedle poisons the foe 40% of the time."
	done

_MoveMysticPidgeotText::
	text "It rules the skies with peerless aim!"
	para "Its signature Hurricane never misses its mark!"
	done

_MoveMysticBlastoiseText::
	text "Its cannons fire with deadly aim!"
	para "Meteor Drive and Hydro Pump both gain 100% Accuracy!"
	done

_MoveMysticAccuracy85::
	text "Its Accuracy increases to 85%!"
	done

_MoveMysticJigglyWigglyOnlyLevel20Text::
	text_start
	para "But only when"
	line "above level 20!"
	done

_GenericMovePowerIncreasesText::
	text "Its Power increases to @"
	text_decimal w2CharStringBuffer, 1, 3
	text "!"
	done

_MoveMysticInfoText::
	text "If ON, a new house will be available in Saffron City."
	para "The Move Mystic here will tell you about <Pokemon> signature moves."
	para "Some <Pokemon> will have bonus power or accuracy when using some moves."
	para "If turned OFF, these bonuses are turned off too."
	prompt
