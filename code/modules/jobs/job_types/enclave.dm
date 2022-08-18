//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/enclave
	department_flag = ENCLAVE
	selection_color = "#434944"
	faction = FACTION_ENCLAVE
	exp_type = EXP_TYPE_ENCLAVE

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)
	forbids = "Enclave taboos: Aiding Brotherhood or Republic members in any way no matter how small."
	enforces = "Enclave rules: Stay in uniform. Act mature and respectful. Obey orders and always remember you are fighting for the only true legitimate power in this land of savages. Wearing gasmasks outside the compound is encouraged but not required."
	objectivesList = list("Department of Defense advisory: Collect resources, attrition is depleting our reserves.", "Science Divison advisory: Capture human subjects for experiments, alive.")

/datum/outfit/job/enclave
	id = null
	ears = /obj/item/radio/headset/headset_enclave
	glasses = /obj/item/clothing/glasses/night/f13/enclave
	box = /obj/item/storage/survivalkit_adv

/datum/outfit/job/enclave/peacekeeper
	id = /obj/item/card/id/dogtag/enclave/trooper
	mask = /obj/item/clothing/mask/gas/enclave
	neck = /obj/item/storage/belt/holster/legholster
	backpack = /obj/item/storage/backpack/enclave
	satchel = /obj/item/storage/backpack/satchel/enclave
	belt = /obj/item/storage/belt/military/assault/enclave
	uniform = /obj/item/clothing/under/f13/enclave/peacekeeper
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots
	gloves = /obj/item/clothing/gloves/f13/military

/datum/outfit/job/enclave/noncombat
	id = /obj/item/card/id/dogtag/enclave/noncombatant
	backpack = /obj/item/storage/backpack/enclave
	satchel = /obj/item/storage/backpack/satchel/enclave
	belt = /obj/item/storage/belt/military/assault/enclave
	uniform = /obj/item/clothing/under/f13/enclave/science
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots

/datum/outfit/job/enclave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)

//Lieutenant
/datum/job/enclave/enclavelt
	title = "Enclave Lieutenant"
	flag = F13USLT
	total_positions = 1
	spawn_positions = 1
	access = list(ACCESS_ENCLAVE, ACCESS_CHANGE_IDS, ACCESS_ENCLAVE_COMMAND)
	description = "You are probably the last operating cell of the Enclave in the US, as far as you know. Your goal, primarily, is to collect organic material. Preferably alive, for the sake of testing. <br>\
	Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavelt
	exp_requirements = 1500

	loadout_options = list(
		/datum/outfit/loadout/lt_ballistics, // G11 and 14mm
		/datum/outfit/loadout/lt_plasma, // Plasma Rifle and Plasma Glock
		)


/datum/outfit/job/enclave/peacekeeper/enclavelt
	name = "Enclave Lieutenant"
	jobtype = /datum/job/enclave/enclavelt

	head = /obj/item/clothing/head/helmet/f13/enclave/officer
	uniform = /obj/item/clothing/under/f13/enclave/officer
	suit = /obj/item/clothing/suit/armor/f13/enclavetrenchcoat
	accessory = /obj/item/clothing/accessory/ncr/LT1
	id = /obj/item/card/id/dogtag/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave/command

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1
		)

/datum/outfit/loadout/lt_ballistics
	name = "Shiny Bullet"
	suit_store = /obj/item/gun/ballistic/automatic/g11/g11e
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m473 = 3,
		/obj/item/gun/ballistic/automatic/pistol/pistol14/custom = 1,
		/obj/item/ammo_box/magazine/m14mm = 2,
		)

/datum/outfit/loadout/lt_plasma
	name = "Never Forgotten"
	suit_store = /obj/item/gun/energy/laser/plasma
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/gun/energy/laser/plasma/glock = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		)

/datum/outfit/job/enclave/peacekeeper/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_PILOT, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)


// Gunnery Sergeant

