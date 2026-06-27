_CinnabarGymBlainePreBattleText::
	text "Hah!"
	para "I am Blaine! I am the Leader of Cinnabar Gym!"
	para "My fiery <Pokemon> will incinerate all challengers!"
	para "Hah! You better have Burn Heal!"
	done

_CinnabarGymBlaineReceivedVolcanoBadgeText::
	text "I have burnt out!"
	para "You have earned the Volcano Badge!@"
	text_end

; Sunsette: BLAINE's random post-battle fire puns live in the floating
; "Sunsette Gym Repeat Text" section (text/sunsette_gym_repeat_text.asm)
; because the Text 9 bank is full.

_CinnabarGymBlaineMoltres::
	text "It can't be<...>"
	para "You caught the flaming bird <Pokemon>, Moltres!"
	para "A Moltres saved my life!"
	para "It guided me out of a mountain range when I lost my way!"
	done

_CinnabarGymBlaineVolcanoBadgeInfoText::
	text "Hah!"
	para "The Volcano Badge heightens the Special abilities of your <Pokemon>!"
	para "Here, you can have this too!"
	done

_CinnabarGymBlaineTM38ExplanationText::
	text_start
	para "@"
	text_ram_stringbuffer
	text " contains Supernova!"
	para "A Fire <Pokemon> blasts it with no recoil at all!"
	para "Ninetales and Arcanine love this gift!"
	done

_CinnabarGymBlaineTM38NoRoomText::
	text "Make room for my gift!"
	done

_CinnabarGymSuperNerd1BattleText::
	text "Do you know how hot a slow burn can get?"
	done

_CinnabarGymSuperNerd1EndBattleText::
	text "Yow! Hot, hot, hot!"
	prompt

_CinnabarGymSuperNerd1AfterBattleText::
	text "It's all in the buildup, the smoldering tension, the..."
	para "...ahem. Forget I said it."
	done

_CinnabarGymBurglar1BattleText::
	text "I was a thief, but I became straight as a Trainer!"
	done

_RocketHideoutB2FRocketEndBattleText::
_CinnabarGymBurglar1EndBattleText::
	text "I surrender!"
	prompt

_CinnabarGymBurglar1AfterBattleText::
	text "I can't help stealing other people's <Pokemon>!"
	done

_CinnabarGymSuperNerd2BattleText::
	text "Cute, but cute won't beat my years of study!"
	done

_CinnabarGymSuperNerd2EndBattleText::
	text "Wha?! Impossible!"
	prompt

_CinnabarGymSuperNerd2AfterBattleText::
	text "I lost to a babyface?!"
	para "I'll never live this down..."
	done

_CinnabarGymBurglar2BattleText::
	text "I just like using fire <Pokemon>!"
	done

_CinnabarGymBurglar2EndBattleText::
	text "Too hot to handle!"
	prompt

_CinnabarGymBurglar2AfterBattleText::
	text "I wish there was a thief <Pokemon>! I'd use that!"
	done

_CinnabarGymFirefighter1BattleText::
	text "I know why Blaine became a Trainer!"
	done

_CinnabarGymFirefighter1EndBattleText::
	text "Ow!"
	prompt

_CinnabarGymFirefighter1AfterBattleText::
	text "Blaine was lost in the mountains when a fiery bird <Pokemon> appeared."
	para "Its light enabled Blaine to find his way down!"
	done

_CinnabarGymBurglar3BattleText::
	text "I've been to many Gyms, but this is my favorite!"
	done

_CinnabarGymBurglar3EndBattleText::
	text "Yowza! Too hot!"
	prompt

_CinnabarGymBurglar3AfterBattleText::
	text "Us fire <Pokemon> fans like Ponyta and Ninetales!"
	done

_CinnabarGymFirefighter2BattleText::
	text "Fire is weak against H2O!"
	done

_CinnabarGymFirefighter2EndBattleText::
	text "Oh! Snuffed out!"
	prompt

_CinnabarGymFirefighter2AfterBattleText::
	text "Water beats fire! But, fire melts ice <Pokemon>!"
	done

_CinnabarGymGymGuideChampInMakingText::
	text "The hot-headed Blaine is a fire <Pokemon> pro!"
	para "The volcanic heat here stokes his <Pokemon>'s Special power!"
	para "You better take some Burn Heals!"
	done

_CinnabarGymGymGuideBeatBlaineText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "<PLAYER>! You beat that fire brand!"
	para "That Badge lets you raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_CinnabarGymGuideApexChipFireText::
	text "An Apex Chip will swiftly transport a Fire <Pokemon> to a sweltering volcano caldera, with flowing lava and plenty of excitement!"
	prompt
