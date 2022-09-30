

/datum/unit_test/reagent_recipe_collisions

/datum/unit_test/reagent_recipe_collisions/Run()
	build_chemical_reactions_list()
	var/list/reactions = list()
	for(var/V in GLOB.chemical_reactions_list)
		reactions += GLOB.chemical_reactions_list[V]
	for(var/i in 1 to (reactions.len-1))
		for(var/i2 in (i+1) to reactions.len)
			var/datum/chemical_reaction/r1 = reactions[i]
			var/datum/chemical_reaction/r2 = reactions[i2]
			if(chem_recipes_do_conflict(r1, r2))
				Fail("Chemical recipe conflict between [r1.type] and [r2.type]")

/datum/unit_test/reagent_recipe_id_collisions

/datum/unit_test/reagent_recipe_id_collisions/Run()
	build_chemical_reactions_list()
	var/list/seen_ids = list()
	for(var/result_reagent in GLOB.chemical_reactions_list)
		for(var/datum/chemical_reaction/reaction as anything in GLOB.chemical_reactions_list[result_reagent])
			if(isnull(reaction.id))
				Fail("Chemical recipe [reaction.type] has no ID set")
			LAZYADD(seen_ids[reaction.id], reaction.type)
	for(var/id in seen_ids)
		if(length(seen_ids[id]) <= 1)
			continue
		var/fail_string = "Chemical recipe id [id] matches more than one entry:\n"
		for(var/reaction in seen_ids[id])
			fail_string += "\t- [reaction]\n"
		Fail(fail_string)
