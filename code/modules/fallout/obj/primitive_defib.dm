//Primitive defib stuff, could be improved by making it require no cell, fixing text messages, making them less fancy in function etc but I can't figure out how without stuffing duplicates all over. This is about as good I can make them for now.
//Made to replace smelling salts due to bugs temporarily, but it fits Legion and Wasteland docs well.
/obj/item/defibrillator/primitive
	name = "primitive defibrillator"
	desc = "The Delco, the name of a box that can deliver shocks to the seriously wounded to revive them."
	icon = 'icons/fallout/objects/medicine/primitivedefib.dmi'
	icon_state = "defibprimitive"
	lefthand_file = 'icons/fallout/onmob/tools/medical_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/tools/medical_righthand.dmi'
	item_state = "defibunit"
	cell = /obj/item/stock_parts/cell/high

/obj/item/defibrillator/primitive/Initialize()
	. = ..()
	paddles = make_paddlesprim()
	update_power()
	return

/obj/item/defibrillator/primitive/proc/make_paddlesprim()
	return new /obj/item/shockpaddles/primitive(src)
