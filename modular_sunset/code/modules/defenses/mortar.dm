/obj/structure/mortar
	name = "M29 Mortar"
	desc = "A lightweight infantry portable mortar. This one would appear pristine, if it weren't for the fact that it violently rattles when handled. Is this safe?"
	icon = 'modular_sunset/icons/structures/mortar.dmi'
	icon_state = "mortar_m402"
	anchored = 1
	density = 1
	var/xinput
	var/yinput
	var/xdial
	var/ydial
	var/xoffset = 0
	var/yoffset = 0
	var/offset_per_turfs = 20 //Number of turfs to offset from target by 1
	var/firing = 0
	var/busy = 0
	var/fixed = 0 //If 1, mortar cannot be unarchored and moved.
	var/travel_time = 45
	var/max_shells = 1
	var/list/shells = new/list


/obj/structure/mortar/attack_hand(mob/user as mob)
	if(busy)
		to_chat(user, "<span class='warning'>Someone else is currently using [src].</span>")
		return
	if(firing)
		to_chat(user, "<span class='warning'>[src]'s barrel is still steaming hot. Wait a few seconds and stop firing it.</span>")
		return
	add_fingerprint(user)

	var/area/A = get_area(src)
	if(!A.outdoors)
		to_chat(user, "<span class='warning'>You refrain from firing the [src] while indoors.</span>")
		return

	var/choice = alert(user, "Would you like to set the mortar's target coordinates?","Mortar Dialing", "Target","Dial" , "Cancel")
	if (choice == "Cancel")
		return
	if (choice == "Target")
		var/temp_targ_x = input("Set longitude of strike.") as num
		if(xdial + deobfuscate_x(temp_targ_x) > world.maxx || xdial + deobfuscate_x(temp_targ_x) < 0)
			to_chat(user, "<span class='warning'>You cannot aim at this coordinate, it is outside of the area of operations.</span>")
			return
		var/temp_targ_y = input("Set latitude of strike.") as num
		if(ydial + deobfuscate_y(temp_targ_y) > world.maxy || ydial + deobfuscate_y(temp_targ_y) < 0)
			to_chat(user, "<span class='warning'>You cannot aim at this coordinate, it is outside of the area of operations.</span>")
			return
		var/turf/T = locate(deobfuscate_x(temp_targ_x) + xdial, deobfuscate_y(temp_targ_y) + ydial, z)
		if(get_dist(loc, T) < 10)
			to_chat(user, "<span class='warning'>You cannot aim at this coordinate, it is too close to your mortar.</span>")
			return
		if(busy)
			to_chat(user, "<span class='warning'>Someone else is currently using this mortar.</span>")
			return
		user.visible_message("<span class='notice'>([user] starts adjusting [src]'s firing angle and distance.</span>",
		"<span class='notice'>You start adjusting [src]'s firing angle and distance to match the new coordinates.</span>")
		busy = 1
		if(do_after(user, 30, src))
			user.visible_message("<span class='notice'>([user] finishes adjusting [src]'s firing angle and distance.</span>",
			"<span class='notice'>You finish adjusting [src]'s firing angle and distance to match the new coordinates.</span>")
			busy = 0
			xinput = deobfuscate_x(temp_targ_x)
			yinput = deobfuscate_y(temp_targ_y)
			var/offset_x_max = round(abs((xinput + xdial) - x)/offset_per_turfs) //Offset of mortar shot, grows by 1 every 20 tiles travelled
			var/offset_y_max = round(abs((yinput + ydial) - y)/offset_per_turfs)
			xoffset = rand(-offset_x_max, offset_x_max)
			yoffset = rand(-offset_y_max, offset_y_max)
		else
			busy = 0
	if (choice == "Dial")
		var/temp_dial_x = input("Set longitude adjustement from -10 to 10.") as num
		if(temp_dial_x + xinput > world.maxx || temp_dial_x + xinput < 0)
			to_chat(user, "<span class='warning'>You cannot dial to this coordinate, it is outside of the area of operations.</span>")
			return
		if(temp_dial_x < -10 || temp_dial_x > 10)
			to_chat(user, "<span class='warning'>You cannot dial to this coordinate, it is too far away. You need to set [src] up instead.</span>")
			return
		var/temp_dial_y = input("Set latitude adjustement from -10 to 10.") as num
		if(temp_dial_y + yinput > world.maxy || temp_dial_y + yinput < 0)
			to_chat(user, "<span class='warning'>You cannot dial to this coordinate, it is outside of the area of operations.</span>")
			return
		var/turf/T = locate(xinput + temp_dial_x, yinput + temp_dial_y, z)
		if(get_dist(loc, T) < 10)
			to_chat(user, "<span class='warning'>You cannot dial to this coordinate, it is too close to your mortar.</span>")
			return
		if(temp_dial_y < -10 || temp_dial_y > 10)
			to_chat(user, "<span class='warning'>You cannot dial to this coordinate, it is too far away. You need to set [src] up instead.</span>")
			return
		if(busy)
			to_chat(user, "<span class='warning'>Someone else is currently using this mortar.</span>")
			return
		user.visible_message("<span class='notice'>[user] starts dialing [src]'s firing angle and distance.</span>",
		"<span class='notice'>You start dialing [src]'s firing angle and distance to match the new coordinates.</span>")
		busy = 1
		if(do_after(user, 15, src))
			user.visible_message("<span class='notice'>[user] finishes dialing [src]'s firing angle and distance.</span>",
			"<span class='notice'>You finish dialing [src]'s firing angle and distance to match the new coordinates.</span>")
			busy = 0
			xdial = temp_dial_x
			ydial = temp_dial_y
		else
			busy = 0