/datum/job/enclave/f13gysergeant
	title = "Enclave Gunnery Sergeant"
	flag = F13USGYSGT
	total_positions = 1
	spawn_positions = 1
	access = list(ACCESS_ENCLAVE, ACCESS_CHANGE_IDS)
	description = "Second in command after Lieutenant, your role is to direct their orders directly to the sergeants and regular troops."
	supervisors = "The Lieutenant."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13gysergeant
	exp_requirements = 1400

	loadout_options = list(
		/datum/outfit/loadout/gysgt_ballistics, // CZ53
		/datum/outfit/loadout/gysgt_laser, // AER14
		/datum/outfit/loadout/gysgt_minigun, // Laser gatling
		)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant
	name = "Enclave Gunnery Sergeant"
	jobtype = /datum/job/enclave/f13gysergeant
	head = /obj/item/clothing/head/helmet/f13/power_armor/x02helmet
	suit = /obj/item/clothing/suit/armor/f13/power_armor/x02
	accessory = /obj/item/clothing/accessory/enclave/master_sergeant

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1
		)

/datum/outfit/loadout/gysgt_ballistics
	name = "Armored Assault Kit"
	backpack_contents = list(
		/obj/item/minigunpackbal5mm = 1,
		/obj/item/ammo_box/magazine/cz53 = 2
		)

/datum/outfit/loadout/gysgt_laser
	name = "Armored Rifleman Kit"
	suit_store = /obj/item/gun/energy/laser/aer14
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 4,
		)

/datum/outfit/loadout/gysgt_minigun
	name = "Armored Support Kit"
	suit_store = 	/obj/item/minigunpack
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ecp = 2,
		)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)


//Sergeant

/datum/job/enclave/enclavesgt
	title = "Enclave Sergeant"
	flag = F13USSGT
	total_positions = 2
	spawn_positions = 2
	description = "Entrusted with the command of the squads assigned to the bunker, your job is to assist the Lieutenant alongside the scientists."
	supervisors = "The Lieutenant and the Gunnery Sergeant."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavesgt
	exp_requirements = 1200

	loadout_options = list(
		/datum/outfit/loadout/sgt_ballistics,	// G11
		/datum/outfit/loadout/sgt_laser, 	// Wattz2k
		)

/datum/outfit/job/enclave/peacekeeper/enclavesgt
	name = "Enclave Sergeant"
	jobtype = /datum/job/enclave/enclavesgt
	head = /obj/item/clothing/head/helmet/f13/power_armor/x02helmet
	suit = /obj/item/clothing/suit/armor/f13/power_armor/x02
	accessory = /obj/item/clothing/accessory/enclave/sergeant

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/frag = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/head/f13/enclave/peacekeeper = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1
		)

/datum/outfit/loadout/sgt_ballistics
	name = "Frontline Operator"
	suit_store = /obj/item/gun/ballistic/automatic/g11
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m473 = 3,
		)

/datum/outfit/loadout/sgt_laser
	name = "Laser Support"
	suit_store = /obj/item/gun/energy/laser/wattz2k
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		)

/datum/outfit/job/enclave/peacekeeper/enclavesgt/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

//Specialist

/datum/job/enclave/f13specialist
	title = "Enclave Specialist"
	flag = F13USSPECIALIST
	total_positions = 2
	spawn_positions = 2
	description = "You are an operative for the remnants of the Enclave. You, unlike the normal privates, have recieved specialist training in either engineering or medicine."
	supervisors = "The Lieutenant and the Sergeants."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13specialist
	exp_requirements = 700

	loadout_options = list(
		/datum/outfit/loadout/combatmedic, // Medical Equipment
		/datum/outfit/loadout/combatengie, // Grenade Launcher
		)

/datum/outfit/job/enclave/peacekeeper/f13specialist
	name = "Enclave Specialist"
	jobtype = /datum/job/enclave/f13specialist
	head = /obj/item/clothing/head/helmet/f13/combat/enclave
	suit = /obj/item/clothing/suit/armor/f13/combat/enclave
	suit_store = /obj/item/gun/energy/laser/aer9
	accessory = /obj/item/clothing/accessory/enclave/specialist

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1
		)

