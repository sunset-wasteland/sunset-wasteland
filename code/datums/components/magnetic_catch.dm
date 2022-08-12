/datum/component/magnetic_catch
	///given to connect_loc to listen for something moving onto or off of parent
	var/static/list/crossed_connections = list(
		COMSIG_ATOM_ENTERED = .proc/entered_react,
		COMSIG_ATOM_EXITED = .proc/exited_react,
	)

/datum/component/magnetic_catch/Initialize()
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, .proc/examine)
	if(ismovable(parent))
		AddComponent(/datum/component/connect_loc_behalf, parent, crossed_connections)
		for(var/i in get_turf(parent))
			if(i == parent)
				continue
			RegisterSignal(i, COMSIG_MOVABLE_PRE_THROW, .proc/throw_react)
	else
		RegisterSignal(parent, COMSIG_ATOM_ENTERED, .proc/entered_react)
		RegisterSignal(parent, COMSIG_ATOM_EXITED, .proc/exited_react)
		for(var/i in parent)
			RegisterSignal(i, COMSIG_MOVABLE_PRE_THROW, .proc/throw_react)

/datum/component/magnetic_catch/proc/examine(datum/source, mob/user, list/examine_list)
	examine_list += "It has been installed with inertia dampening to prevent coffee spills."

/datum/component/magnetic_catch/proc/entered_react(datum/source, atom/movable/thing, atom/oldloc)
	RegisterSignal(thing, COMSIG_MOVABLE_PRE_THROW, .proc/throw_react, TRUE)

/datum/component/magnetic_catch/proc/exited_react(datum/source, atom/movable/thing, atom/newloc)
	UnregisterSignal(thing, COMSIG_MOVABLE_PRE_THROW)

/datum/component/magnetic_catch/proc/throw_react(datum/source, list/arguments)
	return COMPONENT_CANCEL_THROW
