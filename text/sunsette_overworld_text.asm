; Sunsette: overworld texts relocated into a floating section because the numbered "Text N" banks are
; near-full. text_far is bank-agnostic, so these resolve fine from their maps' script banks.

; Sunsette: relocated from text/PokemonTower1F.asm (Text 7 overflowed). The tower gift shop's open pitch.
_PokemonTower1FReceptionistOpenText::
	text "Welcome to <Pokemon> Tower's gift shop!"
	para "All proceeds keep the tower going."
	para "They also help <Pokemon> in need of care."
	prompt

; Sunsette: morale-lockout confirmation when trying to leave a gym/Silph 2F+/Rocket Hideout pre-boss.
; The name is the top-affection unfainted party mon (loaded into wNameBuffer by the caller).
_LockedAreaExitText::
	text "@"
	text_ram_namebuffer
	text " looks ready to fight!"
	para "If you leave now, your team will be unhappy."
	para "Leave anyway?"
	done

; Sunsette: same lockout confirmation, but for the menu escapes (Dig / Teleport / Fly / Escape Rope /
; Pocket Abra) - framed as the escape itself being interrupted rather than walking out a door.
_LockedAreaExitEscapeText::
	text "...but the escape won't take!"
	para "@"
	text_ram_namebuffer
	text " holds fast!"
	para "Slip away now and your team will be unhappy."
	para "Leave anyway?"
	done

; Mt. Moon 1F sign - warns the cave is dark (was the "Beware ZUBAT" sign)
_MtMoon1FBewareZubatSign::
	text "Tread slowly! Mt. Moon is dim and dangerous!"
	para "Even if lit up, running makes you easier for wild <Pokemon> to find!"
	para "These caves are filled with the bloodsucking Zubat<...>"
	done

; Viridian Forest South Gate - Oak's Aide
_ViridianForestSouthGateOaksAideNoDexText::
	text "I'm one of Prof. Oak's Aides!"
	para "He's counting on young trainers like you!"
	done

_ViridianForestSouthGateOaksAideHasDexText::
	text "Ah, you're the one helping fill the <poke>dex!"
	para "Don't forget, you can check in with Oak from any <PC> to evaluate your <poke>dex."
	done

; Sunsette: Viridian unofficial NAME RATER, after LAVENDER's official one is reachable (moved here; the
; ViridianNicknameHouse text bank was full)
_ViridianNicknameHouseOfficialText::
	text "Did you know they have OFFICIAL name raters?"
	para "I got in a lot of trouble for being an unofficial name rater..."
	done

; Sunsette: Viridian Forest PIKACHU girl - FLASH (HM05) hand-off (Option A) + the repeatable "explain an
; HM" offer. Grant + explanation live here because ViridianForest's Text 1 bank is full.
_ViridianForestPikaGirlFlashGrantText::
	text "You're strong!"
	para "Me? I only ever wanted a Pikachu of my own<...>"
	para "but I'm hopeless at catching them!"
	para "Here, you take this instead."
	prompt

_ViridianForestPikaGirlExplainOfferText::
	text "That look in your eyes<...>"
	para "You DO know what an HM is, right?"
	done

; Yes branch ("I know") - default cursor, so fast-tappers skip the lecture
_ViridianForestPikaGirlKnowsHMText::
	text "Of course you do!"
	para "You're a natural!"
	done

; No branch ("I don't") - quick surprise, then the explanation
_ViridianForestPikaGirlHMExplanationText::
	text "Oh! You don't?!"
	para "An HM's move can always be used out in the field."
	para "And one HM can teach its move as often as you like!"
	done

; Sunsette: Oak's Parcel starter reactions (Viridian Mart). <NAME> = wNameBuffer (the starter's
; nickname); per-starter closing line. Played with the starter's cry, no sprite cut-in.
_ParcelCharReactText::
	text_ram_namebuffer
	text " looks curious about the package! Be careful it doesn't burn it!"
	prompt

_ParcelSquirReactText::
	text_ram_namebuffer
	text " looks curious about the package! Be careful it doesn't do any mischief!"
	prompt

_ParcelBulbaReactText::
	text_ram_namebuffer
	text " looks curious about the package! Be careful it doesn't get jealous!"
	prompt

_ParcelGenericReactText::
	text_ram_namebuffer
	text " seems curious about the package!"
	prompt
