/datum/sprite_accessory/frills
	icon = 'icons/mob/mutant_bodyparts.dmi'
	relevant_layers = list(BODY_ADJ_LAYER)
	mutant_part_string = "frills"

/datum/sprite_accessory/frills/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["frills"] || H.dna.features["frills"] == "None" || H.head && (H.head.flags_inv & HIDEEARS) || !HD || HD.status == BODYPART_ROBOTIC)

/datum/sprite_accessory/frills/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/frills/aquatic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/frills/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/frills/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/frills/drake
	name = "Drake"
	icon_state = "drake"

/datum/sprite_accessory/frills/axolotl
	name = "Axolotl"
	icon_state = "axolotl"

/datum/sprite_accessory/frills/marauder
	name = "Marauder"
	icon_state = "murauder"

/datum/sprite_accessory/frills/faceguard
	name = "Faceguard"
	icon_state = "faceguard"

/datum/sprite_accessory/frills/cobrahoodears
	name = "Cobra Hood with Ears"
	icon = 'modular_citadel/icons/mob/frills.dmi'
	icon_state = "cobraears"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/frills/cobrahood
	name = "Cobra Hood"
	icon = 'modular_citadel/icons/mob/frills.dmi'
	icon_state = "cobrahood"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

