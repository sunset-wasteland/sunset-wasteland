/obj/item/storage/belt
	name = "belt"
	desc = "Can hold various things."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "utilitybelt"
	item_state = "utility"
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	attack_verb = list("whipped", "lashed", "disciplined")
	max_integrity = 300
	var/content_overlays = FALSE //If this is true, the belt will gain overlays based on what it's holding
	var/onmob_overlays = FALSE //worn counterpart of the above.

/obj/item/storage/belt/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins belting [user.p_them()]self with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/obj/item/storage/belt/update_overlays()
	. = ..()
	if(content_overlays)
		for(var/obj/item/I in contents)
			. += I.get_belt_overlay()

/obj/item/storage/belt/worn_overlays(isinhands, icon_file, used_state, style_flags = NONE)
	. = ..()
	if(!isinhands && onmob_overlays)
		for(var/obj/item/I in contents)
			. += I.get_worn_belt_overlay(icon_file)

/obj/item/storage/belt/Initialize()
	. = ..()
	update_icon()

/obj/item/storage/belt/ComponentInitialize()
	. = ..()
	if(onmob_overlays)
		AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/storage/belt/utility
	name = "toolbelt" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "Holds tools."
	icon_state = "utilitybelt"
	item_state = "utility"
	content_overlays = TRUE
	custom_premium_price = 300
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE //because this is easier than trying to have showers wash all contents.

/obj/item/storage/belt/utility/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	var/static/list/can_hold = typecacheof(list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/t_scanner,
		/obj/item/analyzer,
		/obj/item/geiger_counter,
		/obj/item/extinguisher/mini,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/holosign_creator,
		/obj/item/forcefield_projector,
		/obj/item/assembly/signaler
		))
	STR.can_hold = can_hold

/obj/item/storage/belt/utility/chief
	name = "\improper Chief Engineer's toolbelt" //"the Chief Engineer's toolbelt", because "Chief Engineer's toolbelt" is not a proper noun
	desc = "Holds tools, looks snazzy."
	icon_state = "utilitybelt_ce"
	item_state = "utility_ce"

/obj/item/storage/belt/utility/full/engi/PopulateContents()
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/weldingtool/experimental(src)//This can be changed if this is too much
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src,30,pick("blue"))
	new /obj/item/extinguisher/mini(src)
	new /obj/item/analyzer/ranged(src)
	//much roomier now that we've managed to remove two tools

/obj/item/storage/belt/utility/full/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/wirecutters(src)
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src,30,pick("red"))

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
	STR.can_hold = typecacheof(list(
		/obj/item/ammo_box/shotgun,
		/obj/item/ammo_box/lasmusket,
		/obj/item/reagent_containers/food/drinks/flask,
		/obj/item/grenade/f13,
		/obj/item/reagent_containers/food/drinks/bottle/molotov,
		/obj/item/grenade/homemade
		))


// END OF FALLOUT BELTS
// ------------------------------------------------------

/obj/item/storage/belt/utility/servant/PopulateContents()
	new /obj/item/screwdriver/brass(src)
	new /obj/item/wirecutters/brass(src)
	new /obj/item/wrench/brass(src)
	new /obj/item/weldingtool/experimental/brass(src)
	new /obj/item/multitool/advanced/brass(src)
	new /obj/item/stack/cable_coil(src, 30, "yellow")

/obj/item/storage/belt/medical
	name = "medical belt"
	desc = "Can hold various medical equipment."
	icon_state = "medicalbelt"
	item_state = "medical"
	content_overlays = TRUE

/obj/item/storage/belt/medical/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.can_hold = typecacheof(list(
		/obj/item/healthanalyzer,
		/obj/item/dnainjector,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/medspray,
		/obj/item/lighter,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/medical,
		/obj/item/flashlight/pen,
		/obj/item/extinguisher/mini,
		/obj/item/reagent_containers/hypospray,
		/obj/item/hypospray/mkii,
		/obj/item/sensor_device,
		/obj/item/radio,
		/obj/item/clothing/gloves/,
		/obj/item/lazarus_injector,
		/obj/item/clothing/mask/surgical,
		/obj/item/clothing/mask/breath,
		/obj/item/clothing/mask/breath/medical,
		/obj/item/surgical_drapes, //for true paramedics
		/obj/item/scalpel,
		/obj/item/circular_saw,
		/obj/item/bonesetter,
		/obj/item/surgicaldrill,
		/obj/item/retractor,
		/obj/item/cautery,
		/obj/item/hemostat,
		/obj/item/geiger_counter,
		/obj/item/clothing/neck/stethoscope,
		/obj/item/stamp,
		/obj/item/clothing/glasses,
		/obj/item/wrench/medical,
		/obj/item/clothing/mask/muzzle,
		/obj/item/storage/bag/chemistry,
		/obj/item/storage/bag/bio,
		/obj/item/reagent_containers/blood,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/implantcase,
		/obj/item/implant,
		/obj/item/implanter,
		/obj/item/pinpointer/crew,
		/obj/item/reagent_containers/chem_pack,
		/obj/item/weldingtool/basic,
		/obj/item/stack/sticky_tape, //surgical tape
		/obj/item/handsaw
		))



