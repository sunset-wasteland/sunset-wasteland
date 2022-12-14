/mob/living/simple_animal/hostile/retaliate
	///A list of weakrefs pointing at things that we consider targets
	var/list/enemies = list()

/mob/living/simple_animal/hostile/retaliate/Found(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(!L.stat)
			return L
		else
			enemies -= WEAKREF(L)
	else if(ismecha(A))
		var/obj/mecha/M = A
		if(M.occupant)
			return A

/mob/living/simple_animal/hostile/retaliate/ListTargets()
	if(!enemies.len)
		return list()
	var/list/see = ..()
	var/list/actual_enemies = list()
	for(var/datum/weakref/enemy as anything in enemies)
		var/mob/flesh_and_blood = enemy.resolve()
		if(!flesh_and_blood)
			enemies -= enemy
			continue
		actual_enemies += flesh_and_blood

	see &= actual_enemies // Remove all entries that aren't in enemies
	return see

/mob/living/simple_animal/hostile/retaliate/proc/Retaliate()
	for(var/mob/living/living_mob in view(src, vision_range))
		if(living_mob == src) // Ignore ourselves.
			continue
		if (faction_check_mob(living_mob)) // We're the same faction,
			if (!attack_same) // but do we care about infighting?
				var/mob/living/simple_animal/hostile/retaliate/comrade = living_mob
				if(istype(comrade) && !comrade.attack_same) // Goats of the world unite! You have nothing to lose but your chains!
					enemies |= comrade.enemies
				continue // Same faction and we don't want to attack them.
		// We're mad!
		enemies |= WEAKREF(living_mob)

	for(var/obj/mecha/mech in view(src, vision_range)) // We're also really mad at mechs.
		if(mech.occupant) // Specifically, their drivers.
			enemies |= WEAKREF(mech)
			enemies |= WEAKREF(mech.occupant)

	return 0

/mob/living/simple_animal/hostile/retaliate/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(. > 0 && stat == CONSCIOUS)
		Retaliate()
