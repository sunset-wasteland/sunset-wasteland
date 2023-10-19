/datum/job/enclave
	department_flag = ENCLAVE
	selection_color = "#434944"
	faction = FACTION_ENCLAVE
	exp_type = EXP_TYPE_ENCLAVE

	access = list(ACCESS_ENCLAVE, ACCESS_SECURITY, ACCESS_AI_UPLOAD)
	minimal_access = list(ACCESS_ENCLAVE, ACCESS_SECURITY, ACCESS_AI_UPLOAD)
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
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)


//Lieutenant
/datum/job/enclave/enclavelt
	title = "Enclave Lieutenant"
	flag = F13USLT
	total_positions = 1
	spawn_positions = 1
	access = list(ACCESS_ENCLAVE, ACCESS_CHANGE_IDS, ACCESS_ENCLAVE_COMMAND, ACCESS_SECURITY, ACCESS_AI_UPLOAD)
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. Your goal, primarily, is to collect organic material. Preferably alive, for the sake of testing. <br>\
	Now that the lore is out of the way, just make the round fun. You set the policies and the attitude of the Enclave this week."
	supervisors = "Enclave Department of the Army."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavelt
	req_admin_notify = 1
	exp_requirements = 1500

	loadout_options = list(
		/datum/outfit/loadout/lt_ballistics, // G11 and Plasma Glock
		/datum/outfit/loadout/lt_plasma, // Plasma Rifle and 14mm
		)


/datum/outfit/job/enclave/peacekeeper/enclavelt
	name = "Enclave Lieutenant"
	jobtype = /datum/job/enclave/enclavelt

	head = /obj/item/clothing/head/helmet/f13/enclave/officer
	uniform = /obj/item/clothing/under/f13/enclave/officer
	suit = /obj/item/clothing/suit/armor/f13/enclavetrenchcoat
	accessory = /obj/item/clothing/accessory/enclave/first_lieutenant
	id = /obj/item/card/id/dogtag/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave/command
	l_pocket = /obj/item/clothing/mask/chameleon

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/card/id/syndicate/anyone =1
		)

/datum/outfit/loadout/lt_ballistics
	name = "Shiny Bullet"
	suit_store = /obj/item/gun/ballistic/automatic/g11/g11e
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m473 = 3,
		/obj/item/gun/energy/laser/plasma/glock = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/grenade/f13/plasma = 2,
		)

/datum/outfit/loadout/lt_plasma
	name = "Never Forgotten"
	suit_store = /obj/item/gun/energy/laser/plasma
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/gun/ballistic/automatic/pistol/pistol14/custom = 1,
		/obj/item/ammo_box/magazine/m14mm = 2,
		/obj/item/grenade/f13/plasma = 2,
		)

/datum/outfit/job/enclave/peacekeeper/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)



// Gunnery Sergeant

/datum/job/enclave/f13gysergeant
	title = "Enclave Platoon Sergeant"
	flag = F13USGYSGT
	total_positions = 1
	spawn_positions = 1
	access = list(ACCESS_ENCLAVE, ACCESS_CHANGE_IDS, ACCESS_ENCLAVE_COMMAND, ACCESS_SECURITY, ACCESS_AI_UPLOAD)
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. Second in command after Lieutenant, your role is to direct their orders directly to the Sergeants and regular troops."
	supervisors = "The Lieutenant."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13gysergeant
	exp_requirements = 1400

	loadout_options = list(
		/datum/outfit/loadout/gysgt_ballistics, // Vindicator
		/datum/outfit/loadout/gysgt_gatlas, // Lasminigun
		/datum/outfit/loadout/gysgt_laser, // Multiplas
		)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant
	name = "Enclave Platoon Sergeant"
	jobtype = /datum/job/enclave/f13gysergeant
	head = /obj/item/clothing/head/helmet/f13/power_armor/tesla
	suit = /obj/item/clothing/suit/armor/f13/power_armor/tesla
	accessory = /obj/item/clothing/accessory/enclave/sergeant_firstclass
	ears = /obj/item/radio/headset/headset_enclave/command
	l_pocket = /obj/item/clothing/mask/chameleon

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/megaphone = 1,
		/obj/item/card/id/syndicate/anyone = 1
		)