/obj/item/storage/belt/medical/surgery_belt_adv
	name = "surgical supply belt"
	desc = "A specialized belt designed for holding surgical equipment. It seems to have specific pockets for each and every surgical tool you can think of."
	content_overlays = FALSE

/obj/item/storage/belt/medical/surgery_belt_adv/PopulateContents()
	new /obj/item/scalpel/advanced(src)
	new /obj/item/retractor/advanced(src)
	new /obj/item/surgicaldrill/advanced(src)
	new /obj/item/surgical_drapes/advanced(src)

/obj/item/storage/belt/security
	name = "security belt"
	desc = "Can hold security gear like handcuffs and flashes."
	icon_state = "securitybelt"
	item_state = "security"//Could likely use a better one.
	content_overlays = TRUE

/obj/item/storage/belt/security/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 5
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.can_hold = typecacheof(list(
		/obj/item/melee/baton,
		/obj/item/melee/classic_baton,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/melee/onehanded/knife/hunting,
		/obj/item/flashlight/seclite,
		/obj/item/melee/classic_baton/telescopic,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/restraints/legcuffs/bola
		))

/obj/item/storage/belt/security/full/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/melee/baton/loaded(src)
	update_icon()

/obj/item/storage/belt/mining
	name = "explorer's webbing"
	desc = "A versatile chest rig, cherished by miners and hunters alike."
	icon_state = "explorer1"
	item_state = "explorer1"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/belt/mining/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.max_combined_w_class = 20
	STR.can_hold = typecacheof(list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/analyzer,
		/obj/item/extinguisher/mini,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/resonator,
		/obj/item/mining_scanner,
		/obj/item/pickaxe,
		/obj/item/stack/sheet/animalhide,
		/obj/item/stack/sheet/sinew,
		/obj/item/stack/sheet/bone,
		/obj/item/lighter,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/reagent_containers/food/drinks/bottle,
		/obj/item/stack/medical,
		/obj/item/kitchen/knife,
		/obj/item/reagent_containers/hypospray,
		/obj/item/gps,
		/obj/item/storage/bag/ore,
		/obj/item/survivalcapsule,
		/obj/item/t_scanner/adv_mining_scanner,
		/obj/item/reagent_containers/pill,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/ore,
		/obj/item/reagent_containers/food/drinks,
		/obj/item/organ/regenerative_core,
		/obj/item/wormhole_jaunter,
		/obj/item/storage/bag/plants,
		/obj/item/stack/marker_beacon,
		/obj/item/melee/baton,
		/obj/item/melee/classic_baton,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/flashlight/seclite,
		/obj/item/melee/classic_baton/telescopic,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/restraints/legcuffs/bola
		))


/obj/item/storage/belt/mining/vendor
	contents = newlist(/obj/item/survivalcapsule)

/obj/item/storage/belt/mining/alt
	icon_state = "explorer2"
	item_state = "explorer2"

/obj/item/storage/belt/mining/primitive
	name = "hunter's belt"
	desc = "A versatile belt, woven from sinew."
	icon_state = "ebelt"
	item_state = "ebelt"

/obj/item/storage/belt/mining/primitive/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 5

/obj/item/storage/belt/champion
	name = "championship belt"
	desc = "Proves to the world that you are the strongest!"
	icon_state = "championbelt"
	item_state = "champion"
	custom_materials = list(/datum/material/gold=400)

/obj/item/storage/belt/champion/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.can_hold = list(
		/obj/item/clothing/mask/luchador
		)

/obj/item/storage/belt/military
	name = "chest rig"
	desc = "A set of tactical webbing worn by Syndicate boarding parties."
	icon_state = "militarywebbing"
	item_state = "militarywebbing"
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/item/storage/belt/military/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/belt/military/snack
	name = "tactical snack rig"

