_CinnabarGymBlainePreBattleText::
	text "Hah!"

	para "I am BLAINE! I"
	line "am the LEADER of"
	cont "CINNABAR GYM!"

	para "My fiery #MON"
	line "will incinerate"
	cont "all challengers!"

	para "Hah! You better"
	line "have BURN HEAL!"
	done

_CinnabarGymBlaineReceivedVolcanoBadgeText::
	text "I have"
	line "burnt out!"

	para "You have earned"
	line "the VOLCANOBADGE!@"
	text_end

; Sunsette: BLAINE's random post-battle fire puns live in the floating
; "Sunsette Gym Repeat Text" section (text/sunsette_gym_repeat_text.asm)
; because the Text 9 bank is full.

_CinnabarGymBlaineMoltres::
	text "It can't be<...>"
	para "You caught the"
	line "flaming bird"
	cont "#MON, MOLTRES!"
	para "A MOLTRES saved"
	line "my life!"
	para "It guided me out"
	line "of a mountain"
	cont "range when I lost"
	cont "my way!"
	done

_CinnabarGymBlaineVolcanoBadgeInfoText::
	text "Hah!"

	para "The VOLCANOBADGE"
	line "heightens the"
	cont "SPECIAL abilities"
	cont "of your #MON!"

	para "Here, you can"
	line "have this too!"
	done

_CinnabarGymBlaineTM38ExplanationText::
	text_start
	para "@"
	text_ram_stringbuffer
	text " contains"
	line "SUPERNOVA!"

	para "A FIRE #MON"
	line "blasts it with no"
	cont "recoil at all!"

	para "NINETALES and"
	line "ARCANINE love"
	cont "this gift!"
	done

_CinnabarGymBlaineTM38NoRoomText::
	text "Make room for my"
	line "gift!"
	done

_CinnabarGymSuperNerd1BattleText::
	text "Do you know how"
	line "hot a slow burn"
	cont "can get?"
	done

_CinnabarGymSuperNerd1EndBattleText::
	text "Yow!"
	line "Hot, hot, hot!"
	prompt

_CinnabarGymSuperNerd1AfterBattleText::
	text "It's all in the"
	line "buildup, the"
	cont "smoldering"
	cont "tension, the..."

	para "...ahem."
	line "Forget I said it."
	done

_CinnabarGymBurglar1BattleText::
	text "I was a thief, but"
	line "I became straight"
	cont "as a trainer!"
	done

_RocketHideoutB2FRocketEndBattleText::
_CinnabarGymBurglar1EndBattleText::
	text "I"
	line "surrender!"
	prompt

_CinnabarGymBurglar1AfterBattleText::
	text "I can't help"
	line "stealing other"
	cont "people's #MON!"
	done

_CinnabarGymSuperNerd2BattleText::
	text "Cute, but cute"
	line "won't beat my"
	cont "years of study!"
	done

_CinnabarGymSuperNerd2EndBattleText::
	text "Wha?!"
	line "Impossible!"
	prompt

_CinnabarGymSuperNerd2AfterBattleText::
	text "I lost to a"
	line "babyface?!"

	para "I'll never live"
	line "this down..."
	done

_CinnabarGymBurglar2BattleText::
	text "I just like using"
	line "fire #MON!"
	done

_CinnabarGymBurglar2EndBattleText::
	text "Too hot"
	line "to handle!"
	prompt

_CinnabarGymBurglar2AfterBattleText::
	text "I wish there was"
	line "a thief #MON!"
	cont "I'd use that!"
	done

_CinnabarGymFirefighter1BattleText::
	text "I know why BLAINE"
	line "became a trainer!"
	done

_CinnabarGymFirefighter1EndBattleText::
	text "Ow!"
	prompt

_CinnabarGymFirefighter1AfterBattleText::
	text "BLAINE was lost"
	line "in the mountains"
	cont "when a fiery bird"
	cont "#MON appeared."

	para "Its light enabled"
	line "BLAINE to find"
	cont "his way down!"
	done

_CinnabarGymBurglar3BattleText::
	text "I've been to many"
	line "GYMs, but this is"
	cont "my favorite!"
	done

_CinnabarGymBurglar3EndBattleText::
	text "Yowza!"
	line "Too hot!"
	prompt

_CinnabarGymBurglar3AfterBattleText::
	text "Us fire #MON"
	line "fans like PONYTA"
	cont "and NINETALES!"
	done

_CinnabarGymFirefighter2BattleText::
	text "Fire is weak"
	line "against H2O!"
	done

_CinnabarGymFirefighter2EndBattleText::
	text "Oh!"
	line "Snuffed out!"
	prompt

_CinnabarGymFirefighter2AfterBattleText::
	text "Water beats fire!"
	line "But, fire melts"
	cont "ice #MON!"
	done

_CinnabarGymGymGuideChampInMakingText::
	text "The hot-headed"
	line "BLAINE is a fire"
	cont "#MON pro!"

	para "The volcanic heat"
	line "here stokes his"
	cont "#MON's SPECIAL"
	cont "power!"

	para "You better take"
	line "some BURN HEALs!"
	done

_CinnabarGymGymGuideBeatBlaineText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "<PLAYER>! You beat"
	line "that fire brand!"

	para "That BADGE lets"
	line "you raise #MON"
	cont "up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_CinnabarGymGuideApexChipFireText::
	text "An APEX CHIP will"
	line "swiftly transport"
	cont "a fire #MON"
	cont "to a sweltering"
	cont "volcano caldera,"
	cont "with flowing lava"
	cont "and plenty of"
	cont "excitement!"
	prompt 
