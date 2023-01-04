// --------------------------------------------------------
// FALLOUT BELTS

// Wasteland toolbelt
/obj/item/storage/belt/utility/waster
	name = "wastelander toolbelt"
	desc = "Holds a collection of simple tools."

/obj/item/storage/belt/utility/waster/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	var/static/list/can_hold = typecacheof(list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/analyzer,
		/obj/item/geiger_counter,
		/obj/item/extinguisher/mini,
		/obj/item/radio,
		/obj/item/assembly/signaler,
		/obj/item/twohanded/chainsaw,
		/obj/item/melee/smith/hammer,
		))
	STR.can_hold = can_hold

/obj/item/storage/belt/utility/waster/PopulateContents()
	new /obj/item/crowbar(src)
	new /obj/item/wrench(src)
	new /obj/item/screwdriver/basic(src)
	new /obj/item/weldingtool/basic(src)
	new /obj/item/wirecutters/basic(src)
	new /obj/item/stack/cable_coil(src,30,pick("yellow","orange"))

// Forgemaster toolbelt (made to make the old chainsaw 2h component bearable, phase out unless needed, wasteland toobelt should suffice)
/obj/item/storage/belt/utility/waster/forgemaster
	name = "forgemasters toolbelt"
	desc = "Has a collection of basic tools and a hook rigging to sling a chainsaw from."
	var/max_combined_w_class = WEIGHT_CLASS_SMALL * 8

/obj/item/storage/belt/utility/waster/forgemaster/PopulateContents()
	new /obj/item/crowbar(src)
	new /obj/item/wrench(src)
	new /obj/item/screwdriver/basic(src)
	new /obj/item/weldingtool/basic(src)
	new /obj/item/wirecutters/basic(src)
	new /obj/item/melee/smith/hammer/premade(src)
	new /obj/item/twohanded/chainsaw(src)

/obj/item/storage/belt/utility/waster/forgemaster/khan
	name = "smith toolbelt"

// Gardener belt. Hold farming stuff thats small, also flasks (think hip flasks, not bottles as such)
/obj/item/storage/belt/utility/gardener
	name = "gardeners toolbelt"
	desc = "Leather belt with straps for various smaller farming equipment, bags and hip flasks."
	icon = 'icons/fallout/clothing/belts.dmi'
	icon_state = "gardener"
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'

/obj/item/storage/belt/utility/gardener/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	var/static/list/can_hold = typecacheof(list(
		/obj/item/shovel/spade,
		/obj/item/cultivator,
		/obj/item/hatchet,
		/obj/item/book/manual/advice_farming,
		/obj/item/reagent_containers/glass/bottle/nutrient,
		/obj/item/reagent_containers/glass/bottle/killer,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/storage/bag/plants, // remove if it gets abused to breaking somehow
		/obj/item/plant_analyzer, // out of place but mechanically useful for the foreseeable future, so included for QoL
		))
	STR.can_hold = can_hold

// Primitive medical belt, meant to be part of a ghetto surgery improvement at some point
/obj/item/storage/belt/medical/primitive
	name = "primitive medical toolbelt"
	desc = "This might look a bit like a toolbelt for a carpenter, but the items inside are meant to be used in surgery. No really."
	content_overlays = FALSE

/obj/item/storage/belt/medical/primitive/PopulateContents()
	new /obj/item/surgical_drapes(src)
	new /obj/item/scalpel (src)
	new /obj/item/handsaw(src)
	new /obj/item/retractor(src)
	new /obj/item/hemostat(src)
	new /obj/item/weldingtool/basic(src)
	new /obj/item/bonesetter(src)

// ---------------------------------------------
// BANDOLIER - since TG style bandolier was useless, now takes 3 boxes of shotgun ammo, or flasks, or grenades, or improvised bombs/molotovs
/obj/item/storage/belt/bandolier
	name = "bandolier"
	desc = "A bandolier for holding shotgun boxes, flasks, las musket cells or various grenades."
	icon_state = "bandolier"
	item_state = "bandolier"
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/item/storage/belt/bandolier/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 3
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	CANHOLD_STATIC(STR, typecacheof(list(
		/obj/item/ammo_box/shotgun,
		/obj/item/ammo_box/lasmusket,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/grenade/f13,
		/obj/item/reagent_containers/food/drinks/bottle/molotov,
		/obj/item/grenade/homemade
		)))

