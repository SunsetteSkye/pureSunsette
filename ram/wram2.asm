SECTION "GBC WRAM", WRAMX
; wram that can be only used on GBC, switched out with the addresses of section WRAM 1 if 2 is written to rWBK
; starts at address $d000 just like section WRAM 1
wGBCFullPalBuffer:: ds 128


; PureRGBnote: ADDED: persistent Surfing Pikachu minigame hi-score. Pinned to WRAM
; bank 1 (the bank selected during normal overworld/script execution and the minigame),
; so it survives the textbox/menu draws that clobber wTileMapBackup and the Summer Beach
; House "printer" object can display it after the player has surfed. (WRAM0 is full.)
SECTION "Surfing Pikachu Hi Score", WRAMX, BANK[1]
wSurfingMinigameHiScore:: dw ; little-endian BCD
; Sunsette: the score of the most recent run, stashed by the minigame before it reloads the
; map (which clobbers the volatile wSurfingMinigameTotalScore). Read by the Summer Beach House
; script to pay out coins when the player wagered. Little-endian BCD, like TotalScore.
wSurfingMinigameLastScore:: dw
; PureRGBnote: ADDED: Summer Beach House surf-dude progress flags (named after its Yellow
; address). Bit 0 = greeted, bit 1 = has surfed at least once. Shared by the minigame
; engine (quit handling) and the SummerBeachHouse script. Persistent within a session.
wd492:: db