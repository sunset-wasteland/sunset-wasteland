/////////////
// RAILING //
/////////////

//Wooden fence
/obj/structure/railing/wood
	name = "wooden fence"
	desc = "Marks property and prevents accidents."
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "straight_wood"
	layer = WALL_OBJ_LAYER

/obj/structure/railing/wood/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/wood/post 
	icon_state = "post_wood"
	density = FALSE

/obj/structure/railing/wood/post/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/simple_door/metal/fence/wooden
	name = "wood fence gate"
	desc = "A wooden gate for a wood fence."
	icon_state = "fence_wood"
	door_type = "fence_wood"
	open_sound = "sound/machines/door_open.ogg"
	close_sound = "sound/machines/door_close.ogg"
	opacity = FALSE
	base_opacity = FALSE
	can_hold_padlock = TRUE


//Yellow rail
/obj/structure/railing/handrail
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon_state = "handrail_y"
	layer = WALL_OBJ_LAYER

/obj/structure/railing/handrail/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/end
	icon_state = "handrail_y_end"
	density = FALSE

/obj/structure/railing/handrail/end/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/intersect
	icon_state = "handrail_y_intersect"

//Rusty rail
/obj/structure/railing/handrail/rusty
	name = "handrail"
	desc = "Old, rusted metal handrails. The green paint is chipping off in spots."
	icon_state = "handrail_g"

/obj/structure/railing/handrail/rusty/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/rusty/end
	icon_state = "handrail_g_end"
	density = FALSE

/obj/structure/railing/handrail/rusty/end/underlayer
	layer = BELOW_MOB_LAYER

//Blue rail
/obj/structure/railing/handrail/blue
	name = "handrail"
	desc = "Old, rusted metal handrails. The green paint is chipping off in spots."
	icon_state = "handrail_b"

/obj/structure/railing/handrail/blue/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/blue/end
	icon_state = "handrail_b_end"

/obj/structure/railing/handrail/blue/end/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/handrail/blue/intersect
	icon_state = "handrail_b_intersect"


///////////
// POLES //
/////////// For tents and such

/obj/structure/railing/tent_pole
	icon_state = "pole_tent"
	density = FALSE

/obj/structure/railing/tent_pole/top
	icon_state = "pole_tent_top"

/obj/structure/railing/dancing_pole
	icon_state = "pole_b"
	layer = BELOW_MOB_LAYER

/obj/structure/railing/dancing_pole/top
	icon_state = "pole_t"
