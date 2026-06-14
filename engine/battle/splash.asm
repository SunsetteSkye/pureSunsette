; Sunsette: In its own ROMX section so the 12 messages can't overflow a shared bank. SPLASH is otherwise a
; user-weight FLYING attack (SplashWeightModifier sets its power - the heavier the user, the harder the
; splash). For MAGIKARP the modifier forces 0 power (no damage) and this handler plays the flop animation,
; then prints one of 12 random "still does nothing" lines. Reached via SplashEffect's jpfar trampoline
; in the full Battle Core. For any non-MAGIKARP user it just returns - the ; weight hit already landed and
; its animation played in the main damage flow.

SECTION "Sunsette Splash", ROMX

SplashEffect_::
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonSpecies] ; user's turn -> user = player
	jr z, .gotUser
	ld a, [wEnemyMonSpecies]
.gotUser
	cp MAGIKARP
	ret nz ; non-MAGIKARP: weight damage already applied; nothing more to do
	callfar PlayCurrentMoveAnimation2 ; the flop (0-BP for MAGIKARP, so the main flow never played it)
.roll
	callfar FarBattleRandom ; d = random byte (survives the bankswitch)
	ld a, d
	and $0F
	cp 12
	jr nc, .roll ; reject 12-15 -> uniform 0-11
	add a ; *2 for the word table
	ld e, a
	ld d, 0
	ld hl, SplashMagikarpMessages
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	rst _PrintText ; messages live in this same bank, so a direct print works
	ret

SplashMagikarpMessages:
	dw .m0
	dw .m1
	dw .m2
	dw .m3
	dw .m4
	dw .m5
	dw .m6
	dw .m7
	dw .m8
	dw .m9
	dw .m10
	dw .m11

.m0
	text "But nothing"
	line "happened!"
	done
.m1
	text "...as expected."
	done
.m2
	text "Not even a"
	line "ripple."
	done
.m3
	text "A bold display"
	line "of nothing!"
	done
.m4
	text "MAGIKARP looks"
	line "very proud."
	done
.m5
	text "It splashed."
	line "That's all."
	done
.m6
	text "Still useless,"
	line "somehow!"
	done
.m7
	text "Truly a wasted"
	line "turn."
	done
.m8
	text "10 out of 10"
	line "splashing!"
	done
.m9
	text "The foe is"
	line "unimpressed."
	done
.m10
	text "Maybe in a"
	line "million years."
	done
.m11
	text "Magnificent,"
	line "yet pointless!"
	done
