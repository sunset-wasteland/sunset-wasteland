///This element just handles creating and destroying an area sound manager that's hooked into weather stuff
/datum/element/weather_listener
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 2
	var/weather_type
	//What events to change the track on
	var/list/sound_change_signals
	//The weather type we're working with
	var/weather_trait
	//The playlist of sounds to draw from. Pass by ref
	var/list/playlist


/datum/element/weather_listener/Attach(atom/target, w_type, trait, weather_playlist)
	. = ..()
	if(!weather_type)
		weather_type = w_type
		sound_change_signals = list(
			COMSIG_WEATHER_TELEGRAPH(weather_type),
			COMSIG_WEATHER_START(weather_type),
			COMSIG_WEATHER_WINDDOWN(weather_type),
			COMSIG_WEATHER_END(weather_type)
		)
		weather_trait = trait
		playlist = weather_playlist

	RegisterSignal(target, COMSIG_MOVABLE_Z_CHANGED, .proc/handle_z_level_change)
	RegisterSignal(target, COMSIG_MOB_LOGOUT, .proc/handle_logout)

	var/turf/target_turf = get_turf(target)
	handle_z_level_change(target, target_turf, target_turf)

/datum/element/weather_listener/Detach(datum/source)
	. = ..()
	UnregisterSignal(source, list(COMSIG_MOVABLE_Z_CHANGED, COMSIG_MOB_LOGOUT))

/datum/element/weather_listener/proc/handle_z_level_change(datum/source, turf/old_turf, turf/new_turf)
	SIGNAL_HANDLER
	var/list/trait_levels = SSmapping.levels_by_trait(weather_trait)
	var/list/fitting_z_levels
	if(weather_trait == ZTRAIT_SURFACE)
		fitting_z_levels = list()
		for(var/trait_level in trait_levels)
			fitting_z_levels += get_surface_zblock(trait_level)
	else
		fitting_z_levels = trait_levels
	if(!(new_turf?.z in fitting_z_levels))
		return
	source.AddComponent(/datum/component/area_sound_manager, playlist, list(), COMSIG_MOB_LOGOUT, sound_change_signals, list(), fitting_z_levels)

/datum/element/weather_listener/proc/handle_logout(datum/source)
	SIGNAL_HANDLER
	source.RemoveElement(/datum/element/weather_listener, weather_type, weather_trait, playlist)

