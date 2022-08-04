/datum/crafting_recipe
	var/name = "" //in-game display name
	var/list/reqs = list() //type paths of items consumed associated with how many are needed
	var/list/blacklist = list() //type paths of items explicitly not allowed as an ingredient
	var/result //type path of item resulting from this craft
	var/list/tools = list() //type paths of items needed but not consumed
	var/time = 30 //time in deciseconds
	var/list/parts = list() //type paths of items that will be placed in the result
	var/list/chem_catalysts = list() //like tools but for reagents
	var/category = CAT_NONE //where it shows up in the crafting UI
	var/subcategory = CAT_NONE
	var/always_available = TRUE //Set to FALSE if it needs to be learned first.
	var/granting_trait /// Trait(s) that grant this recipe automatically. Can be a single trait define OR a list of trait defines.

/datum/crafting_recipe/New()
	if(!(result in reqs))
		blacklist += result

/**
 * Run custom pre-craft checks for this recipe
 *
 * user: The /mob that initiated the crafting
 * collected_requirements: A list of lists of /obj/item instances that satisfy reqs. Top level list is keyed by requirement path.
 */
/datum/crafting_recipe/proc/check_requirements(mob/user, list/collected_requirements)
	return TRUE

/datum/crafting_recipe/proc/check_trait(mob/user)
	. = FALSE
	if (islist(granting_trait))
		. = TRUE
		for (var/trait in granting_trait)
			// Format: list(list(trait_1, trait_2), trait_3)
			// will require trait 3, as well as either trait 1 or trait 2
			if (islist(trait))
				var/has_inner_trait = FALSE
				for (var/inner_trait in trait)
					if (HAS_TRAIT(user, inner_trait))
						has_inner_trait = TRUE
						break
				. = has_inner_trait
			else if (istext(granting_trait))
				if (HAS_TRAIT(user, trait))
					continue
				. = FALSE
			if (!.)
				break
	else if (istext(granting_trait))
		. = HAS_TRAIT(user, granting_trait)
