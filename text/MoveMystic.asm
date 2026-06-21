_MoveMysticIntro::
	text "I am the"
	line "MOVE MYSTIC!"
	para "Certain #MON"
	line "have hidden"
	cont "talents!"
	para "I can scry for"
	line "their secrets in"
	cont "my crystal ball!"
	para "But only if"
	line "you've seen the"
	cont "#MON before!"
	prompt

_MoveMysticAgain::
	text "You've returned to"
	line "the MOVE MYSTIC!"
	prompt

_MoveMysticQuestion::
	text "What #MON"
	line "shall I divine"
	cont "the secrets of?"
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
	text "Its venom runs"
	line "thick and potent!"

	para "Its TWINEEDLE"
	line "POISONS the foe"
	cont "40% of the time."
	done

_MoveMysticPidgeotText::
	text "It rules the"
	line "skies with"
	cont "peerless aim!"
	para "Its signature"
	line "HURRICANE never"
	cont "misses its mark!"
	done

_MoveMysticBlastoiseText::
	text "Its cannons fire"
	line "with deadly aim!"
	para "METEOR DRIVE and"
	line "HYDRO PUMP both"
	cont "gain 100%"
	cont "ACCURACY!"
	done

_MoveMysticAccuracy85::
	text "Its ACCURACY"
	line "increases to 85%!"
	done

_MoveMysticJigglyWigglyOnlyLevel20Text::
	text_start
	para "But only when"
	line "above level 20!"
	done

_GenericMovePowerIncreasesText::
	text "Its POWER"
	line "increases to @"
	text_decimal w2CharStringBuffer, 1, 3
	text "!"
	done

_MoveMysticInfoText::
	text "If ON, a new house"
	line "will be available"
	cont "in SAFFRON CITY."
	para "The MOVE MYSTIC"
	line "here will tell"
	cont "you about #MON"
	cont "SIGNATURE MOVEs."
	para "Some #MON will"
	line "have bonus power"
	cont "or accuracy when"
	cont "using some moves."
	para "If turned OFF,"
	line "these bonuses are"
	cont "turned off too."
	prompt
