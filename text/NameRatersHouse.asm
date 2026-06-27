_NameRatersHouseNameRaterWantMeToRateText::
	text "Hello, hello! I am the official Name Rater!"
	para "Want me to rate the nicknames of your <Pokemon>?"
	done

_NameRatersHouseNameRaterWhichPokemonText::
	text "Which <Pokemon> should I look at?"
	prompt

_NameRatersHouseNameRaterGiveItANiceNameText::
	text_ram_namebuffer
	text ", is it? That is a decent nickname!"
	para "But, would you like me to give it a nicer name?"
	para "How about it?"
	done

_NameRatersHouseNameRaterWhatShouldWeNameItText::
	text "Fine! What should we name it?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "OK! This <Pokemon> has been renamed @"
	text_ram wBuffer
	text "!"
	para "That's a better name than before!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "Fine! Come any time you like!"
	done

;_NameRatersHouseNameRaterATrulyImpeccableNameText::
;	text_ram_namebuffer
;	text ", is it?"
;	line "That is a truly"
;	cont "impeccable name!"

;	para "Take good care of"
;	line "@"
;	text_ram_namebuffer
;	text "!"
;	done
