/proc/get_step_multiz(ref, dir)
	if(dir & UP)
		dir &= ~UP
		return get_step(SSmapping.get_turf_above(get_turf(ref)), dir)
	if(dir & DOWN)
		dir &= ~DOWN
		return get_step(SSmapping.get_turf_below(get_turf(ref)), dir)
	return get_step(ref, dir)

/proc/get_multiz_accessible_levels(center_z)
	. = list(center_z)
	var/other_z = center_z
	var/offset
	while((offset = SSmapping.level_trait(other_z, ZTRAIT_DOWN)))
		other_z += offset
		. += other_z
	other_z = center_z
	while((offset = SSmapping.level_trait(other_z, ZTRAIT_UP)))
		other_z += offset
		. += other_z
	return .


/proc/get_dir_multiz(turf/us, turf/them)
	us = get_turf(us)
	them = get_turf(them)
	if(!us || !them)
		return NONE
	if(us.z == them.z)
		return get_dir(us, them)
	else
		var/turf/T = us.above()
		var/dir = NONE
		if(T && (T.z == them.z))
			dir = UP
		else
			T = us.below()
			if(T && (T.z == them.z))
				dir = DOWN
			else
				return get_dir(us, them)
		return (dir | get_dir(us, them))

/turf/proc/above()
	return get_step_multiz(src, UP)

/turf/proc/below()
	return get_step_multiz(src, DOWN)
	
/proc/get_levels_above(bottom_z) // :pleading_face:
	. = list(bottom_z)
	var/other_z = bottom_z
	var/offset
	while((offset = SSmapping.level_trait(other_z, ZTRAIT_UP)))
		other_z += offset
		. += other_z
	return .

GLOBAL_LIST_EMPTY(surface_zblocks)
/proc/get_surface_zblock(surface_z)
	// this assumes we pass in a surface level
	if (!SSmapping.level_trait(surface_z, ZTRAIT_SURFACE))
		CRASH("Non-surface level [surface_z] passed to get_surface_zblocks!")
	if (!GLOB.surface_zblocks["[surface_z]"])
		GLOB.surface_zblocks["[surface_z]"] = get_levels_above(surface_z)
	return GLOB.surface_zblocks["[surface_z]"]
