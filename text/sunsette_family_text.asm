; Sunsette: one-time badge-milestone dialogue for MOM (RedsHouse1F) and DAISY (BluesHouse).
; Each milestone is offered only while it's the player's current (highest) milestone; reach the next
; one without talking and the previous line + its gift are lost. See scripts/RedsHouse1F.asm and
; scripts/BluesHouse.asm for the state logic. Relocated here so the maps' own text banks don't overflow.

; --- MOM (RARE CANDY each) ---
_MomMilestoneBoulderText::
	text "The BOULDER BADGE!"
	line "So you'll be off"
	cont "to MT.MOON next?"

	para "Hmm... I think"
	line "LUCY's daughter"
	cont "had a FLASH HM."
	
	para "But she went to"
	line "the FOREST a bit"
	cont "ago already."

	para "Here, take this"
	line "for the road!"
	prompt

_MomMilestoneThunderText::
	text "The THUNDER BADGE!"
	line "Your father and I"
	cont "are so proud of"
	cont "you, <PLAYER>!"

	para "You've grown up"
	line "so much. Here's a"
	cont "little something."
	prompt

_MomMilestoneMarshText::
	text "The MARSH BADGE!"

	para "A ninja gym"
	line "leader? I can't..."

	para "BELIEVE IT!"

	para "Ahaha! Oh, listen"
	line "to me. Here you"
	cont "go, sweetheart."
	prompt

_MomMilestoneVolcanoText::
	text "The VOLCANO BADGE!"

	para "Is BLAINE STILL a"
	line "gym leader? My,"
	cont "after all these"
	cont "years!"

	para "Time flies. Take"
	line "this, <PLAYER>."
	prompt

_MomMilestoneChampionText::
	text "<PLAYER>! The"
	line "CHAMPION! I can"
	cont "hardly believe it!"

	para "What a summer this"
	line "has turned out to"
	cont "be!"

	para "A summer to"
	line "remember, for"
	cont "certain!"
	prompt

_MomMilestoneGotCandyText::
	text "<PLAYER> got a"
	line "RARE CANDY!"
	done

; Mom's Champion gift handoff (a MASTER BALL - she's coy about what it is). sound_get_item_1 in the wrapper.
_MomChampionGiftText::
	text "They haven't"
	line "started making"
	cont "these public yet,"

	para "but your dad"
	line "pulled a few"
	cont "favors!"

	para "We thought it'd"
	line "make a nice gift"
	cont "for the occasion!"
	done

; MOM's one-time acknowledgments for the badges she doesn't gift for (no item)
_MomCommentCascadeText::
	text "The CASCADE BADGE!"
	line "You're doing"
	cont "wonderfully, dear!"
	prompt

_MomCommentRainbowText::
	text "The RAINBOW BADGE!"
	line "Such a pretty one."
	cont "Keep it up!"
	prompt

_MomCommentSoulText::
	text "The SOUL BADGE!"
	line "My, you're really"
	cont "something!"
	prompt

_MomCommentEarthText::
	text "The EARTH BADGE!"
	line "All of them now?"
	cont "I'm so proud!"
	prompt

; --- DAISY (PP UP each) ---
_DaisyMilestoneCascadeText::
	text "The CASCADE BADGE!"

	para "Wow, you came all"
	line "this way just to"
	cont "see me?"

	para "Hee hee... Here,"
	line "a little reward."
	prompt

_DaisyMilestoneRainbowText::
	text "The RAINBOW BADGE!"

	para "...Why do you"
	line "smell like women's"
	cont "perfume, <PLAYER>?"

	para "...Hmph. Here."
	prompt

_DaisyMilestoneSoulText::
	text "The SOUL BADGE!"
	line "Isn't she kinda"
	cont "scary?"

	para "...So she had a"
	line "whip, huh?"
	cont "I'll remember"
	cont "that."
	prompt

_DaisyMilestoneEarthText::
	text "The EARTH BADGE!"
	line "That's all eight!"

	para "Wait... what was"
	line "that about the"
	cont "VIRIDIAN leader?"

	para "TEAM ROCKET?!"

	para "Wait, YOU saved"
	line "SAFFRON CITY?!"

	para "You HAVE to tell"
	line "me everything!"
	prompt

_DaisyMilestoneChampionText::
	text "So, you're the"
	line "CHAMPION now."

	para "What are you doing"
	line "with the rest of"
	cont "your summer?"

	para "Because I've got a"
	line "few ideas..."

	para "Here. A little"
	line "something from me"
	cont "to you."

	para "Now come on,"
	line "before <RIVAL> gets"
	cont "home and starts"
	cont "whining."
	prompt

_DaisyMilestoneGotTMText::
	text "<PLAYER> received"
	line "@"
	text_ram_stringbuffer
	text "!"
	done

_DaisyMilestoneGotPPUpText::
	text "<PLAYER> got a"
	line "PP UP!"
	done

; DAISY's one-time acknowledgments for the badges she doesn't gift for (no item)
_DaisyCommentBoulderText::
	text "The BOULDER BADGE?"
	line "Heh. Off to a"
	cont "start, then."
	prompt

_DaisyCommentThunderText::
	text "The THUNDER BADGE."
	line "You're getting"
	cont "tougher, <PLAYER>."
	prompt

_DaisyCommentMarshText::
	text "The MARSH BADGE?"
	line "Color me a little"
	cont "impressed."
	prompt

_DaisyCommentVolcanoText::
	text "The VOLCANO BADGE!"
	line "Nearly there now,"
	cont "aren't you?"
	prompt
