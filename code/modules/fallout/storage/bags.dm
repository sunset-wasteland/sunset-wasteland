/obj/item/storage/bag/chemistry/tribal
	name = "tribal medicinal bag"
	icon = 'icons/obj/chemical.dmi'
	icon_state = "tribal_chembag"
	desc = "A bag for holding a variety of tribal medical supplies."
	slot_flags = ITEM_SLOT_BELT|ITEM_SLOT_POCKET
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/salvage
	name = "salvage sack"
	desc = "A sack for your salvage."
	icon = 'icons/obj/janitor.dmi' //im lazy
	icon_state = "trashbag"
	item_state = "trashbag"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	resistance_flags = FLAMMABLE

/obj/item/storage/bag/salvage/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = INFINITY
	STR.max_items = 50
	CANHOLD_STATIC(STR, typecacheof(list(/obj/item/salvage)))

/obj/item/storage/bag/salvagestorage
	name = "salvage storage sack"
	desc = "A sack for storing your game-lagging piles of salvage components."
	icon = 'icons/obj/janitor.dmi' //im lazy
	icon_state = "trashbag"
	item_state = "trashbag"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/bag/salvagestorage/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = WEIGHT_CLASS_NORMAL * 30
	STR.max_items = 30
	CANHOLD_STATIC(STR, typecacheof(list(/obj/item/advanced_crafting_components, /obj/item/stack/crafting, /obj/item/crafting, /obj/item/multitool/advanced, /obj/item/crowbar/hightech, /obj/item/wrench/hightech, /obj/item/weldingtool/hightech, /obj/item/screwdriver/hightech, /obj/item/wirecutters/hightech, /obj/item/blueprint/research, /obj/item/multitool/advanced)))

