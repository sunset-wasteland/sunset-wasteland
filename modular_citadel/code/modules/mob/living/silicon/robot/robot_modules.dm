/obj/item/robot_module
	var/list/added_channels = list() //Borg radio stuffs
	var/cyborg_pixel_offset
	var/dogborg = FALSE

/mob/living/silicon/robot/modules/medihound
	set_module = /obj/item/robot_module/medihound

/mob/living/silicon/robot/modules/k9
	set_module = /obj/item/robot_module/k9

/mob/living/silicon/robot/modules/scrubpup
	set_module = /obj/item/robot_module/scrubpup

/mob/living/silicon/robot/proc/get_cit_modules()
	var/list/modulelist = list()
	modulelist["MediHound"] = /obj/item/robot_module/medihound
	modulelist["Security K-9"] = /obj/item/robot_module/k9
	modulelist["Scrub Puppy"] = /obj/item/robot_module/scrubpup
	return modulelist

/obj/item/robot_module/k9
	name = "Security K-9 Unit"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/storage/bag/borgdelivery,
		/obj/item/dogborg/jaws/big,
		/obj/item/clothing/mask/gas/sechailer/cyborg,
		/obj/item/soap/tongue,
		/obj/item/analyzer/nose,
		/obj/item/holosign_creator/security,
		/obj/item/gun/energy/disabler/cyborg,
		/obj/item/gun/energy/laser/pistol/cyborg/gutsy)
	ratvar_modules = list(/obj/item/clockwork/slab/cyborg/security,
		/obj/item/clockwork/weapon/ratvarian_spear)
	borghealth = 300
	cyborg_base_icon = "k9"
	moduleselect_icon = "k9"
	moduleselect_alternate_icon = 'modular_citadel/icons/ui/screen_cyborg.dmi'
	can_be_pushed = FALSE
	hat_offset = INFINITY
	sleeper_overlay = "ksleeper"
	cyborg_icon_override = 'modular_sunset/icons/mob/robot/widerobot_sec.dmi'
	has_snowflake_deadsprite = TRUE
	dogborg = TRUE
	cyborg_pixel_offset = -16

/obj/item/robot_module/k9/be_transformed_to(obj/item/robot_module/old_module)
	var/mob/living/silicon/robot/R = loc
	var/static/list/k9_models
	if(!k9_models)
		k9_models = list(
			"K9" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_sec.dmi', icon_state = "k9", pixel_x = -16),
			"Dark" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_sec.dmi', icon_state = "k9dark", pixel_x = -16),
			"Vale" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_sec.dmi', icon_state = "valesec", pixel_x = -16),
			"Drake" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_sec.dmi', icon_state = "drakesec", pixel_x = -16)
		)
		k9_models = sortList(k9_models)
	var/k9_borg_icon = show_radial_menu(R, R , k9_models, custom_check = CALLBACK(src, .proc/check_menu, R), radius = 42, require_near = TRUE, tooltips = TRUE)
	if(!k9_borg_icon)
		return
	switch(k9_borg_icon)
		if("K9")
			cyborg_base_icon = "k9"
		if("Dark")
			cyborg_base_icon = "k9dark"
		if("Vale")
			cyborg_base_icon = "valesec"
		if("Drake")
			cyborg_base_icon = "drakesec"
	return ..()

/obj/item/robot_module/medihound
	name = "MediHound"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/dogborg/jaws/small,
		/obj/item/storage/bag/borgdelivery,
		/obj/item/analyzer/nose,
		/obj/item/soap/tongue,
		/obj/item/extinguisher/mini,
		/obj/item/healthanalyzer,
		/obj/item/roller/robo,
		/obj/item/crowbar/cyborg,
		/obj/item/weapon/gripper/medical,
		/obj/item/surgical_drapes,
		/obj/item/retractor,
		/obj/item/hemostat,
		/obj/item/cautery,
		/obj/item/surgicaldrill,
		/obj/item/scalpel,
		/obj/item/circular_saw,
		/obj/item/reagent_containers/borghypo,
		/obj/item/twohanded/shockpaddles/cyborg/hound,
		/obj/item/stack/medical/gauze/cyborg,
		/obj/item/reagent_containers/syringe,
		/obj/item/organ_storage)
	ratvar_modules = list(/obj/item/clockwork/slab/cyborg/medical,
		/obj/item/clockwork/weapon/ratvarian_spear)
	cyborg_base_icon = "medihound"
	moduleselect_icon = "medihound"
	moduleselect_alternate_icon = 'modular_citadel/icons/ui/screen_cyborg.dmi'
	can_be_pushed = FALSE
	hat_offset = INFINITY
	sleeper_overlay = "msleeper"
	cyborg_icon_override = 'modular_sunset/icons/mob/robot/widerobot_med.dmi'
	has_snowflake_deadsprite = TRUE
	dogborg = TRUE
	cyborg_pixel_offset = -16