/datum/outfit/loadout/gysgt_ballistics
	name = "Armored Assault Kit"
	backpack_contents = list(
		/obj/item/encencminigunbal4mm = 1,
		/obj/item/ammo_box/magazine/vindic = 2
		)

/datum/outfit/loadout/gysgt_gatlas
	name = "Armored Support Kit"
	backpack_contents = list(
		/obj/item/encminigunpack = 1,
		/obj/item/stock_parts/cell/ammo/ecp = 2
		)

/datum/outfit/loadout/gysgt_laser
	name = "Armored Rifleman Kit"
	suit_store = /obj/item/gun/energy/laser/plasma/scatter
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/grenade/f13/plasma = 1,
		)

/datum/outfit/job/enclave/peacekeeper/f13gysergeant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)


//Sergeant

/datum/job/enclave/enclavesgt
	title = "Enclave Sergeant"
	flag = F13USSGT
	total_positions = 2
	spawn_positions = 2
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. Entrusted with the command of the squads assigned to the bunker, your job is to assist the Lieutenant alongside the scientists."
	supervisors = "The Lieutenant and the Gunnery Sergeant."
	outfit = /datum/outfit/job/enclave/peacekeeper/enclavesgt
	exp_requirements = 1200

	loadout_options = list(
		/datum/outfit/loadout/sgt_ballistics,	// G11
		/datum/outfit/loadout/sgt_laser, 	// Plasma
		)

/datum/outfit/job/enclave/peacekeeper/enclavesgt
	name = "Enclave Sergeant"
	jobtype = /datum/job/enclave/enclavesgt
	head = /obj/item/clothing/head/helmet/f13/power_armor/x02helmet
	suit = /obj/item/clothing/suit/armor/f13/power_armor/x02
	accessory = /obj/item/clothing/accessory/enclave/sergeant
	l_pocket = /obj/item/clothing/mask/chameleon

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/f13/frag = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/head/f13/enclave/peacekeeper = 1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1,
		/obj/item/storage/pill_bottle/chem_tin/mentats = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/card/id/syndicate/anyone =1
		)

/datum/outfit/loadout/sgt_ballistics
	name = "Frontline Operator"
	suit_store = /obj/item/gun/ballistic/automatic/g11
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m473 = 3,
		)

/datum/outfit/loadout/sgt_laser
	name = "Support Rifleman"
	suit_store = /obj/item/gun/energy/laser/plasma
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/grenade/f13/plasma = 1,
		)

/datum/outfit/job/enclave/peacekeeper/enclavesgt/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)

//Specialist

/datum/job/enclave/f13specialist
	title = "Enclave Specialist"
	flag = F13USSPECIALIST
	total_positions = 2
	spawn_positions = 2
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. You are an operative for the remnants of the Enclave. You, unlike the normal Privates, have recieved specialist training in either engineering or medicine."
	supervisors = "The Lieutenant and the Sergeants."
	outfit = /datum/outfit/job/enclave/peacekeeper/f13specialist
	exp_requirements = 700

	loadout_options = list(
		/datum/outfit/loadout/combatmedic, // Medical Equipment
		/datum/outfit/loadout/combatengie, // TBD
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
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/clothing/mask/chameleon = 1,
		/obj/item/card/id/syndicate/anyone =1
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
	backpack_contents = list(
		/obj/item/storage/belt/utility = 1,
		/obj/item/shovel/trench = 1,
		/obj/item/metaldetector = 1
	)

/datum/outfit/job/enclave/peacekeeper/f13specialist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)


//Private
/datum/job/enclave/enclavespy
	title = "Enclave Private"
	flag = F13USPRIVATE
	total_positions = 4
	spawn_positions = 4
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. You are an enlisted member of the Enclave. Obey your Lieutenant. They set the Enclave's policies. Unfortunately, you've not yet received your PA training. <br> (OOC NOTE: If you use this role to TDM, you'll be jobbanned and risk a potential permaban from the server.)"
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
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/clothing/mask/chameleon = 1,
		/obj/item/card/id/syndicate/anyone =1
		)

/datum/outfit/job/enclave/peacekeeper/enclavespy/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)

//NON-COMBATANTS

