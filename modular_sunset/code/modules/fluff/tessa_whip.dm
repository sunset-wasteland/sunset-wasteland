	// Scourge FLUFF ITEM		Keywords: Damage 13, Edged, Reach, Wound bonus

/obj/item/melee/onehanded/scourge
	name = "Scourge"
	desc = "The weapon of a true sadist. This weapon features rusted nails and bits of glass woven into its length to inflict the most pain and bleeding possible while also packing a punch with the spiked knuckle handle guard."
	icon = 'modular_sunset/icons/obj/melee/tessa_whip.dmi'
	icon_state = "scourge"
	item_state = "chain"
	lefthand_file = 'icons/fallout/onmob/weapons/melee1h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee1h_righthand.dmi'
	hitsound = 'sound/weapons/whip.ogg'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	force = 13
	max_reach = 2
	bare_wound_bonus = 5
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("slashed", "sliced", "torn", "ripped", "lashed")
	resistance_flags = FIRE_PROOF
