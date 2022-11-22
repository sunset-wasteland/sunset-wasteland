/proc/create_all_lighting_objects()
	var/area/current_area
	for(var/turf/T in world)
		current_area = T.loc
		if(!IS_DYNAMIC_LIGHTING(current_area) || !IS_DYNAMIC_LIGHTING(T))
			continue
		new/atom/movable/lighting_object(T)
		CHECK_TICK
