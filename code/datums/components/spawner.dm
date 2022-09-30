/datum/component/spawner
	var/mob_types = list(/mob/living/simple_animal/hostile/carp)
	var/spawn_time = 30 SECONDS
	var/list/spawned_mobs = list()
	var/spawn_delay = 0
	var/max_mobs = 5
	var/spawn_text = "emerges from"
	var/spawn_sound
	var/list/faction = list("mining")
	var/infinite = TRUE /// If not infinite, we delete our parent when we hit max_mobs.

/datum/component/spawner/Initialize(_mob_types, _spawn_time, _faction, _spawn_text, _max_mobs, _spawn_sound = null, _infinite = TRUE)
	if(!isatom(parent))
		return COMPONENT_INCOMPATIBLE
	if(_spawn_time)
		spawn_time=_spawn_time
	if(_mob_types)
		mob_types=_mob_types
	if(_faction)
		faction=_faction
	if(_spawn_text)
		spawn_text=_spawn_text
	if(_max_mobs)
		max_mobs=_max_mobs
	if(_spawn_sound)
		spawn_sound=_spawn_sound
	infinite=_infinite

	RegisterSignal(parent, COMSIG_PARENT_QDELETING, .proc/stop_spawning)
	RegisterSignal(parent, COMSIG_OBJ_ATTACK_GENERIC, .proc/on_attack_generic)
	START_PROCESSING(SSprocessing, src)

/datum/component/spawner/process()
	try_spawn_mob()

/datum/component/spawner/proc/stop_spawning(datum/source, force, hint)
	STOP_PROCESSING(SSprocessing, src)
	for(var/datum/weakref/mob_ref as anything in spawned_mobs)
		var/mob/living/simple_animal/removed_animal = mob_ref.resolve()
		if(!removed_animal)
			continue
		if(removed_animal.nest == src)
			removed_animal.nest = null
	spawned_mobs = null

// Stopping clientless simple mobs' from indiscriminately bashing their own spawners due DestroySurroundings() et similars.
/datum/component/spawner/proc/on_attack_generic(datum/source, mob/user, damage_amount, damage_type, damage_flag, sound_effect, armor_penetration)
	if(!user.client && ((user.faction & faction) || (WEAKREF(user) in spawned_mobs)))
		return COMPONENT_STOP_GENERIC_ATTACK

/datum/component/spawner/proc/try_spawn_mob()
	var/atom/P = parent
	if(spawned_mobs.len >= max_mobs)
		return FALSE
	if(spawn_delay > world.time)
		return FALSE
	spawn_delay = world.time + spawn_time
	var/chosen_mob_type = pick(mob_types)
	var/mob/living/simple_animal/L = new chosen_mob_type(P.loc)
	L.flags_1 |= (P.flags_1 & ADMIN_SPAWNED_1)
	spawned_mobs += WEAKREF(L)
	L.nest = src
	if(length(faction))
		L.faction = src.faction
	P.visible_message(span_danger("[L] [spawn_text] [P]."))
	if(spawned_mobs.len >= max_mobs && !infinite)
		qdel(P)
