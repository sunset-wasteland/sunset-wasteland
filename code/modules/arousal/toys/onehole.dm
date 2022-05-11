//////////
//onehole//
//////////
/obj/item/onehole
	name 				= "onehole"
	desc 				= "Floppy!"
	icon 				= 'icons/obj/genitals/onehole.dmi'
	force 				= 10
	hitsound			= 'sound/weapons/tap.ogg'
	throwforce			= 5
	icon_state 			= "onahole_plain_2"
	alpha 				= 192//transparent
	var/can_customize	= FALSE
	var/onehole_shape 	= "plain"
	var/onehole_size		= 2
	var/onehole_type		= "onehole"//pretty much just used for the icon state
	var/random_color 	= TRUE
	var/random_size 	= FALSE
	var/random_shape 	= FALSE
	var/is_knotted		= FALSE
	//Lists moved to _cit_helpers.dm as globals so they're not instanced individually

/obj/item/onehole/proc/update_appearance()
	icon_state = "[onehole_type]_[onehole_shape]_[onehole_size]"
	var/sizeword = ""
	switch(onehole_size)
		if(1)
			sizeword = "small "
		if(2)
			sizeword = "medium "
		if(3)
			sizeword = "large "

	name = "[sizeword][onehole_shape] [can_customize ? "custom " : ""][onehole_type]"

/obj/item/onehole/AltClick(mob/living/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	customize(user)
	return TRUE

/obj/item/onehole/proc/customize(mob/living/user)
	if(!can_customize)
		return FALSE
	if(src && !user.incapacitated() && in_range(user,src))
		var/color_choice = input(user,"Choose a color for your onehole.","onehole Color") as null|anything in GLOB.onehole_colors
		if(src && color_choice && !user.incapacitated() && in_range(user,src))
			sanitize_inlist(color_choice, GLOB.onehole_colors, "Red")
			color = GLOB.onehole_colors[color_choice]
	update_appearance()
	if(src && !user.incapacitated() && in_range(user,src))
		var/shape_choice = input(user,"Choose a shape for your onehole.","onehole Shape") as null|anything in GLOB.onehole_shapes
		if(src && shape_choice && !user.incapacitated() && in_range(user,src))
			sanitize_inlist(shape_choice, GLOB.onehole_colors, "Knotted")
			onehole_shape = GLOB.onehole_shapes[shape_choice]
	update_appearance()
	if(src && !user.incapacitated() && in_range(user,src))
		var/size_choice = input(user,"Choose the size for your onehole.","onehole Size") as null|anything in GLOB.onehole_sizes
		if(src && size_choice && !user.incapacitated() && in_range(user,src))
			sanitize_inlist(size_choice, GLOB.onehole_colors, "Medium")
			onehole_size = GLOB.onehole_sizes[size_choice]
	update_appearance()
	if(src && !user.incapacitated() && in_range(user,src))
		var/transparency_choice = input(user,"Choose the transparency of your onehole. Lower is more transparent!(192-255)","onehole Transparency") as null|num
		if(src && transparency_choice && !user.incapacitated() && in_range(user,src))
			sanitize_integer(transparency_choice, 192, 255, 192)
			alpha = transparency_choice
	update_appearance()
	return TRUE

/obj/item/onehole/Initialize()
	. = ..()
	if(random_color == TRUE)
		var/randcolor = pick(GLOB.onehole_colors)
		color = GLOB.onehole_colors[randcolor]
	if(random_shape == TRUE)
		var/randshape = pick(GLOB.onehole_shapes)
		onehole_shape = GLOB.onehole_shapes[randshape]
	if(random_size == TRUE)
		var/randsize = pick(GLOB.onehole_sizes)
		onehole_size = GLOB.onehole_sizes[randsize]
	update_appearance()
	alpha		= rand(192, 255)
	pixel_y 	= rand(-7,7)
	pixel_x 	= rand(-7,7)

/obj/item/onehole/examine(mob/user)
	. = ..()
	if(can_customize)
		. += "<span class='notice'>Alt-Click \the [src.name] to customize it.</span>"

/obj/item/onehole/random//totally random
	name 				= "random onehole"//this name will show up in vendors and shit so you know what you're vending(or don't, i guess :^))
	random_color 		= TRUE
	random_shape 		= TRUE
	random_size 		= TRUE

// /obj/item/onehole/knotted
// 	onehole_shape 		= "knotted"
// 	name 				= "knotted onehole"
// 	attack_verb 		= list("penetrated", "knotted", "slapped", "inseminated")

obj/item/onehole/plain
	onehole_shape 		= "plain"
	name 				= "plain onehole"
	attack_verb 		= list("embraced", "sucked", "milked")

obj/item/onehole/plain
	onehole_shape 		= "plain"
	name 				= "plain onehole"
	attack_verb 		= list("embraced", "sucked", "milked")

// obj/item/onehole/flared
// 	onehole_shape 		= "flared"
// 	name 				= "flared onehole"
// 	attack_verb 		= list("penetrated", "slapped", "neighed", "gaped", "prolapsed", "inseminated")

// obj/item/onehole/flared/huge
// 	name 				= "literal horse cock"
// 	desc 				= "THIS THING IS HUGE!"
// 	onehole_size 			= 4
// 	force				= 10

obj/item/onehole/custom
	name 				= "customizable onehole"
	desc 				= "Thanks to significant advances in synthetic nanomaterials, this onehole is capable of taking on many different forms to fit the user's preferences! Pricy!"
	can_customize		= TRUE
	random_color 		= TRUE
	random_shape 		= TRUE
	random_size 		= TRUE

// Suicide acts, by request

/obj/item/onehole/proc/manual_suicide(mob/living/user)
		user.visible_message("<span class='suicide'>[user] finally finishes deepthroating the [src], and their life.</span>")
		user.adjustOxyLoss(200)
		user.death(0)

/obj/item/onehole/suicide_act(mob/living/user)
//	is_knotted = ((src.onehole_shape == "knotted")?"They swallowed the knot":"Their face is turning blue")
	if(do_after(user,17,target=src))
		user.visible_message("<span class='suicide'>[user] tears-up and gags as they shove [src] down their throat! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(loc, 'sound/weapons/gagging.ogg', 50, 1, -1)
		user.Stun(150)
		user.adjust_blurriness(8)
		var/obj/item/organ/eyes/eyes = user.getorganslot(ORGAN_SLOT_EYES)
		eyes?.applyOrganDamage(10)
	return MANUAL_SUICIDE

/obj/item/onehole/flared/huge/suicide_act(mob/living/user)
	if(do_after(user,35,target=src))
		user.visible_message("<span class='suicide'>[user] tears-up and gags as they try to deepthroat the [src]! WHY WOULD THEY DO THAT? It looks like [user.p_theyre()] trying to commit suicide!!</span>")
		playsound(loc, 'sound/weapons/gagging.ogg', 50, 2, -1)
		user.Stun(300)
		user.adjust_blurriness(8)
	return MANUAL_SUICIDE

