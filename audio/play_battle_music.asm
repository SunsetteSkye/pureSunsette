; PureRGBnote: CHANGED: adjusted to be able to play new songs based on wSpecialBattleMusicID, used in champ arena
; Sunsette: custom special battle themes; ids index SpecialMusicData below (ASSERTed there).
DEF SPECIAL_MUSIC_TEAM_ROCKET EQU 13
DEF SPECIAL_MUSIC_ELITE_FOUR  EQU 14
DEF SPECIAL_MUSIC_MEWTWO      EQU 15
DEF SPECIAL_MUSIC_BIRDS       EQU 16

PlayBattleMusic::
	ResetFlag FLAG_ALTERNATE_BATTLE_WIN_THEME
	callfar BackupAudioWram
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	call StopAllMusic ; shinpokerednote: MOVED: a common function to do what the 3 lines that used to be here did was created
	rst _DelayFrame
	call SelectUpfrontBattleTheme ; Sunsette: E4 (overrides gym music) + wild Mewtwo/birds set a special id here
	ld c, BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	ld b, MUSIC_GYM_LEADER_BATTLE
	jr nz, .playSong
	ld a, [wIsInBattle] ; Sunsette: trainer-vs-wild now from the type flag (2 = trainer), not the packed opponent range
	cp 2
	ld b, MUSIC_WILD_BATTLE
	jr c, .playSong
	ld a, [wCurOpponent]
	cp OPP_RIVAL3
	ld b, MUSIC_FINAL_BATTLE
	jr z, .playSong
	cp OPP_PROF_OAK
	jr z, .playSong ; PureRGBnote: ADDED: professor oak battle uses final battle music
	; Sunsette: Rocket grunts + Rocket queens + boss Giovanni get the Team Rocket battle theme.
	; (Giovanni's Viridian-gym and Pkmn-Tower fights script wGymLeaderNo, so those keep gym-leader
	; music via the check above; only his Rocket Hideout / Silph Co boss fights reach here.)
	cp ROCKET
	jr z, .rocketTheme
	cp ROCKET_QUEEN
	jr z, .rocketTheme
	cp GIOVANNI
	jr z, .rocketTheme
	; normal trainer
	ld b, MUSIC_TRAINER_BATTLE
.playSong
	ld a, [wSpecialBattleMusicID]
	and a
	jr nz, .specialMusic
	ld a, b
	jp PlayMusic
.rocketTheme
	ld a, [wSpecialBattleMusicID] ; Sunsette: yield to an already-chosen special id (e.g. champ arena)
	and a
	jr nz, .specialMusic
	ld a, SPECIAL_MUSIC_TEAM_ROCKET
	ld [wSpecialBattleMusicID], a
	; fall through to .specialMusic with a = SPECIAL_MUSIC_TEAM_ROCKET
.specialMusic
	cp 2 ; seel stage music
	jr nz, .notSeelStage
	SetFlagHL FLAG_ALTERNATE_BATTLE_WIN_THEME
.notSeelStage
	ld hl, SpecialMusicData
	dec a
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld c, a
	call GetAddressFromPointer
	xor a
	ld [wSpecialBattleMusicID], a
	jp PlaySpecialBattleMusic

SpecialMusicData:
	dba Music_DuelTheme1
	dba Music_SeelStage
	dba Music_HereComesGR
	dba Music_CatchEmBlue
	dba Music_Ronald
	dba Music_WhackTheDiglett
	dba Music_DuelTheme2
	dba Music_Fort2
	dba Music_DuelTheme3
	dba Music_GRChallengeCup
	dba Music_GengarInTheGraveyard
	dba Music_TitleScreen
.teamRocketEntry
	dba Music_TeamRocketBattle ; Sunsette: Rocket grunt/queen/Giovanni-boss theme
.eliteFourEntry
	dba Music_EliteFourBattle  ; Sunsette: Lorelei/Bruno/Agatha/Lance
.mewtwoEntry
	dba Music_DragonsDen       ; Sunsette: wild Mewtwo
.birdsEntry
	dba Music_LegendaryBirds   ; Sunsette: wild Articuno/Zapdos/Moltres
	ASSERT (SpecialMusicData.teamRocketEntry - SpecialMusicData) / 3 + 1 == SPECIAL_MUSIC_TEAM_ROCKET, \
		"SPECIAL_MUSIC_TEAM_ROCKET id out of sync with SpecialMusicData order"
	ASSERT (SpecialMusicData.eliteFourEntry - SpecialMusicData) / 3 + 1 == SPECIAL_MUSIC_ELITE_FOUR, \
		"SPECIAL_MUSIC_ELITE_FOUR id out of sync with SpecialMusicData order"
	ASSERT (SpecialMusicData.mewtwoEntry - SpecialMusicData) / 3 + 1 == SPECIAL_MUSIC_MEWTWO, \
		"SPECIAL_MUSIC_MEWTWO id out of sync with SpecialMusicData order"
	ASSERT (SpecialMusicData.birdsEntry - SpecialMusicData) / 3 + 1 == SPECIAL_MUSIC_BIRDS, \
		"SPECIAL_MUSIC_BIRDS id out of sync with SpecialMusicData order"

; Sunsette: pick a custom special battle theme that the normal PlayBattleMusic path can't reach
; on its own. Runs before the wGymLeaderNo check, so the Elite Four override gym-leader music.
; Yields to an already-set id (champ arena). Rocket grunts/queens/Giovanni are handled later in
; PlayBattleMusic's trainer fall-through (so Giovanni's gym/tower fights keep gym-leader music).
SelectUpfrontBattleTheme:
	ld a, [wSpecialBattleMusicID]
	and a
	ret nz
	ld a, [wIsInBattle]
	cp 2
	jr c, .wild ; <2 = wild battle; wCurOpponent holds the species
	ld a, [wCurOpponent] ; trainer battle; wCurOpponent holds the class
	cp LORELEI
	jr z, .eliteFour
	cp BRUNO
	jr z, .eliteFour
	cp AGATHA
	jr z, .eliteFour
	cp LANCE
	jr z, .eliteFour
	ret
.wild
	ld a, [wCurOpponent]
	cp MEWTWO
	jr z, .mewtwo
	cp ARTICUNO
	jr z, .birds
	cp ZAPDOS
	jr z, .birds
	cp MOLTRES
	jr z, .birds
	ret
.eliteFour
	ld a, SPECIAL_MUSIC_ELITE_FOUR
	jr .set
.mewtwo
	ld a, SPECIAL_MUSIC_MEWTWO
	jr .set
.birds
	ld a, SPECIAL_MUSIC_BIRDS
.set
	ld [wSpecialBattleMusicID], a
	ret