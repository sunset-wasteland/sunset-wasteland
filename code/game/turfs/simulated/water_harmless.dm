/turf/open/water/hwater

/turf/open/water/hwater/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/water/hwater))
			to_chat(L, "<span class='warning'>You get drenched in water!</span>")
	AM.water_act(5)
	..()

/turf/open/water/hwater/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/water/hwater))
			to_chat(L, "<span class='warning'>You wade through \the [src].</span>")
	..()
