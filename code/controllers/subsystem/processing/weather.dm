#define STARTUP_STAGE 1
#define MAIN_STAGE 2
#define WIND_DOWN_STAGE 3
#define END_STAGE 4

//Used for all kinds of weather, ex. lavaland ash storms.
PROCESSING_SUBSYSTEM_DEF(weather)
	name = "Weather"
	flags = SS_BACKGROUND
	wait = 10
	runlevels = RUNLEVEL_GAME
	var/list/eligible_zlevels = list()
	var/list/next_hit_by_zlevel = list() //Used by barometers to know when the next storm is coming
	var/weather_on_start = FALSE

/datum/controller/subsystem/processing/weather/fire()
	. = ..()		//Active weather is handled by . = ..() processing subsystem base fire().

	// start random weather on relevant levels
	for(var/z in eligible_zlevels)
		var/possible_weather = eligible_zlevels[z]
		var/datum/weather/our_event = pickweight(possible_weather)
		// Run weather together on all Zs in a block, from the surface upwards
		run_weather(our_event, get_surface_zblock(text2num(z))) // Sunset change
		eligible_zlevels -= z
		var/randTime = rand(25 MINUTES, 30 MINUTES)
		next_hit_by_zlevel["[z]"] = addtimer(CALLBACK(src, .proc/make_eligible, z, possible_weather), randTime + initial(our_event.weather_duration_upper), TIMER_UNIQUE|TIMER_STOPPABLE) //Around 5-10 minutes between weathers

/datum/controller/subsystem/processing/weather/Initialize(start_timeofday)
	for(var/V in subtypesof(/datum/weather))
		var/datum/weather/W = V
		var/probability = initial(W.probability)
		var/target_trait = initial(W.target_trait)

		// any weather with a probability set may occur at random
		if (probability)
			for(var/z in SSmapping.levels_by_trait(target_trait))
				LAZYINITLIST(eligible_zlevels["[z]"])
				eligible_zlevels["[z]"][W] = probability
	return ..()

/datum/controller/subsystem/processing/weather/proc/run_weather(datum/weather/weather_datum_type, z_levels)
	if (istext(weather_datum_type))
		for (var/V in subtypesof(/datum/weather))
			var/datum/weather/W = V
			if (initial(W.name) == weather_datum_type)
				weather_datum_type = V
				break
	if (!ispath(weather_datum_type, /datum/weather))
		CRASH("run_weather called with invalid weather_datum_type: [weather_datum_type || "null"]")

	if (isnull(z_levels))
		z_levels = SSmapping.levels_by_trait(initial(weather_datum_type.target_trait))
	else if (isnum(z_levels))
		z_levels = list(z_levels)
	else if (!islist(z_levels))
		CRASH("run_weather called with invalid z_levels: [z_levels || "null"]")

	var/datum/weather/W = new weather_datum_type(z_levels)
	W.telegraph()

/datum/controller/subsystem/processing/weather/proc/make_eligible(z, possible_weather)
	eligible_zlevels[z] = possible_weather
	next_hit_by_zlevel["[z]"] = null

/datum/controller/subsystem/processing/weather/proc/get_weather(z, area/active_area)
	var/datum/weather/A
	for(var/V in processing)
		var/datum/weather/W = V
		if((z in W.impacted_z_levels) && is_path_in_list(active_area.type, W.area_types))
			A = W
			break
	return A
