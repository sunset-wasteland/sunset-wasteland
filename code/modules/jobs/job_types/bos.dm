/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/

/datum/job/bos //do NOT use this for anything, it's just to store faction datums.
	department_flag = BOS
	selection_color = "#95a5a6"
	faction = FACTION_BROTHERHOOD

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	outfit = /datum/outfit/job/bos/
	exp_type = EXP_TYPE_BROTHERHOOD

	objectivesList = list("Leadership recommends the following goal for this week: Establish an outpost at the radio tower","Leadership recommends the following goal for this week: Acquire blueprints for research and preservation", "Leadership recommends the following goal for this week: Acquire or confiscate dangerous tech by any means necessary.")

/datum/outfit/job/bos
	name = "bosdatums"
	jobtype = 	/datum/job/bos
	backpack = 	/obj/item/storage/backpack/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	ears = 		/obj/item/radio/headset/headset_bos
	uniform =	/obj/item/clothing/under/syndicate/brotherhood
	shoes = 	/obj/item/clothing/shoes/combat/swat
	gloves = 	/obj/item/clothing/gloves/combat
	id = 		/obj/item/card/id/dogtag
	box = 		/obj/item/storage/survivalkit_adv

/datum/outfit/job/bos/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/bos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/set_vrboard/bos)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gate_bos)

/*
Elder
*/

/datum/job/bos/f13elder
	title = "Baron"
	flag = F13ELDER
	head_announce = list("Security")
	supervisors = "the high elders"
	selection_color = "#7f8c8d"
	req_admin_notify = 1
	roleplay_exclusive_notify = 1

	exp_requirements = 3000

	total_positions = 1
	spawn_positions = 1

	outfit = /datum/outfit/job/bos/f13elder

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13elder/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/bos/f13elder
	name = "Baron"
	jobtype = /datum/job/bos/f13elder
	pa_wear = TRUE
	suit =	/obj/item/clothing/suit/f13/elder
	glasses =	/obj/item/clothing/glasses/night
	accessory =	/obj/item/clothing/accessory/bos/elder
	suit_store =	/obj/item/gun/energy/laser/laer
	neck =	/obj/item/clothing/neck/mantle/bos/right
	ears = /obj/item/radio/headset/headset_bos/command
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/gun/energy/laser/wattz/recharger/Walker = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
	)

/*
Head Paladin
*/

/datum/job/bos/f13sentinel
	title = "Castellan"
	flag = F13SENTINEL
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the acting field commander until the Brotherhood regains its strength enough to place an Elder for the bunker. You are a veteran of many battles and sorties in pursuit of Brotherhood goals; your only weakness may just be your hubris. Your main goals are defense of the Chapter and surveillance of the surrounding region for technology."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Baron"
	selection_color = "#7f8c8d"

	exp_requirements = 2400

	loadout_options = list(
	/datum/outfit/loadout/sentstand, //Tribeam laser + Hardened T-51
	/datum/outfit/loadout/sentheavy, //Gauss + Hardened T-51
	/datum/outfit/loadout/sentlaser //Wattz laser + Hardened T-51
	)

	outfit = /datum/outfit/job/bos/f13sentinel

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13sentinel/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/bos/f13sentinel/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/bos/f13sentinel
	name = "Head Paladin"
	jobtype = /datum/job/bos/f13sentinel
	uniform = 		/obj/item/clothing/under/f13/recon
	accessory = 	/obj/item/clothing/accessory/bos/sentinel
	glasses =       /obj/item/clothing/glasses/sunglasses
	belt =			/obj/item/storage/belt/military/assault
	mask =			/obj/item/clothing/mask/gas/sechailer
	ears =			/obj/item/radio/headset/headset_bos/command
	id = 			/obj/item/card/id/dogtag
	neck = 			/obj/item/clothing/neck/mantle/bos/paladin
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/melee/powerfist/f13 = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99/crusader = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		)

/datum/outfit/loadout/sentstand
	name = "Shock Laser Head Paladin"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/midwest/hardened
	head = /obj/item/clothing/head/helmet/f13/power_armor/midwest/hardened
	l_hand = /obj/item/gun/energy/laser/scatter
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc = 3,
	)