/datum/outfit/loadout/combatmedic
	name = "Combat Medic"
	mask = /obj/item/clothing/mask/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	head = /obj/item/clothing/head/beret/enclave/science
	backpack_contents = list(
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/book/granter/trait/midsurgery = 1
		)

/datum/outfit/loadout/combatengie
	name = "Combat Engineer"
	mask = /obj/item/clothing/mask/gas/welding
	gloves = /obj/item/clothing/gloves/color/yellow
	head = /obj/item/clothing/head/hardhat/orange
	suit_store = /obj/item/gun/ballistic/revolver/grenadelauncher
	backpack_contents = list(
		/obj/item/storage/belt/utility = 1,
		/obj/item/ammo_box/a40mm = 2,
		/obj/item/shovel/trench = 1,
		/obj/item/metaldetector = 1
	)

/datum/outfit/job/enclave/peacekeeper/f13specialist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

//Private
/datum/job/enclave/enclavespy
	title = "Enclave Private"
	flag = F13USPRIVATE
	total_positions = 0
	spawn_positions = 0
	description = "You are an enlisted member of the Enclave. Obey your Lieutenant. He sets the Enclave's policies."
	supervisors = "The Lieutenant and the Sergeants"
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavespy
	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 3600//Next to a whitelist, this is the only thing to keep it bereft of you know what.

/datum/outfit/job/enclave/peacekeeper/enclavespy
	name = "Enclave Private"
	jobtype = /datum/job/enclave/enclavespy
	head = /obj/item/clothing/head/beret/enclave
	accessory = /obj/item/clothing/accessory/enclave/private_firstclass

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/pda = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1
		)

/datum/outfit/job/enclave/peacekeeper/enclavespy/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

//NON-COMBATANTS

//Scientist
/datum/job/enclave/enclavesci
	title = "Enclave Scientist"
	flag = F13USSCIENTIST
	total_positions = 2
	spawn_positions = 2
	description = "You're responsible for the maintenance of the base and field studies, the knowledge you've accumulated over the years is the only thing keeping the remnants alive. You've dabbled in enough to be considered a Professor in your field of research, but they call you Doctor. Support your dwindling forces and listen to the Lieutenant."
	supervisors = "Enclave Research and Development Division."
	outfit = /datum/outfit/job/enclave/noncombat/enclavesci
	exp_requirements = 1000
	access = list(ACCESS_ENCLAVE, ACCESS_ENCLAVE_COMMAND)

/datum/outfit/job/enclave/noncombat/enclavesci
	name = "Enclave Scientist"
	jobtype = /datum/job/enclave/enclavesci
	head = /obj/item/clothing/head/helmet/f13/envirosuit
	mask =/obj/item/clothing/mask/breath/medical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	suit = /obj/item/clothing/suit/armor/f13/environmentalsuit
	belt = /obj/item/storage/belt/medical
	suit_store =  /obj/item/tank/internals/oxygen

	backpack_contents = list(
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		/obj/item/pda = 1,
		/obj/item/gun/energy/gammagun = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/head/beret/enclave/science = 1,
		)

/datum/outfit/job/enclave/noncombat/enclavesci/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
//	ADD_TRAIT(H, TRAIT_POOR_AIM, src)

// Enclave Citizen
// Really only used for ID console
/datum/job/enclave/f13enclavecitizen
	title = "American Citizen"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/enclave/f13enclavecitizen

/datum/outfit/job/enclave/f13enclavecitizen
	name = "American Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/vault13
	shoes = /obj/item/clothing/shoes/jackboots
	id = /obj/item/card/id/dogtag/town/enclave

// Special - 'Borg
/datum/job/enclave/encborg
	title = "Synthetic"
	flag = F13ENCCYBORG
	total_positions = 0
	spawn_positions = 0
	supervisors = "Lieutenant and Science Officers"
	minimal_player_age = 21
	exp_requirements = 300

/datum/job/enclave/encborg/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	return H.Robotize(FALSE, latejoin)

/datum/job/enclave/encborg/after_spawn(mob/living/silicon/robot/R, mob/M)
	. = ..()
	ADD_TRAIT(R, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)
	R.apply_pref_name("cyborg", M.client)
	R.gender = NEUTER
