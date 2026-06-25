; Movedex move-description text, overflow half. "Movedex Text" (movedex_text.asm) fills its bank, so new
; entries live here in the "Movedex Text 2" floating section. Entries are reached via text_far from
; movedex_entries.asm, so the bank split is transparent; text_jump targets (e.g. _GenericAbsorbMoveText)
; are bank-aware too.
;
; Sunsette: this file was previously an orphaned copy of the tail entries (_Sharpen.._Struggle), all of
; which already live in movedex_text.asm; that dead copy was never INCLUDEd. Repurposed as the live overflow.

_GigaDrainDexEntry::
	text "Drains a large"
	next "amount of HP"
	next "from the foe.@"

	text_jump _GenericAbsorbMoveText

; Sunsette: SAPPING COLD - ICE drain that goes last and freezes if uninterrupted.
_SappingColdDexEntry::
	text "Saps warmth to"
	next "heal half the"
	next "damage dealt."

	bage "It strikes LAST;"
	next "if nothing hit"
	next "you that turn,"

	bage "the foe FREEZES."
	dex

; Sunsette: FINISHER (ex-PIVOT STRIKE). A Focus-Punch-like COMBO MOVE.
_FinisherDexEntry::
	text "The user winds up"
	next "and always strikes"
	next "LAST."

	bage "If untouched, it"
	next "unleashes a huge"
	next "150-power blow!"

	bage "If hit first, the"
	next "finish is clipped"
	next "to 50 power."

	bage "Can't be used two"
	next "turns in a row."
	dex

; Sunsette: SHADOW BOX (uses the old COUNTER dex slot). A brace-counter: you read the foe's intended attack.
_ShadowBoxDexEntry::
	text "Brace, then read"
	next "the foe's attack."

	bage "Special move: you"
	next "take half, hit"
	next "hard, confuse it."

	bage "Else: a modest"
	next "hit, and you"
	next "confuse yourself."

	bage "'Special' is by"
	next "TYPE; FIGHTING"
	next "types get STAB."

	bage "Usable once every"
	next "two turns."
	dex

; Sunsette: PLASMA BURN - ELECTRIC "Scald": a hot current that often burns.
_PlasmaBurnDexEntry::
	text "A searing jolt of"
	next "plasma that may"
	next "leave a BURN."
	dex

; Sunsette: BULLDOZE - GROUND ground-shaker that lowers SPEED.
_BulldozeDexEntry::
	text "The user stomps"
	next "the ground to hit"
	next "and may lower the"
	next "foe's SPEED."
	dex

; Sunsette: POISON FANG - a venomous bite that may badly-poison (toxic).
_PoisonFangDexEntry::
	text "Bites with toxic"
	next "fangs."

	bage "May leave the foe"
	next "BADLY POISONED."
	dex

; Sunsette: BUG OFF - disrupt the foe, then bail (Butterfree/Venomoth).
_BugOffDexEntry::
	text "Disorients the"
	next "foe, then the"
	next "user slips away."

	bage "Confuses the foe"
	next "and cuts its"
	next "SPECIAL, then"
	next "switches out."
	dex

; Sunsette: MUDSLIDE - GROUND spread, an Earthquake alternative that can bog the foe down.
_MudslideDexEntry::
	text "A wave of mud"
	next "buries the foe."

	bage "It often drops"
	next "the foe's SPEED."
	dex

; Sunsette: FLUTTER KICK - FLYING clone of BONEMERANG (twice-hit, 30% -SPEED).
_FlutterKickDexEntry::
	text "Two midair kicks"
	next "strike in a blur."

	bage "It may slow the"
	next "foe down."
	dex

; Sunsette: ENERGY FLUX - capacitor charge; discharges on a SPECIAL hit.
_EnergyFluxDexEntry::
	text "The user charges"
	next "up: it FLOATS and"
	next "its SPECIAL rises"
	next "sharply."

	bage "The charge bursts"
	next "the next time it"
	next "lands a SPECIAL"
	next "attack, resetting"

	bage "its types and"
	next "stat changes."
	dex

; Sunsette: PSYCHOCRISIS - PSYCHIC "INDIGNATION" / last-stand nuke. Resets the user + heavy recoil every turn.
_PsychocrisisDexEntry::
	text "A psychic break"
	next "that resets the"
	next "<user>'s stats."

	bage "Heavy recoil each"
	next "turn. Lasts 2-3,"
	next "then confuses."
	dex

; Sunsette: ROCK SMASH - 40-BP FIGHTING, chance to drop the target's DEFENSE.
_RockSmashDexEntry::
	text "A FIGHTING blow"
	next "that may lower"
	next "the target's DEF."
	dex

; Sunsette: SUPERPOWER - 120-BP FIGHTING; cuts the user's own ATTACK + DEFENSE on hit.
_SuperpowerDexEntry::
	text "A massive blow."

	bage "Cuts the <user>'s"
	next "own ATTACK and"
	next "DEFENSE after."
	dex

; Sunsette: SUBMISSION - FIGHTING clone of DOUBLE-EDGE (recoil).
_SubmissionMoveDexEntry::
	text "A reckless tackle"
	next "that also hurts"
	next "the <user>."
	dex

; Sunsette: SLAM - plain NORMAL 80-BP move.
_SlamDexEntry::
	text "Throws the whole"
	next "body into a heavy"
	next "slam."
	dex

; Sunsette: PSYSHOCK - special-category PSYCHIC move that hits the target's physical DEFENSE.
_PsyshockDexEntry::
	text "A telekinetic"
	next "blow that uses"
	next "the attacker's"

	bage "SPECIAL but"
	next "hits the foe"
	next "physically."
	dex
