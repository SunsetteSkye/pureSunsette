SortPCItems::
	ld hl, SortPCText
	rst _PrintText
	ld hl, wNumBoxItems
	jr SortItems

SortBagItems::
	ld hl, SortBagText
	rst _PrintText
	ld hl, wNumBagItems
	; fall through

; hl = item list to sort
; selection sort algorithm
SortItems::
	; 2 or more items stored
	push hl
	call YesNoChoice
	pop hl
	ret nz
	ld a, [hli]
	cp 2
	jr nc, .continue
	; less than 2 items in bag
	ld hl, .nothingToSort
	rst _PrintText
	ret
.continue
	push hl
	ld hl, .sortingInProgress
	rst _PrintText
	ld a, SFX_WITHDRAW_DEPOSIT
	call PlaySoundWaitForCurrent
	ld c, 20
	rst _DelayFrames
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	ld c, 20
	rst _DelayFrames
	ld a, SFX_WITHDRAW_DEPOSIT
	rst _PlaySound
	ld c, 20
	rst _DelayFrames
	pop hl
	ld c, 0
.sortItemsLoop
	ld a, [hl]
	cp $FF
	jr z, .sortingDone
	push bc
	push hl
	ld e, $FF ; index of lowest item found (currently the highest possible because none found yet)
.findLowestItemInList
	ld a, [hli]
	cp $FF
	jr z, .sortIterationDone
	inc hl
	push bc
	push de
	push hl
	ld hl, ItemSortedList
	call IsInSingleByteArray
	pop hl
	pop de
	ld d, b ; count of where it was in the array
	pop bc
	jr nc, .errord
	ld a, e
	cp d
	jr z, .findLowestItemInList
	jr c, .findLowestItemInList
	dec hl
	dec hl
	ld b, h
	ld c, l ; back up the address of the item
	inc hl
	inc hl
	ld e, d ; we found an item lower than the lowest current index
	jr .findLowestItemInList
.sortIterationDone
	; item to be sorted's address is in bc, load it into hl
	ld h, b
	ld l, c
	; get the item to be sorted's info into de
	ld a, [hli]
	ld e, [hl] ; quantity of item to replace first item in sorting
	ld d, a ; which item the item to replace the first item in sorting is
	; go back to the first unsorted item
	pop hl
	push hl
	; save the sorted item's address
	push bc
	; get the first unsorted item's data into bc
	ld a, [hli]
	ld c, [hl] ; quantity of first item in list
	ld b, a ; which item the first item in the list is
	; replace the first unsorted item's data with the item to be sorted's data
	ld [hl], e
	dec hl
	ld [hl], d
	pop hl ; pop bc into hl, hl is now at the item to be sorted's address
	; replace the newly sorted item's data with the first unsorted item's data
	ld [hl], b
	inc hl
	ld [hl], c
	; get back the first unsorted item's address
	pop hl
	; get back the sorting index into c
	pop bc
	; go to next item in the list and next sorting index
	inc hl
	inc hl
	inc c
	jr .sortItemsLoop
.sortingDone
	ld hl, .sorted
	rst _PrintText
	ret
.errord
	pop hl
	pop bc
	; item was searched that doesn't exist in list. should not happen
	ld a, SFX_DENIED
	rst _PlaySound
	ret	
.sorted
	text_far _SortDone
	text_end
.sortingInProgress
	text_far _FuchsiaCityFossilSignUndeterminedText
	text_end
.nothingToSort
	text_far _SortNotEnough
	text_end


SortBagText::
	text_far _SortItems
	text_end

SortPCText::
	text_far _SortPCItems
	text_end


