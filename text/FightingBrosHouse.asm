_FightingBrosRocketText::
	text "Ow<...>"
	para "They roughed me up for trying to block their door."
	para "Now I'm cleaning up the mess<...>"
	prompt

_FightingBrosRocketText2::
	text "Bro: We'll sort this <ROCKET> out!"
	para "He needs courtesy, integrity, perseverance, self-control,"
	para "and indomitable spirit!"
	para "Those are the five tenets of the Fighting Dojo!"
	para "You're going there tomorrow for some tough guidance!"
	para "Understand, trainee?"
	prompt

_FightingBrosRocketText3::
	text "<ROCKET>: Yipes! Y-yes sir!"
	done

_FightingBrosWelcomeText::
	text "We're the Fighting Bros.!"
	para "Members of the Fighting Dojo."
	prompt

_FightingBrosSabrinaText::
	text "Sabrina defeated the Dojo<...>"
	para "she made us lose <PK><MN> Gym status!"
	para "We're looking for someone to beat her as revenge!"
	para "Get into Saffron Gym and show her who's boss for us!"
	para "If you do, we'll treat you as a brother!"
	done

_FightingBrosGotMarshBadge::
	text "The cruel pink of the Soul Badge is unmissable!"
	para "So you beat Sabrina, brother!"
	para "The Fighting Bros. will reward you any way we can!"
	prompt

_FightingBrosRightBro::
	text "As the older Fighting Bro,"
	para "I'm the calm, collected one."
	para "I use reason before violence, meditating daily."
	para "Do you know the move Shoryuken?"
	para "A rising dragon uppercut!"
	para "You may think Alakazam cannot learn it."
	para "Actually<...> it can!"
	para "It's a genius you know!"
	para "But it refuses to!"
	para "It sees the move as barbaric."
	para "I can convince your Alakazam to learn it"
	para "through pure logic!"
	para "But it isn't easy."
	para "So I'll only do it once!"
	para "How about it?"
	done

_FightingBrosRightBroShort::
	text "So, how about it?"
	para "Shall I teach your Alakazam Shoryuken?"
	para "Remember, I'll only do it once!"
	done

_FightingBrosRightBroWhich::
	text "Then it's decided."
	done

_FightingBrosRightBroConvene::
	text "Perfect. @"
	text_ram_namebuffer
	text "!"
	para "Give me some time to speak with @"
	text_ram_stringbuffer
	text "<CONT>to convince it!"
	prompt

_FightingBrosRightBroConvene2::
	text "It took a while,"
	para "but @"
	text_ram_stringbuffer
	text "<LINE>trusts your judgement!"
	para "It'll allow it. Here we go!"
	prompt

_FightingBrosRightBroEnd::
	text "You might have the only Alakazam in the whole world with that move!"
	para "Isn't that cool to think of?"
	done

_FightingBrosRightBroAfter::
	text "Alakazam!"
	para "Go forth and punch the heavens!"
	done

_FightingBrosLeftBro::
	text "As the younger Fighting Bro,"
	para "I'm the go-getter and mood-maker!"
	para "I love learning and teaching many techniques!"
.showMe
	para "Show me a <Pokemon> and I'll tell you the moves I can teach it!"
	prompt

_FightingBrosLeftBroShort::
	text "Hey, brother!@"
	text_jump _FightingBrosLeftBro.showMe

_FightingBrosLeftBroAfterTeachText::
	text "Good choice! That move rules!"
	done

_MoveTutorChooseMoveToLearnText::
	text "@"
	text_ram_namebuffer
	text "?"
	para "I can teach it these moves."
	prompt

_MoveTutorCantTeach::
	text "@"
	text_ram_namebuffer
	text "? Ah, sorry!"
	para "It can't learn any of my moves!"
	prompt

_MoveTutorLearnMoveCost::
	text "Learning a move costs ¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "."
	prompt

_MoveTutorFreebie::
	text "This time only it'll be free!"
	prompt

_MoveTutorNotEnoughCash::
	text "Whoops! You don't have enough cash!"
	done

_FightingBrosHouseCatalogueText::
	text "Fighting Bros. sensei services!"
	para "Choose any move from our catalog!"
	prompt

_FightingBrosHouseCatalogue2Text::
	text "Join the Fighting Bros. family!"
	para "NEVER GIVE UP!"
	done

_FightingBrosRocketText4::
	text "I'm a humble white belt at the Fighting Dojo!"
	para "I'm just starting out now,"
	para "but it beats a life of crime as a <ROCKET>!"
	para "Fighting Bros. NEVER GIVE UP!"
	done

; Sunsette: _ViridianForestPikaGirlHMExplanationText moved to text/sunsette_overworld_text.asm (trimmed,
; now behind a repeatable yes/no "explain an HM" offer).
