/obj/item/flashlight/flare/torch
	name = "torch"
	desc = "A self-lighting handheld torch fashioned from some cloth wrapped around a wooden handle. It could probably fit in a backpack while it isn't burning."
	icon = 'icons/obj/lighting.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	light_range = 5
	light_color = LIGHT_COLOR_ORANGE
	icon_state = "torch"
	item_state = "torch"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	total_mass = TOTAL_MASS_NORMAL_ITEM
	on_damage = 10
	slot_flags = null

/obj/item/flashlight/flare/torch/attack_self(mob/user)
	// Usual checks
	if(!fuel)
		to_chat(user, "<span class='warning'>[src] is out of fuel!</span>")
		return
	if(on)
		to_chat(user, "<span class='notice'>[src] is already lit.</span>")
		return
	// All good, turn it on.
	else
		user.visible_message("<span class='notice'>[user] lights [src].</span>", "<span class='notice'>You light [src]!</span>")
		playsound(loc, 'sound/effects/torch_light.ogg', 50, 0)
		force = on_damage
		damtype = BURN
		w_class = WEIGHT_CLASS_BULKY
		desc = "A handheld wooden torch that's slowly burning away."
		START_PROCESSING(SSobj, src)
		on = !on
		update_brightness(user)
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtonIcon()
		return TRUE
