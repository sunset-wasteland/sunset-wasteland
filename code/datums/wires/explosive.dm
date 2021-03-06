/datum/wires/explosive
	req_trait = TRAIT_EXPLOSIVE_CRAFTING

/datum/wires/explosive/New(atom/holder)
	add_duds(2) // In this case duds actually explode.
	..()

/datum/wires/explosive/on_pulse(index)
	explode()

/datum/wires/explosive/on_cut(index, mend)
	explode()

/datum/wires/explosive/proc/explode()
	return


/datum/wires/explosive/c4
	holder_type = /obj/item/grenade/plastic/c4
	randomize = TRUE	//Same behaviour since no wire actually disarms it
	req_skill = JOB_SKILL_UNTRAINED

/datum/wires/explosive/c4/interactable(mob/user)
	var/obj/item/grenade/plastic/c4/P = holder
	if(P.open_panel)
		return TRUE

/datum/wires/explosive/c4/explode()
	var/obj/item/grenade/plastic/c4/P = holder
	P.prime()


/datum/wires/explosive/pizza
	holder_type = /obj/item/pizzabox
	randomize = TRUE
	req_skill = JOB_SKILL_MASTER

/datum/wires/explosive/pizza/New(atom/holder)
	wires = list(
		WIRE_DISARM
	)
	add_duds(3) // Duds also explode here.
	..()

/datum/wires/explosive/pizza/interactable(mob/user)
	var/obj/item/pizzabox/P = holder
	if(P.open && P.bomb)
		return TRUE

/datum/wires/explosive/pizza/get_status()
	var/obj/item/pizzabox/P = holder
	var/list/status = list()
	status += "The red light is [P.bomb_active ? "on" : "off"]."
	status += "The green light is [P.bomb_defused ? "on": "off"]."
	return status

/datum/wires/explosive/pizza/on_pulse(wire)
	var/obj/item/pizzabox/P = holder
	switch(wire)
		if(WIRE_DISARM) // Pulse to toggle
			P.bomb_defused = !P.bomb_defused
		else // Boom
			explode()

/datum/wires/explosive/pizza/on_cut(wire, mend)
	var/obj/item/pizzabox/P = holder
	switch(wire)
		if(WIRE_DISARM) // Disarm and untrap the box.
			if(!mend)
				P.bomb_defused = TRUE
		else
			if(!mend && !P.bomb_defused)
				explode()

/datum/wires/explosive/pizza/explode()
	var/obj/item/pizzabox/P = holder
	P.bomb.detonate()


/datum/wires/explosive/gibtonite
	holder_type = /obj/item/gibtonite

/datum/wires/explosive/gibtonite/explode()
	var/obj/item/gibtonite/P = holder
	P.GibtoniteReaction(null, 2)

/datum/wires/explosive/mine
	holder_type = /obj/item/mine
	randomize = FALSE
	req_skill = JOB_SKILL_UNTRAINED

/datum/wires/explosive/mine/New(atom/holder)
	wires = list(
		WIRE_DISARM
	)
	add_duds(2) // Duds also explode here.
	..()

/datum/wires/explosive/mine/interactable(mob/user)
	return TRUE

/datum/wires/explosive/mine/explode()
	var/obj/item/mine/P = holder
	P.arm()

/datum/wires/explosive/mine/on_cut(wire, mend)
	var/obj/item/mine/P = holder
	switch(wire)
		if(WIRE_DISARM) // Disarm and untrap the box.
			if(!mend)
				P.armed = FALSE
				P.anchored = FALSE
		else
			if(!mend)
				P.arm()

/datum/wires/explosive/mine/on_pulse(wire)
	var/obj/item/mine/P = holder
	switch(wire)
		if(WIRE_DISARM) // Pulse to toggle
			P.armed = FALSE
			P.anchored = FALSE
		else // Boom
			P.arm()

/datum/wires/explosive/mine/random
	randomize = TRUE //be careful!
