
	//The mob should have a gender you want before running this proc. Will run fine without H
/datum/preferences/proc/random_character(gender_override)
	if(gender_override)
		gender = gender_override
	else
		gender = MALE
	underwear = "Boxers"
	undie_color = random_clothing_dye()
	undershirt = "Shirt - Short Sleeved"
	shirt_color = random_clothing_dye()
	socks = "Short"
	socks_color = random_clothing_dye()
	use_custom_skin_tone = FALSE
	skin_tone = pick("latino", "mediterranean")
	hair_style = pick("Trimmed", "Fade (Low)")
	facial_hair_style = pick("Beard (5 o\'Clock)", "Beard (3 o\'Clock)")
	hair_color = random_hair_shade()
	facial_hair_color = random_hair_shade()
	left_eye_color = random_dark_shade()
	right_eye_color = random_dark_shade()
	age = (rand(20, 25))


/datum/preferences/proc/update_preview_icon(current_tab)
	var/equip_job = (current_tab != APPEARANCE_TAB)
	// Determine what job is marked as 'High' priority, and dress them up as such.
	var/datum/job/previewJob = get_highest_job()

	if(previewJob)
		// Silicons only need a very basic preview since there is no customization for them.
		if(istype(previewJob,/datum/job/ai))
			parent.show_character_previews(image('icons/mob/ai.dmi', icon_state = resolve_ai_icon(preferred_ai_core_display), dir = SOUTH))
			return
		if(istype(previewJob,/datum/job/cyborg))
			parent.show_character_previews(image('icons/mob/robots.dmi', icon_state = "robot", dir = SOUTH))
			return
		if(istype(previewJob,/datum/job/enclave/encborg))
			parent.show_character_previews(image('icons/mob/robots.dmi', icon_state = "robot", dir = SOUTH))
			return

	// Set up the dummy for its photoshoot
	var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)
	// Apply the Dummy's preview background first so we properly layer everything else on top of it.
	mannequin.add_overlay(mutable_appearance('modular_citadel/icons/ui/backgrounds.dmi', bgstate, layer = SPACE_LAYER))
	copy_to(mannequin, initial_spawn = TRUE)

	if(current_tab == LOADOUT_TAB)
		//give it its loadout if not on the appearance tab
		SSjob.equip_loadout(parent.mob, mannequin, FALSE, bypass_prereqs = TRUE, can_drop = FALSE)
	else
		if(previewJob && equip_job)
			mannequin.job = previewJob.title
			previewJob.equip(mannequin, TRUE, preference_source = parent)

	mannequin.regenerate_icons()

	COMPILE_OVERLAYS(mannequin)
	parent.show_character_previews(new /mutable_appearance(mannequin))
	unset_busy_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)

/datum/preferences/proc/get_highest_job()
	var/highest_pref = 0
	var/datum/job/highest_job
	for(var/job in job_preferences)
		if(job_preferences["[job]"] > highest_pref)
			highest_job = SSjob.GetJob(job)
			highest_pref = job_preferences["[job]"]
	return highest_job