/obj/structure/mortar/attackby(obj/item/O as obj, mob/user as mob)

	var/area/A = get_area(src)
	if(!A.outdoors)
		to_chat(user, "<span class='warning'>You refrain from firing the [src] while indoors.</span>")
		return

	if(istype(O, /obj/item/mortar_shell))
		var/obj/item/mortar_shell/mortar_shell = O

		if(busy)
			to_chat(user, "<span class='warning'>Someone else is currently using [src].</span>")
			return
/*
		if(z != 1)
			to_chat(user, "<span class='warning'>You cannot fire [src] here.</span>")
			return
*/
		if(xinput == 0 && yinput == 0) //Mortar wasn't set
			to_chat(user, "<span class='warning'>[src] needs to be aimed first.</span>")
			return

		var/turf/T = locate(xinput + xdial + xoffset, yinput + ydial + yoffset, z)
		if(!isturf(T))
			to_chat(user, "<span class='warning'>You cannot fire [src] to this target.</span>")
			return

		user.visible_message("<span class='notice'>[user] starts loading \a [mortar_shell.name] into [src].</span>",
		"<span class='notice'>You start loading \a [mortar_shell.name] into [src].</span>")
		playsound(loc, 'modular_sunset/sound/defenses/mortar_reload.ogg', 50, 1)
		busy = 1

		if(do_after(user, 15, src))
			user.visible_message("<span class='notice'>[user] loads \a [mortar_shell.name] into [src].</span>",
			"<span class='notice'>You load \a [mortar_shell.name] into [src].</span>")
			visible_message("\icon[src] <span class='danger'>The [name] fires!</span>")
			user.dropItemToGround(mortar_shell, src)
			playsound(loc, 'modular_sunset/sound/defenses/mortar_fire.ogg', 50, 1)
			busy = 0
			firing = 1
			flick(icon_state + "_fire", src)
			mortar_shell.forceMove(src)

			for(var/mob/M in range(7))
				shake_camera(M, 3, 1)
			spawn(travel_time) //What goes up
				playsound(T, 'modular_sunset/sound/defenses/mortar_long_whistle.ogg', 50, 1)
				spawn(45) //Must go down //This should always be 45 ticks!
					mortar_shell.detonate(T)

					qdel(mortar_shell)
					xdial = 0//Reset after each shell.
					ydial = 0
					xinput = 0
					yinput = 0

					firing = 0

		else
			busy = 0

	if(istype(O, /obj/item/wrench))
		if(busy)
			to_chat(user, "<span class='warning'>Someone else is currently using [src].</span>")
			return
		if(firing)
			to_chat(user, "<span class='warning'>The mortar is currently firing, Wait a few seconds for the barrel to cool.</span>")
			return
		if(fixed)
			to_chat(user, "<span class='warning'>The mortar is fixed in place. You're not able to move it.</span>")
			return

		xdial = 0//Reset after attempted deconstruction.
		ydial = 0
		xinput = 0
		yinput = 0

		playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)
		user.visible_message("<span class='notice'>[user] starts undeploying [src].",
		"<span class='notice'>You start undeploying [src].")
		if(do_after(user, 40, src))
			user.visible_message("<span class='notice'>[user] undeploys [src].",
			"<span class='notice'>You undeploy [src].")
			playsound(loc, 'sound/items/Deconstruct.ogg', 25, 1)
			new /obj/item/mortar_kit(loc)
			qdel(src)

//Don't allow blowing those up, so nades don't fuck them
/obj/structure/mortar/ex_act(severity)
	return

//TODO change mortar fluff and desc
/obj/structure/mortar/fixed
	desc = "A manual, crew-operated mortar system intended to rain down 80mm goodness on anything it's aimed at. Uses manual targetting dials. Insert round to fire. This one is bolted and welded into the ground."
	fixed = 1

//The portable mortar item
/obj/item/mortar_kit
	name = "\improper M29 mortar portable kit"
	desc = "A manual, crew-operated mortar system intended to rain down 80mm goodness on anything it's aimed at. Needs to be set down first"
	icon = 'modular_sunset/icons/structures/mortar.dmi'
	icon_state = "mortar_m402_carry"
	w_class = 5

