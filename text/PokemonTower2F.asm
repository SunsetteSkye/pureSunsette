_PokemonTower2FRivalWhatBringsYouHereText::
	text "<RIVAL>: Hey, <PLAYER>! What brings you here? Your <Pokemon> don't look dead!"
	para "I can at least make them faint! Let's go, pal!"
	done

_PokemonTower2FRivalDefeatedText::
	text "What? You stinker!"
	para "I took it easy on you too!"
	prompt

_PokemonTower2FRivalVictoryText::
	text "Well, look at all your wimpy <Pokemon>!"
	para "Toughen them up a bit more!"
	prompt

_PokemonTower2FRivalHowsYourDexText::
	text "How's your <poke>dex coming, pal? I just caught a Cubone!"
	para "I can't find the grown-up Marowak yet!"
	para "I doubt there are any left! Well, I better get going! I've got a lot to accomplish, pal!"
	para "Smell ya later!"
	done

_PokemonTower2FChannelerText::
	text "Even we could not identify the wayward ghosts!"
	para "A @"
	text_ram_namebuffer
	text_start
	line "might be able to unmask them."
	done

_PokemonTower2FChannelerText2::
	text "Thanks for getting rid of <TEAM><ROCKET> in our tower!"
	done

_PokemonTower2FChannelerText3::
	text "Thanks for all your help!"
	done

_PokemonTower2FChannelerTextBorrowSilphScope::
	text "Before you go, maybe you could lend me that @"
	text_ram_namebuffer
	text "?"
	para "It'd help us with the wayward spirits!"
	para "I'll give it back whenever you visit here!"
	para "How about it?"
	done

_PokemonTower2FChannelerTextBorrowSilphScopeYes::
	text "Perfect!"
	para "<PLAYER> handed the channeler the @"
	text_ram_namebuffer
	text "."
	done

_PokemonTower2FChannelerTextBack::
	text "Do you want your @"
	text_ram_namebuffer
	text " back?"
	done

_PlayerGotBackItem::
	text "<PARA><PLAYER> got back the @"
	text_ram_namebuffer
	text "!"
	done

_PokemonTower2FChannelerTextBorrowAgain::
	text "By the way<...>"
	para "May I borrow your @"
	text_ram_namebuffer
	text " again?"
	done

_GenericWaitText::
	text "Wait!"
	done

_OhHelloAgainText::
	text "Oh, hello again!"
	done
