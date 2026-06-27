; Sunsette: one-time badge-milestone dialogue for MOM (RedsHouse1F) and DAISY (BluesHouse).
; Each milestone is offered only while it's the player's current (highest) milestone; reach the next
; one without talking and the previous line + its gift are lost. See scripts/RedsHouse1F.asm and
; scripts/BluesHouse.asm for the state logic. Relocated here so the maps' own text banks don't overflow.

; --- MOM (RARE CANDY each) ---
_MomMilestoneBoulderText::
	text "The Boulder Badge! So you'll be off to Mt. Moon next?"
	para "Hmm... I think Lucy's daughter had a Flash HM."
	para "But she went to the Forest a bit ago already."
	para "Here, take this for the road!"
	prompt

_MomMilestoneThunderText::
	text "The Thunder Badge! Your father and I are so proud of you, <PLAYER>!"
	para "You've grown up so much. Here's a little something."
	prompt

_MomMilestoneMarshText::
	text "The Marsh Badge!"
	para "A ninja Gym Leader? I can't..."
	para "BELIEVE IT!"
	para "Ahaha! Oh, listen to me. Here you go, sweetheart."
	prompt

_MomMilestoneVolcanoText::
	text "The Volcano Badge!"
	para "Is Blaine STILL a Gym Leader? My, after all these years!"
	para "Time flies. Take this, <PLAYER>."
	prompt

_MomMilestoneChampionText::
	text "<PLAYER>! The Champion! I can hardly believe it!"
	para "What a summer this has turned out to be!"
	para "A summer to remember, for certain!"
	prompt

_MomMilestoneGotCandyText::
	text "<PLAYER> got a Rare Candy!"
	done

; Mom's Champion gift handoff (a MASTER BALL - she's coy about what it is). sound_get_item_1 in the wrapper.
_MomChampionGiftText::
	text "They haven't started making these public yet,"
	para "but your dad pulled a few favors!"
	para "We thought it'd make a nice gift for the occasion!"
	para "By the way, I heard the Company President wants to see you."
	para "I wonder what that's about?"
	done

; MOM's one-time acknowledgments for the badges she doesn't gift for (no item)
_MomCommentCascadeText::
	text "The Cascade Badge! You're doing wonderfully, dear!"
	prompt

_MomCommentRainbowText::
	text "The Rainbow Badge! Such a pretty one. Keep it up!"
	prompt

_MomCommentSoulText::
	text "The Soul Badge! My, you're really something!"
	prompt

_MomCommentEarthText::
	text "The Earth Badge! All of them now? I'm so proud!"
	prompt

; --- DAISY (PP UP each) ---
_DaisyMilestoneCascadeText::
	text "The Cascade Badge!"
	para "Wow, you came all this way just to see me?"
	para "Hee hee... Here, a little reward."
	prompt

_DaisyMilestoneRainbowText::
	text "The Rainbow Badge!"
	para "...Why do you smell like women's perfume, <PLAYER>?"
	para "...Hmph. Here."
	prompt

_DaisyMilestoneSoulText::
	text "The Soul Badge! Isn't she kinda scary?"
	para "...So she had a whip, huh? I'll remember that."
	prompt

_DaisyMilestoneEarthText::
	text "The Earth Badge! That's all eight!"
	para "Wait... what was that about the Viridian Leader?"
	para "TEAM ROCKET?!"
	para "Wait, YOU saved Saffron City?!"
	para "You HAVE to tell me everything!"
	prompt

_DaisyMilestoneChampionText::
	text "So, you're the Champion now."
	para "What are you doing with the rest of your summer?"
	para "Because I've got a few ideas..."
	para "Here. A little something from me to you."
	para "Now come on, before <RIVAL> gets home and starts whining."
	prompt

_DaisyMilestoneGotTMText::
	text "<PLAYER> received @"
	text_ram_stringbuffer
	text "!"
	done

_DaisyMilestoneGotPPUpText::
	text "<PLAYER> got a PP Up!"
	done

; DAISY's one-time acknowledgments for the badges she doesn't gift for (no item)
_DaisyCommentBoulderText::
	text "The Boulder Badge? Heh. Off to a start, then."
	prompt

_DaisyCommentThunderText::
	text "The Thunder Badge. You're getting tougher, <PLAYER>."
	prompt

_DaisyCommentMarshText::
	text "The Marsh Badge? Color me a little impressed."
	prompt

_DaisyCommentVolcanoText::
	text "The Volcano Badge! Nearly there now, aren't you?"
	prompt
