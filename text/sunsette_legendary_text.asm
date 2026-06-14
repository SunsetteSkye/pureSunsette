; Sunsette: OAK's one-time remarks when you first show him a caught legendary (OakLegendaryComment in
; engine/events/oak_legendary_comments.asm picks one at random per Pallet visit). The three birds start
; coherent, then trail into the Fan-Club-Chairman run-on; Mew is upbeat, Mewtwo somber. A shared
; transition line (printed after any of them) eases Oak back toward his usual dialogue.

_OakMoltresText::
	text "<PLAYER>! Is that"
	line "MOLTRES data?!"

	para "The fire bird! Its"
	line "flame is said to"
	cont "be the spirit"
	cont "of victory."

	para "Bound to the sun"
	line "in the old myths,"
	cont "of course<...>"

	para "the solstice"
	line "blaze<...>reborn"
	cont "from embers<...>"
	cont "a sky set aflame"
	cont "<...>and the"
	cont "people would<...>"
	cont "oh, the songs"
	cont "they sang<...>"
	prompt

_OakArticunoText::
	text "<PLAYER>! ARTICUNO"
	line "data! Remarkable!"

	para "The bird of ice."
	line "Legend says it"
	cont "appears to those"
	cont "soon to perish<...>"

	para "lost travelers"
	line "in the peaks<...>"
	cont "a final mercy<...>"
	cont "or an omen<...>"
	cont "the cold before"
	cont "the<...>well<...>"
	cont "the last sight,"
	cont "some say<...>"
	prompt

_OakZapdosText::
	text "<PLAYER>! Is that"
	line "ZAPDOS data?!"

	para "The thunder bird!"
	line "Feared by most,"
	cont "but you know,"

	para "in the arid lands"
	line "they adore it<...>"

	para "for its storms"
	line "bring the rains"
	cont "<...>life to the"
	cont "desert<...>a good"
	cont "omen<...>first"
	cont "drops<...>the smell"
	cont "of wet earth<...>"
	cont "they'd dance<...>"
	prompt

_OakMewText::
	text "<PLAYER>! You have"
	line "MEW data?!"

	para "I never thought"
	line "I'd see it! There"
	cont "were hardly any"
	cont "pictures, even in"
	cont "the diaries after"
	cont "it was found."

	para "A cheerful little"
	line "thing, isn't it?"

	para "Makes you wonder"
	line "how long they hid"
	cont "out there, and we"
	cont "never knew."
	prompt

_OakMewtwoText::
	text "So<...>MEWTWO."

	para "I just finished"
	line "reviewing that"
	cont "data."

	para "<...>"

	para "Humans can be"
	line "wonderful,"
	cont "<PLAYER>."

	para "And we can be"
	line "quite cruel, too."
	prompt

_OakLegendaryTransitionText::
	text "<...>but I'm sure"
	line "that's not what"
	cont "you're here for!"

	para "Don't mind me!"
	prompt

; Sunsette: OAK's one-time remark after you've fought either SNORLAX (fond reminiscence, hastily
; covered with PROF.ELM's unevolved-form hypothesis). Not a "caught" trigger - see OakVisitComment.
_OakSnorlaxText::
	text "SNORLAX<...>ahh."

	para "It reminds me of"
	line "an old assistant"
	cont "of mine."

	para "A big, sleepy"
	line "soul. I remember"
	cont "him fondly<...>"

	para "Er! That is,"
	line "PROF.ELM thinks"
	cont "there may be an"
	cont "unevolved form."

	para "Yes. Anyway!"
	prompt

; Sunsette: OAK's one-time remark on getting HM03 (SURF)
_OakSurfText::
	text "The HM for SURF!"

	para "Did you know I"
	line "have a cousin who"
	cont "loves to SURF?"

	para "Lives all the way"
	line "in ALOLA. Quite"
	cont "good at it, I"
	cont "hear!"
	prompt