/datum/outfit/loadout/sentheavy
	name = "Heavy Head Paladin"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/midwest/hardened
	head = /obj/item/clothing/head/helmet/f13/power_armor/midwest/hardened
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/m72 = 1,
		/obj/item/ammo_box/magazine/m2mm = 3,
	)

/datum/outfit/loadout/sentlaser
	name = "Rifle Laser Head Paladin"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/midwest/hardened
	head = /obj/item/clothing/head/helmet/f13/power_armor/midwest/hardened
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz2k/extended=1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
	)


/*
Head Scribe
*/

/datum/job/bos/f13headscribe
	title = "Keeper"
	flag = F13HEADSCRIBE
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the foremost experienced scribe remaining in this bunker. Your role is to ensure the safekeeping and proper usage of technology within the Brotherhood. You are also the lead medical expert in this Chapter. Delegate your tasks to your Scribes."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Baron"
	selection_color = "#7f8c8d"

	exp_requirements = 1500

	loadout_options = list(
	/datum/outfit/loadout/hsstand,
	/datum/outfit/loadout/hspract
	)

	outfit = /datum/outfit/job/bos/f13headscribe

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13headscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
//	ADD_TRAIT(H, TRAIT_POOR_AIM, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R93)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)

/datum/outfit/job/bos/f13headscribe
	name = "Head Scribe"
	jobtype = /datum/job/bos/f13headscribe
	chemwhiz = TRUE
	uniform = 		/obj/item/clothing/under/syndicate/brotherhood
	accessory = 	/obj/item/clothing/accessory/bos/headscribe
	glasses =       /obj/item/clothing/glasses/sunglasses
	suit = 			/obj/item/clothing/suit/armor/f13/headscribe
	ears = 			/obj/item/radio/headset/headset_bos/command
	belt = 			/obj/item/storage/belt/utility/full/engi
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		)

/datum/outfit/loadout/hsstand
	name = "Medicinal Expert"
	backpack_contents = list(
		/obj/item/gun/medbeam = 1,
		/obj/item/reagent_containers/hypospray/CMO = 1,
		)

/datum/outfit/loadout/hspract
	name = "Administrative Leader"
	backpack_contents = list(
		/obj/item/gun/energy/laser/plasma/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		)

/*
Head Knight
*/

/datum/job/bos/f13knightcap
	title = "Knight-Commander"
	flag = F13KNIGHTCAPTAIN
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the Head Knight, leader of your respective division in the Chapter. Your knowledge of pre-war materials and engineering is almost unparalleled, and you have basic combat training and experience. You are in charge of the Chapter's engineering Corps, and your Knights. Delegate to them as necessary. As Chief Armorer, you are also in charge of the armory."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Baron"
	selection_color = "#7f8c8d"

	exp_requirements = 1500

	loadout_options = list(
	/datum/outfit/loadout/capstand, //Wattz 2k
	/datum/outfit/loadout/capsap, //Marksman
	/datum/outfit/loadout/capalt //Neostead with buck because they don't know slugs are better
	)

	outfit = /datum/outfit/job/bos/f13knightcap

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_CHANGE_IDS)


/datum/outfit/job/bos/f13knightcap/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/bos/f13knightcap/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R93)


/datum/outfit/job/bos/f13knightcap
	name = "Head Knight"
	jobtype = /datum/job/bos/f13knightcap
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/captain
	glasses =		/obj/item/clothing/glasses/night
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	accessory =		/obj/item/clothing/accessory/bos/knightcaptain
	belt =			/obj/item/storage/belt/security/full
	neck =			/obj/item/storage/belt/holster
	ears =			 /obj/item/radio/headset/headset_bos/command
	mask =			/obj/item/clothing/mask/gas/sechailer
	head =			/obj/item/clothing/head/helmet/f13/combat/brotherhood/captain
	id =			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/pistol14 = 1,
		/obj/item/ammo_box/magazine/m14mm = 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/book/granter/crafting_recipe/gunsmith_one=1,
		/obj/item/book/granter/crafting_recipe/gunsmith_two=1
		)

/datum/outfit/loadout/capstand
	name = "Standard"
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz2k = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
	)

