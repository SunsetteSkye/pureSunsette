
; PureRGBnote: CHANGED: Lonemoves was modified to specify which move index will be replaced.
; unique moves for gym leaders
; this is not automatic! you have to write the index you want to [wLoneAttackNo]
; first. e.g., erika's script writes 4 to [wLoneAttackNo] to get mega drain,
; the fourth entry in the list.
LoneMoves:
	; gym leader number (= wGymLeaderNo, 1-8), pokemon index (0-BASED, = position in the party),
	; move slot to overwrite (0-3), move to give. A leader may have MULTIPLE rows - .AddLoneMove
	; applies EVERY row tagged with that leader's number. Table is -1 terminated.
	; (mostly on the ACE = last mon; the 0-based index points there.)
	db 1, 2, 2, BULK_UP        ; Brock: Onix ace (Geodude, Koffing, Onix)
	db 1, 1, 3, DISABLE     ; Brock: Koffing gets DISABLE in its empty 4th slot
	db 2, 2, 3, WATER_PULSE  ; Misty: Starmie ace (Goldeen, Farfetch'd, Starmie)
	db 3, 3, 3, THUNDERBOLT ; Surge: Raichu ace (Voltorb, Magnemite, Pinsir, Raichu)
	db 4, 3, 1, RAZOR_LEAF  ; Erika: Vileplume ace (Victreebel, Tangela, Dragonair, Vileplume)
	db 4, 2, 0, DISABLE     ; Erika: Dragonair (now L38) gets DISABLE over AGILITY (slot 0) - keeps its OUTRAGE STAB
	db 4, 2, 1, SOLARBEAM   ; Erika: Dragonair gets SOLARBEAM over QUICK_ATTACK (slot 1) - showcases the reworked SolarBeam; keeps DISABLE + OUTRAGE + MIST
	db 5, 4, 0, TOXIC       ; Koga: Weezing ace (Tentacruel, Muk, Venomoth, Scyther, Weezing)
	db 6, 5, 1, PSYCHIC_M   ; Sabrina: Alakazam ace (Hypno, Mr.Mime, Golduck, Butterfree, Gengar, Alakazam)
	db 6, 5, 2, SKITTERMIND     ; Sabrina: Alakazam ace also gets SKITTERMIND (PSYWAVE) - her signature TM move
	db 6, 0, 3, SKITTERMIND     ; Sabrina: Hypno gets SKITTERMIND too, so the team showcases it
	db 7, 5, 1, FIRE_BLAST  ; Blaine: Arcanine ace (Ninetales, Magmar, Electrode, Rapidash, Golem, Arcanine)
	db 7, 2, 1, THUNDERBOLT ; Blaine: Electrode gets THUNDERBOLT over Reflect (slot 1)
	db 8, 5, 1, EARTHQUAKE  ; Giovanni: Rhydon ace (Kingler, Dodrio, Dugtrio, Nidoqueen, Nidoking, Rhydon)
	db 8, 2, 3, EARTHQUAKE  ; Giovanni: Dugtrio gets EARTHQUAKE over SUBMISSION (slot 3); keeps FURY_ATTACK (DUAL SPEAR) for Grass/Fighting coverage, and DISABLE is already in its natural L61 set
	db -1 ; end

; unique moves for elite 4
; all trainers in this class are given this move automatically on their 6th pokemon's 2nd move slot
; (unrelated to LoneMoves)
TeamMoves:
	; trainer, move
	db AGATHA,  THUNDERBOLT
	db -1 ; end
