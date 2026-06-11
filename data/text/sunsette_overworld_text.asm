; Sunsette: overworld texts relocated into a floating section because the numbered "Text N" banks are
; near-full. text_far is bank-agnostic, so these resolve fine from their maps' script banks.

; Sunsette: morale-lockout confirmation when trying to leave a gym/Silph 2F+/Rocket Hideout pre-boss.
; The name is the top-affection unfainted party mon (loaded into wNameBuffer by the caller).
_LockedAreaExitText::
	text "@"
	text_ram_namebuffer
	text " looks"
	line "ready to fight!"

	para "If you leave"
	line "now, your team"
	cont "will be unhappy."

	para "Leave anyway?"
	done

; Mt. Moon 1F sign - warns the cave is dark (was the "Beware ZUBAT" sign)
_MtMoon1FBewareZubatSign::
	text "Beware! MT.MOON"
	line "is pitch black"
	cont "inside!"

	para "Don't press on"
	line "without a #MON"
	cont "that can light"
	cont "the way, or you"
	cont "may lose your"
	cont "footing!"
	done

; Viridian Forest South Gate - Oak's Aide
_ViridianForestSouthGateOaksAideNoDexText::
	text "I'm one of PROF."
	line "OAK's AIDES!"

	para "He's counting on"
	line "young trainers"
	cont "like you!"
	done

_ViridianForestSouthGateOaksAideHasDexText::
	text "Ah, you're the one"
	line "helping PROF.OAK"
	cont "fill the #DEX!"

	para "Don't forget-you"
	line "can check in with"
	cont "him from any <PC>"
	cont "to have your #DEX"
	cont "evaluated!"
	done
