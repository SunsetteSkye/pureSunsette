; Sunsette: OAK's one-time remarks when you first show him a caught legendary (OakLegendaryComment in
; engine/events/oak_legendary_comments.asm picks one at random per Pallet visit). The three birds start
; coherent, then trail into the Fan-Club-Chairman run-on; Mew is upbeat, Mewtwo somber. A shared
; transition line (printed after any of them) eases Oak back toward his usual dialogue.

_OakMoltresText::
	text "<PLAYER>! Is that Moltres data?!"
	para "The fire bird! Its flame is said to be the spirit of victory."
	para "Bound to the sun in the old myths, of course<...>"
	para "the solstice blaze<...>reborn from embers<...>a sky set aflame<...>and the people would<...>oh, the songs they sang<...>"
	prompt

_OakArticunoText::
	text "<PLAYER>! Articuno data! Remarkable!"
	para "The bird of ice. Legend says it appears to those soon to perish<...>"
	para "lost travelers in the peaks<...>a final mercy<...>or an omen<...>the cold before the<...>well<...>the last sight, some say<...>"
	prompt

_OakZapdosText::
	text "<PLAYER>! Is that Zapdos data?!"
	para "The thunder bird! Feared by most, but you know,"
	para "in the arid lands they adore it<...>"
	para "for its storms bring the rains<...>life to the desert<...>a good omen<...>first drops<...>the smell of wet earth<...>they'd dance<...>"
	prompt

_OakMewText::
	text "<PLAYER>! You have Mew data?!"
	para "I never thought I'd see it! There were hardly any pictures, even in the diaries after it was found."
	para "A cheerful little thing, isn't it?"
	para "Makes you wonder how long they hid out there, and we never knew."
	prompt

_OakMewtwoText::
	text "So<...>Mewtwo."
	para "I just finished reviewing that data."
	para "<...>"
	para "Humans can be wonderful, <PLAYER>."
	para "And we can be quite cruel, too."
	prompt

_OakLegendaryTransitionText::
	text "<...>but I'm sure that's not what you're here for!"
	para "Don't mind me!"
	prompt

; Sunsette: OAK's one-time remark after you've fought either SNORLAX (fond reminiscence, hastily
; covered with PROF.ELM's unevolved-form hypothesis). Not a "caught" trigger - see OakVisitComment.
_OakSnorlaxText::
	text "Snorlax<...>ahh."
	para "It reminds me of an old assistant of mine."
	para "A big, sleepy soul. I remember him fondly<...>"
	para "Er! That is, Prof. Elm thinks there may be an unevolved form."
	para "Yes. Anyway!"
	prompt

; Sunsette: OAK's one-time remark on getting HM03 (SURF)
_OakSurfText::
	text "The HM for Surf!"
	para "Did you know I have a cousin who loves to Surf?"
	para "Lives all the way in Alola. Quite good at it, I hear!"
	prompt
