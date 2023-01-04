/obj/machinery/autolathe/constructionlathe
	name = "Workshop"
	desc = "Contains an array of custom made and skilled tools for professional craftsmen."
	circuit = /obj/item/circuitboard/machine/autolathe/constructionlathe
	super_advanced_technology = TRUE
	resistance_flags = NONE
	var/constage = 0 //construction stage for upgrading into a regular lathe
	//DRM = 1
	categories = list(
							"Tools",
							"Electronics",
							"Construction",
							"T-Comm",
							//"Security",
							"Machinery",
							"Medical",
							"Misc",
							"Dinnerware",
							)

/*
/obj/machinery/autolathe/constructionlathe/attackby(obj/item/O, mob/user, params)
	..()
	if(DRM && panel_open)
		if(constage == 0)
			if(istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_four))
				to_chat(user, "<span class='notice'>You upgrade [src] with ammunition schematics. You'll still need to bypass the DRM with some high-quality metal parts.</span>")
				constage = 1
				qdel(O)
		if(constage == 1)
			if(istype(O, /obj/item/stack/crafting/goodparts))
				var/obj/item/stack/crafting/goodparts/S = O
				if(S.get_amount() < 5)
					to_chat(user, "<span class='warning'>You need at least 5 high-quality metal parts to upgrade [src].</span>")
					return
				S.use(5)
				to_chat(user, "<span class='notice'>You upgrade [src] to bypass the DRM. You'll still need to install a makeshift reloader to finish the process.</span>")
				constage = 2
		if(constage == 2)
			if(istype(O, /obj/item/crafting/reloader))
				to_chat(user, "<span class='notice'>You upgrade [src] with a makeshift reloader, allowing it to finally produce ammunition again.</span>")
				constage = 3
				DRM = 0
				categories = list(
							"Tools",
							"Electronics",
							"Construction",
							"T-Comm",
							"Security",
							"Machinery",
							"Medical",
							"Misc",
							"Dinnerware",
							)
				hacked = TRUE
				name = "Workshop"
				desc = "Contains an array of custom made and skilled tools for professional craftsmen."
				qdel(O)
	if(panel_open)
		default_deconstruction_crowbar(O)
		return TRUE
	else
		attack_hand(user)
		return TRUE


/obj/machinery/autolathe/constructionlathe/can_build(datum/design/D, amount = 1)
	if("Security" in D.category)
		if(DRM == 1)
			return FALSE
		else
			. = ..()
	else
		. = ..()

/obj/machinery/autolathe/ui_interact(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.has_trait(TRAIT_TECHNOPHOBE, TRAIT_GENERIC))
			to_chat(user, "<span class='warning'>The array of simplistic button pressing confuses you. Besides, did you really want to spend all day staring at a screen?</span>")
			return FALSE
		else
			. = ..()
*/

/obj/machinery/autolathe/ammo
	name = "reloading bench"
	icon = 'icons/obj/machines/reloadingbench.dmi'
	desc = "An ammo bench that utilizes metal and other materials to make ammo and magazines."
	circuit = /obj/item/circuitboard/machine/autolathe/ammo
	stored_research = /datum/techweb/specialized/autounlocking/autolathe/ammo
	categories = list(
					"Simple Ammo",
					"Simple Magazines",
					"Basic Ammo",
					"Basic Magazines",
					"Intermediate Ammo",
					"Intermediate Magazines",
					"Advanced Ammo",
					"Advanced Magazines",
					"Materials"
					)
	allowed_materials = list(
		/datum/material/iron,
		/datum/material/titanium,
		/datum/material/blackpowder,
		/datum/material/uranium)
	var/simple = 0
	var/basic = 0
	var/intermediate = 0
	var/advanced = 0
	tooadvanced = TRUE //technophobes will still need to be able to make ammo	//not anymore they wont

/obj/machinery/autolathe/ammo/attackby(obj/item/O, mob/user, params)
	if(!busy && !stat && istype(O, /obj/item/storage/bag/casings))
		var/obj/item/storage/bag/casings/casings_bag = O
		var/datum/component/material_container/mats = GetComponent(/datum/component/material_container)
		var/count = 0
		if(INTERACTING_WITH(user, src))
			return
		if(!length(casings_bag.contents))
			to_chat(user, span_warning("There's nothing in \the [casings_bag] to load into \the [src]!"))
			return
		to_chat(user, span_notice("You start dumping \the [casings_bag] into \the [src]."))
		if(!do_after(user, 2 SECONDS, target = src))
			to_chat(user, span_notice("You stop dumping \the [casings_bag] into \the [src]."))
			return
		for(var/obj/item/ammo_casing/casing in casings_bag.contents)
			var/mat_amount = mats.get_item_material_amount(casing)
			if(!mat_amount)
				continue
			if(!mats.has_space(mat_amount))
				to_chat(user, span_warning("You can't fit any more in \the [src]!"))
				return
			if(!SEND_SIGNAL(casings_bag, COMSIG_TRY_STORAGE_TAKE, casing, src))
				continue
			// Forgive me for this.
			if(mats.after_insert)
				mats.after_insert.Invoke(casing, mats.last_inserted_id, mats.insert_item(casing))
			// I blame whoever wrote material containers.
			qdel(casing)
			count++
		if(count > 0)
			to_chat(user, span_notice("You insert [count] casing\s into \the [src]."))
		else
			to_chat(user, span_warning("There aren't any casings in \the [O] to recycle!"))
		return
	if(panel_open)
		if(!simple && istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_one))
			to_chat(user, "<span class='notice'>You upgrade [src] with simple ammunition schematics.</span>")
			simple = TRUE
			qdel(O)
			return
		if(!basic && istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_two))
			to_chat(user, "<span class='notice'>You upgrade [src] with basic ammunition schematics.</span>")
			basic = TRUE
			qdel(O)
			return
		else if(!intermediate && istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_three))
			to_chat(user, "<span class='notice'>You upgrade [src] with intermediate ammunition schematics.</span>")
			intermediate = TRUE
			qdel(O)
			return
		else if(!advanced && istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_four))
			to_chat(user, "<span class='notice'>You upgrade [src] with advanced ammunition schematics.</span>")
			advanced = TRUE
			qdel(O)
			return
	return ..()

/obj/machinery/autolathe/ammo/can_build(datum/design/D, amount = 1)
	if("Simple Ammo" in D.category)
		if(simple == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Simple Magazines" in D.category)
		if(simple == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Basic Ammo" in D.category)
		if(basic == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Basic Magazines" in D.category)
		if(basic == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Intermediate Ammo" in D.category)
		if(intermediate == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Intermediate Magazines" in D.category)
		if(intermediate == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Advanced Ammo" in D.category)
		if(advanced == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Advanced Magazines" in D.category)
		if(advanced == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()

/obj/machinery/autolathe/ammo/on_deconstruction()
	..()
	if(simple)
		new /obj/item/book/granter/crafting_recipe/gunsmith_one(src)
	if(basic)
		new /obj/item/book/granter/crafting_recipe/gunsmith_two(src)
	if(intermediate)
		new /obj/item/book/granter/crafting_recipe/gunsmith_three(src)
	if(advanced)
		new /obj/item/book/granter/crafting_recipe/gunsmith_four(src)
	return

/obj/machinery/autolathe/ammo/unlocked_basic
	desc = "A ammo bench where you can make ammo and magazines. Copies of Guns and Ammo, parts one and two, can be found in a drawer."
	simple = 1
	basic = 1

/obj/machinery/autolathe/ammo/unlocked
	simple = 1
	basic = 1
	intermediate = 1
	advanced = 1
