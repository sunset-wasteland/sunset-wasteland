//Fallout 13 unique furniture directory

/obj/structure/chair/bench
	name = "bench"
	desc = "A classic wooden bench. It has some dried wax on it..."
	icon_state = "church"
	icon = 'icons/obj/objects2.dmi'
	item_chair = null
	buildstacktype = /obj/item/stack/sheet/mineral/wood

////////////////////
// Fallout chairs //
////////////////////

// Settler chair
/obj/structure/chair/wood
	name = "wooden chair"
	desc = "A basic yet sturdy chair made from weathered old wood."
	icon_state = "wooden_chair_settler"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 3
	item_chair = /obj/item/chair/wood

/obj/item/chair/wood
	name = "wooden chair"
	desc = "A basic yet sturdy chair made from weathered old wood."
	icon_state = "wooden_chair_settler_toppled"
	item_state = "woodenchair"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	hitsound = 'sound/weapons/genhit1.ogg'
	origin_type = /obj/structure/chair/wood
	custom_materials = null
	break_chance = 50

// Simple dining chair
/obj/structure/chair/wood/dining
	desc = "A commonplace dining chair with a faded green cushion."
	icon_state = "wooden_chair"

/obj/item/chair/wood/dining
	desc = "A commonplace dining chair with a faded green cushion."
	icon_state = "wooden_chair_toppled"
	item_state = "wooden_chair"
	origin_type = /obj/structure/chair/wood/dining

// Winged wooden chair
/obj/structure/chair/wood/wings
	desc = "An antique wooden chair of distinctive design. Creaky."
	icon_state = "wooden_chair_fine"
	item_chair = /obj/item/chair/wood/wings

/obj/item/chair/wood/wings
	desc = "An antique wooden chair of distinctive design. Creaky."
	icon_state = "wooden_chair_fine_toppled"
	origin_type = /obj/structure/chair/wood/wings

// Fancy wooden chair
/obj/structure/chair/wood/fancy
	icon_state = "wooden_chair_fancy"
	desc = "A well-designed study chair with a faded red cushion."
	item_chair = /obj/item/chair/wood/fancy

/obj/item/chair/wood/fancy
	desc = "A well-designed study chair with a faded red cushion."
	icon_state = "wooden_chair_fancy_toppled"
	item_state = "wooden_chair_fancy"
	origin_type = /obj/structure/chair/wood/fancy

// Folding chair
/obj/structure/chair/folding
	icon_state = "folding_chair"
	item_chair = /obj/item/chair/folding

/obj/item/chair/folding
	icon_state = "folding_chair_toppled"
	item_state = "folding_chair"
	origin_type = /obj/structure/chair/folding

// Plywood chair
/obj/structure/chair/comfy/plywood
	name = "deckchair"
	desc = "A relaxing plywood deckchair."
	icon_state = "plywood_chair"
	anchored = FALSE
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 4

/obj/structure/chair/comfy/throne
	name = "khan throne"
	desc = "An ornate wooden chair padded with fine leather. A symbol of authority."
	icon_state = "throne"
	anchored = TRUE
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 4

/obj/structure/chair/comfy/plywood/GetArmrest()
	return mutable_appearance('icons/fallout/objects/furniture/chairs_and_beds.dmi', "plywood_chair_armrest")

// Pre-war chair
/obj/structure/chair/comfy/shuttle
	name = "pre-war comfy chair"
	desc = "A comfortable, secure seat in synthetics."
	icon_state = "shuttle_chair"

/obj/structure/chair/comfy/shuttle/GetArmrest()
	return mutable_appearance('icons/fallout/objects/furniture/chairs_and_beds.dmi', "shuttle_chair_armrest")

/obj/structure/chair/comfy/modern
	name = "modern chair"
	desc = "the latest in pre-war chair technology."
	icon_state = "synthetic_chair"
	max_integrity = 250
	buildstacktype = /obj/item/stack/sheet/prewar
	buildstackamount = 2

/obj/structure/chair/comfy/modern/GetArmrest()
	return mutable_appearance('icons/fallout/objects/furniture/chairs_and_beds.dmi', "synthetic_chair_armrest")



// Office chairs
/obj/structure/chair/office
	icon_state = "office_chair"
	anchored = FALSE
	buildstackamount = 5
	item_chair = null
	drag_delay = 0.05 SECONDS //Pulling something on wheels is easy

/obj/structure/chair/office/Moved()
	. = ..()
	if(has_gravity())
		playsound(src, 'sound/effects/roll.ogg', 100, 1)

/obj/structure/chair/office/light
	icon_state = "office_chair_white"