/datum/outfit/loadout/capsap
	name = "Close Support"
	backpack_contents = list(
		/obj/item/gun/energy/laser/rcw = 1,
		/obj/item/stock_parts/cell/ammo/ecp = 2,
	)

/datum/outfit/loadout/capalt
	name = "Warden-Defender"
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/automatic/combat/neostead = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
	)

/*
Star Paladin
*/

/datum/job/bos/f13seniorpaladin
	title = "Paladin Marshal"
	flag = F13SENIORPALADIN
	total_positions = 1
	spawn_positions = 1
	description = "As the Chapter's senior offensive warrior, you have proven your service and dedication to the Brotherhood over your time as a Paladin. As your skills gained, however, you were deigned to be more useful as a commander and trainer. Your job is to coordinate the Paladins and ensure they work as a team, instilling discipline as you go."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Castellan"
	selection_color = "#95a5a6"

	exp_requirements = 1500 //Not used right now anyways. Slot disabled.
	exp_type = EXP_TYPE_BROTHERHOOD

	loadout_options = list(
		/datum/outfit/loadout/spaladinb, //Combat Rifle + Powerfist
		/datum/outfit/loadout/spaladinc,  //AER14, no powerfist given strength of rifle.
		/datum/outfit/loadout/spaladind, //Sledge + Powerfist
		/datum/outfit/loadout/spaladine, //L30, no powerfist given strength of weapon.
		)

	outfit = /datum/outfit/job/bos/f13seniorpaladin

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13paladin,
		),
	)

/datum/outfit/job/bos/f13seniorpaladin/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/bos/f13seniorpaladin
	name =	"Senior Paladin"
	jobtype =	/datum/job/bos/f13seniorpaladin
	suit =	/obj/item/clothing/suit/armor/f13/power_armor/midwest
	head =	/obj/item/clothing/head/helmet/f13/power_armor/midwest
	accessory =	/obj/item/clothing/accessory/bos/seniorpaladin
	uniform =	/obj/item/clothing/under/f13/recon
	mask =	/obj/item/clothing/mask/gas/sechailer
	belt =	/obj/item/storage/belt/military/assault
	neck =	/obj/item/clothing/neck/mantle/bos/paladin

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
	)

/datum/outfit/loadout/spaladinb
	name = "Senior Tactical Paladin"
	backpack_contents = list(
		/obj/item/melee/powerfist/f13 = 1,
		/obj/item/gun/ballistic/automatic/combat = 1,
		/obj/item/ammo_box/magazine/tommygunm45/stick = 5,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin=1,
		)

/datum/outfit/loadout/spaladinc
	name = "Senior Frontline Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer14 = 1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin=1,
		)

/datum/outfit/loadout/spaladind
	name = "Senior Melee Specialist Paladin"
	backpack_contents = list(
		/obj/item/melee/powerfist/f13 = 1,
		/obj/item/twohanded/sledgehammer/supersledge =1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin=1,
		)

/datum/outfit/loadout/spaladine
	name = "Gatling Head Paladin"
	backpack_contents = list(
		/obj/item/encminigunpack=1,
	)

/*
Paladin
*/

/datum/job/bos/f13paladin
	title = "Paladin"
	flag = F13PALADIN
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Marshal. You are this Chapter's main line of defense and offense; highly trained in combat and weaponry though with little practical field experience, you are eager to prove your worth to the Brotherhood. Your primary duties are defense and surface operations. You may also be assigned a trainee Initiate."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Paladin Marshal and Castellan"
	selection_color = "#95a5a6"
	exp_requirements = 1200

	loadout_options = list(
	/datum/outfit/loadout/paladinb, //Combat Rifle + Power Fist
	/datum/outfit/loadout/paladinc, //AER12 no power fist.
	/datum/outfit/loadout/paladind, //Sledge + Power Fist
	)

	outfit = /datum/outfit/job/bos/f13paladin

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13seniorpaladin,
		),
	)

