/turf/open/water/hwater
	name = "spring water"

/turf/open/water/hwater/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		L.radiation -= min(L.radiation, 4.1)
	..()

/turf/open/hwater/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		L.radiation -= min(L.radiation, 4.1)
	..()

