/datum/sprite_accessory/horns
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_src = HORNCOLOR
	relevant_layers = list(HORNS_LAYER)

/datum/sprite_accessory/horns/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["horns"] || H.dna.features["horns"] == "None" || H.head && (H.head.flags_inv & HIDEHAIR) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEHAIR)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/horns/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/horns/curled
	name = "Curled"
	icon_state = "curled"

/datum/sprite_accessory/horns/curledbig
	name = "Curled Big"
	icon_state = "curledbig"

/datum/sprite_accessory/horns/lifted
	name = "Lifted"
	icon_state = "lifted"

/datum/sprite_accessory/horns/demon
	name = "Demon"
	icon_state = "demon"

/datum/sprite_accessory/horns/angler
	name = "Angeler"
	icon_state = "angler"
	color_src = MUTCOLORS

/datum/sprite_accessory/horns/antler
	name = "Deer Antlers"
	icon_state = "deer"

/datum/sprite_accessory/horns/guilmon
	name = "Guilmon"
	icon_state = "guilmon"

/datum/sprite_accessory/horns/ram
	name = "Ram"
	icon_state = "ram"

/datum/sprite_accessory/horns/ram2
	name = "Ram 2"
	icon_state = "ram2"

/datum/sprite_accessory/horns/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/horns/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/horns/deathclaw
	name = "Deathclaw"
	icon_state = "deathclaw"

/datum/sprite_accessory/horns/deathclawinverted
	name = "Deathclaw Inverted"
	icon_state = "deathclawinverted"

/datum/sprite_accessory/horns/deathclawshort
	name = "Deathclaw Short"
	icon_state = "deathclawshort"