//Scientist
/datum/job/enclave/enclavesci
	title = "Enclave Scientist"
	flag = F13USSCIENTIST
	total_positions = 3
	spawn_positions = 3
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. You're responsible for the maintenance of the base and field studies, the knowledge you've accumulated over the years is the only thing keeping the remnants alive. You've dabbled in enough to be considered a Professor in your field of research, but they call you Doctor. Support your dwindling forces and listen to the Lieutenant."
	supervisors = "Enclave Research and Development Division."
	outfit = /datum/outfit/job/enclave/noncombat/enclavesci
	exp_requirements = 1000
	roleplay_exclusive_notify = 1
	access = list(ACCESS_ENCLAVE, ACCESS_SECURITY, ACCESS_AI_UPLOAD)

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
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/head/beret/enclave/science = 1,
		/obj/item/clothing/mask/chameleon = 1,
		/obj/item/card/id/syndicate/anyone =1
		)

/datum/outfit/job/enclave/noncombat/enclavesci/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
//	ADD_TRAIT(H, TRAIT_POOR_AIM, src)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/needle)

//Pilot
/datum/job/enclave/enclavepilot
	title = "Enclave Pilot Officer"
	flag = F13USSCIENTIST
	total_positions = 2
	spawn_positions = 2
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. You're responsible for the operation of your assigned aircraft on base and within field operations. Support the First Lieutenant."
	supervisors = "Enclave Department of the Army, Air Force Division."
	outfit = /datum/outfit/job/enclave/noncombat/enclavepilot
	req_admin_notify = 1
	roleplay_exclusive_notify = 1
	exp_requirements = 1000
	access = list(ACCESS_ENCLAVE, ACCESS_ENCLAVE_COMMAND, ACCESS_SECURITY, ACCESS_AI_UPLOAD)

/datum/outfit/job/enclave/noncombat/enclavepilot
	name = "Enclave Pilot Officer"
	jobtype = /datum/job/enclave/enclavepilot
	head = /obj/item/clothing/head/helmet/f13/enclave/usmcriot/armypilot//TEMP UNTIL WE GET A PROPER PILOT UNIFORM
	uniform = /obj/item/clothing/under/f13/enclave/officer
	suit = /obj/item/clothing/suit/armor/f13/usmcriot/armypilot//TEMP UNTIL WE GET A PROPER PILOT UNIFORM
	accessory = /obj/item/clothing/accessory/enclave/second_lieutenant
	id = /obj/item/card/id/dogtag/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave/command

	backpack_contents = list(
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/pda = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/clothing/mask/chameleon = 1,
		/obj/item/card/id/syndicate/anyone =1
		)

/datum/outfit/job/enclave/noncombat/enclavepilot/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PILOT, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)

//Bunker Duty
/datum/job/enclave/f13BDUTY
	title = "Enclave Bunker Duty"
	flag = F13USBDUTY
	total_positions = 6
	spawn_positions = 6
	description = "You're a small garrison within a side entrance of a far larger complex. This complex sits within the Casper mountain range. You're a non-combatant, skilled in a field outside of exterior operations. Given your value, you aren't permitted to engage in conflict."
	enforces = "You are not permited to leave the base. You are a non-combatant. You cannot join any raids or battles on the surface."
	supervisors = "Everyone else."
	outfit = /datum/outfit/job/enclave/noncombat/f13BDUTY
	roleplay_exclusive_notify = 1
	exp_requirements = 100

	loadout_options = list(
		/datum/outfit/loadout/bunkerduty_pharma,
		/datum/outfit/loadout/bunkerduty_engi,
		/datum/outfit/loadout/bunkerduty_janny,
		/datum/outfit/loadout/bunkerduty_chaplain,
		/datum/outfit/loadout/bunkerduty_cook,
		)

/datum/outfit/job/enclave/noncombat/f13BDUTY
	name = "Enclave Bunker Duty"
	jobtype = /datum/job/enclave/f13BDUTY
	id = /obj/item/card/id/dogtag/enclave/trooper
	glasses = /obj/item/clothing/glasses/sunglasses/big
	uniform = /obj/item/clothing/under/f13/enclave/peacekeeper
	accessory = /obj/item/clothing/accessory/enclave

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		)

/datum/outfit/loadout/bunkerduty_pharma
	name = "Pharmaceutical Technician"
	mask = /obj/item/clothing/mask/surgical
	suit = /obj/item/clothing/suit/hooded/surgical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	backpack_contents = list(
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/healthanalyzer = 1,
		)

