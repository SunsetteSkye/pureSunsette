_FuchsiaGymKogaPostBattleAdviceText::
	text "A fine result. I congratulate you."
	para "Naturally, a true ninja shows only what he wishes to be seen<...>"
	para "<...>and keeps the rest unseen."
	done

_FuchsiaGymKogaSoulBadgeInfoText::
	text "Now that you have the Marsh Badge, the Defense of your <Pokemon> increases!"
	para "It also lets you Surf outside of battle!"
	para "Ah! Take this too!"
	done

_FuchsiaGymKogaTM06ExplanationText::
	text_start
	para "@"
	text_ram_stringbuffer
	text " contains Shadow Game!"
	para "It is a secret technique over 400 years old!"
	done

_FuchsiaGymKogaTM06NoRoomText::
	text "Make space for this, child!"
	done

_FuchsiaGymJuggler1BattleText::
	text "Strength isn't the key for <Pokemon>!"
	para "It's strategy!"
	para "I'll show you how strategy can beat brute strength!"
	done

_FuchsiaGymJuggler1EndBattleText::
	text "What? Extraordinary!"
	prompt

_FuchsiaGymJuggler1AfterBattleText::
	text "So, you mix brawn with brains? Good strategy!"
	done

_FuchsiaGymJuggler2BattleText::
	text "I wanted to become a ninja, so I joined this Gym!"
	done

_FuchsiaGymJuggler2EndBattleText::
	text "I'm done for!"
	prompt

_FuchsiaGymJuggler2AfterBattleText::
	text "I will keep on training under Koga, my ninja master!"
	done

_FuchsiaGymJuggler3BattleText::
	text "Let's see you beat my special techniques!"
	done

_FuchsiaGymJuggler3EndBattleText::
	text "You had me fooled!"
	prompt

_FuchsiaGymJuggler3AfterBattleText::
	text "I like poison and sleep techniques, as they linger after battle!"
	done

_FuchsiaGymTamer1BattleText::
	text "Stop right there!"
	para "Our invisible walls have you frustrated?"
	done

_FuchsiaGymTamer1EndBattleText::
	text "Whoa! He's got it!"
	prompt

_FuchsiaGymTamer1AfterBattleText::
	text "You impressed me! Here's a hint!"
	para "Look very closely for gaps in the invisible walls!"
	done

_FuchsiaGymTamer1AfterBattleGymDefeatedText::
	text "I've never seen a ninja master lose until today!"
	para "You're insane!"
	done

_FuchsiaGymTamer2BattleText::
	text "I also study the way of the ninja with master Koga!"
	para "Ninja have a long history of using animals!"
	done

_FuchsiaGymTamer2EndBattleText::
	text "Awoo!"
	prompt

_FuchsiaGymTamer2AfterBattleText::
	text "I still have much to learn!"
	done

_FuchsiaGymJuggler4BattleText::
	text "Master Koga comes from a long line of ninjas!"
	para "What did you descend from?"
	done

_FuchsiaGymJuggler4EndBattleText::
	text "Dropped my balls!"
	prompt

_FuchsiaGymJuggler4AfterBattleText::
	text "Where there is light, there is shadow!"
	para "Light and shadow! Which do you choose?"
	done

_FuchsiaGymGymGuideChampInMakingText::
	text "Fuchsia Gym is riddled with invisible walls!"
	para "Those same walls confuse your lead <Pokemon> as the battle begins!"
	para "You have to find gaps in the walls to reach him!"
	done

_FuchsiaGymGymGuideBeatKogaText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "It's amazing how ninja can terrify even now!"
	para "That Badge lets you raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_FuchsiaGymGuideApexChipPoisonText::
	text "For Poison <Pokemon>, an Apex Chip will conjure up images of a dark, totally overgrown mangrove swamp."
	prompt
