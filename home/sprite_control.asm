; a = which sprite
SetSpriteFacingRight::
	ld b, SPRITE_FACING_RIGHT
	jr ChangeSpriteFacing
; a = which sprite
SetSpriteFacingLeft::
	ld b, SPRITE_FACING_LEFT
	jr ChangeSpriteFacing
; a = which sprite
SetSpriteFacingUp::
	ld b, SPRITE_FACING_UP
	jr ChangeSpriteFacing
; a = which sprite
SetSpriteFacingDown::
	ld b, SPRITE_FACING_DOWN
; a = which sprite
; b = which facing
ChangeSpriteFacing::
	ldh [hSpriteIndex], a
	ld a, b
	ldh [hSpriteFacingDirection], a
	jp SetSpriteFacingDirection
	
GenericMoveDown::
	db NPC_MOVEMENT_DOWN
	db -1

GenericMoveLeft::
	db NPC_MOVEMENT_LEFT
	db -1

GenericMoveUp::
	db NPC_MOVEMENT_UP
	db -1
	