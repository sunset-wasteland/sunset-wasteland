#define COMPILED_LEVELS 1 // Change this if you change the number of compiled-in maps.

/datum/unit_test/station_z_reused_areas/Run()
	var/list/bad_areas = list()
	var/list/station_levels = SSmapping.levels_by_trait(ZTRAIT_STATION)
	for (var/z1=length(station_levels), z1 > 1, z1--)
		for (var/z2=z1-1, z2 > 0, z2--)
			bad_areas["[z2]"] = SSmapping.areas_in_z["[z1]"] | SSmapping.areas_in_z["[z2]"]
	for(var/z in bad_areas)
		if(length(bad_areas[z]))
			Fail("Station level [z] ([SSmapping.config.map_file[text2num(z)-COMPILED_LEVELS]]) reuses the following areas from earlier station levels: [bad_areas.Join(", ")]")
