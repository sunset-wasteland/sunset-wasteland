/obj/structure/barricade/tentleathercorner
	name = "brahmin skin tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "leather_corner"
	opacity = TRUE

/obj/structure/barricade/tentleatheredge
	name = "brahmin skin tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "leather_edge"
	opacity = TRUE

/obj/structure/barricade/tentclothcorner
	name = "cotton tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "cloth_corner"
	max_integrity = 80
	opacity = TRUE

/obj/structure/barricade/tentclothedge
	name = "cotton tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "cloth_edge"
	max_integrity = 80
	opacity = TRUE

/obj/structure/barricade/tent
	name = "tent wall"
	desc = "The cloth wall of a tent. Provides protection from the elements, but not much else."
	icon = 'icons/obj/smooth_structures/tent_cloth.dmi'
	icon_state = "tent"
	max_integrity = 100
	proj_pass_rate = 80
	bar_material = null
	climbable = FALSE
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/barricade/tent)
	var/drop_amount = 3
	opacity = TRUE

/obj/structure/barricade/tent/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	user.visible_message("<span class='notice'>[user] starts to take down [src]...</span>", "<span class='notice'>You start to take down [src]...</span>")
	if(!has_buckled_mobs() && do_after(user, 60, target = src))
		to_chat(user, "<span class='notice'>You take down [src].</span>")
		new /obj/item/stack/sheet/cloth(src.loc, drop_amount)
		qdel(src)
		return

/obj/structure/barricade/tent/make_debris()
	new /obj/item/stack/sheet/cloth(get_turf(src), drop_amount)