/obj/item/storage/belt/sabre/heavy
	name = "heavy-duty sheath"
	desc = "A rugged set of leather straps and metal tips to comfortably carry a large variety of blades (and even blunt objects) on your side."
	icon_state = "sheath"
	item_state = "sheath"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE
	onmob_overlays = TRUE
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_NECK
	fitting_swords = list(/obj/item/melee/smith/machete,
	/obj/item/melee/smith/machete/reforged,
	/obj/item/melee/smith/wakizashi,
	/obj/item/melee/smith/sword,
	/obj/item/melee/smith/twohand/axe,
	/obj/item/melee/smith/twohand/katana,
	/obj/item/melee/smith/sword/sabre,
	/obj/item/melee/onehanded/machete,
	/obj/item/melee/onehanded/club,
	/obj/item/melee/classic_baton,
	/obj/item/twohanded/fireaxe,
	/obj/item/twohanded/baseball,
	/obj/item/twohanded/sledgehammer/simple,
	/obj/item/melee/transforming/energy/axe/protonaxe,
	/obj/item/melee/powered/ripper)
	starting_sword = null

/obj/item/storage/belt/holster/ranger44/PopulateContents()
	new /obj/item/gun/ballistic/revolver/revolver44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)

/obj/item/storage/belt/holster/ranger357/PopulateContents()
	new /obj/item/gun/ballistic/revolver/colt357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)

/obj/item/storage/belt/holster/ranger45/PopulateContents()
	new /obj/item/gun/ballistic/revolver/revolver45(src)
	new /obj/item/ammo_box/c45rev(src)
	new /obj/item/ammo_box/c45rev(src)
	new /obj/item/ammo_box/c45rev(src)

/obj/item/storage/belt/holster/ranger4570/PopulateContents()
	new /obj/item/gun/ballistic/revolver/sequoia(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)

/obj/item/storage/belt/holster/ranger4570bayonet/PopulateContents()
	new /obj/item/gun/ballistic/revolver/sequoia/bayonet(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)

/obj/item/storage/belt/holster/sheriff/PopulateContents()
	new /obj/item/gun/ballistic/revolver/revolver44/sheriff(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)

/obj/item/storage/belt/holster/regulator/PopulateContents()
	new /obj/item/gun/energy/laser/complianceregulator(src)
	new /obj/item/stock_parts/cell/ammo/ec(src)
	new /obj/item/stock_parts/cell/ammo/ec(src)
	new /obj/item/stock_parts/cell/ammo/ec(src)

/obj/item/storage/belt/holster/legholster
	name = "leg holster"
	desc = "A holster to carry a handgun and ammo worn on the leg."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "holster_leg"
	item_state = "holster_leg"

/obj/item/storage/belt/holster/legholster/police/PopulateContents()
	new /obj/item/gun/ballistic/revolver/police(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)


/obj/item/storage/belt/sword // new that works
	name = "sword sheath"
	desc = "A fine sheath for carrying a sword in style."
	icon = 'icons/fallout/clothing/belts.dmi'
	icon_state = "sheath_sword"
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	item_state = "sheath_sword"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE
	onmob_overlays = TRUE
	var/list/fitting_swords = list(/obj/item/melee/smith/sword, /obj/item/melee/baton/stunsword)

// Instead of half-assed broken weaboo stuff lets have something that works.
/obj/item/storage/belt/sword/twin
	name = "daishō"
	desc = "A set of sheathes and straps for carrying two curved japanese style swords."
	icon_state = "sheath_twin"
	item_state = "sheath_twin"
	fitting_swords = list(/obj/item/melee/smith/wakizashi, /obj/item/melee/smith/twohand/katana, /obj/item/melee/bokken)

/obj/item/storage/belt/sword/twin/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 2
	STR.max_w_class = WEIGHT_CLASS_BULKY + WEIGHT_CLASS_NORMAL //katana and waki.
	STR.can_hold = typecacheof(fitting_swords)
	STR.quickdraw = TRUE

/obj/item/storage/belt/military/alt
	icon_state = "explorer2"
	item_state = "explorer2"

/obj/item/storage/belt/military/assault/legion
	name = "legionnaire marching belt"
	desc = "Sturdy leather belt with a red decorative sash."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "belt_legion"
	item_state = "belt_legion"

/obj/item/storage/belt/military/assault/enclave
	name = "old style army belt"
	desc = "Prewar army utility belt design."
	icon_state = "enclave_belt"
	item_state = "enclave_belt"

/obj/item/storage/belt/military/assault/ncr
	name = "NCR patrol belt"
	desc = "A standard issue robust duty belt for the NCR."
	icon_state = "ncr_belt"
	item_state = "ncr_belt"

/obj/item/storage/belt/military/assault/ncr/engineer/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/wirecutters(src)
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))

