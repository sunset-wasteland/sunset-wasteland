//Fallout 13 primary vehicle

/obj/vehicle/ridden/fuel/motorcycle
	name = "motorcycle"
	desc = "Wanderer Motors LLC."
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "bike"
	pixel_x = -16
	pixel_y = -2
	layer = LYING_MOB_LAYER
	obj_integrity = 400
	max_integrity = 400
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 30, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 40)
	key_type = /obj/item/key/motorcycle
	var/static/mutable_appearance/motorcycle
//	var/datum_type = /datum/riding/motorcycle
	engine_on_sound = 'sound/f13machines/bike_start.ogg'
	engine_loop_sound = 'sound/f13machines/bike_loop.ogg'

/obj/vehicle/ridden/fuel/motorcycle/Initialize()
	. = ..()
	update_icon()

	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1
	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8), TEXT_SOUTH = list(-2, 5), TEXT_EAST = list(0, 12), TEXT_WEST = list( 2, 5)))
	D.set_vehicle_dir_offsets(NORTH, -16, -16)
	D.set_vehicle_dir_offsets(SOUTH, -16, -16)
	D.set_vehicle_dir_offsets(EAST, -18, 0)
	D.set_vehicle_dir_offsets(WEST, -18, 0)

/obj/vehicle/ridden/fuel/motorcycle/post_buckle_mob(mob/living/M)
	add_overlay(motorcycle)
	return ..()

/obj/vehicle/ridden/fuel/motorcycle/post_unbuckle_mob(mob/living/M)
	if(!has_buckled_mobs())
		cut_overlay(motorcycle)
	return ..()


/*
/obj/vehicle/ridden/fuel/motorcycle/buckle_mob()
	. = ..()
	riding_datum = new datum_type()
*/
/obj/vehicle/ridden/fuel/motorcycle/relaymove(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_suit, /obj/item/clothing/suit/armor/f13/power_armor))//Standard PA.
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
		if(istype(H.wear_suit, /obj/item/clothing/suit/armored/heavy))//Salvaged PA and misc.
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
	..()
/*
/obj/vehicle/ridden/fuel/motorcycle/post_buckle_mob(mob/living/M)
	if(has_buckled_mobs())
		add_overlay(cover)
	else
		overlays -= cover

/obj/vehicle/ridden/fuel/motorcycle/New()
	..()
	cover = image(icon, "[icon_state]_cover")//"bike_cover")
	cover.layer = ABOVE_MOB_LAYER
*/
/obj/item/key/motorcycle
	name = "motorcycle key"
	desc = "A keyring with a small steel key.<br>By the look of the key cuts it likely belongs to a motorcycle."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'

/obj/item/key/motorcycle/New()
	..()
	icon_state = pick("key-bike-r","key-bike-y","key-bike-g","key-bike-b")

//Motorcycle subtypes with different skins

/obj/vehicle/ridden/fuel/motorcycle/rusty
	name = "rusty motorcycle"
	desc = "A very old, weathered motorcycle.<br>Somehow the engine is still intact."
	icon_state = "bike_rust_med"
//	D.vehicle_move_delay = 1.2

/obj/vehicle/ridden/fuel/motorcycle/rusty/Initialize()
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1.1//only 10% slower.

/obj/vehicle/ridden/fuel/motorcycle/green
	name = "green motorcycle"
	desc = "A military motorcycle from the old days.<br>Oddly enough it's still in pristine condition. The Army always had all the top-quality stuff."
	icon_state = "bike_green"

/obj/vehicle/ridden/fuel/motorcycle/flamy
	name = "black motorcycle"
	desc = "A vintage motorcycle from the old days.<br>It's extremely well maintained, jet black, and very shiny.<br>Topping it all off, it has badass flames painted on the fuel tank."
	icon_state = "bike_flamy"

/obj/vehicle/ridden/fuel/motorcycle/scrambler
	name = "scrambler motorbike"
	desc = "Scrambler is an old term for a dirt bike with a powerful engine that raced on dirt tracks with low jumps.<br>Something tells you it's better not to mess around with its owner."
	icon_state = "bike_scrambler"

/obj/vehicle/ridden/fuel/motorcycle/scrambler/Initialize()
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 0.7

/*
//Motorcycle riding datum

/datum/riding/motorcycle/fast
	vehicle_move_delay = 0.7

/datum/riding/motorcycle/slow
	vehicle_move_delay = 1.2

/datum/riding/motorcycle
	keytype = /obj/item/key/motorcycle
	vehicle_move_delay = 1

/datum/riding/motorcycle/proc/handle_vehicle_layer()
	return

/datum/riding/motorcycle/proc/handle_vehicle_offsets()
	..()
	if(ridden.has_buckled_mobs())
		for(var/m in ridden.buckled_mobs)
			var/mob/living/buckled_mob = m
			switch(buckled_mob.dir)
				if(NORTH)
					buckled_mob.pixel_x = 0
					buckled_mob.pixel_y = 8
				if(EAST)
					buckled_mob.pixel_x = -2
					buckled_mob.pixel_y = 5
				if(SOUTH)
					buckled_mob.pixel_x = 0
					buckled_mob.pixel_y = 12
				if(WEST)
					buckled_mob.pixel_x = 2
					buckled_mob.pixel_y = 5*/
