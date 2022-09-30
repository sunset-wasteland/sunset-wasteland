/datum/sprite_accessory/ears
	icon = 'icons/mob/mutant_bodyparts.dmi'
	mutant_part_string = "ears"
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/ears/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["ears"] || H.dna.features["ears"] == "None" || H.head && (H.head.flags_inv & HIDEEARS) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEEARS)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/ears/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/******************************************
*************** Human Ears ****************
*******************************************/


/datum/sprite_accessory/ears/human/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bat
	name = "Bat"
	icon_state = "bat"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bear
	name = "Bear"
	icon_state = "bear"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/bigwolfinner
	name = "Big Wolf (ALT)"
	icon_state = "bigwolfinner"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	extra = TRUE
	extra_color_src = NONE
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bigwolfdark //alphabetical sort ignored here for ease-of-use
	name = "Dark Big Wolf"
	icon_state = "bigwolfdark"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/bigwolfinnerdark
	name = "Dark Big Wolf (ALT)"
	icon_state = "bigwolfinnerdark"
	extra = TRUE
	extra_color_src = NONE
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bunny
	name = "Bunny"
	icon_state = "bunny"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bunnyalt
	name = "Bunny (ALT)"
	icon_state = "bunnyalt"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_src = HAIR
	extra = TRUE
	extra_color_src = NONE

/datum/sprite_accessory/ears/human/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/cobra
	name = "Cobra Hood"
	icon_state = "cobra"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = SKINTONE

/datum/sprite_accessory/ears/human/cow
	name = "Cow"
	icon_state = "cow"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/curled
	name = "Curled Horn"
	icon_state = "horn1"
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/human/deer
	name = "Deer"
	icon_state = "deer"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/dog
	name = "Dog"
	icon_state = "lab"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/eevee
	name = "Eevee"
	icon_state = "eevee"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/eeveealt
	name = "Eevee Alt"
	icon_state = "eeveealt"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/eeveetorn
	name = "Eeeve Torn"
	icon_state = "eeveetorn"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/elf
	name = "Elf"
	icon_state = "elf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/human/elephant
	name = "Elephant"
	icon_state = "elephant"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/fennec2
	name = "Fennec (ALT)"
	icon_state = "fennec2"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/fish
	name = "Fish"
	icon_state = "fish"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/fox
	name = "Fox"
	icon_state = "fox"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/husky
	name = "Husky"
	icon_state = "wolf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = HAIR

/datum/sprite_accessory/ears/human/kangaroo
	name = "Kangaroo"
	icon_state = "kangaroo"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/murid
	name = "Murid"
	icon_state = "murid"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/otie
	name = "Otusian"
	icon_state = "otie"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/rabbitalt
	name = "Rabbit (ALT)"
	icon_state = "rabbitalt"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/human/pede
	name = "Scolipede"
	icon_state = "pede"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/sergal
	name = "Sergal"
	icon_state = "sergal"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/skunk
	name = "Skunk"
	icon_state = "skunk"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/wolf
	name = "Wolf"
	icon_state = "wolf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/zorgoia
	name = "Zorgoia"
	icon_state = "zorgoia"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED


/******************************************
*************** Furry Ears ****************
*******************************************/

/datum/sprite_accessory/ears/mam_ears
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/ears/mam_ears/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["mam_ears"] || H.dna.features["mam_ears"] == "None" || H.head && (H.head.flags_inv & HIDEEARS) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEEARS)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/ears/mam_ears/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/ears/mam_ears/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bat
	name = "Bat"
	icon_state = "bat"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bear
	name = "Bear"
	icon_state = "bear"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/bigwolfinner
	name = "Big Wolf (ALT)"
	icon_state = "bigwolfinner"
	extra = TRUE
	extra_color_src = NONE
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bigwolfdark //alphabetical sort ignored here for ease-of-use
	name = "Dark Big Wolf"
	icon_state = "bigwolfdark"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/bigwolfinnerdark
	name = "Dark Big Wolf (ALT)"
	icon_state = "bigwolfinnerdark"
	extra = TRUE
	extra_color_src = NONE
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bunny
	name = "Bunny"
	icon_state = "bunny"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bunnyalt
	name = "Bunny (ALT)"
	icon_state = "bunnyalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_src = HAIR
	extra = TRUE
	extra_color_src = NONE

/datum/sprite_accessory/ears/mam_ears/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/cobra
	name = "Cobra Hood"
	icon_state = "cobra"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = SKINTONE

/datum/sprite_accessory/ears/mam_ears/cow
	name = "Cow"
	icon_state = "cow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/curled
	name = "Curled Horn"
	icon_state = "horn1"
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/mam_ears/deer
	name = "Deer"
	icon_state = "deer"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/dog
	name = "Dog"
	icon_state = "lab"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/eevee
	name = "Eevee"
	icon_state = "eevee"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/eeveealt
	name = "Eevee Alt"
	icon_state = "eeveealt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/eeveetorn
	name = "Eeeve Torn"
	icon_state = "eeveetorn"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/elf
	name = "Elf"
	icon_state = "elf"
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/mam_ears/elephant
	name = "Elephant"
	icon_state = "elephant"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/fennec
	name = "Fennec"
	icon_state = "fennec"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/fennec2
	name = "Fennec (ALT)"
	icon_state = "fennec2"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/fish
	name = "Fish"
	icon_state = "fish"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/fox
	name = "Fox"
	icon_state = "fox"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/husky
	name = "Husky"
	icon_state = "wolf"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"
	color_src = HAIR

/datum/sprite_accessory/ears/mam_ears/kangaroo
	name = "Kangaroo"
	icon_state = "kangaroo"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/murid
	name = "Murid"
	icon_state = "murid"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/otie
	name = "Otusian"
	icon_state = "otie"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/rabbitalt
	name = "Rabbit (ALT)"
	icon_state = "rabbitalt"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/pede
	name = "Scolipede"
	icon_state = "pede"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/sergal
	name = "Sergal"
	icon_state = "sergal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/skunk
	name = "Skunk"
	icon_state = "skunk"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/wolf
	name = "Wolf"
	icon_state = "wolf"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/zorgoia
	name = "Zorgoia"
	icon_state = "zorgoia"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