/obj/item/storage/belt/military/reconbandolier
	name = "NCR recon ranger bandolier"
	desc = "A belt with many pockets, now at an angle."
	icon_state = "reconbandolier"
	item_state = "reconbandolier"

/obj/item/storage/belt/military/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/belt/military/NCR_Bandolier
	name = "NCR bandolier"
	desc = "A standard issue NCR bandolier."
	icon_state = "ncr_bandolier"
	item_state = "ncr_bandolier"

/obj/item/storage/belt/military/NCR_Bandolier/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7

//Regular Quiver
/obj/item/storage/belt/tribe_quiver
	name = "tribal quiver"
	desc = "A simple leather quiver designed for holding arrows."
	icon_state = "tribal_quiver"
	item_state = "tribal_quiver"

/obj/item/storage/belt/tribe_quiver/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8
	CANHOLD_STATIC(STR, typecacheof(list(/obj/item/ammo_casing/caseless/arrow)))
	STR.max_w_class = 3
	STR.max_combined_w_class = 24

/obj/item/storage/belt/tribe_quiver/PopulateContents()
	new /obj/item/ammo_casing/caseless/arrow(src)
	new /obj/item/ammo_casing/caseless/arrow(src)
	new /obj/item/ammo_casing/caseless/arrow(src)
	new /obj/item/ammo_casing/caseless/arrow(src)
	new /obj/item/ammo_casing/caseless/arrow(src)
	new /obj/item/ammo_casing/caseless/arrow(src)
	new /obj/item/ammo_casing/caseless/arrow(src)
	new /obj/item/ammo_casing/caseless/arrow(src)

/obj/item/storage/belt/tribe_quiver/AltClick(mob/living/carbon/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(!length(user.get_empty_held_indexes()))
		to_chat(user, "<span class='warning'>Your hands are full!</span>")
		return
	var/obj/item/ammo_casing/caseless/arrow/L = locate() in contents
	if(L)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, L, user)
		user.put_in_hands(L)
		to_chat(user, "<span class='notice'>You take \a [L] out of the quiver.</span>")
		return TRUE
	var/obj/item/ammo_casing/caseless/W = locate() in contents
	if(W && contents.len > 0)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, W, user)
		user.put_in_hands(W)
		to_chat(user, "<span class='notice'>You take \a [W] out of the quiver.</span>")
	else
		to_chat(user, "<span class='notice'>There is nothing left in the quiver.</span>")
	return TRUE

//Bone Arrow Quiver
/obj/item/storage/belt/tribe_quiver/bone
	name = "hunters quiver"
	desc = "A simple leather quiver designed for holding arrows, this one seems to hold deadlier arrows for hunting."
	icon_state = "tribal_quiver"
	item_state = "tribal_quiver"

/obj/item/storage/belt/tribe_quiver/bone/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8
	CANHOLD_STATIC(STR, typecacheof(list(/obj/item/ammo_casing/caseless/arrow)))
	STR.max_w_class = 3
	STR.max_combined_w_class = 24

/obj/item/storage/belt/tribe_quiver/bone/PopulateContents()
	new /obj/item/ammo_casing/caseless/arrow/bone(src)
	new /obj/item/ammo_casing/caseless/arrow/bone(src)
	new /obj/item/ammo_casing/caseless/arrow/bone(src)
	new /obj/item/ammo_casing/caseless/arrow/bone(src)
	new /obj/item/ammo_casing/caseless/arrow/bone(src)
	new /obj/item/ammo_casing/caseless/arrow/bone(src)
	new /obj/item/ammo_casing/caseless/arrow/bone(src)
	new /obj/item/ammo_casing/caseless/arrow/bone(src)

/obj/item/storage/belt/tribe_quiver/bone/AltClick(mob/living/carbon/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	if(!length(user.get_empty_held_indexes()))
		to_chat(user, "<span class='warning'>Your hands are full!</span>")
		return
	var/obj/item/ammo_casing/caseless/arrow/L = locate() in contents
	if(L)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, L, user)
		user.put_in_hands(L)
		to_chat(user, "<span class='notice'>You take \a [L] out of the quiver.</span>")
		return TRUE
	var/obj/item/ammo_casing/caseless/W = locate() in contents
	if(W && contents.len > 0)
		SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, W, user)
		user.put_in_hands(W)
		to_chat(user, "<span class='notice'>You take \a [W] out of the quiver.</span>")
	else
		to_chat(user, "<span class='notice'>There is nothing left in the quiver.</span>")
	return TRUE

/obj/item/storage/belt/military/army/military/followers/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/melee/classic_baton(src)
	new /obj/item/melee/onehanded/knife/hunting(src)
	update_icon()