/obj/structure/chair/office/dark
	icon_state = "office_chair_dark"

// Bar stools
/obj/structure/chair/stool/retro
	name = "bar stool"
	icon = 'icons/fallout/objects/furniture/chairs_and_beds.dmi'
	icon_state = "bar"
	item_chair = /obj/item/chair/stool/retro

/obj/item/chair/stool/retro
	icon_state = "bar_toppled"
	item_state = "bar"
	origin_type = /obj/structure/chair/stool/retro

/obj/structure/chair/stool/retro/black
	icon_state = "bar_black"
	item_chair = /obj/item/chair/stool/retro/black

/obj/item/chair/stool/retro/black
	icon_state = "bar_black_toppled"
	item_state = "bar_black"
	origin_type = /obj/structure/chair/stool/retro/black

/obj/structure/chair/stool/retro/tan
	name = "bar stool"
	icon_state = "bar_tan"
	item_chair = /obj/item/chair/stool/retro/tan

/obj/item/chair/stool/retro/tan
	icon_state = "bar_tan_toppled"
	item_state = "bar_tan"
	origin_type = /obj/structure/chair/stool/retro/tan

/obj/structure/chair/stool/retro/backed
	icon_state = "bar_backed"
	item_chair = /obj/item/chair/stool/retro/backed

/obj/item/chair/stool/retro/backed
	icon_state = "bar_backed_toppled"
	item_state = "bar_backed"
	origin_type = /obj/structure/chair/stool/retro/backed

///Material chair
/obj/structure/chair/greyscale
	icon = 'icons/obj/chairs.dmi'
	icon_state = "chair_greyscale"
	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	item_chair = /obj/item/chair/greyscale
	buildstacktype = null //Custom mats handle this

/obj/structure/chair/wood/narsie_act()
	return

/obj/structure/chair/f13foldupchair
	icon = 'icons/obj/chairs.dmi'
	icon_state = "f13foldupchair"
	item_chair = null

/obj/structure/chair/f13chair1
	icon = 'icons/obj/chairs.dmi'
	icon_state = "f13chair1"
	item_chair = null

/obj/structure/chair/f13chair2
	icon = 'icons/obj/chairs.dmi'
	icon_state = "f13chair2"
	item_chair = null

/obj/structure/chair/stool/f13stool
	name = "bar stool"
	desc = "It has some unsavory stains on it..."
	icon_state = "f13stool"
	item_chair = /obj/item/chair/stool/bar

/obj/item/chair/stool/bar
	name = "bar stool"
	icon_state = "bar_toppled"
	item_state = "stool_bar"
	origin_type = /obj/structure/chair/stool/bar

/obj/item/chair/wood/modern

/obj/structure/chair/booth
	name = "single booth"
	desc = "A lone-some diner-styled booth."
	icon = 'icons/obj/chairs.dmi'
	icon_state = "booth_single"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/booth/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/booth/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	overlay.plane = MOB_PLANE
	return ..()

/obj/structure/chair/booth/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/booth/proc/GetOverlay()
	return mutable_appearance('icons/obj/chairs.dmi', "booth_single_overlay")

/obj/structure/chair/left
	name = "booth"
	desc = "A diner-styled end booth."
	icon = 'icons/obj/chairs.dmi'
	icon_state = "booth_leftend"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/left/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/left/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	overlay.plane = MOB_PLANE
	return ..()

/obj/structure/chair/left/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/left/proc/GetOverlay()
	return mutable_appearance('icons/obj/chairs.dmi', "booth_leftend_overlay")

/obj/structure/chair/west_middle
	name = "booth"
	desc = "A diner-styled end booth."
	icon = 'icons/obj/chairs.dmi'
	icon_state = "booth_west_middle"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/left/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	overlay.plane = MOB_PLANE
	return ..()

/obj/structure/chair/left/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/middle
	name = "booth"
	desc = "A diner-styled middle booth."
	icon = 'icons/obj/chairs.dmi'
	icon_state = "booth_middle"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/middle/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/middle/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	overlay.plane = MOB_PLANE
	return ..()

/obj/structure/chair/middle/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/middle/proc/GetOverlay()
	return mutable_appearance('icons/obj/chairs.dmi', "booth_middle_overlay")

/obj/structure/chair/right
	name = "booth"
	desc = "A diner-styled end booth."
	icon = 'icons/obj/chairs.dmi'
	icon_state = "booth_rightend"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/right/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/right/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	overlay.plane = MOB_PLANE
	return ..()

/obj/structure/chair/right/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/right/proc/GetOverlay()
	return mutable_appearance('icons/obj/chairs.dmi', "booth_rightend_overlay")