/datum/outfit/job/bos/f13paladin/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/bos/f13paladin
	name =	"Paladin"
	jobtype =	/datum/job/bos/f13paladin
	suit =	/obj/item/clothing/suit/armor/f13/power_armor/midwest
	head =	/obj/item/clothing/head/helmet/f13/power_armor/midwest
	uniform =	/obj/item/clothing/under/f13/recon
	mask =	/obj/item/clothing/mask/gas/sechailer
	belt =	/obj/item/storage/belt/military/assault
	neck =	/obj/item/clothing/neck/mantle/bos/paladin
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak= 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
	)

/datum/outfit/loadout/paladinb
	name = "Tactical Paladin"
	backpack_contents = list(
		/obj/item/melee/powerfist/f13 = 1,
		/obj/item/gun/ballistic/automatic/combat = 1,
		/obj/item/ammo_box/magazine/tommygunm45/stick = 5,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin = 1,
		)

/datum/outfit/loadout/paladinc
	name = "Frontline Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer12 = 1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin = 1,
		)

/datum/outfit/loadout/paladind
	name = "Melee Specialist Paladin"
	backpack_contents = list(
		/obj/item/melee/powerfist/f13 = 1,
		/obj/item/twohanded/sledgehammer/supersledge =1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/paladin = 1,
		)

/*
Senior Scribe
*/

/datum/job/bos/f13seniorscribe
	title = "Librarian"
	flag = F13SENIORSCRIBE
	total_positions = 1
	spawn_positions = 1
	description = "You are the bunker's seniormost medical and scientific expert in the bunker, sans the Keeper themselves. You are trained in both medicine and engineering, while also having extensive studies of the old world to assist in pinpointing what technology would be useful to the Brotherhood and its interests."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Keeper"
	selection_color = "#95a5a6"

	exp_requirements = 900

	outfit = /datum/outfit/job/bos/f13seniorscribe

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13scribe,
		),
	)


/datum/outfit/job/bos/f13seniorscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
//	ADD_TRAIT(H, TRAIT_POOR_AIM, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R93)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)

/datum/outfit/job/bos/f13seniorscribe
	name =	"Senior Scribe"
	jobtype =	/datum/job/bos/f13seniorscribe
	chemwhiz =	TRUE
	uniform =	/obj/item/clothing/under/syndicate/brotherhood
	shoes =	/obj/item/clothing/shoes/combat
	belt =	/obj/item/storage/belt/utility/full/engi
	accessory =	/obj/item/clothing/accessory/bos/seniorscribe
	suit =	/obj/item/clothing/suit/f13/seniorscribe
	id =	/obj/item/card/id/dogtag
	glasses =	/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/firstaid/regular = 1,
		/obj/item/reagent_containers/hypospray/CMO = 1,
	)

/*
Scribe
*/

/datum/job/bos/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	total_positions = 3
	spawn_positions = 3
	description = "You answer directly to the Librarian, tasked with researching and reverse-engineering recovered technologies from the old world, while maintaining the brotherhoods scientific archives. You may also be given a trainee to assign duties to."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Librarian and Keeper"
	selection_color = "#95a5a6"

	exp_requirements = 300

	loadout_options = list(
	/datum/outfit/loadout/scribea,
	/datum/outfit/loadout/scribeb,
	)

	outfit = /datum/outfit/job/bos/f13scribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13seniorscribe,
		),
	)

/datum/outfit/job/bos/f13scribe
	name = "Scribe"
	jobtype = /datum/job/bos/f13scribe
	chemwhiz = TRUE
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/f13/scribe
	id = 			/obj/item/card/id/dogtag
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/melee/onehanded/knife/survival=1,
		/obj/item/storage/firstaid/regular=1,
		)

/datum/outfit/job/bos/f13scribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
//	ADD_TRAIT(H, TRAIT_POOR_AIM, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R93)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)

/datum/outfit/loadout/scribea
	name = "Junior Scribe"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorscribe=1,
		)

/datum/outfit/loadout/scribeb
	name = "Scribe"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/scribe=1,
		)

/*
Knight Captain
*/

