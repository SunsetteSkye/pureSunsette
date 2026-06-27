_GameCornerBeauty1Text::
	text "Welcome!"
	para "You can exchange your coins for fabulous prizes next door."
	done

_GameCornerClerk1DoYouNeedSomeGameCoinsText::
	text "Welcome to Rocket Game Corner!"
	para "Do you need some game coins?"
	para "It's ¥8000 for 500 coins. Would you like some?"
	done

_GameCornerClerk1ThanksHereAre50CoinsText::
	text "Thanks! Here are your 500 coins!"
	prompt

_CeladonGameCornerText_another500::
	text "Want another 500?"
	prompt

_GameCornerClerk1PleaseComePlaySometimeText::
	text "No? Please come play sometime!"
	done

_GameCornerClerk1CantAffordTheCoinsText::
	text "You can't afford the coins!"
	done

_GameCornerClerk1CoinCaseIsFullText::
	text "Oops! Your Coin Case is full."
	done

_GameCornerClerk1DontHaveCoinCaseText::
	text "You don't have a Coin Case!"
	done

_GameCornerMiddleAgedMan1Text::
	text "Keep this quiet."
	para "It's rumored that this place is run by <TEAM><ROCKET>."
	done

_GameCornerBeauty2Text::
	text "I think these machines have different odds."
	done

_GameCornerFishingGuruWantToPlayText::
	text "Kid, do you want to play?"
	prompt

_GameCornerFishingGuruReceived10CoinsText::
	text "<PLAYER> received 10 coins!@"
	text_end

_GameCornerFishingGuruDontNeedMyCoinsText::
	text "You don't need my coins!"
	done

_GameCornerFishingGuruWinsComeAndGoText::
	text "Wins seem to come and go."
	done

_GameCornerMiddleAgedWomanText::
	text "I'm having a wonderful time!"
	done

_GameCornerGymGuideChampInMakingText::
	text "Hey, champ!"
	para "Men can't enter that Gym unless challenging the Leader, so I'm here at the slots!"
	para "Erika uses grass-types. Perfume in there is intense!"
	done

_CeladonGameCornerText_gymguide::
	text_asm
	push bc
	callfar ComputeExpGrowthThreshold
	pop bc
	ld hl, .body
	ret
.body:
	text "I hear you beat Erika!"
	para "That Badge lets you raise <Pokemon> up to L@"
	text_decimal wExpGrowthThreshold, 1, 2
	text "!"
	prompt

_CeladonGameCornerGymGuideApexChipGrassText::
	text "For grass <Pokemon>, an Apex Chip will evoke a lush green forest or jungle with a thick canopy and endless amounts of plantlife."
	prompt

_GameCornerGymGuideTheyOfferRarePokemonText::
	text "How about this Game Corner?"
	para "They offer rare <Pokemon> that can be exchanged for your coins."
	para "But, I just can't seem to win!"
	done

_GameCornerGamblerText::
	text "Games are scary! It's so easy to get hooked!"
	done

_GameCornerClerk2WantSomeCoinsText::
	text "What's up? Want some coins?"
	prompt

_GameCornerGentlemanReceived20CoinsText::
_GameCornerClerk2Received20CoinsText::
	text "<PLAYER> received 20 coins!@"
	text_end

_GameCornerClerk2YouHaveLotsOfCoinsText::
	text "You have lots of coins!"
	done

_GameCornerClerk2INeedMoreCoinsText::
	text "Darn! I need more coins for the <Pokemon> I want!"
	done

_GameCornerGentlemanThrowingMeOffText::
	text "Hey, what? You're throwing me off! Here are some coins, shoo!"
	prompt

_GameCornerGentlemanYouGotYourOwnCoinsText::
	text "You've got your own coins!"
	done

_GameCornerGentlemanCloselyWatchTheReelsText::
	text "The trick is to watch the reels closely!"
	done

_GameCornerRocketImGuardingThisPosterText::
	text "I'm guarding this poster! Go away, or else!"
	done

_Route21Fisher1EndBattleText::
_GameCornerRocketBattleEndText::
	text "Dang!"
	prompt

_GameCornerRocketAfterBattleText::
	text "Our hideout might be discovered! I better tell Boss!"
	done

_GameCornerPosterSwitchBehindPosterText::
	text "Hey!"
	para "A switch behind the poster!? Let's push it!@"
	text_end

_GameCornerOopsForgotCoinCaseText::
	text "Oops! Forgot the Coin Case!"
	done
