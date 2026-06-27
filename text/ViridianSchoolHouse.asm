; status-mechanic tutorial blackboard text is in data/text/text_2.asm.

_ViridianSchoolHouseBrunetteGirlText::
	text "Whew! I'm trying to memorize all my notes."
	done

_ViridianSchoolHouseCooltrainerFText::
	text "Okay!"
	para "Be sure to read the blackboard carefully!"
	done

_SchoolText3::
	text "Whew! Detention feels like it never ends!"
	done

_SchoolText4::
	text "Detention Room"
	done

; basement

_SchoolB1FGuyNearStairs::
	text "Why do we have our classrooms in the basement?"
	para "Well, we love Ground-type <Pokemon> here in Viridian City!"
	para "So it's only natural we study below ground!"
	done

_SchoolB1FCornerGameboyKid::
	text "Shh! Don't tell anyone that I'm hiding here."
	para "I already memorized the whole textbook. It's kinda bogus that criticals ignore all stat boosts..."
	para "Anyway! Gotta beat this game."
	para "For the Frog the Bell Tolls"
	para "I'm totally hooked!"
	done


_SchoolB1FLittleGirlProdigy::
	text "I skipped 3 grades!"
	para "Mom says I'm going places!"
	para "Did you know?"
	para "A move that is the same type as the <Pokemon> using it gets bonus damage!"
	para "I find that so fascinating!"
	done


_SchoolB1FNerd::
	text "Ahh! Don't distract me!"
	para "I won't let this tiny girl insult my superior intellect!"
	para "Here's a smidgen of knowledge from the vast database that is my brain:"
	para "Psychic-type <Pokemon> are near unstoppable due to having zero weaknesses!"
	prompt

_SchoolB1FLittleGirlRetort2::
	text "Actually, they're weak to Bug and Ghost. Grass and Normal resist them, too!"
	prompt

_SchoolB1FNerdSilence::
	text "Silence!!"
	prompt

_SchoolB1FLittleGirlBro::
	text "Don't forget to eat the greens mom gave you at lunch, big bro!"
	prompt

_SchoolB1FNerdAck::
	text "Ack!!"
	done

_SchoolB1FRocker::
	text "Gus: Bah. School is for losers."
	para "Cool people learn about <Pokemon> by battling theirs!"
	para "Am I right?"
	done

_SchoolB1FRockerYes::
	text "Winners like us think the same!"
	para "You're firin' me up, dude!@"
	text_jump _SchoolB1FRockerBattleNow

_SchoolB1FRockerNo::
	text "Now I'm angry!"
	para "Dweebs like you need to be taken down a peg!"
	; fall through
_SchoolB1FRockerBattleNow::
	para "Let's battle right here, right now!!"
	done

_SchoolB1FDetentionText::
	text "PA: Gus G, please report to the Detention Room for battling during class."
	para "Gus: Yikes!"
	done

_SchoolB1FStudentTeacher::
	text "I'm a teacher-in-training."
	para "I'm helping out this class!"
	para "Did you know?"
	para "There's a move that has elements of three types: Fire, Ice, and Electric!"
	para "It's called Tri Attack!"
	done

_SchoolB1FBrunetteGirl::
	text "Jen: Psst!"
	para "What's the answer to number 3?"
	done

_SchoolB1FDetention2Text::
	text "PA: Jen J, please report to detention for trying to cheat on your quiz."
	prompt

_SchoolB1FNotAgainText::
	text "Jen: Not again!"
	done

_SchoolB1FTutorText::
	text "You guys have to learn about all 15 <Pokemon> types!"
	para "Not just half of them!"
	para "You asked me to tutor you after all!"
	done

_SchoolB1FLeftTuteeText::
	text "Moves that do physical damage are my favorite!"
	para "That means they use the Attack and Defense stats to determine their damage."
	para "It all depends on the move's type!"
	para "I wrote down the physical types in my notebook."
	done