/datum/job/bos/f13seniorknight
	title = "Knight-Captain"
	flag = F13SENIORKNIGHT
	total_positions = 2
	spawn_positions = 2
	description = "You report directly to the Knight-Commander. Having served the Knight Caste for some time now, you are versatile and experienced in both basic combat and repairs, and also a primary maintainer of the Bunker's facilities. As your seniormost Knight, you may be assigned initiates or Junior Knights to mentor."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Knight-Commander"
	selection_color = "#95a5a6"
	exp_requirements = 900

	loadout_options = list(
	/datum/outfit/loadout/sknighta, //AER9
	/datum/outfit/loadout/sknightb, //Police Shotgun
	/datum/outfit/loadout/sknightc, //R93 PDW
	/datum/outfit/loadout/sknightd,
	)

	outfit = /datum/outfit/job/bos/f13seniorknight

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13knight,
		),
	)


/datum/outfit/job/bos/f13seniorknight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R93)

/datum/outfit/job/bos/f13seniorknight
	name = "Senior Knight"
	jobtype = /datum/job/bos/f13seniorknight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/senior
	accessory = 	/obj/item/clothing/accessory/bos/seniorknight
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	glasses =       /obj/item/clothing/glasses/night
	mask =			/obj/item/clothing/mask/gas/sechailer
	belt = 			/obj/item/storage/belt/military/assault
	neck =			/obj/item/storage/belt/holster
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/senior
	id = 			/obj/item/card/id/dogtag
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2,
		/obj/item/book/granter/crafting_recipe/gunsmith_one=1,
		/obj/item/book/granter/crafting_recipe/gunsmith_two=1
		)

/datum/outfit/loadout/sknighta
	name = "Footknight"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/attachments/scope = 1,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		)

/datum/outfit/loadout/sknightb
	name = "Knight-Defender"
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/police=1,
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/datum/outfit/loadout/sknightc
	name = "Recon"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/r93=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/datum/outfit/loadout/sknightd
	name = "Senior Knight-Cavalry"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight=1,
		/obj/item/melee/powered/ripper/prewar=1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/*
Knight
*/

/datum/job/bos/f13knight
	title = "Knight"
	flag = F13KNIGHT
	total_positions = 4
	spawn_positions = 4
	description = " You are the Brotherhood Knight, the veritable lifeblood of your organization. You are a versatile and adaptably trained person: from your primary duties of weapon & armor repair to basic combat, survival and stealth skills, the only thing you lack is proper experience. You are also in charge of Initiates."
	forbids = "TheBrotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals, and cruel torture or experiments on the minds or bodies of prisoners."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Knight-Captain and Knight-Commander"
	selection_color = "#95a5a6"

	exp_requirements = 300

	loadout_options = list(
	/datum/outfit/loadout/knighta, //AER9
	/datum/outfit/loadout/knightb, //R82
	/datum/outfit/loadout/knightc, //Ripper
	/datum/outfit/loadout/knightd, //R82 J
	/datum/outfit/loadout/knighte, //Ripper J
	/datum/outfit/loadout/knightf, //Ripper S
	)

	outfit = /datum/outfit/job/bos/f13knight

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13seniorknight,
		),
	)

/datum/outfit/job/bos/f13knight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)

/datum/outfit/job/bos/f13knight
	name = "Knight"
	jobtype = /datum/job/bos/f13knight
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	mask =			/obj/item/clothing/mask/gas/sechailer
	belt = 			/obj/item/storage/belt/military/assault
	neck =			/obj/item/storage/belt/holster
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	id = 			/obj/item/card/id/dogtag
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,
		/obj/item/book/granter/crafting_recipe/gunsmith_one=1,
		/obj/item/book/granter/crafting_recipe/gunsmith_two=1
		)

/datum/outfit/loadout/knighta
	name = "Junior Footknight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight=1,
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/clothing/accessory/bos/KnightC=1,
		/obj/item/clothing/accessory/bos/KnightT=1,
		)

/datum/outfit/loadout/knightb
	name = "Junior Knight-Defender"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight=1,
		/obj/item/gun/ballistic/automatic/r93=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/KnightC=1,
		/obj/item/clothing/accessory/bos/KnightT=1,
		)

/datum/outfit/loadout/knightc
	name = "Junior Knight-Cavalry"
	backpack_contents = list(
		/obj/item/book/granter/trait/trekking = 1,
		/obj/item/clothing/accessory/bos/juniorknight = 1,
		/obj/item/clothing/accessory/bos/KnightC = 1,
		/obj/item/clothing/accessory/bos/KnightT = 1,
		/obj/item/attachments/scope = 1,
		/obj/item/gun/energy/laser/pistol/cavalier = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		)


