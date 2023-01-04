/obj/item/storage/pill_bottle/chem_tin/
	name = "chem tin"
	desc = "A branded tin made to hold ingestable chems."

/obj/item/storage/pill_bottle/chem_tin/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.allow_quick_gather = TRUE
	STR.click_gather = TRUE
	CANHOLD_STATIC(STR, typecacheof(list(/obj/item/reagent_containers/pill, /obj/item/reagent_containers/syringe, /obj/item/dice)))

// ---------------------------------------------
// MENTAT TIN

/obj/item/storage/pill_bottle/chem_tin/mentats
	name = "Mentats tin"
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_mentats"
	desc = "Contains pills used to increase intelligence and perception."

/obj/item/storage/pill_bottle/chem_tin/mentats/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/mentat(src)

// ---------------------------------------------
// FIXER TIN

/obj/item/storage/pill_bottle/chem_tin/fixer
	name = "Fixer tin"
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_fixer"
	desc = "Contains pills used to treat addiction and overdose on other chems."

/obj/item/storage/pill_bottle/chem_tin/fixer/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/fixer(src)

// ---------------------------------------------
// RAD-X PILL BOTTLE

/obj/item/storage/pill_bottle/chem_tin/radx
	name = "Rad-X bottle"
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_radx"
	desc = "Contains pills used to treat and prevent radiation and minor toxin damage."

/obj/item/storage/pill_bottle/chem_tin/radx/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/radx(src)

// ---------------------------------------------
// BUFFOUT PILL BOTTLE

/obj/item/storage/pill_bottle/chem_tin/buffout
	name = "Buffout bottle"
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "pill_canister_buffout"
	desc = "Contains pills used to increase muscle mass."

/obj/item/storage/pill_bottle/chem_tin/buffout/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/buffout(src)


// ---------------------------------------------
// WATER PURIFICATION TABLETS

/obj/item/storage/pill_bottle/chem_tin/waterpuretablet
	name = "Water Purification Tablets"
	icon_state = "pill_canister_water"
	desc = "Contains tablets used to treat dirty water. Simply drop a tablet in a bottle or cup, and wait a few seconds."

/obj/item/storage/pill_bottle/chem_tin/waterpuretablet/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/waterpuretablet(src)

// ---------------------------------------------
// NUTRIMENT TABLETS

/obj/item/storage/pill_bottle/chem_tin/foodpaste
	name = "Nutriment Tablets"
	icon_state = "pill_canister_paste"
	desc = "Contains tablets that contain nutriments needed for survival. Don't take more than one every five minutes at once, to avoid wasting them all."

/obj/item/storage/pill_bottle/chem_tin/foodpaste/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/foodpaste(src)