/obj/item/storage/belt/military/snack/Initialize()
	. = ..()
	var/sponsor = pick("DonkCo", "Waffle Co.", "Roffle Co.", "Gorlax Marauders", "Tiger Cooperative")
	desc = "A set of snack-tical webbing worn by athletes of the [sponsor] VR sports division."

/obj/item/storage/belt/military/snack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.can_hold = typecacheof(list(
		/obj/item/reagent_containers/food/snacks,
		/obj/item/reagent_containers/food/drinks
		))

	var/amount = 5
	var/rig_snacks
	while(contents.len <= amount)
		rig_snacks = pick(list(
		/obj/item/reagent_containers/food/snacks/candy,
		/obj/item/reagent_containers/food/drinks/dry_ramen,
		/obj/item/reagent_containers/food/snacks/chips,
		/obj/item/reagent_containers/food/snacks/sosjerky,
		/obj/item/reagent_containers/food/snacks/syndicake,
		/obj/item/reagent_containers/food/snacks/spacetwinkie,
		/obj/item/reagent_containers/food/snacks/cheesiehonkers,
		/obj/item/reagent_containers/food/snacks/nachos,
		/obj/item/reagent_containers/food/snacks/cheesynachos,
		/obj/item/reagent_containers/food/snacks/cubannachos,
		/obj/item/reagent_containers/food/snacks/nugget,
		/obj/item/reagent_containers/food/snacks/pastatomato,
		/obj/item/reagent_containers/food/snacks/rofflewaffles,
		/obj/item/reagent_containers/food/snacks/donkpocket,
		/obj/item/reagent_containers/food/drinks/soda_cans/cola,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind,
		/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb,
		/obj/item/reagent_containers/food/drinks/soda_cans/starkist,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_up,
		/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game,
		/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime,
		/obj/item/reagent_containers/food/drinks/drinkingglass/filled/nuka_cola,
		/obj/item/reagent_containers/food/drinks/drinkingglass/filled/syndicatebomb
		))
		new rig_snacks(src)

/obj/item/storage/belt/military/abductor
	name = "agent belt"
	desc = "A belt used by abductor agents."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "belt"
	item_state = "security"

/obj/item/storage/belt/military/abductor/full/PopulateContents()
	new /obj/item/screwdriver/abductor(src)
	new /obj/item/wrench/abductor(src)
	new /obj/item/weldingtool/abductor(src)
	new /obj/item/crowbar/abductor(src)
	new /obj/item/wirecutters/abductor(src)
	new /obj/item/multitool/abductor(src)
	new /obj/item/stack/cable_coil(src,30,"white")

/obj/item/storage/belt/military/army
	name = "army belt"
	desc = "A belt used by military forces."
	icon_state = "grenadebeltold"
	item_state = "security"

/obj/item/storage/belt/military/assault
	name = "assault belt"
	desc = "A tactical assault belt."
	icon_state = "assaultbelt"
	item_state = "security"

/obj/item/storage/belt/military/assault/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7


/obj/item/storage/belt/military/army/military/followers/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/melee/classic_baton(src)
	new /obj/item/melee/onehanded/knife/hunting(src)
	update_icon()

/obj/item/storage/belt/durathread
	name = "durathread toolbelt"
	desc = "A toolbelt made out of durathread, it seems robust enough to hold bigger tools like RCDs or RPDs, with enough pouches to hold more gear than a normal belt."
	icon_state = "webbing-durathread"
	item_state = "webbing-durathread"
	resistance_flags = FIRE_PROOF
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE //If normal belts get this, the upgraded version should too

/obj/item/storage/belt/durathread/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 14
	STR.max_combined_w_class = 32
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.can_hold = typecacheof(list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/t_scanner,
		/obj/item/analyzer,
		/obj/item/geiger_counter,
		/obj/item/extinguisher,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/holosign_creator,
		/obj/item/forcefield_projector,
		/obj/item/assembly/signaler,
		/obj/item/lightreplacer,
		/obj/item/rcd_ammo,
		/obj/item/construction,
		/obj/item/stack/rods,
		/obj/item/stack/tile/plasteel,
		/obj/item/grenade/chem_grenade/metalfoam,
		/obj/item/grenade/chem_grenade/smart_metal_foam
		))

/obj/item/storage/belt/grenade
	name = "grenadier belt"
	desc = "A belt for holding grenades."
	icon_state = "grenadebeltnew"
	item_state = "security"
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/item/storage/belt/grenade/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 30
	STR.display_numerical_stacking = TRUE
	STR.max_combined_w_class = 60
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.can_hold = typecacheof(list(
		/obj/item/grenade,
		/obj/item/screwdriver,
		/obj/item/lighter,
		/obj/item/multitool,
		/obj/item/reagent_containers/food/drinks/bottle/molotov,
		/obj/item/grenade/plastic/c4,
		))

