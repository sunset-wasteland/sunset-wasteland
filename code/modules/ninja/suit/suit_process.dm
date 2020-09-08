/obj/item/clothing/suit/space/space_ninja/process(delta_time)
	if(!affecting || !s_initialized)
		return PROCESS_KILL

	if(cell.charge > 0)
		if(s_coold)
			s_coold -= delta_time //Checks for ability s_cooldown first.

		cell.charge -= s_cost * delta_time //s_cost is the default energy cost each second, usually 2.5.
		if(stealth && stealth_cooldown <= world.time)//If stealth is active.
			cell.charge -= s_acost * delta_time
			affecting.alpha = max(affecting.alpha - 10, 15)

	else
		cell.charge = 0
		if(stealth)
			cancel_stealth()
