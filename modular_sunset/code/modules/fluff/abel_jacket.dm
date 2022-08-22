	// Custom NCRCF Jacket FLUFF ITEM >> Balanced around the standard kevlar vest.

/obj/item/clothing/suit/toggle/labcoat/abeljacket
	name = "modified NCRCF jacket"
	desc = "A modified NCR Correctional Facility inmate jacket, sporting the added protection of a ballistic vest and the added utility of a bandolier and leather shoulderpad."
	icon = 'modular_sunset/icons/mob/clothing/abel_jacket.dmi'
	icon_state = "abeljacket"
	item_state = "abeljacket"
	mob_overlay_icon = 'modular_sunset/icons/mob/clothing/abel_jacket.dmi'
	blood_overlay_type = "coat"
	body_parts_covered = CHEST|ARMS
	pocket_storage_component_path = /datum/component/storage/concrete/pockets
	armor = list("melee" = 15, "bullet" = 45, "laser" = 10, "energy" = 10, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = -5)
	togglename = "bandolier"
	
