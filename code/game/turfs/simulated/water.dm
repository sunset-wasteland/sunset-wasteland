/turf/open/water
	gender = PLURAL
	name = "spring water"
	desc = "Shallow, almost clear water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/indestructible/ground/inside/mountain
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = TRUE
	slowdown = 2
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

	//fortuna edit
	depth = 1 // Higher numbers indicates deeper water.


// Fortuna edit. Below is Largely ported from citadels HRP branch

/turf/open/water/Initialize()
	. = ..()
	update_icon()
	// Moved from /turf/open/indestructible/ground/outside/desert to reduce lag.
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(turf_to_check.type == /turf/open/indestructible/ground/outside/desert) // don't do it for subtypes!
			var/obj/effect/overlay/desert_side/DS = new /obj/effect/overlay/desert_side(turf_to_check)
			switch(direction)
				if(NORTH)
					DS.pixel_y = -32
				if(SOUTH)
					DS.pixel_y = 32
				if(EAST)
					DS.pixel_x = -32
				if(WEST)
					DS.pixel_x = 32
			DS.dir = direction

/turf/open/water/update_icon()
	. = ..()

/turf/open/water/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/water))
			to_chat(L, "<span class='warning'>You get drenched in water!</span>")
	AM.water_act(5)
	..()

/turf/open/water/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/water))
			to_chat(L, "<span class='warning'>You wade through \the [src].</span>")
	..()

/mob/living/proc/check_submerged()
	if(buckled)
		return 0
	if(locate(/obj/structure/lattice/catwalk) in loc)
		return 0
	loc = get_turf(src)
	if(istype(loc, /turf/open/indestructible/ground/outside/water) || istype(loc, /turf/open/water))
		var/turf/open/T = loc
		return T.depth
	return 0

// Use this to have things react to having water applied to them.
/atom/movable/proc/water_act(amount)
	return

/mob/living/water_act(amount)
	if(ishuman(src))
		var/mob/living/carbon/human/drownee = src
		if(!drownee || drownee.stat == DEAD)
			return
		if(drownee.resting && !drownee.internal)
			if(drownee.stat != CONSCIOUS)
				drownee.adjustOxyLoss(1)
			else
				drownee.adjustOxyLoss(1)
				if(prob(35))
					to_chat(drownee, "<span class='danger'>You're drowning!</span>")
	adjust_fire_stacks(-amount * 5)
	for(var/atom/movable/AM in contents)
		AM.water_act(amount)

