_SaffronGymSabrinaText::
	text "I had a vision of your arrival!"
	para "I have had psychic powers since I was a child."
	para "I first learned to bend spoons with my mind."
	para "I dislike fighting, but if you wish, I will show you my powers!"
	done

_SaffronGymSabrinaReceivedMarshBadgeText::
	text "I'm shocked! But, a loss is a loss."
	para "I admit I didn't work hard enough to win!"
	para "You earned the Soul Badge!@"
	text_end

_SaffronGymSabrinaStopBotheringText::
	text "<...>What is it now?"
	para "Will you stop bothering me?"
	done

_SaffronGymSabrinaThankYouText::
	text "<...>Thank you."
	done

_TM46ExplanationText::
	text_start
	para "@"
	text_ram_stringbuffer
	text " is Skittermind!"
	para "Empty the foe's mind of all that it is!"
	para "It forgets what it is, left a mere bug."
	para "Confusion clouds it."
	done

_SaffronGymSabrinaTM46NoRoomText::
	text "Your pack is full of other items!"
	done

_SaffronGymGuideChampInMakingText::
	text "Sabrina's <Pokemon> use psychic power instead of force!"
	para "A psychic barrier seals your pack."
	para "No items the whole fight!"
	done

_SaffronGymGuideBeatSabrinaText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "Psychic power, huh?"
	para "If I had that, I'd make a bundle at the slots!"
	para "That Badge lets you raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_SaffronGymGuideApexChipPsychicText::
	text "For Psychic <Pokemon>, an Apex Chip will replicate a calm silent area of meditation, like a temple or a beach at sunset."
	prompt

_SaffronGymChanneler1BattleText::
	text "Sabrina is younger than I, but I respect her!"
	done

_SaffronGymChanneler1EndBattleText::
	text "Not good enough!"
	prompt

_SaffronGymChanneler1AfterBattleText::
	text "In a battle of equals, the one with the stronger will wins!"
	para "If you wish to beat Sabrina, focus on winning!"
	done

_SaffronGymYoungster1BattleText::
	text "Does our unseen power scare you?"
	done

_SaffronGymYoungster1EndBattleText::
	text "I never foresaw this!"
	prompt

_SaffronGymYoungster1AfterBattleText::
	text "Psychic <Pokemon> fear only bugs@"
	text_end

_SaffronGymYoungster1AfterBattleText3::
	text "<SCROLL>and ghosts!"
	done

_SaffronGymChanneler2BattleText::
	text "<Pokemon> take on the appearance of their Trainers."
	para "Your <Pokemon> must be tough, then!"
	done

_SaffronGymChanneler2EndBattleText::
	text "I knew it!"
	prompt

_SaffronGymChanneler2AfterBattleText::
	text "I must teach better techniques to my <Pokemon>!"
	done

_SaffronGymYoungster2BattleText::
	text "You know that power alone isn't enough!"
	done

_SaffronGymYoungster2EndBattleText::
	text "I don't believe this!"
	prompt

_SaffronGymYoungster2AfterBattleText::
	text "Sabrina just wiped out the Karate Master next door!"
	done

_SaffronGymChanneler3BattleText::
	text "You and I, our <Pokemon> shall fight!"
	done

_SaffronGymChanneler3EndBattleText::
	text "I lost after all!"
	prompt

_SaffronGymChanneler3AfterBattleText::
	text "I knew that this was going to take place."
	done

_SaffronGymYoungster3BattleText::
	text "Sabrina is young, but she's also our Leader!"
	para "You won't reach her easily!"
	done

_SaffronGymYoungster3EndBattleText::
	text "I lost my concentration!"
	prompt

_SaffronGymYoungster3AfterBattleText::
	text "There used to be 2 <Pokemon> Gyms in Saffron."
	para "The Fighting Dojo next door lost its Gym status when we went and creamed them!"
	done

_SaffronGymYoungster4BattleText::
	text "Saffron <Pokemon> Gym is famous for its psychics!"
	para "You want to see Sabrina! I can tell!"
	done

_SaffronGymYoungster4EndBattleText::
	text "Arrrgh!"
	prompt

_SaffronGymYoungster4AfterBattleText::
	text "That's right! I used telepathy to read your mind!"
	done
