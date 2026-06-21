SaffronGym_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SaffronGymTrainerHeaders
	ld de, SaffronGym_ScriptPointers
	ld a, [wSaffronGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSaffronGymCurScript], a
	ret

SaffronGym_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SAFFRONGYM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SAFFRONGYM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SAFFRONGYM_END_BATTLE
	dw_const SaffronGymSabrinaPostBattle,           SCRIPT_SAFFRONGYM_SABRINA_POST_BATTLE

SaffronGymResetScripts:
	call ResetMapScripts
	ld [wSaffronGymCurScript], a ; SCRIPT_SAFFRONGYM_DEFAULT
	ret

SaffronGymSabrinaPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jr z, SaffronGymResetScripts
	call DisableDpad

SaffronGymSabrinaReceiveTM46Script:
	ld d, SAFFRONGYM_SABRINA
	callfar MakeSpriteFacePlayer
	ld a, TEXT_SAFFRONGYM_SABRINA_MARSH_BADGE_INFO
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_SABRINA
	lb bc, TM_SABRINA, 1
	call GiveItem
	jr nc, .BagFull
	ld a, TEXT_SAFFRONGYM_SABRINA_RECEIVED_TM46
	ldh [hTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM46
	jr .gymVictory
.BagFull
	ld a, TEXT_SAFFRONGYM_SABRINA_TM46_NO_ROOM
	ldh [hTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_PSYCHICBADGE, [hl]
	call BadgeMonCry ; Sunsette: lead mon cries when the badge is earned

	; deactivate gym trainers
	SetEventRange EVENT_BEAT_SAFFRON_GYM_TRAINER_0, EVENT_BEAT_SAFFRON_GYM_TRAINER_6

	ld a, SAFFRONGYM_SABRINA
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	jr SaffronGymResetScripts

SaffronGym_TextPointers:
	def_text_pointers
	dw_const SaffronGymSabrinaText,               TEXT_SAFFRONGYM_SABRINA
	dw_const SaffronGymChanneler1Text,            TEXT_SAFFRONGYM_CHANNELER1
	dw_const SaffronGymYoungster1Text,            TEXT_SAFFRONGYM_YOUNGSTER1
	dw_const SaffronGymChanneler2Text,            TEXT_SAFFRONGYM_CHANNELER2
	dw_const SaffronGymYoungster2Text,            TEXT_SAFFRONGYM_YOUNGSTER2
	dw_const SaffronGymChanneler3Text,            TEXT_SAFFRONGYM_CHANNELER3
	dw_const SaffronGymYoungster3Text,            TEXT_SAFFRONGYM_YOUNGSTER3
	dw_const SaffronGymYoungster4Text,            TEXT_SAFFRONGYM_YOUNGSTER4
	dw_const SaffronGymGymGuideText,              TEXT_SAFFRONGYM_GYM_GUIDE
	dw_const SaffronGymSabrinaMarshBadgeInfoText, TEXT_SAFFRONGYM_SABRINA_MARSH_BADGE_INFO
	dw_const SaffronGymSabrinaReceivedTM46Text,   TEXT_SAFFRONGYM_SABRINA_RECEIVED_TM46
	dw_const SaffronGymSabrinaTM46NoRoomText,     TEXT_SAFFRONGYM_SABRINA_TM46_NO_ROOM

SaffronGymTrainerHeaders:
	def_trainers 2
SaffronGymTrainerHeader0:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_0, 3, SaffronGymChanneler1BattleText, SaffronGymChanneler1EndBattleText, SaffronGymChanneler1AfterBattleText
SaffronGymTrainerHeader1:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_1, 3, SaffronGymYoungster1BattleText, SaffronGymYoungster1EndBattleText, SaffronGymYoungster1AfterBattleText
SaffronGymTrainerHeader2:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_2, 3, SaffronGymChanneler2BattleText, SaffronGymChanneler2EndBattleText, SaffronGymChanneler2AfterBattleText
SaffronGymTrainerHeader3:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_3, 3, SaffronGymYoungster2BattleText, SaffronGymYoungster2EndBattleText, SaffronGymYoungster2AfterBattleText
SaffronGymTrainerHeader4:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_4, 3, SaffronGymChanneler3BattleText, SaffronGymChanneler3EndBattleText, SaffronGymChanneler3AfterBattleText
SaffronGymTrainerHeader5:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_5, 3, SaffronGymYoungster3BattleText, SaffronGymYoungster3EndBattleText, SaffronGymYoungster3AfterBattleText
SaffronGymTrainerHeader6:
	trainer EVENT_BEAT_SAFFRON_GYM_TRAINER_6, 3, SaffronGymYoungster4BattleText, SaffronGymYoungster4EndBattleText, SaffronGymYoungster4AfterBattleText
	db -1 ; end

SaffronGymSabrinaText:
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM46
	jr nz, .afterBeat
	call z, SaffronGymSabrinaReceiveTM46Script
	call DisableWaitingAfterTextDisplay
	jr .done
.afterBeat
	ld hl, .StopBotheringText
	rst _PrintText
	call YesNoChoice
	jr nz, .keepBothering ; NZ = NO -> won't stop -> teleport to the gym entrance
	ld hl, .ThankYouText
	rst _PrintText
	jr .done
.keepBothering
	xor a ; warp 0 = the bottom entrance door
	ld [wDestinationWarpID], a
	ld a, SAFFRON_GYM
	ldh [hWarpDestinationMap], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl]
	jr .done
.beforeBeat
	ld hl, .Text
	rst _PrintText
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld hl, .ReceivedMarshBadgeText
	ld de, .ReceivedMarshBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $6
	ld [wGymLeaderNo], a
	call ApplyGymLeaderBadgeTier ; Sunsette: badge count picks the leader's party tier
	ld a, SCRIPT_SAFFRONGYM_SABRINA_POST_BATTLE
	ld [wSaffronGymCurScript], a
.done
	rst TextScriptEnd

.Text:
	text_far _SaffronGymSabrinaText
	text_end

.ReceivedMarshBadgeText:
	text_far _SaffronGymSabrinaReceivedMarshBadgeText
	sound_get_key_item ; actually plays the second channel of SFX_BALL_POOF due to the wrong music bank being loaded
	text_promptbutton
	text_end

.StopBotheringText:
	text_far _SaffronGymSabrinaStopBotheringText
	text_end

.ThankYouText:
	text_far _SaffronGymSabrinaThankYouText
	text_end

SaffronGymSabrinaMarshBadgeInfoText:
	text_far _SaffronGymSabrinaMarshBadgeInfoText
	text_end

SaffronGymSabrinaReceivedTM46Text:
	text_far _SaffronGymSabrinaReceivedTM46Text
	sound_get_item_1
	text_far _TM46ExplanationText
	text_end

SaffronGymSabrinaTM46NoRoomText:
	text_far _SaffronGymSabrinaTM46NoRoomText
	text_end

SaffronGymChanneler1Text:
	script_trainer SaffronGymTrainerHeader0

SaffronGymYoungster1Text:
	script_trainer SaffronGymTrainerHeader1

SaffronGymChanneler2Text:
	script_trainer SaffronGymTrainerHeader2

SaffronGymYoungster2Text:
	script_trainer SaffronGymTrainerHeader3

SaffronGymChanneler3Text:
	script_trainer SaffronGymTrainerHeader4

SaffronGymYoungster3Text:
	script_trainer SaffronGymTrainerHeader5

SaffronGymYoungster4Text:
	script_trainer SaffronGymTrainerHeader6

SaffronGymGymGuideText: ; Sunsette: post-badge, the gym guide sells a spare copy of SABRINA's TM at the normal MART price
	text_asm
	CheckEvent EVENT_BEAT_SABRINA
	jr nz, .afterBeat
	ld hl, SaffronGymGuideChampInMakingText
	rst _PrintText
	rst TextScriptEnd
.afterBeat
	ld hl, SaffronGymGuideBeatSabrinaText
	rst _PrintText
	ld hl, wObtainedBadges ; Sunsette: badge-count-gated extra TMs (3 badges, then 6)
	ld b, 1
	call CountSetBits
	ld a, [wNumSetBits]
	cp 6
	ld hl, SaffronGymGuideTMShop6
	jr nc, .tmShopReady
	cp 3
	ld hl, SaffronGymGuideTMShop3
	jr nc, .tmShopReady
	ld hl, SaffronGymGuideTMShop1
.tmShopReady
	call DisplayPokemartNoGreeting
	rst TextScriptEnd

INCLUDE "data/items/marts/saffron_gym_guide.asm"

SaffronGymGuideChampInMakingText:
	text_far _GymGuideChampInMakingText
	text_far _SaffronGymGuideChampInMakingText
	text_end

SaffronGymGuideBeatSabrinaText:
	text_far _SaffronGymGuideBeatSabrinaText
	text_end

SaffronGymChanneler1BattleText:
	text_far _SaffronGymChanneler1BattleText
	text_end

SaffronGymChanneler1EndBattleText:
	text_far _SaffronGymChanneler1EndBattleText
	text_end

SaffronGymChanneler1AfterBattleText:
	text_far _SaffronGymChanneler1AfterBattleText
	text_end

SaffronGymYoungster1BattleText:
	text_far _SaffronGymYoungster1BattleText
	text_end

SaffronGymYoungster1EndBattleText:
	text_far _SaffronGymYoungster1EndBattleText
	text_end

; Sunsette: PSYCHIC is always weak to BUG+GHOST now, so this is always the bug-and-ghost line
SaffronGymYoungster1AfterBattleText:
	text_far _SaffronGymYoungster1AfterBattleText
	text_promptbutton
	text_far _SaffronGymYoungster1AfterBattleText3
	text_end

SaffronGymChanneler2BattleText:
	text_far _SaffronGymChanneler2BattleText
	text_end

SaffronGymChanneler2EndBattleText:
	text_far _SaffronGymChanneler2EndBattleText
	text_end

SaffronGymChanneler2AfterBattleText:
	text_far _SaffronGymChanneler2AfterBattleText
	text_end

SaffronGymYoungster2BattleText:
	text_far _SaffronGymYoungster2BattleText
	text_end

SaffronGymYoungster2EndBattleText:
	text_far _SaffronGymYoungster2EndBattleText
	text_end

SaffronGymYoungster2AfterBattleText:
	text_far _SaffronGymYoungster2AfterBattleText
	text_end

SaffronGymChanneler3BattleText:
	text_far _SaffronGymChanneler3BattleText
	text_end

SaffronGymChanneler3EndBattleText:
	text_far _SaffronGymChanneler3EndBattleText
	text_end

SaffronGymChanneler3AfterBattleText:
	text_far _SaffronGymChanneler3AfterBattleText
	text_end

SaffronGymYoungster3BattleText:
	text_far _SaffronGymYoungster3BattleText
	text_end

SaffronGymYoungster3EndBattleText:
	text_far _SaffronGymYoungster3EndBattleText
	text_end

SaffronGymYoungster3AfterBattleText:
	text_far _SaffronGymYoungster3AfterBattleText
	text_end

SaffronGymYoungster4BattleText:
	text_far _SaffronGymYoungster4BattleText
	text_end

SaffronGymYoungster4EndBattleText:
	text_far _SaffronGymYoungster4EndBattleText
	text_end

SaffronGymYoungster4AfterBattleText:
	text_far _SaffronGymYoungster4AfterBattleText
	text_end