_SchoolB1FRightTuteeText::
	text "Flashy special moves are my favorite!"
	para "That means they use the Special stat to determine their damage."
	para "It all depends on the move's type!"
	para "My tutor wrote the special types in her notebook."
	done

_SchoolB1FLeftTuteeNotebook::
	text "Physical move types list:"
	para "Normal, Fighting, Bug, Rock, Ground, Poison, Flying"
	done

_SchoolB1FTutorNotebook::
	text "Special move types list:"
	para "Fire, Water, Ice, Grass, Electric, Psychic, Dragon"
	done

_SchoolB1FBottomLeftNotebook::
	text "In battle, some moves always go first!"
	para "Quick Attack, Mach Punch, and Swift are some examples."
	done

_SchoolB1FRightBlackboard::
	text "Fire beats Grass"
	para "Grass beats Water"
	para "Water beats Fire!"
	para "Just like rock-paper-scissors!"
	done

_SchoolB1FBottomRightNotebook::
	text "Wow!"
	para "Ghost-type <Pokemon> are immune to"
	para "Normal, Fighting, and Poison-type moves!"
	done


_SchoolB1FNerdTextbook::
	text "Notes on each <Pokemon> stat."
	prompt

_SchoolB1FNerdNotebookRepeat::
	text "Read about which stat?"
	done

_SchoolB1FNerdNotebookHP::
	text "Decides how much HP (Hit Points) a <Pokemon> has."
	para "The more it has, the harder it is to faint."
	prompt

_SchoolB1FNerdNotebookAttack::
	text "Decides how much damage a <Pokemon>'s physical attacks do."
	prompt

_SchoolB1FNerdNotebookDefense::
	text "Decides how much damage a <Pokemon> takes when hit by physical attacks."
	prompt

_SchoolB1FNerdNotebookSpeed::
	text "Decides which <Pokemon> will go first in battle."
	para "Whoever has the highest Speed will go first."
	para "It also increases critical chance."
	prompt

_SchoolB1FNerdNotebookSpecial::
	text "Decides how much damage a <Pokemon>'s special attacks do, as well as how much damage it will take from special attacks."
	prompt

_SchoolB1FRightTeacher::
	text "Knowing which types are good against which takes a lot of memorization!"
	para "But if you're on a big <Pokemon> adventure, you'll learn quick!"
	para "Have fun!"
	done

_SchoolB1FRockerNotebook::
	text "It's a bunch of detailed doodles."
	para "A goofy version of the teacher is being attacked by a flock of angry Spearow."
	done

_SchoolB1FBrunetteGirlNotebook::
	text "Cutest <Pokemon>: Diglett"
	para "Cutest guy: He sits behind me!"
	done

_SchoolB1FBottomCenterNotebook::
	text "Some moves cause confusion."
	para "When a <Pokemon> is confused, it can hurt itself by accident when attacking."
	para "This confusion lasts 2-5 turns."
	para "It goes away by switching <Pokemon> or finishing the battle."
	para "Psychic types stay too clear-headed to be confused!"
	para "Some moves make a <Pokemon> flinch and lose its turn, but Dragons are never rattled!"
	done

_SchoolB1FLeftClassroomSign::
	text "Class 2A - <Pokemon> Moves"
	done

_SchoolB1FRightClassroomSign::
	text "Class 1A - <Pokemon> Basics"
	done

_SchoolB1FRightPoster::
	text "It's a beautiful landscape artwork of Viridian City."
	para "It says in big letters:"
	para "The Wonderful World of <Pokemon>"
	para "-It starts with learning!-"
	done

_SchoolB1FLeftPoster::
	text "A chart of all 15 <Pokemon> types as colorful circular icons."
	para "Behind it is a sunset photo of Indigo Plateau."
	done

_SchoolB1FLeftBlackboard::
	text "Today's Homework:"
	para "Write a poem about 10 <Pokemon> moves you love!"
	para "Example:"
	para "Water Gun is fun, Squirtle is the one, a nice shower waters my flowers!"
	done
