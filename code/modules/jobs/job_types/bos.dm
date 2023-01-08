/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/

/datum/job/bos //do NOT use this for anything, it's just to store faction datums.
	department_flag = BOS
	selection_color = "#95a5a6"
	faction = FACTION_BROTHERHOOD
	forbids = "The Midwestern Brotherhood Forbids: Violence without purpose. Associating with outsiders while on-duty."
	enforces = "The Midwestern Brotherhood Expects: Obeying your superiors. Collection and safeguarding of technology from savages. Experimentation and research."
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
Paladin Commander
*/

/datum/job/bos/f13paladincommander
	title = "Paladin Commander"
	flag = F13PALADINCOMMANDER
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the acting field commander until the Brotherhood regains its strength enough to place an Elder for the bunker. You are a veteran of many battles and sorties in pursuit of Brotherhood goals; your only weakness may just be your hubris. Your main goals are defense of the Chapter and surveillance of the surrounding region for technology."
	supervisors = "the Elder"
	selection_color = "#7f8c8d"

	exp_requirements = 2400

	loadout_options = list(
	/datum/outfit/loadout/sentheavy, //Gauss + Hardened T-51
	/datum/outfit/loadout/sentlaser //Wattz laser + Hardened T-51
	)

	outfit = /datum/outfit/job/bos/f13paladincommander

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13paladincommander/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/bos/f13paladincommander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/bos/f13paladincommander
	name = "Head Paladin"
	jobtype = /datum/job/bos/f13paladincommander
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

/datum/outfit/loadout/sentheavy
	name = "Heavy Paladin Commander"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/midwest/hardened
	head = /obj/item/clothing/head/helmet/f13/power_armor/midwest/hardened
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/m72 = 1,
		/obj/item/ammo_box/magazine/m2mm = 3,
	)

/datum/outfit/loadout/sentlaser
	name = "Support Paladin Commander"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/midwest/hardened
	head = /obj/item/clothing/head/helmet/f13/power_armor/midwest/hardened
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz2k/extended=1,
		/obj/item/stock_parts/cell/ammo/mfc = 3,
	)

/*
Paladin
*/

/datum/job/bos/f13paladin
	title = "Paladin"
	flag = F13PALADIN
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Commander. You are this Chapter's main line of defense and offense; highly trained in combat and weaponry though with little practical field experience, you are eager to prove your worth to the Brotherhood. Your primary duties are defense and surface operations. You may also be assigned a trainee Initiate."
	supervisors = "the Paladin Commander"
	selection_color = "#95a5a6"
	exp_requirements = 1200

	loadout_options = list(
	/datum/outfit/loadout/paladina, //X30
	/datum/outfit/loadout/paladinb, //Tribeam + Power Fist.
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
			/datum/job/bos/f13paladincommander,
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

/datum/outfit/loadout/paladina
	name = "Shock Paladin"
	backpack_contents = list(
		/obj/item/minigunpack = 1,
		/obj/item/clothing/accessory/bos/paladin = 1
		)

/datum/outfit/loadout/paladinb
	name = "Frontline Paladin"
	backpack_contents = list(
		/obj/item/melee/powerfist/f13 = 1,
		/obj/item/gun/energy/laser/scatter = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/clothing/accessory/bos/paladin = 1
		)

/*
Head Scribe
*/

/datum/job/bos/f13seniorscribe
	title = "Senior Scribe"
	flag = F13SENIORSCRIBE
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the foremost experienced scribe remaining in this bunker. Your role is to ensure the safekeeping and proper usage of technology within the Brotherhood. You are also the lead medical expert in this Chapter. Delegate your tasks to your Scribes."
	supervisors = "the Elder"
	selection_color = "#7f8c8d"

	exp_requirements = 1500

	loadout_options = list(
	/datum/outfit/loadout/hsstand,
	/datum/outfit/loadout/hspract
	)

	outfit = /datum/outfit/job/bos/f13seniorscribe

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13seniorscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
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
	ADD_TRAIT(H, TRAIT_POOR_AIM, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/dks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R93)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)

/datum/outfit/job/bos/f13seniorscribe
	name = "Head Scribe"
	jobtype = /datum/job/bos/f13seniorscribe
	chemwhiz = TRUE
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
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
		/obj/item/reagent_containers/hypospray/CMO = 1,
		/obj/item/clothing/accessory/bos/seniorscribe = 1,
		)

/datum/outfit/loadout/hspract
	name = "Administrative Leader"
	backpack_contents = list(
		/obj/item/gun/energy/laser/plasma/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/clothing/accessory/bos/seniorscribe = 1,
		)

/*
Scribe
*/

/datum/job/bos/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	total_positions = 3
	spawn_positions = 3
	description = "You answer directly to the Senior Scribe, tasked with researching and reverse-engineering recovered technologies from the old world, while maintaining the brotherhoods scientific archives. You may also be given a trainee to assign duties to."
	supervisors = "the Senior Scribe"
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
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
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
	ADD_TRAIT(H, TRAIT_POOR_AIM, src)
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
Knight
*/

/datum/job/bos/f13knight
	title = "Knight"
	flag = F13KNIGHT
	total_positions = 2
	spawn_positions = 2
	description = " You're the rank and file of the Midwest Brotherhood. Given proper training and equipment after proving yourself, here's hoping you can remain alive to use it."
	supervisors = "the Paladin and Paladin Commander"
	selection_color = "#95a5a6"

	exp_requirements = 300

	loadout_options = list(
	/datum/outfit/loadout/knighta, //AER9
	/datum/outfit/loadout/knightb, //R93
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
			/datum/job/bos/f13paladin,
		),
	)

/datum/outfit/job/bos/f13knight
	name = "Knight"
	jobtype = /datum/job/bos/f13knight
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	belt = 			/obj/item/storage/belt/military/assault
	neck =			/obj/item/storage/belt/holster
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,
		)

/datum/outfit/loadout/knighta
	name = "Paladin Support"
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		)

/datum/outfit/loadout/knightb
	name = "Surface Recon"
	uniform =		/obj/item/clothing/suit/armor/f13/combat/environmental
	head = 			/obj/item/clothing/head/helmet/f13/combat/environmental
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/knight=1,
		/obj/item/gun/ballistic/automatic/r93=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		)

/*
Initiate
*/

/datum/job/bos/f13initiate
	title = "Initiate"
	flag = F13INITIATE
	total_positions = 6
	spawn_positions = 6
	description = "Either recently inducted, born or conscripted into the Brotherhood, you have yet to prove yourself worthy of assignment to the Chapter. You are to assist your superiors and receive training how they deem fit. You are NEVER allowed to leave the bunker without the direct supervision of a superior; doing so may result in exile or transferrence back the Valley."
	supervisors = "the scribes, knights, or paladins"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 45//:)

	loadout_options = list(
	/datum/outfit/loadout/initiate_conscript, //Combat rig. Rifle.
	/datum/outfit/loadout/initiate_squire, //Combat armour. Basic laser pistol.
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

/datum/outfit/loadout/initiate_conscript
	name = "Conscript"
	suit = 			/obj/item/clothing/suit/armored/light/conscript_rig
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/varmint=1,
		/obj/item/ammo_box/magazine/m556/rifle/small=3,
		/obj/item/clothing/accessory/bos/initiate_conscript=1,
		)

/datum/outfit/loadout/initiate_squire
	name = "Squire"
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=2,
		/obj/item/clothing/accessory/bos/initiate_squire=1,
		)
