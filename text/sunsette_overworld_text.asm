; Sunsette: overworld texts relocated into a floating section because the numbered "Text N" banks are
; near-full. text_far is bank-agnostic, so these resolve fine from their maps' script banks.

; Sunsette: relocated from text/PokemonTower1F.asm (Text 7 overflowed). The tower gift shop's open pitch.
_PokemonTower1FReceptionistOpenText::
	text "Welcome to #MON"
	line "TOWER's gift shop!"

	para "All proceeds keep"
	line "the tower going."

	para "They also help"
	line "#MON in need"
	cont "of care."
	prompt

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

; Sunsette: same lockout confirmation, but for the menu escapes (Dig / Teleport / Fly / Escape Rope /
; Pocket Abra) - framed as the escape itself being interrupted rather than walking out a door.
_LockedAreaExitEscapeText::
	text "...but the escape"
	line "won't take!"

	para "@"
	text_ram_namebuffer
	text " holds"
	line "fast!"

	para "Slip away now and"
	line "your team will"
	cont "be unhappy."

	para "Leave anyway?"
	done

; Mt. Moon 1F sign - warns the cave is dark (was the "Beware ZUBAT" sign)
_MtMoon1FBewareZubatSign::
	text "Tread slowly!"
	line "MT.MOON is dim"
	cont "and dangerous!"

	para "Even if lit up, "
	line "running makes you"
	cont "easier for wild"
	cont "#MON to find!"

	para "These caves are"
	line "filled with the"
	cont "bloodsucking"
	cont "ZUBAT<...>"
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
	line "helping fill the"
	cont "#DEX!"

	para "Don't forget, you"
	line "can check in with"
	cont "OAK from any <PC>"
	cont "to evaluate your"
	cont "#DEX."
	done

; Sunsette: Viridian unofficial NAME RATER, after LAVENDER's official one is reachable (moved here; the
; ViridianNicknameHouse text bank was full)
_ViridianNicknameHouseOfficialText::
	text "Did you know they"
	line "have OFFICIAL"
	cont "name raters?"

	para "I got in a lot of"
	line "trouble for being"
	cont "an unofficial"
	cont "name rater..."
	done

; Sunsette: Viridian Forest PIKACHU girl - FLASH (HM05) hand-off (Option A) + the repeatable "explain an
; HM" offer. Grant + explanation live here because ViridianForest's Text 1 bank is full.
_ViridianForestPikaGirlFlashGrantText::
	text "You're strong!"

	para "Me? I only ever"
	line "wanted a PIKACHU"
	cont "of my own<...>"

	para "but I'm hopeless"
	line "at catching them!"

	para "Here, you take"
	line "this instead."
	prompt

_ViridianForestPikaGirlExplainOfferText::
	text "That look in your"
	line "eyes<...>"

	para "You DO know what"
	line "an HM is, right?"
	done

; Yes branch ("I know") - default cursor, so fast-tappers skip the lecture
_ViridianForestPikaGirlKnowsHMText::
	text "Of course you do!"
	para "You're a natural!"
	done

; No branch ("I don't") - quick surprise, then the explanation
_ViridianForestPikaGirlHMExplanationText::
	text "Oh! You don't?!"

	para "An HM's move can"
	line "always be used"
	cont "out in the field."

	para "And one HM can"
	line "teach its move as"
	cont "often as you like!"
	done

; Sunsette: Oak's Parcel starter reactions (Viridian Mart). <NAME> = wNameBuffer (the starter's
; nickname); per-starter closing line. Played with the starter's cry, no sprite cut-in.
_ParcelCharReactText::
	text_ram_namebuffer
	text " looks"
	line "curious about the"
	cont "package! Be"
	cont "careful it doesn't"
	cont "burn it!"
	prompt

_ParcelSquirReactText::
	text_ram_namebuffer
	text " looks"
	line "curious about the"
	cont "package! Be"
	cont "careful it doesn't"
	cont "do any mischief!"
	prompt

_ParcelBulbaReactText::
	text_ram_namebuffer
	text " looks"
	line "curious about the"
	cont "package! Be"
	cont "careful it doesn't"
	cont "get jealous!"
	prompt

_ParcelGenericReactText::
	text_ram_namebuffer
	text " seems"
	line "curious about the"
	cont "package!"
	prompt
