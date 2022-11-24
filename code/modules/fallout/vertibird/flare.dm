/obj/item/flashlight/flare/emergency
	name = "emergency flare"
	desc = "A special flare used to mark the landing zones. There are instructions on the side, it reads 'pull cord, make light'. This one has burns triple as long as normal."
	light_range = 12 // Extra bright.
	grind_results = list("sulfur" = 45)
	var/obj/effect/landmark/vertibird/flare/landmark = null
	var/static/count = 1

/obj/item/flashlight/flare/emergency/proc/attack_light(user)
	on = !on
//	toggle()
	update_brightness(user)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
	return 1


/obj/item/flashlight/flare/emergency/New()
	. = ..()

	fuel = 3500


/obj/item/flashlight/flare/emergency/attack_self(mob/user)

	if(!fuel)
		to_chat(user, "<span class='warning'>[src] is out of fuel!</span>")
		return
	if(on)
		to_chat(user, "<span class='notice'>[src] is already on.</span>")
		return

	var/turf/T = get_turf(user)
	for(var/obj/O in range(3, T))
		if(O.density)
			to_chat(user, "<span class='warning'>There is not enough place for a landing spot!!</span>")
			return
	for(var/turf/TO in range(3, T))
		if(TO.density)
			to_chat(user, "<span class='warning'>There is not enough place for a landing spot!!</span>")
			return
	if(!isarea(T.loc))
		to_chat(user, "<span class='warning'>This location isn't visible on GPS!!</span>")
		return
	if(!istype(T.loc, /area/f13/wasteland))
		to_chat(user, "<span class='warning'>This LZ is unreachable, find a clear area!!</span>")
		return

	. = attack_light(user)
	// All good, turn it on.
	if(.)

		landmark = new(src)
		landmark.name = "[src] [count]"
		landmark.loc = user.loc
		count++

		user.dropItemToGround(src)
		anchored = TRUE
		user.visible_message("<span class='notice'>[user] lights \the [src].</span>", "<span class='notice'>You light \the [src] and place it to the ground!</span>")
		playsound(loc, 'sound/effects/flare_light.ogg', 50, 0)
		force = on_damage
		damtype = "fire"
		START_PROCESSING(SSobj, src)

/obj/item/flashlight/flare/emergency/turn_off()
	. = ..()
	fuel = 0
	icon_state = "[initial(icon_state)]-empty"
	anchored = FALSE
	GLOB.vertibirdLandZone -= landmark
	qdel(landmark)

/obj/item/flashlight/flare/emergency/attack_hand(mob/user)
	. = ..()
	if(anchored && on)
		user.visible_message("<span class='notice'>[user] begins to put out the [src]!</span>")
		if(do_after(user, 40, TRUE, src))
			user.visible_message("<span class='notice'>[user] puts out the [src]!</span>")
			turn_off()
