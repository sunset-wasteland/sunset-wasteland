//Sunset wood floors
//Order > Regular, Light, Dark

/turf/open/floor/wood   //placeholder - this shouldn't be used but has a few details so it at least doesn't look broken if it does
	name = "wooden floor"
	icon = 'modular_sunset/icons/turfs/wood_floor.dmi'
	icon_state = "common1"

/turf/open/floor/wood/wood_common
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "common1"
	floor_tile = /obj/item/stack/tile/wood/common
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("common-broken1","common-broken2","common-broken3","common-broken4","common-broken5","common-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_common/Initialize()
	. = ..()
	if(icon_state == "common1")
		icon_state = "common[rand(1,3)]"

/turf/open/floor/wood/wood_common/wood_common_light
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "common_light1"
	floor_tile = /obj/item/stack/tile/wood/common/light
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("common_light-broken1","common_light-broken2","common_light-broken3","common_light-broken4","common_light-broken5","common_light-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_common/wood_common_light/Initialize()
	. = ..()
	if(icon_state == "common_light1")
		icon_state = "common_light[rand(1,3)]"

/turf/open/floor/wood/wood_common/wood_common_dark
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "common_dark1"
	floor_tile = /obj/item/stack/tile/wood/common/dark
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("common_dark-broken1","common_dark-broken2","common_dark-broken3","common_dark-broken4","common_dark-broken5","common_dark-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_common/wood_common_dark/Initialize()
	. = ..()
	if(icon_state == "common_dark1")
		icon_state = "common_dark[rand(1,3)]"

/turf/open/floor/wood/wood_worn
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "worn1"
	floor_tile = /obj/item/stack/tile/wood/worn
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("worn-broken1","worn-broken2","worn-broken3","worn-broken4","worn-broken5","worn-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_worn/Initialize()
	. = ..()
	if(icon_state == "worn1")
		icon_state = "worn[rand(1,4)]"

/turf/open/floor/wood/wood_worn/wood_worn_light
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "worn_light1"
	floor_tile = /obj/item/stack/tile/wood/worn/light
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("worn_light-broken1","worn_light-broken2","worn_light-broken3","worn_light-broken4","worn_light-broken5","worn_light-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_worn/wood_worn_light/Initialize()
	. = ..()
	if(icon_state == "worn_light1")
		icon_state = "worn_light[rand(1,4)]"

/turf/open/floor/wood/wood_worn/wood_worn_dark
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "worn_dark1"
	floor_tile = /obj/item/stack/tile/wood/worn/dark
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("worn_dark-broken1","worn_dark-broken2","worn_dark-broken3","worn_dark-broken4","worn_dark-broken5","worn_dark-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_worn/wood_worn_dark/Initialize()
	. = ..()
	if(icon_state == "worn_dark1")
		icon_state = "worn_dark[rand(1,4)]"



/turf/open/floor/wood/wood_fancy
	desc = "Wood cast in a fancy angled pattern."
	icon_state = "fancy1"
	floor_tile = /obj/item/stack/tile/wood/fancy
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("fancy-broken1","fancy-broken2","fancy-broken3","fancy-broken4","fancy-broken5","fancy-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_fancy/Initialize()
	. = ..()
	if(icon_state == "fancy1")
		icon_state = "fancy[rand(1,1)]"

/turf/open/floor/wood/wood_fancy/wood_fancy_light
	desc = "Wood cast in a fancy angled pattern."
	icon_state = "fancy_light1"
	floor_tile = /obj/item/stack/tile/wood/fancy/light
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("fancy_light-broken1","fancy_light-broken2","fancy_light-broken3","fancy_light-broken4","fancy_light-broken5","fancy_light-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_fancy/wood_fancy_light/Initialize()
	. = ..()
	if(icon_state == "fancy_light1")
		icon_state = "fancy_light[rand(1,1)]"


/turf/open/floor/wood/wood_fancy/wood_fancy_dark
	desc = "Wood cast in a fancy angled pattern."
	icon_state = "fancy_dark1"
	floor_tile = /obj/item/stack/tile/wood/fancy/dark
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("fancy_dark-broken1","fancy_dark-broken2","fancy_dark-broken3","fancy_dark-broken4","fancy_dark-broken5","fancy_dark-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_fancy/wood_fancy_dark/Initialize()
	. = ..()
	if(icon_state == "fancy_dark1")
		icon_state = "fancy_dark[rand(1,1)]"




/turf/open/floor/wood/wood_wide
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "wide1"
	floor_tile = /obj/item/stack/tile/wood/wide
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("wide-broken1","wide-broken2","wide-broken3","wide-broken4","wide-broken5","wide-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_wide/Initialize()
	. = ..()
	if(icon_state == "wide1")
		icon_state = "wide[rand(1,3)]"

/turf/open/floor/wood/wood_wide/wood_wide_light
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "wide_light1"
	floor_tile = /obj/item/stack/tile/wood/wide/light
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("wide_light-broken1","wide_light-broken2","wide_light-broken3","wide_light-broken4","wide_light-broken5","wide_light-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_wide/wood_wide_light/Initialize()
	. = ..()
	if(icon_state == "wide_light1")
		icon_state = "wide_light[rand(1,3)]"

/turf/open/floor/wood/wood_wide/wood_wide_dark
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "wide_dark1"
	floor_tile = /obj/item/stack/tile/wood/wide/dark
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("wide_dark-broken1","wide_dark-broken2","wide_dark-broken3","wide_dark-broken4","wide_dark-broken5","wide_dark-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_wide/wood_wide_dark/Initialize()
	. = ..()
	if(icon_state == "wide_dark1")
		icon_state = "wide_dark[rand(1,3)]"



/turf/open/floor/wood/wood_mosaic
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "mosaic1"
	floor_tile = /obj/item/stack/tile/wood/mosaic
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("mosaic-broken1","mosaic-broken2","mosaic-broken3","mosaic-broken4","mosaic-broken5","mosaic-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_mosaic/Initialize()
	. = ..()
	if(icon_state == "mosaic1")
		icon_state = "mosaic[rand(1,3)]"

/turf/open/floor/wood/wood_mosaic/wood_mosaic_light
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "mosaic_light1"
	floor_tile = /obj/item/stack/tile/wood/mosaic/light
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("mosaic_light-broken1","mosaic_light-broken2","mosaic_light-broken3","mosaic_light-broken4","mosaic_light-broken5","mosaic_light-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_mosaic/wood_mosaic_light/Initialize()
	. = ..()
	if(icon_state == "mosaic_light1")
		icon_state = "mosaic_light[rand(1,3)]"

/turf/open/floor/wood/wood_mosaic/wood_mosaic_dark
	desc = "Wood cast in a sturdy standard pattern."
	icon_state = "mosaic_dark1"
	floor_tile = /obj/item/stack/tile/wood/mosaic/dark
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 0.25)
	broken_states = list("mosaic_dark-broken1","mosaic_dark-broken2","mosaic_dark-broken3","mosaic_dark-broken4","mosaic_dark-broken5","mosaic_dark-broken6",)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/wood_mosaic/wood_mosaic_dark/Initialize()
	. = ..()
	if(icon_state == "mosaic_dark1")
		icon_state = "mosaic_dark[rand(1,3)]"

/turf/open/floor/carpet/vault
	icon = 'icons/turf/floors/carpet_vault.dmi'
	canSmoothWith = list(/turf/open/floor/carpet/vault)
