/////////
// A lot of this is ripped from another codebase, primarily NSV's gauss munition dispenser, because I'm tired and can't be bothered.
// They've done great work on their end.
// Please, go check that server out if you're reading this. It's worth it. -Carl
/////////
/obj/machinery/base_dispenser
	name = "\improper some vendor"
	desc = "A terminal connected to pre-war machinery. Looks like it has a dispenser-port beneath the keyboard..."
	icon = 'icons/fallout/machines/terminals.dmi'
	icon_state = "research"
	resistance_flags = INDESTRUCTIBLE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	anchored = TRUE
//	pixel_y = 26
	var/dispense_amount = 1
	var/active = TRUE
	var/progress = 0 SECONDS
	var/progress_rate = 1 SECONDS
	var/goal = 45 SECONDS
	var/ready = FALSE

/obj/machinery/base_dispenser/Initialize()
	. = ..()

/obj/machinery/base_dispenser/process()
	cut_overlays()
	if(stat & NOPOWER)
		progress = 0 SECONDS
		return PROCESS_KILL
	progress += progress_rate
	if(progress >= goal)
		add_overlay("research_key")
		add_overlay("research_on")
		playsound(src, 'sound/f13machines/turret_close.ogg', 100, FALSE)
		ready = TRUE
		progress = 0
		return PROCESS_KILL
	else
		add_overlay("research_key_off")
		add_overlay("research_off")

/obj/machinery/base_dispenser/attack_hand(mob/living/user, params)
	var/drop_location = drop_location()
	if(ready == TRUE)
		var/list/choices = list(
			"METAL" = image(icon = 'icons/mob/radial.dmi', icon_state = "airlock"),
			"GLASS" = image(icon= 'icons/mob/radial.dmi', icon_state = "delete")
			)
		var/list/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, .proc/check_menu, user), require_near = TRUE)
		switch(choice)
			if("METAL")
				to_chat(user, "You chose METAL.")
				new /obj/item/storage/belt/mining/vendor(drop_location)
			if("GLASS")
				to_chat(user, "You chose GLASS.")
				new /obj/item/storage/belt/mining/alt(drop_location)
			else
				return
		flick("research_key_off", src)
		playsound(src, 'sound/f13machines/turret_open.ogg', 100, 1)
		cut_overlays()
		ready = FALSE
		use_power = 50
		progress = 0 SECONDS
		START_PROCESSING(SSmachines, src)
		return
	else
		to_chat(user, "[goal - progress] until an item is ready to be dispensed.")

/obj/machinery/base_dispenser/proc/check_menu(mob/living/user)
	if(!istype(user))
		return FALSE
	if(user.incapacitated() || !user.Adjacent(src))
		return FALSE
	return TRUE

/obj/machinery/base_dispenser/proc/check_active(state)
	if(state)
		use_power = 50 //Takes some power
		START_PROCESSING(SSmachines, src)
	else
		use_power = 0
		cut_overlays()
		STOP_PROCESSING(SSmachines, src)

/*
/obj/machinery/base_dispenser/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = FALSE, datum/tgui/master_ui = null, datum/ui_state/state = GLOB.default_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "smartvend", name, 440, 550, master_ui, state)
		ui.set_autoupdate(FALSE)
		ui.open()

/obj/machinery/base_dispenser/ui_act(action, params, datum/tgui/ui)
	if(..())
		return
	switch(action)
		if("toggle_power")
			active = !active
			ready = FALSE
			progress = 0
			check_active(active)
		if("dispense")
			if(!ready)
				return FALSE
			flick("research_key_off", src)
			playsound(src, 'sound/f13machines/turret_open.ogg', 100, 1)
			for(var/I = 0, I < dispense_amount, I++)
				new /obj/item/analyzer(get_turf(src))
			cut_overlays()
			ready = FALSE
			use_power = 50
			START_PROCESSING(SSmachines, src)

/obj/machinery/base_dispenser/ui_data(mob/user)
	var/list/data = list()
	data["powered"] = active
	data["progress"] = progress
	data["goal"] = goal
	data["ready"] = ready
	return data
*/
