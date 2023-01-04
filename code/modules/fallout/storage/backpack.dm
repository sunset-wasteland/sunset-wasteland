/obj/item/storage/backpack/spearquiver
	name = "sturdy quiver"
	desc = "A leather and iron quiver designed to hold throwing spears and bolas."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "spearquiver"
	item_state = "spearquiver"
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT

/obj/item/storage/backpack/spearquiver/empty

/obj/item/storage/backpack/spearquiver/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	CANHOLD_STATIC(STR, typecacheof(list(/obj/item/throwing_star/spear, /obj/item/restraints/legcuffs/bola)))

/obj/item/storage/backpack/spearquiver/PopulateContents()
	new /obj/item/throwing_star/spear(src)
	new /obj/item/throwing_star/spear(src)
	new /obj/item/throwing_star/spear(src)
	new /obj/item/throwing_star/spear(src)
	new /obj/item/throwing_star/spear(src)

/obj/item/storage/backpack/spearquiver/empty/PopulateContents()
	return

/obj/item/storage/backpack/spearquiver/AltClick(mob/living/carbon/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(!length(user.get_empty_held_indexes()))
		to_chat(user, "<span class='warning'>Your hands are full!</span>")
		return
	var/obj/item/throwing_star/L = locate() in contents
	if(L)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, L, user)
		user.put_in_hands(L)
		to_chat(user, "<span class='notice'>You take a spear out of the quiver.</span>")
		return TRUE
	var/obj/item/restraints/legcuffs/W = locate() in contents
	if(W && contents.len > 0)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, W, user)
		user.put_in_hands(W)
		to_chat(user, "<span class='notice'>You take a bola out of the quiver.</span>")
	else
		to_chat(user, "<span class='notice'>There is nothing left in the quiver.</span>")
	return TRUE

/obj/item/storage/backpack/duffelbag/equipment/update_icon_state()
	if(contents.len == 0)
		qdel(src)

/obj/item/storage/backpack/duffelbag/scavengers
	name = "scavenger's duffel bag"
	desc = "An extra large duffel bag for holding extra things."
	slowdown = 1.2

/obj/item/storage/backpack/duffelbag/scavengers/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_combined_w_class = 40

/obj/item/storage/backpack/trekker
	name = "trekkers pack"
	desc = "A light and durable pack often seen in use by those prone to wandering the wastes, often alone."
	icon_state = "trekkerpack"
	item_state = "trekkerpack"

/obj/item/storage/backpack/satchel/trekker
	name = "trekkers satchel"
	desc = "A light and durable satchel often seen in use by those prone to wandering the wastes, often alone."
	icon_state = "satchel-trekker"
	item_state = "satchel-trekker"

/obj/item/storage/backpack/satchel/old
	name = "old satchel"
	desc = "The leather is stiff and cracking, but the satchel still works."
	icon = 'icons/fallout/clothing/khans.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/khaans.dmi'
	lefthand_file = 'icons/fallout/onmob/items/bags_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/items/bags_righthand.dmi'
	icon_state = "satchel_old"
	item_state = "satchel_old"

/obj/item/storage/backpack/enclave
	name = "service backpack"
	desc = "Backpack copying an old US Army pattern."
	icon_state = "backpack_enclave"
	item_state = "backpack_enclave"

/obj/item/storage/backpack/satchel/enclave
	name = "service satchel"
	desc = "Satchel modeled after old US Army pattern."
	icon_state = "satchel_enclave"
	item_state = "satchel_enclave"

/obj/item/storage/backpack/legionr
	name = "Legion red flag"
	desc = "Legion cape made from what looks like red piece of cloth, with a golden bull on the back. With a lot of pockets underneath"
	icon_state = "legioncaper"
	item_state = "legioncaper"

/obj/item/storage/backpack/legionb
	name = "Legion black flag"
	desc = "Legion cape made from what looks like black piece of cloth, with a golden bull on the back. With a lot of pockets underneath"
	icon_state = "legioncapeb"
	item_state = "legioncapeb"
