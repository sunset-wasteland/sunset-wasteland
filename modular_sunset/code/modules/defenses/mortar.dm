/obj/structure/mortar
	name = "Mortar"
	desc = "Mortar"
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
		if(z != 1)
			to_chat(user, "<span class='warning'>You cannot fire [src] here.</span>")
			return
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
	name = "\improper M402 mortar portable kit"
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

/obj/item/mortar_shell
	name = "\improper 80mm mortar shell"
	desc = "An unlabeled 80mm mortar shell, probably a casing."
	icon = 'modular_sunset/icons/structures/mortar.dmi'
	icon_state = "mortar_ammo_he"
	w_class = 5

/obj/item/mortar_shell/proc/detonate(turf/T)
	forceMove(T)

/obj/item/mortar_shell/detonate(turf/T)
	explosion(T, 2, 4, 6, 8)
