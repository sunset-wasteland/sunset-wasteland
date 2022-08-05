/obj/machinery/chem_master/primitive
	name = "alchemy table"
	desc = "A wooden table with various bone mortars and pistles, as well as other tools."
	icon_state = "alchemy_table"
	use_power = FALSE
	idle_power_usage = 0
	circuit = null // don't create or drop a circuit

/obj/machinery/chem_master/primitive/update_icon_state()
	// no custom icons for different states atm
	// todo: readd?
	return

/obj/machinery/chem_master/primitive/default_deconstruction_screwdriver() // don't, we have no panel
	return

/obj/machinery/chem_master/primitive/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction_crowbar(I, ignore_panel = TRUE)) // we have no panel
		return TRUE // no afterattack
	
	return ..() // do base stuff

/obj/machinery/chem_master/primitive/on_deconstruction()
	new /obj/item/stack/sheet/mineral/wood(drop_location(), 25)
	. = ..()

/obj/machinery/chem_master/primitive/ui_interact(mob/living/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	var/can_use = istype(user, /mob/dead/observer)
	if(!can_use && !HAS_TRAIT(user, TRAIT_MACHINE_SPIRITS) && !HAS_TRAIT(user, TRAIT_MARS_TEACH))
		to_chat(user, span_warning("Try as you might, you have no clue how to work this thing."))
	else
		can_use = TRUE
	if(!can_use)
		return
	if(!ui)
		ui = new(user, src, "AlchemyTable", name)
		if(user.hallucinating())
			ui.set_autoupdate(FALSE) //to not ruin the immersion by constantly changing the fake chemicals
		else
			ui.set_autoupdate(TRUE)
		ui.open()

/obj/machinery/chem_master/primitive/ui_act(action, params)
	if(..())
		return

	if(action == "create")
		if(reagents.total_volume == 0)
			return FALSE
		var/item_type = params["type"]
		// Get amount of items
		var/amount = text2num(params["amount"])
		if(amount == null)
			amount = text2num(input(usr,
				"Max 10. Buffer content will be split evenly.",
				"How many to make?", 1))
		amount = clamp(round(amount), 0, 10)
		if (amount <= 0)
			return FALSE
		// Get units per item
		var/vol_each = text2num(params["volume"])
		var/vol_each_text = params["volume"]
		var/vol_each_max = reagents.total_volume / amount
		if (item_type == "bottle_primitive")
			vol_each_max = min(60, vol_each_max)
		else if (item_type == "bag")
			vol_each_max = min (40, vol_each_max)
		else
			return FALSE
		if(vol_each_text == "auto")
			vol_each = vol_each_max
		if(vol_each == null)
			vol_each = text2num(input(usr,
				"Maximum [vol_each_max] units per item.",
				"How many units to fill?",
				vol_each_max))
		vol_each = clamp(vol_each, 0, vol_each_max)
		if(vol_each <= 0)
			return FALSE
		// Get item name
		var/name = params["name"]
		if(!name)
			var/name_default = reagents.get_master_reagent_name()
			name = stripped_input(usr,
				"Name:",
				"Give it a name!",
				name_default,
				MAX_NAME_LEN)
		if(!name || !reagents.total_volume || !src || QDELETED(src) || !usr.canUseTopic(src, !issilicon(usr)))
			return FALSE
		// Start filling
		if(item_type == "bag")
			var/obj/item/reagent_containers/pill/patch/P
			for(var/i = 0; i < amount; i++)
				P = new/obj/item/reagent_containers/pill/patch/healingpowder/custom(drop_location())
				P.name = trim("[name] powder")
				adjust_item_drop_location(P)
				reagents.trans_to(P, vol_each)//, transfered_by = usr)
			return TRUE
		if(item_type == "bottle_primitive")
			var/obj/item/reagent_containers/glass/bottle/P
			for(var/i = 0; i < amount; i++)
				P = new/obj/item/reagent_containers/glass/bottle/primitive(drop_location())
				P.name = trim("[name] bottle")
				adjust_item_drop_location(P)
				reagents.trans_to(P, vol_each)//, transfered_by = usr)
		return FALSE // so we can't create anything this table doesn't support, via href hacking

	return FALSE