/obj/item/storage/belt/grenade/full/PopulateContents()
	new /obj/item/grenade/flashbang(src)
	new /obj/item/grenade/smokebomb(src)
	new /obj/item/grenade/smokebomb(src)
	new /obj/item/grenade/smokebomb(src)
	new /obj/item/grenade/smokebomb(src)
	new /obj/item/grenade/empgrenade(src)
	new /obj/item/grenade/empgrenade(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/incendiary(src)
	new /obj/item/grenade/chem_grenade/facid(src)
	new /obj/item/grenade/syndieminibomb(src)
	new /obj/item/grenade/syndieminibomb(src)
	new /obj/item/screwdriver(src)
	new /obj/item/multitool(src)

/obj/item/storage/belt/janitor
	name = "janibelt"
	desc = "A belt used to hold most janitorial supplies."
	icon_state = "janibelt"
	item_state = "janibelt"

/obj/item/storage/belt/janitor/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6
	STR.max_w_class = WEIGHT_CLASS_BULKY // Set to this so the  light replacer can fit.
	STR.can_hold = typecacheof(list(
		/obj/item/grenade/chem_grenade,
		/obj/item/lightreplacer,
		/obj/item/flashlight,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/spray,
		/obj/item/soap,
		/obj/item/holosign_creator,
		/obj/item/forcefield_projector,
		/obj/item/key/janitor,
		/obj/item/clothing/gloves,
		/obj/item/melee/flyswatter,
		/obj/item/broom,
		/obj/item/paint/paint_remover,
		/obj/item/assembly/mousetrap,
		/obj/item/screwdriver,
		/obj/item/stack/cable_coil
		))



/obj/item/storage/belt/utility
	name = "toolbelt" //Carn: utility belt is nicer, but it bamboozles the text parsing.
	desc = "Holds tools."
	icon_state = "utilitybelt"
	item_state = "utility"
	content_overlays = TRUE
	custom_premium_price = 300


/obj/item/storage/belt/bandolier/durathread
	name = "durathread bandolier"
	desc = "An double stacked bandolier made out of durathread."
	icon_state = "bandolier-durathread"
	item_state = "bandolier-durathread"
	resistance_flags = FIRE_PROOF

/obj/item/storage/belt/bandolier/durathread/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 32
	STR.display_numerical_stacking = TRUE
	STR.can_hold = typecacheof(list(
		/obj/item/ammo_casing
		))

//CIT QUIVER
/*/obj/item/storage/belt/quiver
	name = "leather quiver"
	desc = "A quiver made from the hide of some animal. Used to hold arrows."
	icon_state = "quiver"
	item_state = "quiver"

/obj/item/storage/belt/quiver/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 15
	STR.display_numerical_stacking = TRUE
	STR.can_hold = typecacheof(list(
		/obj/item/ammo_casing/caseless/arrow
		))
*/
/obj/item/storage/belt/medolier
	name = "medolier"
	desc = "A medical bandolier for holding smartdarts."
	icon_state = "medolier"
	item_state = "medolier"

/obj/item/storage/belt/medolier/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 15
	STR.display_numerical_stacking = FALSE
	STR.allow_quick_gather = TRUE
	STR.allow_quick_empty = TRUE
	STR.click_gather = TRUE
	STR.can_hold = typecacheof(list(
		/obj/item/reagent_containers/syringe/dart,
		/obj/item/storage/pill_bottle,
		/obj/item/reagent_containers/medspray,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/glass/bottle
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/syringe
		))

/obj/item/storage/belt/medolier/full/PopulateContents()
	for(var/i in 1 to 16)
		new /obj/item/reagent_containers/syringe/dart/(src)

/obj/item/storage/belt/medolier/afterattack(obj/target, mob/user , proximity)
	if(!(istype(target, /obj/item/reagent_containers/glass/beaker)))
		return
	if(!proximity)
		return
	if(!target.reagents)
		return

	for(var/obj/item/reagent_containers/syringe/dart/D in contents)
		if(round(target.reagents.total_volume, 1) <= 0)
			to_chat(user, "<span class='notice'>You soak as many of the darts as you can with the contents from [target].</span>")
			return
		if(D.mode == SYRINGE_INJECT)
			continue

		D.afterattack(target, user, proximity)

	..()

/obj/item/storage/belt/holster
	name = "shoulder holster"
	desc = "A holster to carry a handgun and ammo. WARNING: Badasses only."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "holster_shoulder"
	item_state = "holster_shoulder"
	alternate_worn_layer = UNDER_SUIT_LAYER
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_NECK

/obj/item/storage/belt/holster/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 4
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.can_hold = typecacheof(list(
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/gun/ballistic/revolver,
		/obj/item/ammo_box/magazine,
		/obj/item/ammo_box/tube,
		/obj/item/ammo_box/a357,
		/obj/item/ammo_box/c38,
		/obj/item/ammo_box/l10mm,
		/obj/item/ammo_box/a762,
		/obj/item/ammo_box/shotgun,
		/obj/item/ammo_box/m44,
		/obj/item/ammo_box/a762,
		/obj/item/ammo_box/a556/stripper,
		/obj/item/ammo_box/needle,
		/obj/item/ammo_box/a308,
		/obj/item/ammo_box/c4570,
		/obj/item/ammo_box/a50MG,
		/obj/item/ammo_box/c45rev,
		/obj/item/ammo_box/a45lcrev,
		/obj/item/gun/energy/laser/solar,
		/obj/item/gun/energy/laser/pistol,
		/obj/item/gun/energy/laser/auto,
		/obj/item/gun/energy/laser/complianceregulator,
		/obj/item/gun/energy/laser/plasma/pistol,
		/obj/item/gun/energy/laser/plasma/glock,
		/obj/item/gun/energy/laser/plasma/glock/extended,
		/obj/item/gun/energy/laser/wattz,
		/obj/item/gun/energy/laser/wattz/magneto,
		/obj/item/gun/energy/laser/plasma/pistol/alien,
		/obj/item/stock_parts/cell/ammo/ec,
		/obj/item/stock_parts/cell/ammo/ecp,
		))

/obj/item/storage/belt/holster/full/PopulateContents()
	new /obj/item/gun/ballistic/revolver/detective(src)
	new /obj/item/ammo_box/c38(src)
	new /obj/item/ammo_box/c38(src)

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

/obj/item/storage/belt/fannypack
	name = "fannypack"
	desc = "A dorky fannypack for keeping small items in."
	icon_state = "fannypack_leather"
	item_state = "fannypack_leather"
	dying_key = DYE_REGISTRY_FANNYPACK
	custom_price = PRICE_ALMOST_CHEAP

/obj/item/storage/belt/fannypack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 3
	STR.max_w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/belt/fannypack/black
	name = "black fannypack"
	icon_state = "fannypack_black"
	item_state = "fannypack_black"

/obj/item/storage/belt/fannypack/orange
	name = "orange fannypack"
	icon_state = "fannypack_orange"
	item_state = "fannypack_orange"

/obj/item/storage/belt/fannypack/pink
	name = "pink fannypack"
	icon_state = "fannypack_pink"
	item_state = "fannypack_pink"


/obj/item/storage/belt/sabre
	name = "sword sheath"
	desc = "A fine sheath for carrying a sword in style."
	icon_state = "utilitybelt"
	item_state = "utility"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE
	onmob_overlays = TRUE
	var/list/fitting_swords = list(/obj/item/melee/sabre, /obj/item/melee/baton/stunsword)
	var/starting_sword = /obj/item/melee/sabre

/obj/item/storage/belt/sabre/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 1
	STR.rustle_sound = FALSE
	STR.max_w_class = WEIGHT_CLASS_BULKY
	STR.can_hold = typecacheof(fitting_swords)
	STR.quickdraw = TRUE

/obj/item/storage/belt/sabre/examine(mob/user)
	. = ..()
	if(length(contents))
		. += "<span class='notice'>Alt-click it to quickly draw the blade.</span>"

/obj/item/storage/belt/sabre/PopulateContents()
	if(ispath(starting_sword))
		new starting_sword(src)

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


/obj/item/storage/belt/sabre/rapier
	name = "rapier sheath"
	desc = "A sinister, thin sheath, suitable for a rapier."
	icon_state = "rsheath"
	item_state = "rsheath"
	force = 5
	throwforce = 15
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("bashed", "slashes", "prods", "pokes")
	fitting_swords = list(/obj/item/melee/rapier)
	starting_sword = /obj/item/melee/rapier


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
	STR.can_hold = typecacheof(list(/obj/item/ammo_casing/caseless/arrow))
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
	STR.can_hold = typecacheof(list(/obj/item/ammo_casing/caseless/arrow))
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
