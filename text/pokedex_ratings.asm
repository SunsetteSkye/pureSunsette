_DexCompletionText::
	text "<poke>dex completion is:"

	para "@"
	text_decimal hDexRatingNumMonsSeen, 1, 3
	text " <Pokemon> seen"
	line "@"
	text_decimal hDexRatingNumMonsOwned, 1, 3
	text " <Pokemon> owned"

	para "Prof. Oak's Rating:"
	prompt

_DexRatingText_Own0To9::
	text "You still have lots to do. Look for <Pokemon> in grassy areas!"
	done

_DexRatingText_Own10To19::
	text "You're on the right track! Get a Flash HM from my Aide!"
	done

_DexRatingText_Own20To29::
	text "You still need more <Pokemon>! Try to catch other species!"
	done

_DexRatingText_Own30To39::
	text "Good, you're trying hard! Get an Itemfinder from my Aide!"
	done

_DexRatingText_Own40To49::
	text "Very good! Go fish for some marine <Pokemon>!"
	done

_DexRatingText_Own50To59::
	text "Ho! This is getting even better!"
	done

_DexRatingText_Own60To69::
	text "Wonderful! Do you like to collect things?"
	done

_DexRatingText_Own70To79::
	text "Looking good! Go find my Aide when you get 80!"
	done

_DexRatingText_Own80To89::
	text "You finally got at least 80 species! Be sure to get a Booster Chip from my Aide!"
	done

_DexRatingText_Own90To99::
	text "I'm impressed! It must have been difficult to do!"
	done

_DexRatingText_Own100To109::
	text "I can't believe how good you are!"
	para "You finally got at least 100 species!"
	done

_DexRatingText_Own110To119::
	text "You even have the evolved forms of <Pokemon>! Super!"
	done

_DexRatingText_Own120To129::
	text "Excellent! Trade with friends to get some more!"
	done

_DexRatingText_Own130To139::
	text "Outstanding! You've become a real pro at this!"
	done

_DexRatingText_Own140To149::
	text "I have nothing left to say! You're the authority now!"
	done

_DexRatingText_Own150To151::
	text "Congratulations!"
	para "Your <poke>dex is entirely complete!"
	done
