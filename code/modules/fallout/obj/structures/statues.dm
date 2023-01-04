/obj/structure/statue/sandstone/mars
	name = "statue of Mars"
	desc = "A statue dedicated to Legion's God of War."
	icon_state = "marsred"

//Wood

/obj/structure/statue/wood
	obj_integrity = 150
	material_drop_type = /obj/item/stack/sheet/mineral/wood

/obj/structure/statue/wood/headstonewood
	name = "gravemarker"
	desc = "A wooden gravemarker, used to mark a burial site."
	icon = 'icons/obj/graveyard.dmi'
	icon_state = "wooden"
	density = 0
	anchored = 1
	oreAmount = 2
	var/obj/item/clothing/head/Helmet = null
	var/obj/item/card/id/dogtag/Dogtags = null

/obj/structure/statue/wood/headstonewood/examine(mob/user)
	. = ..()
	if(Helmet)
		. += span_notice("It has [Helmet] on it.")
	if(Dogtags)
		. += span_notice("It has [Dogtags] on it.")

/obj/structure/statue/wood/headstonewood/Destroy()
	if(Helmet)
		Helmet.forceMove(src.loc)
	if(Dogtags)
		Dogtags.forceMove(src.loc)
	return ..()

/obj/structure/statue/wood/headstonewood/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/clothing/head))
		if(Helmet)
			to_chat(user, "<span class='notice'>There's already a hat on the marker.</span>")
			return
		W.forceMove(src)
		Helmet = W
		update_icon()
		user.visible_message("[user] puts the [Helmet] on the grave marker.", "You put the [Helmet] on the grave marker.")
		return
	if(istype(W, /obj/item/card/id/dogtag))
		if(Dogtags)
			to_chat(user, "<span class='notice'>There's already some dogtags on the marker.</span>")
			return
		W.forceMove(src)
		Dogtags = W
		update_icon()
		user.visible_message("[user] puts the [Dogtags] on the grave marker.", "You put the [Dogtags] on the grave marker.")
		return
	..()

/obj/structure/statue/wood/headstonewood/attack_hand(mob/user)
	if(Helmet)
		user.put_in_hands(Helmet)
		user.visible_message("[user] removes the [Helmet] from the grave marker.", "You remove the [Helmet] from the grave marker.")
		Helmet = null
		update_icon()
		return
	if(Dogtags)
		user.put_in_hands(Dogtags)
		user.visible_message("[user] removes the [Dogtags] from the grave marker.", "You remove the [Dogtags] from the grave marker.")
		Dogtags = null
		update_icon()
		return
	..()

/obj/structure/statue/wood/headstonewood/update_icon()
	name = initial(name)
	overlays.Cut()
	if(Dogtags)
		var/icon/O = new('icons/mob/mob.dmi', icon_state = "[Dogtags.icon_state]")
		O.Shift(SOUTH, 6)
		overlays += O
		name = "[initial(name)] ([Dogtags.registered_name])"
	if(Helmet)
		var/icon/O = new('icons/mob/clothing/head.dmi', icon_state = "[Helmet.icon_state]")
		O.Shift(SOUTH, 6)
		overlays += O

//fortuna statues

/obj/structure/statue/bos/ladyleft
	name = "The Lady"
	desc = "The inscription reads 'Scribe with hands outstretched, pray her shelter of the world, reborn anew of olde.'"
	icon = 'icons/obj/tomb.dmi'
	icon_state = "ladystatue-left"
	anchored = TRUE
/obj/structure/statue/bos/ladyright
	name = "The Lady"
	desc = "The inscription reads 'Scribe with hands outstretched, pray her shelter of the world, reborn anew of olde.'"
	icon = 'icons/obj/tomb.dmi'
	icon_state = "ladystatue-right"
	anchored = TRUE
