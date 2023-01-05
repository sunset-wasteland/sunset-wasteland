// Sunset Flags

/obj/item/bighorn_flag
	name = "Bighorn flag"
	desc = "A flag depicting the head of a bighorner. It's the symbol of the town of Bighorn."
	icon = 'modular_sunset/icons/structures/bighorn_flag.dmi'
	icon_state = "bighorn_flag"
	item_state = "bighorn_flag"
	density = 1
	anchored = 1
	w_class = 4
	layer = 4.1

/obj/item/renegade_flag
	name = "Renegade Corps flag"
	desc = "A flag marking territory belonging to the Renegade Corps mercenaries."
	icon = 'modular_sunset/icons/structures/bighorn_flag.dmi'
	icon_state = "renegade_flag"
	item_state = "renegade_flag"
	density = 1
	anchored = 1
	w_class = 4
	layer = 4.1

// Sunset Signs - SMALL

/obj/item/sign/bee_warning
	name = "Beeware, Bees"
	desc = "Appears to be warning of a potential dangerous bee hive and that ample protection should be worn."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "beewarning"
	item_state = "beewarning"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/highway_sign
	name = "highway sign"
	desc = "A metal highway sign. This one is blank."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "sign_template"
	item_state = "sign_template"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/highway_sign/casper
	name = "Casper"
	desc = "An aged highway sign indicating the road leads to Casper."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "sign_casper"
	item_state = "sign_casper"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/highway_sign/bighorn
	name = "Bighorn National Park"
	desc = "An aged highway sign indicating the road leads to the Bighorn National Park."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "sign_bighorn"
	item_state = "sign_bighorn"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/highway_sign/gillette
	name = "Gillette"
	desc = "An aged highway sign indicating the road leads to Gillette."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "sign_gillette"
	item_state = "sign_gillette"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/highway_sign/rocksprings
	name = "Rock Springs"
	desc = "An aged highway sign indicating the road leads to Rock Springs."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "sign_rocksprings"
	item_state = "sign_rocksprings"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/highway_sign/warren
	name = "Warren"
	desc = "An aged highway sign indicating the road leads to the city of Warren."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "sign_warren"
	item_state = "sign_warren"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/minefield_sign
	name = "Minefield Warning"
	desc = "Appears to be warning that there is a minefield in the area. Watch your step."
	icon = 'modular_sunset/icons/structures/sunset_signs_small.dmi'
	icon_state = "sign_minefield"
	item_state = "sign_minefield"
	density = TRUE
	anchored = TRUE
	w_class = WEIGHT_CLASS_BULKY
	layer = ABOVE_MOB_LAYER

// Sunset Signs - LARGE

/obj/item/bighorn_sign
	name = "Bighorn sign"
	desc = "A repurposed highway sign with the spray painted name of 'Bighorn'."
	icon = 'modular_sunset/icons/structures/bighorn_sign.dmi'
	icon_state = "bighorn_hvysign"
	item_state = "bighorn_hvysign"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/obj/item/trade_sign
	name = "Trade sign"
	desc = "A wooden sign with seemingly hand forged lettering bolted to it."
	icon = 'modular_sunset/icons/structures/sunset_signs.dmi'
	icon_state = "sign_trade_south"
	item_state = "sign_trade_south"
	density = 1
	anchored = 1
	w_class = 4
	layer = 5

/datum/weather/ash_storm/sandstorm
	telegraph_message = "<span class='userdanger'>A sandstorm is coming to the area, decreasing overall visibility outside.</span>"

	weather_message = "<span class='boldannounce'>The sand wafts down around you like grotesque, thick snow. The sandstorm is here...</span>"

	end_message = "<span class='boldannounce'>The sandstorm slows before stopping. Adding another layer of sand to the ground beneath your feet.</span>"

/*
This is a pre-destroyed nuclear reactor for the sake of mapping special fluff stuff.
Not actually a reactor, just uses the icon and irradiates the surrounding area a bit.
Nowhere else to really put this. Pulled from what I had done on Hyper. - Carl
*/

/obj/structure/fluff/destroyed_nuclear_reactor
	name = "Destroyed Nuclear Reactor"
	desc = "What in the hell happened here?"
	icon = 'modular_sunset/icons/obj/rbmk.dmi'
	icon_state = "reactor_slagged"
	pixel_x = -32
	pixel_y = -32
	density = FALSE
	anchored = TRUE
	deconstructible = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	light_color = LIGHT_COLOR_CYAN
	dir = 8 //Less headache inducing :))

/obj/structure/fluff/destroyed_nuclear_reactor/Initialize()
	. = ..()
	set_light(3)
//	AddComponent(/datum/component/radioactive, 15000 , src)
	START_PROCESSING(SSradiation,src)

/obj/structure/fluff/destroyed_nuclear_reactor/Destroy()
	STOP_PROCESSING(SSradiation,src)
	return ..()

/obj/structure/fluff/destroyed_nuclear_reactor/process()
	if(QDELETED(src))
		return PROCESS_KILL
	
	if(!z || !SSmobs.clients_by_zlevel[z].len) // we don't care about irradiating if no one is around to see it!
		return

	for(var/mob/living/carbon/human/victim in view(src,5))
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(1500)//WHY ARE YOU STANDING NEAR IT?