ItemSortedList:
	table_width 1
	; key items that need consistent usage from the item list
	db POCKET_ABRA
	db CAMERA
	db ITEMFINDER
	; Balls
	db POKE_BALL
	db GREAT_BALL
	db SAFARI_BALL
	db ULTRA_BALL
	db HYPER_BALL
	db MASTER_BALL
	; Main status items
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db POKE_FLUTE
	db FULL_HEAL
	db BURN_HEAL
	db ICE_HEAL
	; Health
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	; Revives
	db REVIVE
	db MAX_REVIVE
	; Common Items
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db ESCAPE_ROPE
	; PP
	db ETHER
	db MAX_ETHER
	db ELIXER
	db MAX_ELIXER
	; Permanent Raises
	db RARE_CANDY
	db APEX_CHIP
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db PP_UP
	; Battle items
	db X_ACCURACY
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPECIAL
	db GUARD_SPEC
	db DIRE_HIT	
	; Rods
	db SUPER_ROD
	db GOOD_ROD
	db OLD_ROD
	; Key Items
	db BICYCLE
	db BOOSTER_CHIP
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db S_S_TICKET
	db SILPH_SCOPE
	db LIFT_KEY
	db CARD_KEY
	db SECRET_KEY
	db TOPSECRETKEY
	db GOLD_TEETH
	db BIKE_VOUCHER
	db OAKS_PARCEL
	db LOST_WALLET
	; Stones
	db LEAF_STONE
	db FIRE_STONE
	db THUNDER_STONE
	db WATER_STONE
	db MOON_STONE
	; Money-earning items
	db POKE_DOLL
	db NUGGET
	db OLD_COIN
	; TMs / HMs
	db TM_FROST_FIST   	; $C9
	db TM_ROOST   ; $CA ROOST
	db TM_MUD_BOMB 	; $CB
	db TM_PIN_MISSILE  ; $CC
	db TM_BLAZE_HAMMER   ; $CD
	db TM_TOXIC        ; $CE
	db TM_HONE_EDGE   ; $CF
	db TM_BODY_SLAM    ; $D0
	db TM_DISABLE    	; $D1
	db TM_DOUBLE_EDGE  ; $D2
	db TM_AQUA_RING   ; $D3
	db TM_AURORA_MIST  ; $D4
	db TM_ICE_BEAM     ; $D5
	db TM_BLIZZARD     ; $D6
	db TM_HYPER_BEAM   ; $D7
	db TM_CALM_MIND      ; $D8
	db TM_LOW_KICK     ; $D9 ; LOW KICK
	db TM_ZAPPERCUT ; $DA
	db TM_METEOR_SWEEP ; $DB
	db TM_BARRIER      ; $DC
	db TM_ADAPTATION   ; $DD
	db TM_SOLARBEAM    ; $DE (SOLARBEAM)
	db TM_WYRM_WRATH  ; $DF
	db TM_THUNDERBOLT  ; $E0
	db TM_THUNDER      ; $E1
	db TM_EARTHQUAKE   ; $E2
	db TM_RIPTIDE	; $E3 ; Sunsette: TM28 now RIPTIDE (WATERFALL)
	db TM_DIG          ; $E4
	db TM_PSYCHIC_M    ; $E5
	db TM_MEGA_DRAIN   ; $E6
	db TM_MIRAGE      ; $E7 MIRAGE
	db TM_SWORDS_DANCE ; $E8
	db TM_REFLECT      ; $E9
	db TM_BULK_UP         ; $EA
	db TM_ILL_WIND    	; $EB
	db TM_SHADOW_BALL 		; $EC
	db TM_SUPERNOVA ; $ED
	db TM_FIRE_BLAST   ; $EE
	db TM_TWISTER        	; $EF
	db TM_DEMOLISH  ; $F0
	db TM_VOID_MIND   	; $F1
	db TM_LOVELY_KISS  ; $F2
	db TM_BRAVE_BIRD   ; $F3
	db TM_LIGHT_SCREEN ; $F4
	db TM_THUNDER_WAVE ; $F5
	db TM_SKITTERMIND      ; $F6 ; SKITTERMIND
	db TM_SHADOW_GAME      	; $F7 (SHADOW GAME; was SLUDGE BOMB)
	db TM_ROCK_SLIDE   ; $F8
	db TM_ROCK_ON	; $F9
	db TM_SUBSTITUTE   ; $FA
	db TM_CLAY_ARMOR      ; $FB (CLAY ARMOR; Sunsette TM51)
	db HM_CUT          ; $C4
	db HM_FLY          ; $C5
	db HM_SURF         ; $C6
	db HM_STRENGTH     ; $C7
	db HM_FLASH        ; $C8
	; Unused items
	db POKEDEX
	db SAFARI_BAIT
	db SAFARI_ROCK
	db UNUSED_ITEM4
	db UNUSED_ITEM5
	db UNUSED_ITEM6
	db SURFBOARD
	db COIN
	assert_table_length NUM_ITEMS + NUM_TM_HM
	db -1