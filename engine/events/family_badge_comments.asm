; Sunsette: one-time "noticed your badge" acknowledgments (no item) that MOM and DAISY give for the four
; badges each of them does NOT hand an item out for. Called via callfar from RedsHouse1F / BluesHouse
; (those map banks were full). Each shows the highest unseen badge in the relevant set, sets its flag, and
; returns so the NPC's normal behavior (Mom's heal/food, Daisy's tea/use-map) still happens afterward.

; MOM comments on DAISY's badge set: Cascade / Rainbow / Soul(Poison) / Earth.
MomBadgeComment::
	ld a, [wObtainedBadges]
	ld b, a
	bit BIT_EARTHBADGE, b
	jr nz, .earth
	bit BIT_POISONBADGE, b
	jr nz, .soul
	bit BIT_RAINBOWBADGE, b
	jr nz, .rainbow
	bit BIT_CASCADEBADGE, b
	jr nz, .cascade
	ret
.earth
	CheckEvent EVENT_MOM_SAW_EARTH
	ret nz
	ld hl, .earthText
	rst _PrintText
	SetEvent EVENT_MOM_SAW_EARTH
	ret
.soul
	CheckEvent EVENT_MOM_SAW_SOUL
	ret nz
	ld hl, .soulText
	rst _PrintText
	SetEvent EVENT_MOM_SAW_SOUL
	ret
.rainbow
	CheckEvent EVENT_MOM_SAW_RAINBOW
	ret nz
	ld hl, .rainbowText
	rst _PrintText
	SetEvent EVENT_MOM_SAW_RAINBOW
	ret
.cascade
	CheckEvent EVENT_MOM_SAW_CASCADE
	ret nz
	ld hl, .cascadeText
	rst _PrintText
	SetEvent EVENT_MOM_SAW_CASCADE
	ret
.cascadeText
	text_far _MomCommentCascadeText
	text_end
.rainbowText
	text_far _MomCommentRainbowText
	text_end
.soulText
	text_far _MomCommentSoulText
	text_end
.earthText
	text_far _MomCommentEarthText
	text_end

; DAISY comments on MOM's badge set: Boulder / Thunder / Marsh(Psychic) / Volcano.
DaisyBadgeComment::
	ld a, [wObtainedBadges]
	ld b, a
	bit BIT_VOLCANOBADGE, b
	jr nz, .volcano
	bit BIT_PSYCHICBADGE, b
	jr nz, .marsh
	bit BIT_THUNDERBADGE, b
	jr nz, .thunder
	bit BIT_BOULDERBADGE, b
	jr nz, .boulder
	ret
.volcano
	CheckEvent EVENT_DAISY_SAW_VOLCANO
	ret nz
	ld hl, .volcanoText
	rst _PrintText
	SetEvent EVENT_DAISY_SAW_VOLCANO
	ret
.marsh
	CheckEvent EVENT_DAISY_SAW_MARSH
	ret nz
	ld hl, .marshText
	rst _PrintText
	SetEvent EVENT_DAISY_SAW_MARSH
	ret
.thunder
	CheckEvent EVENT_DAISY_SAW_THUNDER
	ret nz
	ld hl, .thunderText
	rst _PrintText
	SetEvent EVENT_DAISY_SAW_THUNDER
	ret
.boulder
	CheckEvent EVENT_DAISY_SAW_BOULDER
	ret nz
	ld hl, .boulderText
	rst _PrintText
	SetEvent EVENT_DAISY_SAW_BOULDER
	ret
.boulderText
	text_far _DaisyCommentBoulderText
	text_end
.thunderText
	text_far _DaisyCommentThunderText
	text_end
.marshText
	text_far _DaisyCommentMarshText
	text_end
.volcanoText
	text_far _DaisyCommentVolcanoText
	text_end