/datum/outfit/loadout/bunkerduty_engi
	name = "Maintenance Technician"
	head = /obj/item/clothing/head/hardhat
	suit = /obj/item/clothing/suit/hazardvest
	gloves = /obj/item/clothing/gloves/color/yellow
	backpack_contents = list(
		/obj/item/storage/belt/utility = 1,
		/obj/item/stack/sheet/metal/twenty = 1,
		/obj/item/stack/sheet/glass/ten = 2,
		/obj/item/stack/cable_coil/thirty = 2,
		)

/datum/outfit/loadout/bunkerduty_janny
	name = "Sanitation Technician"
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/soft/purple
	shoes = /obj/item/clothing/shoes/galoshes
	backpack_contents = list(
		/obj/item/reagent_containers/spray/cleaner = 1,
		/obj/item/mop/advanced = 1,
		/obj/item/grenade/chem_grenade/cleaner = 3,
		)

/datum/outfit/loadout/bunkerduty_chaplain
	name = "Spiritual Technician"
	mask = /obj/item/clothing/mask/surgical
	suit = /obj/item/clothing/suit/f13/autumn
	backpack_contents = list(
		/obj/item/storage/book/bible = 2,
		/obj/item/pen = 1,
		/obj/item/folder = 1,
		)

/datum/outfit/loadout/bunkerduty_cook
	name = "Culinary Technician"
	head = /obj/item/clothing/head/chefhat
	suit = /obj/item/clothing/neck/apron/housewife
	backpack_contents = list(
		/obj/item/storage/box/ingredients/wildcard = 4,
		/obj/item/kitchen/knife/butcher = 1,
		)

// Internal Security. Takes the role of general Security Detail.
// RP job primarily. Gets the incredibly rare and powerful plasma rifle, alongside a subtype of the Enclave Remnant plasma pistol.
// Not a big deal. This has the RP flag
/datum/job/enclave/enc_is
	title = "Enclave Internal Security"
	flag = F13USIS
	total_positions = 3
	spawn_positions = 3
	description = "As Internal Security, you answer to no one, aside from high-command directly. Despite that, you're tasked to maintain order and security within the bunker. Assist the Science division with experiments when possible, and further the Lieutenant's goals."
	enforces = "You are not permited to leave the base under any circumstance. You cannot join any raids or battles on the surface."
	supervisors = "United States Secret Service"
	access = list(ACCESS_ENCLAVE, ACCESS_CHANGE_IDS, ACCESS_ENCLAVE_COMMAND, ACCESS_SECURITY, ACCESS_AI_UPLOAD)
	outfit = /datum/outfit/job/enclave/noncombat/enc_is
	roleplay_exclusive_notify = 1
	req_admin_notify = 1
	exp_requirements = 2500//Well above Lieutenant for good reason. It's RP exclusive, and comes with some heavy perks.

	loadout_options = list(
		/datum/outfit/loadout/is_twolt,
		/datum/outfit/loadout/is_lt,
		)

/datum/outfit/job/enclave/noncombat/enc_is
	name = "Enclave Internal Security"
	jobtype = /datum/job/enclave/enc_is
	id = /obj/item/card/id/dogtag/enclave/officer
	glasses = /obj/item/clothing/glasses/sunglasses/big
	uniform = /obj/item/clothing/under/f13/enclave/officer
	head = /obj/item/clothing/head/f13/enclave
	suit = /obj/item/clothing/suit/armor/f13/enclavetrenchcoat

	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/classic_baton = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/gun/energy/laser/plasma/pistol/remnant/is = 1,
		/obj/item/storage/belt/holster = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/survivalkit_aid_adv = 1,
		)

/datum/outfit/job/enclave/noncombat/enc_is/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_ENCLAVE_CODES, src)
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
	H.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)

/datum/outfit/loadout/is_twolt
	name = "Second Lieutenant"
	backpack_contents = list(
		/obj/item/clothing/accessory/cia_badge = 1,
		/obj/item/clothing/accessory/enclave/second_lieutenant = 1,
		)

/datum/outfit/loadout/is_lt
	name = "First Lieutenant"
	backpack_contents = list(
		/obj/item/clothing/accessory/cia_badge = 1,
		/obj/item/clothing/accessory/enclave/first_lieutenant = 1,
		)


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
