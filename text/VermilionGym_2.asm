_VermilionGymLTSurgePostBattleAdviceText::
	text "Haven't had a fight that good in ages, kid!"
	para "Next time we're both in Celadon,"
	para "grab a slice with me at the Diner!"
	done

_VermilionGymLTSurgeThunderBadgeInfoText::
	text "The Thunder Badge cranks up your <Pokemon>'s Speed!"
	para "It also lets your <Pokemon> Fly any time, kid!"
	para "You're special, kid! Take this!"
	done

_TM24ExplanationText::
	text_start
	para "@"
	text_ram_stringbuffer
	text " contains Thunderbolt!"
	para "Teach it to an electric <Pokemon>!"
	done

_VermilionGymLTSurgeTM24NoRoomText::
	text "Yo kid, make room in your pack!"
	done

_VermilionGymLTSurgeReceivedThunderBadgeText::
	text "Whoa!"
	para "You're the real deal, kid!"
	para "Fine then, take the Thunder Badge!"
	prompt

_VermilionGymGentlemanBattleText::
	text "When I was in the Army, Lt. Surge was my strict CO!"
	done

_VermilionGymGentlemanEndBattleText::
	text "Stop! You're very good!"
	prompt

_VermilionGymGentlemanAfterBattleText::
	text "The door won't open?"
	para "Lt. Surge always was cautious!"
	done

_VermilionGymSuperNerdBattleText::
	text "I'm a lightweight, but I'm good with electricity!"
	done

_VermilionGymSuperNerdEndBattleText::
	text "Fried!"
	prompt

_VermilionGymSuperNerdAfterBattleText::
	text "OK, I'll talk!"
	para "Lt. Surge said he hid door switches inside something!"
	done

_VermilionGymSailorBattleText::
	text "This is no place for kids!"
	done

_VermilionGymSailorEndBattleText::
	text "Wow! Surprised me!"
	prompt

_VermilionGymSailorAfterBattleText::
	text "Lt. Surge set up double locks! Here's a hint!"
	para "When you open the 1st lock, the 2nd lock is right next to it!"
	done

_VermilionGymGymGuideChampInMakingText::
	text "Lt. Surge has a nickname. People refer to him as the Lightning American!"
	para "Surge drills his <Pokemon> in close combat. They hit harder here!"
	para "Lt. Surge is very cautious!"
	para "You'll have to break a code to get to him!"
	done

_VermilionGymGymGuideBeatLTSurgeText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "Whew! That match was electric!"
	para "That Badge lets you raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_VermilionGymGuideApexChipElectricText::
	text "For Electric <Pokemon>, an Apex Chip will simulate a vast grassy steppe with frequent storms, lightning and thunder!"
	prompt

_VermilionGymGentlemanAfterLocksText::
	text "There you go."
	para "The gates opened! Good job!"
	done

_VermilionGymSuperNerdAfterLocksText::
	text "Hey! You figured it out! Cool!"
	done

_VermilionGymSailorAfterLocksText::
	text "You found the locks?"
	para "You're sharp!"
	done