/obj/item/mortar_kit/attack_self(mob/user)
	user.visible_message("<span class='notice'>[user] starts deploying [src].",
	"<span class='notice'>You start deploying [src].")
	playsound(loc, 'modular_sunset/sound/defenses/mortar_unpack.ogg', 25, 1)
	if(do_after(user, 40, src))
		user.visible_message("<span class='notice'>[user] deploys [src].",
		"<span class='notice'>You deploy [src].")
		playsound(loc, 'modular_sunset/sound/defenses/mortar_unpack.ogg', 25, 1)
		var/obj/structure/mortar/M = new /obj/structure/mortar(get_turf(user))
		M.dir = user.dir
		del(src)

////////////////////////////////////////////////////////////////////////////////////////////
/////////////////Mortar Shell Values//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

//HE
/obj/item/mortar_shell
	name = "\improper 80mm mortar shell (HE)"
	desc = "A hefty mortar shell. Looks to be an HE round."
	icon = 'modular_sunset/icons/structures/mortar.dmi'
	icon_state = "mortar_ammo_he"
	w_class = 5

/obj/item/mortar_shell/proc/detonate(turf/T)
	forceMove(T)

/obj/item/mortar_shell/detonate(turf/T)
	explosion(T, 2, 4, 6, 8)


//WILLY PETE
/obj/item/mortar_shell/smoke
	name = "\improper 80mm mortar shell (WP)"
	desc = "An 80mm mortar shell, loaded with chemical dispersal agents."
	icon_state = "mortar_ammo_smk"
	var/datum/effect_system/smoke_spread/bad/smoke

/obj/item/mortar_shell/smoke/New()
	..()
	src.smoke = new /datum/effect_system/smoke_spread/willy_pete
	src.smoke.attach(src)

/obj/item/mortar_shell/smoke/Destroy()
	qdel(smoke)
	return ..()

/obj/item/mortar_shell/smoke/detonate(turf/T)
	explosion(T, 0, 1, 2, 7)//Generic mortar explosion outside of HE shells.
	forceMove(T) //AAAAAAAA
	playsound(T, 'sound/effects/smoke.ogg', 50, 1, 4)
	smoke.set_up(4, src)
	smoke.start()
	sleep(1)//Yeah, I know.
	qdel(src)

//FRAG
/obj/item/mortar_shell/frag
	name = "\improper 80mm mortar shell (FRAG)"
	desc = "A hefty mortar shell. Looks to be a fragmentation round."
	icon_state = "mortar_ammo_frag"
	var/shrapnel_type = /obj/item/projectile/bullet/shrapnel_launcher/mortar
	var/shrapnel_magnitude = 6//Previously 24. Way too powerful at that.

/obj/item/mortar_shell/frag/New()
	..()
	AddComponent(/datum/component/pellet_cloud, projectile_type=shrapnel_type, magnitude=shrapnel_magnitude)

/obj/item/mortar_shell/frag/detonate(turf/T)
	explosion(T, 0, 1, 2, 7)//Generic mortar explosion outside of HE shells.
	forceMove(T) //AAAAAAAA
	SEND_SIGNAL(src, COMSIG_ROCKET_IMPACT)
	qdel(src)

//RAD
/obj/item/mortar_shell/rad
	name = "\improper 80mm mortar shell (CNTM)"
	desc = "A hefty mortar shell. Looks to be a round filled with contaminated material. A little door on the side feels hot to the touch. Is this safe?"
	icon_state = "mortar_ammo_flr"

/obj/item/mortar_shell/rad/detonate(turf/T)
	explosion(T, 0, 1, 2, 7)//Generic mortar explosion outside of HE shells.
	forceMove(T) //AAAAAAAA

	for(var/mob/living/carbon/human/victim in view(src,6))//6 range, half step of frag.
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(12500)//I'm sorry, little one. :(

	for(var/turf/open/turf in view(src,2))//Probably too little?
		if(istype(turf))
			var/obj/effect/decal/waste/WS = locate() in turf.contents
			if(!WS)
				WS = new/obj/effect/decal/waste(turf)

	rad_act(3500)//General rad pulse. Stacks with the above. If this even works?
	qdel(src)

////////////////////////////////////////////////////////////////////////////////////////////
/////////////////Mortar Crates//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/closet/crate/mortar_shells
	name = "mortar shell crate"
	desc = "Specialised mortar shells."
	icon_state = "hydrocrate"

/obj/structure/closet/crate/mortar_shells/PopulateContents()
	..()
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/binoculars(src)
	new /obj/item/weapon/maptool(src)

//DO NOT USE THIS OUTSIDE OF ADMIN FUGGERY
/obj/structure/closet/crate/mortar_shells_only
	name = "large mortar shell crate"
	desc = "Specialised mortar shells. Sixteen per crate."
	icon_state = "hydrocrate"

/obj/structure/closet/crate/mortar_shells_only/PopulateContents()
	..()
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
