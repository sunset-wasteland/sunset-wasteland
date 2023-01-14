/obj/item/var/list/components

/obj/item/attackby(obj/item/W, mob/user, params)
	if(istype(components) && istype(W, /obj/item/screwdriver))
		user.visible_message(span_notice("[user] starts disassembling \the [src] with \the [W]."), span_notice("You start disassembling \the [src] with \the [W]."))
		if(do_after(user, 4 SECONDS * W.toolspeed, 1, target = src))
			for(var/comp in components)
				for(var/i=0, i<components[comp], i++)
					new comp(get_turf(src))
			qdel(src)
			return TRUE
		return FALSE
	. = ..()

/obj/item/examine(mob/user)
	. = ..()
	if(istype(components))
		. += span_notice("It seems it can be <b>disassembled</b>.")
