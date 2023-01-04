/obj/structure/destructible/tribal_torch
	name = "tribal torch"
	desc = "A standing torch, used to provide light in dark environments."
	density = FALSE
	anchored = TRUE
	icon = 'icons/obj/candle.dmi'
	icon_state = "torch_unlit"
	light_color = LIGHT_COLOR_FIRE
	light_power = 1
	light_range = 0
	break_sound = 'sound/hallucinations/veryfar_noise.ogg'
	debris = list(/obj/item/candle/tribal_torch = 1)
	var/burning = FALSE
	var/flickering = FALSE
	var/flicker_chance = 1 // percent

/obj/structure/destructible/tribal_torch/update_icon()
	icon_state = "torch_[burning ? null : "un"]lit"

/obj/structure/destructible/tribal_torch/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(burning)
		user.visible_message("<span class='notice'>[user] snuffs [src] out.</span>", "<span class='notice'>You snuff [src] out.</span>")
		burning = FALSE
		update_icon()
		set_light(0)
		return
	if(!burning)
		user.visible_message("<span class='notice'>[user] starts to pull [src] free from the ground....</span>", "<span class='notice'>You start to pull [src] free from the ground...</span>")
		if(do_after(user, 20, progress = 1, target = src))
			to_chat(user, span_notice("You pull [src] free from the ground."))
			var/torch = new /obj/item/candle/tribal_torch
			user.put_in_hands(torch)
			qdel(src)
			return

/obj/structure/destructible/tribal_torch/attackby(obj/item/W, mob/user, params)
	if(W.get_temperature())
		StartBurning()
		user.visible_message("<span class='notice'>[user] lights [src] with [W].</span>", "<span class='notice'>You light [src] with [W].</span>")
		return

/obj/structure/destructible/tribal_torch/proc/StartBurning()
	if(!burning)
		burning = TRUE
		set_light(7)
		update_icon()
		return

/obj/structure/destructible/tribal_torch/process()
	. = ..()
	if(!flickering && prob(flicker_chance))
		flicker(rand(1, 4)) // 0.1 to 0.4 seconds

/obj/structure/destructible/tribal_torch/proc/flicker(duration)
	addtimer(CALLBACK(src, .proc/unflicker, light_range), duration)
	set_light(light_range - rand(1, 2))
	flickering = TRUE
	addtimer(CALLBACK(src, .proc/unflicker), duration)

/obj/structure/destructible/tribal_torch/proc/unflicker(new_range)
	set_light(new_range)
	flickering = FALSE

/obj/structure/destructible/tribal_torch/fire_act(exposed_temperature, exposed_volume)
	StartBurning()

/obj/structure/destructible/tribal_torch/lit //ALREADY LIT TORCH FOR USE IN MAPPING
	burning = TRUE
	icon_state = "torch_lit"
	light_range = 7

/obj/structure/destructible/tribal_torch/wall
	icon_state = "wall_torch_unlit"

/obj/structure/destructible/tribal_torch/wall/update_icon()
	. = ..()
	icon_state = "wall_[icon_state]"
	pixel_y = (dir == NORTH) ? 15 : 0
	pixel_x = 0

/obj/structure/destructible/tribal_torch/wall/lit
	burning = TRUE
	icon_state = "wall_torch_lit"
	light_range = 7

// TORCH ITEM
/obj/item/candle/tribal_torch
	name = "tribal torch"
	desc = "A standing torch, used to provide light in dark environments."
	icon = 'icons/obj/candle.dmi'
	icon_state = "torch_unlit"
	item_state = "torch"
	w_class = WEIGHT_CLASS_BULKY
	light_color = LIGHT_COLOR_FIRE
	infinite = TRUE
	heat = T0C + 400
	light_range = 7
	var/flicker_chance = 1
	var/flickering = FALSE

/obj/item/candle/tribal_torch/attackby(obj/item/W, mob/user, params)
	..()
	var/msg = W.ignition_effect(src, user)
	if(msg)
		light(msg)

/obj/item/candle/tribal_torch/fire_act(exposed_temperature, exposed_volume)
	if(!lit)
		light() //honk
	..()

/obj/item/candle/tribal_torch/process()
	. = ..()
	if(!flickering && prob(flicker_chance))
		flicker(rand(1, 4)) // 0.1 to 0.4 seconds

/obj/item/candle/tribal_torch/proc/flicker(duration)
	flickering = TRUE
	addtimer(CALLBACK(src, .proc/unflicker, light_range), duration)
	set_light_range(light_range - rand(1, 2))

/obj/item/candle/tribal_torch/attack_self(mob/user)
	if(!lit)
		to_chat(user, "<span class='notice'>You start pushing [src] into the ground...</span>")
		if (do_after(user, 20, target=src))
			qdel(src)
			new /obj/structure/destructible/tribal_torch(get_turf(user))
			set_light_color(LIGHT_COLOR_ORANGE)
			user.visible_message("<span class='notice'>[user] plants [src] firmly in the ground.</span>", "<span class='notice'>You plant [src] firmly in the ground.</span>")
			return
	else
		user.visible_message(
			"<span class='notice'>[user] snuffs [src] out.</span>")
		lit = FALSE
		update_icon()
		set_light_on(FALSE)

/obj/item/candle/tribal_torch/proc/unflicker(new_range)
	set_light_range(new_range)
	flickering = FALSE

/obj/item/candle/tribal_torch/update_icon()
	icon_state = "torch_[lit ? null : "un"]lit"
	item_state = "torch[lit ? "-on" : null]"

/obj/item/candle/tribal_torch/proc/do_wallmount(turf/T, mob/user)
	var/ndir = turn(get_dir(T, user), 180)
	if(!(ndir in GLOB.cardinals))
		return
	var/turf/user_turf = get_turf(user)
	if(gotwallitem(user_turf, ndir, 2))
		to_chat(user, span_warning("There's already an item on this wall!"))
		return
	playsound(src.loc, 'sound/machines/click.ogg', 75, 1)
	user.visible_message("[user.name] attaches [src] to the wall.",
		span_notice("You attach [src] to the wall."),
		"<span class='italics'>You hear clicking.</span>")
	var/type_to_make = lit ? /obj/structure/destructible/tribal_torch/wall/lit : /obj/structure/destructible/tribal_torch/wall
	var/obj/structure/destructible/tribal_torch/wall/wall_torch = new type_to_make (user_turf)
	wall_torch.dir = ndir
	wall_torch.update_icon()
	qdel(src)
	return
