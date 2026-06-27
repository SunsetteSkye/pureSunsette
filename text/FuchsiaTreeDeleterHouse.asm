_FuchsiaTreeDeleterText1::
	text "Huh? <...>Oh, yes<...>"
	para "I'm the @"
	text_ram wTrainerName
	text "."
	para "Did you expect someone else?"
	para "I can delete the most annoying trees for you!"
	prompt

_FuchsiaTreeDeleterText2::
	text "Where should I delete a tree?@"
	text_end

_FuchsiaTreeDeleterRoute2::
	text "I can carve a path from Viridian City to Pewter City."
	para "You won't need to cut down any trees to travel between the two, and can avoid Viridian Forest."
	para "It'll cost you ¥8000. Fair?@"
	text_end

_FuchsiaTreeDeleterCerulean::
	text "That tree at the south end of Cerulean City?"
	para "Sure thing. It'll run you ¥4000. Fair?@"
	text_end

_FuchsiaTreeDeleterRoute9::
	text "The tree at the start of the route leading to Rock Tunnel?"
	para "Easy! It'll cost you ¥4000. Fair?@"
	text_end

_FuchsiaTreeDeleterFuchsiaCity::
	text "Clear out every cuttable tree in Fuchsia City?"
	para "That's quite the job! But I like a challenge."
	para "The fee is ¥10000. Fair?"
	done

_FuchsiaTreeDeleterAlreadyDeletedText::
	text "Already been deleted!"
	prompt

_FuchsiaTreeDeleterTreeDelete::
	text "It shall be done!"
	prompt

_FuchsiaTreeDeleterDoneText::
	text "I'm here for all your tree needs!"
	done

_FuchsiaTreeDeleterFinalText::
	text "You cleared out every tree worth clearing out!"
	para "Thanks for the business!@"
	text_end

_FuchsiaTreeDeleterFinalText2::
	text "As you can see I have lots of potted trees."
	para "It's where I keep the trees I take out until someone buys them!"
	para "Snorlax loves to knock them over when it gets hungry!"
	done

_FuchsiaTreeDeleterSnorlax::
	text "Snorlax: Snooore-"
	para "<...>"
	para "<...>"
	para "<...>"
	para "-laaaaaaaaax@"
	text_end

_FuchsiaTreeDeleterSnorlax2::
	text "What a couch potato!"
	done

_FuchsiaTreeDeleterSnorlax3::
	text "@"
	text_ram wTrainerName
	text ": That's my Snorlax."
	para "Its name is Snoozer."
	prompt
