/////////
// Food and Water.
/////////

/obj/machinery/base_dispenser/food
	name = "\improper factory vendor"
	desc = "A terminal connected to pre-war machinery. Looks like it has a keypad for item selection!"
	dispense_amount = 1
	goal = 600 SECONDS//10 minutes. 500u of water, or 175u of nutriment.

/obj/machinery/base_dispenser/food/attack_hand(mob/living/user, params)//WHY DO WE NOT JUST HAVE LISTS AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
	var/drop_location = drop_location()
	if(ready == TRUE)
		var/list/choices = list(
			"Water" = image(icon = 'icons/obj/chemical.dmi', icon_state = "pill_canister_water"),
			"Food" = image(icon= 'icons/obj/chemical.dmi', icon_state = "pill_canister_paste")
			)
		var/list/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, .proc/check_menu, user), require_near = TRUE)
		switch(choice)
			if("Water")
				to_chat(user, "You chose water.")
				new /obj/item/storage/pill_bottle/chem_tin/waterpuretablet(drop_location)
			if("Food")
				to_chat(user, "You chose food.")
				new /obj/item/storage/pill_bottle/chem_tin/foodpaste(drop_location)// bad choice
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

/////////
// Pre-War Parts
/////////
/*
/obj/machinery/base_dispenser/prewar
	name = "\improper pre-war parts vendor"
	desc = "A terminal connected to pre-war machinery. Looks like it has a keypad for item selection!"
	dispense_amount = 1
	goal = 600 SECONDS//10 minutes. 5 pre-war parts.

/obj/machinery/base_dispenser/prewar/attack_hand(mob/living/user, params)//WHY DO WE NOT JUST HAVE LISTS AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
	var/drop_location = drop_location()
	if(ready == TRUE)
		var/list/choices = list(
			"Parts" = image(icon = 'icons/fallout/objects/items.dmi', icon_state = "prewartech")
			)
		var/list/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, .proc/check_menu, user), require_near = TRUE)
		switch(choice)
			if("Parts")
				to_chat(user, "You chose valuable parts.")
				new /obj/item/stack/crafting/prewartech(drop_location)
				new /obj/item/stack/crafting/prewartech(drop_location)
				new /obj/item/stack/crafting/prewartech(drop_location)
				new /obj/item/stack/crafting/prewartech(drop_location)
				new /obj/item/stack/crafting/prewartech(drop_location)
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
*/
/////////
// Ammo.
/////////

/obj/machinery/base_dispenser/ammo
	name = "\improper munitions vendor"
	desc = "A terminal connected to pre-war machinery. Looks like it has a keypad for item selection!"
	dispense_amount = 1
	goal = 300 SECONDS//5 minutes. 1 large box of choice.

/obj/machinery/base_dispenser/ammo/attack_hand(mob/living/user, params)//WHY DO WE NOT JUST HAVE LISTS AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
	var/drop_location = drop_location()
	if(ready == TRUE)
		var/list/choices = list(
			"5.56 FMJ" = image(icon = 'icons/obj/ammo.dmi', icon_state = "556box"),
			".357 FMJ" = image(icon = 'icons/obj/ammo.dmi', icon_state = "357box"),
			"9mm FMJ" = image(icon = 'icons/obj/ammo.dmi', icon_state = "9mmbox"),
			".44 FMJ" = image(icon = 'icons/obj/ammo.dmi', icon_state = "44box"),
			"12g BKS" = image(icon = 'icons/obj/ammo.dmi', icon_state = "gshell-live")
			)
		var/list/choice = show_radial_menu(user, src, choices, custom_check = CALLBACK(src, .proc/check_menu, user), require_near = TRUE)
		switch(choice)
			if("5.56 FMJ")
				to_chat(user, "You chose rifle rounds.")
				new /obj/item/ammo_box/a556(drop_location)
			if(".357 FMJ")
				to_chat(user, "You chose magnum rounds.")
				new /obj/item/ammo_box/a357box(drop_location)
			if("9mm FMJ")
				to_chat(user, "You chose handgun rounds.")
				new /obj/item/ammo_box/c9mm(drop_location)
			if(".44 FMJ")
				to_chat(user, "You chose magnum rounds.")
				new /obj/item/ammo_box/m44box(drop_location)
			if("12g BKS")
				to_chat(user, "You chose buckshot.")
				new /obj/item/ammo_box/shotgun/buck(drop_location)
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
