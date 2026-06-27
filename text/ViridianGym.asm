_ViridianGymGiovanniPreBattleText::
	text "Fwahahaha! This is my hideout!"
	para "I planned to resurrect <TEAM><ROCKET> here!"
	para "But, you have caught me again! So be it! This time, I'm not holding back!"
	para "Once more, you shall face Giovanni, the greatest Trainer!"
	done

_ViridianGymGiovanniReceivedEarthBadgeText::
	text "Ha! That was a truly intense fight! You have won! As proof, here is the Earth Badge!@"
	text_end

_ViridianGymGiovanniPostBattleAdviceText::
	text "Having lost, I cannot face my underlings! <TEAM><ROCKET> is finished forever!"
	para "I will dedicate my life to the study of <Pokemon>!"
	para "Let us meet again some day! Farewell!@"
	text_end

_ViridianGymGiovanniEarthBadgeInfoText::
	text "The Earth Badge is evidence of your mastery as a <Pokemon> Trainer!"
	para "With it, you can enter the <Pokemon> League!"
	para "It is my gift for your <Pokemon> League challenge!"
	para "Now your <Pokemon> use their full Speed to score critical hits!"
	para "Be warned: very rare <Pokemon> will not ordinarily score critical hits!"
	para "Take this <TM> as well!"
	done

_ViridianGymGiovanniTM27ExplanationText::
	text_start

	para "@"
	text_ram_stringbuffer
	text ": Clay Armor! An earthen guard that shields and heals Ground kin!"
	para "I forged it when I ran the Gym here, long ago<...>"
	done

_ViridianGymGiovanniTM27NoRoomText::
	text "You do not have space for this!"
	done

_ViridianGymCooltrainerM1BattleText::
	text "Heh! You must be running out of steam by now!"
	done

_ViridianGymCooltrainerM1EndBattleText::
	text "I ran out of gas!"
	prompt

_ViridianGymCooltrainerM1AfterBattleText::
	text "You need power to keep up with our Gym Leader!"
	done

_ViridianGymHiker1BattleText::
	text "Rrrroar! I'm working myself into a rage!"
	done

_ViridianGymHiker1EndBattleText::
	text "Wargh!"
	prompt

_ViridianGymHiker1AfterBattleText::
	text "I'm still not worthy!"
	done

_ViridianGymRocker1BattleText::
	text "<Pokemon> and I, we make wonderful music together!"
	done

_ViridianGymRocker1EndBattleText::
	text "You are in perfect harmony!"
	prompt

_ViridianGymRocker1AfterBattleText::
	text "Do you know the identity of our Gym Leader?"
	done

_ViridianGymHiker2BattleText::
	text "Karate is the ultimate form of martial arts!"
	done

_ViridianGymHiker2EndBattleText::
	text "Atcho!"
	prompt

_ViridianGymHiker2AfterBattleText::
	text "If my <Pokemon> were as good at Karate as I<...>"
	done

_ViridianGymCooltrainerM2BattleText::
	text "The truly talented win with style!"
	done

_ViridianGymCooltrainerM2EndBattleText::
	text "I lost my grip!"
	prompt

_ViridianGymCooltrainerM2AfterBattleText::
	text "The Leader will scold me!"
	done

_ViridianGymHiker3BattleText::
	text "I'm the Karate King! Your fate rests with me!"
	done

_ViridianGymHiker3EndBattleText::
	text "Ayah!"
	prompt

_ViridianGymHiker3AfterBattleText::
	text "<Pokemon> League? You? Don't get cocky!"
	done

_ViridianGymRocker2BattleText::
	text "Your <Pokemon> will cower at the crack of my whip!"
	done

_ViridianGymRocker2EndBattleText::
	text "Yowch! Whiplash!"
	prompt

_ViridianGymRocker2AfterBattleText::
	text "Wait! I was just careless!"
	done

_ViridianGymCooltrainerM3BattleText::
	text "Viridian Gym was closed for a long time, but now our Leader is back!"
	done

_ViridianGymCooltrainerM3EndBattleText::
	text "I was beaten?"
	prompt

_ViridianGymCooltrainerM3AfterBattleText::
	text "You can go onto <Pokemon> League only by defeating our Gym Leader!"
	done

_ViridianGymGuidePreBattleText::
	text "Even I don't know Viridian Leader's identity!"
	para "This will be the toughest of all the Gym Leaders!"
	para "These Trainers fight vicious!"
	para "Their <Pokemon> land critical hits twice as often!"
	done

_ViridianGymGuidePostBattleText::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "Blow me away! Giovanni was the Gym Leader here?"
	para "That Badge lets you raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_ViridianGymGuideApexChipGroundText::
	text "For Ground <Pokemon>, an Apex Chip will simulate a sandy dry badland environment with rolling hills and burrowable earth below."
	prompt

_ViridianGymGuideSeeAtPokemonLeagueText::
	text "See you at the <Pokemon> League!"
	done