/datum/outfit/loadout/knightd
	name = "Footknight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/clothing/accessory/bos/KnightC=1,
		/obj/item/clothing/accessory/bos/KnightT=1,
		)

/datum/outfit/loadout/knighte
	name = "Knight-Defender"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/gun/ballistic/automatic/smg/mp5=1,
		/obj/item/ammo_box/magazine/uzim9mm=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/KnightC=1,
		/obj/item/clothing/accessory/bos/KnightT=1,
		)

/datum/outfit/loadout/knightf
	name = "Knight-Cavalry"
	backpack_contents = list(
		/obj/item/book/granter/trait/trekking = 1,
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/attachments/scope = 1,
		/obj/item/gun/energy/laser/pistol/cavalier = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/clothing/accessory/bos/KnightC=1,
		/obj/item/clothing/accessory/bos/KnightT=1,
		)

/*
Initiate
*/

/datum/job/bos/f13initiate
	title = "Initiate"
	flag = F13INITIATE
	total_positions = 3
	spawn_positions = 3
	description = "Either recently inducted or born into the Brotherhood, you have since proven yourself worthy of assignment to the Chapter. You are to assist your superiors and receive training how they deem fit. You are NEVER allowed to leave the bunker without the direct supervision of a superior; doing so may result in exile or transferrence back the Valley."
	forbids = "The Brotherhood of Steel Forbids: Unethical human experimentation. Violence beyond what is needed to accomplish Brotherhood goals."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the scribes, knights, or Paladins"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 0

	loadout_options = list(
	/datum/outfit/loadout/initiatek, //AEP7 and Engibelt with combat armor, no helmet
	/datum/outfit/loadout/initiates, //Medical belt and chem knowledge
	)

	outfit = /datum/outfit/job/bos/f13initiate

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bos,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13knight,
			/datum/job/bos/f13scribe,
		),
	)

/datum/outfit/job/bos/f13initiate
	name = "Initiate"
	jobtype = /datum/job/bos/f13initiate
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/loadout/initiatek
	name = "Errant"
	belt = 			/obj/item/storage/belt/utility/full/engi
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/book/granter/crafting_recipe/gunsmith_one=1,
		/obj/item/book/granter/crafting_recipe/gunsmith_two=1,
		/obj/item/clothing/accessory/bos/initiateK=1,
		)

/datum/outfit/loadout/initiates
	name = "Confrere"
	belt =			/obj/item/storage/belt/medical
	suit =			/obj/item/clothing/suit/toggle/labcoat
	glasses =		/obj/item/clothing/glasses/science
	gloves =		/obj/item/clothing/gloves/color/latex
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,
		/obj/item/book/granter/trait/chemistry=1,
		/obj/item/clothing/accessory/bos/initiateS=1,
		)

/*
Off-Duty
*/
/datum/job/bos/f13offdutybos
	title = "BoS Off-Duty"
	flag = F13OFFDUTYBOS
	total_positions = 6//Likely far too many, but this stops you know what. :)
	spawn_positions = 6
	description = "While off-duty, you are relieved of both your duties and your authority. You are not required to participate in any routine duties of the bunker, and you may spend your time doing whatever you please, within reason."
	supervisors = "your superior rank."
	selection_color = "#95a5a6"
	roleplay_exclusive_notify = 1
	exp_requirements = 300
	outfit = /datum/outfit/job/bos/f13offdutybos
	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13offdutybos
	name = "BoS Off-Duty"
	jobtype = /datum/job/bos/f13offdutybos
	backpack = /obj/item/storage/backpack
	ears = 			/obj/item/radio/headset
	uniform =		/obj/item/clothing/under/syndicate
	belt = 			/obj/item/storage/belt/military/army
	shoes = 		/obj/item/clothing/shoes/combat
	gloves = 		/obj/item/clothing/gloves/combat
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,
		/obj/item/encryptionkey/headset_bos=1,
		/obj/item/melee/onehanded/knife/survival=1
		)