/obj/item/robot_module/medihound/be_transformed_to(obj/item/robot_module/old_module)
	var/mob/living/silicon/robot/R = loc
	var/static/list/medihound_models
	if(!medihound_models)
		medihound_models = list(
		"Medihound" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_med.dmi', icon_state = "medihound", pixel_x = -16),
		"Dark" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_med.dmi', icon_state = "medihounddark", pixel_x = -16),
		"Vale" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_med.dmi', icon_state = "valemed", pixel_x = -16),
		"Drake" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_med.dmi', icon_state = "drakemed", pixel_x = -16)
		)
		medihound_models = sortList(medihound_models)
	var/medihound_borg_icon = show_radial_menu(R, R , medihound_models, custom_check = CALLBACK(src, .proc/check_menu, R), radius = 42, require_near = TRUE, tooltips = TRUE)
	if(!medihound_borg_icon)
		return
	switch(medihound_borg_icon)
		if("Medihound")
			cyborg_base_icon = "medihound"
		if("Dark")
			cyborg_base_icon = "medihounddark"
		if("Vale")
			cyborg_base_icon = "valemed"
		if("Drake")
			cyborg_base_icon = "drakemed"
	return ..()

/obj/item/robot_module/scrubpup
	name = "Scrub Pup"
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/dogborg/jaws/small,
		/obj/item/analyzer/nose,
		/obj/item/crowbar/cyborg,
		/obj/item/soap/tongue/scrubpup,
		/obj/item/stack/tile/plasteel/cyborg,
		/obj/item/storage/bag/trash/cyborg,
		/obj/item/lightreplacer/cyborg,
		/obj/item/extinguisher/mini,
		/obj/item/holosign_creator)
	ratvar_modules = list(
		/obj/item/clockwork/replica_fabricator/cyborg)
	cyborg_base_icon = "scrubpup"
	moduleselect_icon = "janitor"
	hat_offset = INFINITY
	clean_on_move = TRUE
	sleeper_overlay = "jsleeper"
	cyborg_icon_override = 'modular_sunset/icons/mob/robot/widerobot_jani.dmi'
	has_snowflake_deadsprite = TRUE
	dogborg = TRUE
	cyborg_pixel_offset = -16

/obj/item/robot_module/scrubpup/be_transformed_to(obj/item/robot_module/old_module)
	var/mob/living/silicon/robot/R = loc
	var/static/list/scrubpup_models
	if(!scrubpup_models)
		scrubpup_models = list(
		"Scrubpup" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_jani.dmi', icon_state = "scrubpup", pixel_x = -16),
		"Drake" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_jani.dmi', icon_state = "drakejanit", pixel_x = -16),
		"J9" = image(icon = 'modular_sunset/icons/mob/robot/widerobot_jani.dmi', icon_state = "J9", pixel_x = -16)
		)
	var/scrubpup_borg_icon = show_radial_menu(R, R , scrubpup_models, custom_check = CALLBACK(src, .proc/check_menu, R), radius = 42, require_near = TRUE, tooltips = TRUE)
	if(!scrubpup_borg_icon)
		return
	switch(scrubpup_borg_icon)
		if("Scrubpup")
			cyborg_base_icon = "scrubpup"
		if("Drake")
			cyborg_base_icon = "drakejanit"
		if("J9")
			cyborg_base_icon = "J9"
	return ..()

/obj/item/robot_module/scrubpup/respawn_consumable(mob/living/silicon/robot/R, coeff = 1)
	..()
	var/obj/item/lightreplacer/LR = locate(/obj/item/lightreplacer) in basic_modules
	if(LR)
		for(var/i in 1 to coeff)
			LR.Charge(R)
