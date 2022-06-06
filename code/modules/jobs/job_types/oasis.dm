/*
Town access doors
Oasis government: 130  ACCESS_COMMAND
Sheriff/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
General access: 25 ACCESS_BAR
Clinic: 133 ACCESS_CLINIC
Church: 22 ACCESS_CHAPEL_OFFICE
Shopkeeper: 34 ACCESS_CARGO_BOT
Barkeep : 28 ACCESS_KITCHEN - you jebronis made default bar for no reason bruh
Prospector : 48 ACCESS_MINING
Detective : 4 ACCESS_FORENSICS_LOCKERS
here's a tip, go search DEFINES/access.dm
*/

/*
Mayor
*/

/datum/job/oasis
	exp_type = EXP_TYPE_FALLOUT
	faction = FACTION_OASIS

/datum/job/oasis/f13mayor
	title = "Mayor"
	flag = F13MAYOR
	department_flag = DEP_OASIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "Oasis"
	description = "You are the benevolent tyrant of Oasis, chosen by the people to represent and lead them. Pass laws to protect your citizens, distribute town funds and make deals with the powers present within the Region to better the people, and yourself, of course."
	selection_color = "#d7b088"

	exp_requirements = 1500

	outfit = /datum/outfit/job/den/f13mayor
	access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

	loadout_options = list(
			/datum/outfit/loadout/mayoral,
			/datum/outfit/loadout/dictator,
			/datum/outfit/loadout/firstcitizen,
			/datum/outfit/loadout/highroller,
					)


/datum/outfit/job/den/f13mayor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/den/f13mayor
	name = "Mayor"
	jobtype = /datum/job/oasis/f13mayor
	ears = 			/obj/item/radio/headset/headset_town
	id =            /obj/item/card/id/silver/mayor
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/oasis
	r_pocket = /obj/item/flashlight/seclite
	shoes = 		/obj/item/clothing/shoes/f13/tan
	uniform = /obj/item/clothing/under/f13/gentlesuit
	head = /obj/item/clothing/head/f13/town/big
	backpack_contents = list(
		/obj/item/storage/box/citizenship_permits = 1, \
		/obj/item/pen/fountain/captain = 1,
		/obj/item/gun/ballistic/automatic/wt550 = 1,
		/obj/item/ammo_box/magazine/m473/small = 2,
		)



/datum/outfit/loadout/dictator
	name = "Mayor for Life"
	backpack_contents = list(
	/obj/item/clothing/under/f13/general/oasis = 1,
	/obj/item/clothing/head/f13/army/general = 1,
	/obj/item/gun/ballistic/automatic/pistol/m1911/custom = 1,
	/obj/item/ammo_box/magazine/m45 = 2,
	/obj/item/clothing/shoes/jackboots = 1,
	/obj/item/clothing/mask/cigarette/pipe/cobpipe = 1,
	)

/datum/outfit/loadout/mayoral
	name = "Frontier Leader"
	backpack_contents = list(
		/obj/item/clothing/suit/armor/f13/town/mayor = 1,
		/obj/item/clothing/head/f13/town/mayor = 1,
		/obj/item/gun/ballistic/revolver/m29/snub = 1,
		/obj/item/ammo_box/m44 = 2,
		/obj/item/clothing/shoes/f13/cowboy = 1,
		/obj/item/clothing/mask/cigarette/cigar = 1,
		)

/datum/outfit/loadout/firstcitizen
	name = "First Citizen"
	backpack_contents = list(
		/obj/item/clothing/under/f13/vault = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/clothing/suit/armor/f13/battlecoat/vault/overseer = 1,
		/obj/item/reagent_containers/food/drinks/flask/vault113,
		/obj/item/gun/energy/laser/pistol= 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		)

/datum/outfit/loadout/highroller
	name = "High Roller"
	backpack_contents = list(
		/obj/item/clothing/glasses/orange = 1,
		/obj/item/clothing/suit/f13/vest = 1,
		/obj/item/clothing/under/f13/sleazeball = 1,
		/obj/item/clothing/shoes/laceup = 1,
		/obj/item/toy/cards/deck/unum = 1,
		/obj/item/gun/ballistic/automatic/pistol/type17 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
	)


/*--------------------------------------------------------------*/

/datum/job/oasis/f13secretary
	title = "Secretary"
	flag = F13SECRETARY
	department_flag = DEP_OASIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mayor"
	description = "You are the mayor's assistant, you help them with anything and everything they require and make sure trivial problems do not concern them. You handle clerical work, hear complaints, and set meetings. An efficient and smooth running town means a happy mayor."
	selection_color = "#d7b088"
	exp_requirements = 800

	outfit = /datum/outfit/job/den/f13secretary

	loadout_options = list(
	/datum/outfit/loadout/pr,
	/datum/outfit/loadout/pw,
	)

	access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13secretary
	name = "Secretary"
	jobtype = /datum/job/oasis/f13secretary

	ears = 			/obj/item/radio/headset/headset_town
	id =            /obj/item/card/id/silver
	glasses = /obj/item/clothing/glasses/regular/hipster
	gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	r_hand = /obj/item/storage/briefcase/secretary
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/seclite
	shoes = 		/obj/item/clothing/shoes/f13/fancy
	uniform = /obj/item/clothing/under/suit/black
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/pda = 1,
		)

/datum/outfit/loadout/pr
	name = "Public Relations"
	backpack_contents = list(
		/obj/item/megaphone = 1,
		/obj/item/reagent_containers/food/snacks/store/cake/birthday = 1,
		/obj/item/clothing/accessory/medal/ribbon = 1,
		/obj/item/clothing/gloves/color/latex/nitrile = 1,
		/obj/item/camera = 1,
		/obj/item/storage/crayons = 1,
		/obj/item/choice_beacon/box/carpet = 1,
		)

/datum/outfit/loadout/pw
	name = "Public Works"
	backpack_contents = list(
		/obj/item/clothing/head/hardhat = 1,
		/obj/item/clothing/suit/hazardvest = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/glass/ten = 2,
		/obj/item/stack/sheet/mineral/concrete/ten = 2
		)

/datum/outfit/job/den/f13secretary/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)


/*--------------------------------------------------------------*/

/datum/job/oasis/f13sheriff
	title = "Chief of Police"
	flag = F13POLICECHIEF
	department_flag = DEP_OASIS
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	supervisors = "Oasis Government"
	description = "You are the Mayor's best friend, you helped them get where they are. While they handle civil matters, you've been rewarded with more hands-on work, as preferred. With your loyal patrolmen, you maintain your claim to authority by keeping the peace, and protecting the citizens from threats within and without. Never leave Oasis undefended, and don't let its people die out. You have nowhere left to go, if this town falls, so will you."
	selection_color = "#d7b088"
	exp_requirements = 1500

	outfit = /datum/outfit/job/den/f13sheriff

	loadout_options = list(
	/datum/outfit/loadout/dakka,
	/datum/outfit/loadout/pew,
	)

	access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_COMMAND, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13sheriff
	name = "Chief of Police"
	jobtype = /datum/job/oasis/f13sheriff

	id = /obj/item/card/id/dogtag/sheriff
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/police/formal
	suit = /obj/item/clothing/suit/armor/f13/town/chief
	head = /obj/item/clothing/head/f13/town/chief
	neck = /obj/item/storage/belt/holster/legholster
	belt = /obj/item/storage/belt/military/army
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/sunglasses
	l_pocket = /obj/item/storage/bag/money/small/den
	backpack_contents = list(
		/obj/item/storage/box/deputy_badges = 1,
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/classic_baton = 1,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/grenade/flashbang = 1,
		)

/datum/outfit/loadout/dakka
	name = "Door kicker"
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m5mm = 2,
		/obj/item/ammo_box/m44 = 2,
		/obj/item/gun/ballistic/revolver/m29/peacekeeper = 1,
		)

/datum/outfit/loadout/pew
	name = "Tactical"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/citykiller
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ecp = 1,
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/shotgun/trainshot = 1,
		/obj/item/gun/energy/laser/auto/oasis = 1,
		)

/datum/outfit/job/den/f13sheriff/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13deputy
	title = "Officer"
	flag = F13POLICEMAN
	department_flag = DEP_OASIS
	total_positions = 5
	spawn_positions = 5
	supervisors = "Oasis Police Department"
	description = "You've passed the training and tests to join the OPD, and your loyalty to the Chief is absolute - this is your new home, your family. This oasis of civilization will not fall as long as you breathe. Protect its citizens and property, for that is your new purpose."
	selection_color = "#dcba97"
	exp_requirements = 12
	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/standardpd,
	/datum/outfit/loadout/police,
	/datum/outfit/loadout/swat,)

	outfit = /datum/outfit/job/oasis/f13deputy
	access = list(ACCESS_BAR, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/oasis/f13deputy
	name = "Officer"
	jobtype = /datum/job/oasis/f13deputy
	ears = /obj/item/radio/headset/headset_town
	id = /obj/item/card/id/dogtag/deputy
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	belt = /obj/item/storage/belt/military/assault
	suit = /obj/item/clothing/suit/armor/bulletproof
	neck = /obj/item/storage/belt/holster/legholster/police
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/f13/police/officer
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/grenade/flashbang = 1,
		)

/datum/outfit/loadout/standardpd
	name = "Standard"
	head = /obj/item/clothing/head/f13/town/officer
	suit_store = /obj/item/gun/ballistic/shotgun/police
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/shotgun/trainshot = 1,
		/obj/item/flashlight/seclite = 1,
		)

/datum/outfit/loadout/police
	name = "Police Marksman"
	head = /obj/item/clothing/head/f13/town/officer
	gloves = /obj/item/clothing/gloves/rifleman
	suit_store = /obj/item/gun/ballistic/rifle/hunting/remington
	backpack_contents = list(
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/a762 = 3,
		/obj/item/book/granter/trait/rifleman = 1,
		)

/datum/outfit/loadout/swat
	name = "S.W.A.T. Officer"
	uniform = /obj/item/clothing/under/f13/police/swat
	head = /obj/item/clothing/head/helmet/alt
	mask = /obj/item/clothing/mask/balaclava
	gloves = /obj/item/clothing/gloves/f13/military
	suit_store = /obj/item/gun/ballistic/automatic/assault_carbine/policerifle
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m5mm = 1,
		)

/datum/outfit/job/den/f13deputy/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13farmer
	title = "Farmer"
	flag = F13FARMER
	department_flag = DEP_OASIS
	total_positions = 3
	spawn_positions = 3
	supervisors = "Oasis Government & Police Department"
	description = "Growing up in the Oasis, you have an endless love for the sacred Oak, for nowhere in the valley is the soil as fertile, the bounty as rich. Behind the safety of the walls, you grow crops, medicines, and raise livestock. The community depends on you, you are a manifestation of the Oak’s will."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13farmer

	access = list(ACCESS_BAR,  ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR,  ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13farmer
	name = "Farmer"
	jobtype = /datum/job/oasis/f13farmer

	id = /obj/item/card/id/dogtag/town
	ears = 			/obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/storage/bag/plants
	backpack_contents = list(
		/obj/item/cultivator=1, \
		/obj/item/hatchet=1,
		/obj/item/shovel/spade=1, \
		/obj/item/gun/ballistic/automatic/pistol/n99, \
		/obj/item/ammo_box/magazine/m10mm_adv/simple=2)
	shoes = 		/obj/item/clothing/shoes/workboots

/datum/outfit/job/den/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13prospector
	title = "Prospector"
	flag = F13PROSPECTOR
	department_flag = DEP_OASIS
	total_positions = 4
	spawn_positions = 4
	supervisors = "Oasis Government & Police Department"
	description = "Prospecting is a complicated business, some call it scrounging or looting, but there is more to it than sifting through rubble - few can boast the skills you possess in mining and delving through the ruins of the fallen empire. Not many survive this line of business, and the pay has always been uncertain, but perhaps today you'll strike gold."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13prospector

	access = list(ACCESS_BAR, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_MINING)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13prospector
	name = "Prospector"
	jobtype = /datum/job/oasis/f13prospector

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	suit = /obj/item/clothing/suit/armor/f13/raider/iconoclast/
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/lantern
	r_hand = /obj/item/pickaxe
	belt = /obj/item/storage/bag/ore
	shoes = /obj/item/clothing/shoes/workboots
	backpack_contents = list(
		/obj/item/mining_scanner,
		/obj/item/shovel,
		/obj/item/melee/onehanded/knife/hunting,
		/obj/item/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/book/granter/crafting_recipe/ODF = 1,
		)

/datum/outfit/job/den/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/roving, \
		/obj/item/clothing/under/f13/cowboyt)

/datum/outfit/job/den/f13prospector/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13towndoctor
	title = "Town Doctor"
	flag = F13TOWNDOCTOR
	department_flag = DEP_OASIS
	total_positions = 3
	spawn_positions = 3
	supervisors = "Oasis Government & Police Department"
	description = "Handy with a scalpel and scanner, your expertise in the practice of medicine makes you an indispensible asset to the Town. Because you are independent, you are free to pick your patients and charge for your work."
	selection_color = "#dcba97"
	outfit = /datum/outfit/job/f13towndoctor
	loadout_options = list(
		/datum/outfit/loadout/towndoctor,
		/datum/outfit/loadout/followerdoctor,
		/datum/outfit/loadout/apothecary,
		/datum/outfit/loadout/nurse)
	access = list(ACCESS_BAR, ACCESS_CLINIC)
	minimal_access = list(ACCESS_BAR, ACCESS_CLINIC)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/rival = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/mentor = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/disciple = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/patron = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/protegee = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis))

/datum/outfit/job/f13towndoctor
	name = "Town Doctor"
	jobtype = /datum/job/oasis/f13towndoctor
	ears = /obj/item/radio/headset/headset_town
	neck = /obj/item/clothing/neck/stethoscope
	uniform = /obj/item/clothing/under/f13/medic
	gloves = /obj/item/pda/medical
	l_pocket = /obj/item/storage/bag/chemistry
	r_pocket = /obj/item/storage/bag/money/small/settler
	id = /obj/item/card/id/dogtag/town
	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag =	/obj/item/storage/backpack/duffelbag/med

/datum/outfit/loadout/towndoctor
	name = "Town Doctor"
	uniform = /obj/item/clothing/under/f13/doctor
	suit = /obj/item/clothing/suit/flakjack
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911/custom = 1,
		/obj/item/ammo_box/magazine/m45 = 3,
		/obj/item/stack/medical/bruise_pack = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 4)

/datum/outfit/loadout/followerdoctor
	name = "Follower of the Apocalypse"
	glasses =	/obj/item/clothing/glasses/hud/health
	uniform =	/obj/item/clothing/under/f13/followers
	suit =	/obj/item/clothing/suit/toggle/labcoat/f13/followers
	shoes = /obj/item/clothing/shoes/sneakers/white
	backpack_contents = list(
		/obj/item/retractor/advanced = 1,
		/obj/item/reagent_containers/medspray/synthflesh = 2,
		/obj/item/storage/firstaid/regular = 1)

/datum/outfit/loadout/apothecary
	name = "Apothecary"
	head = /obj/item/clothing/head/plaguedoctorhat
	mask = /obj/item/clothing/mask/gas/plaguedoctor
	suit = /obj/item/clothing/suit/bio_suit/plaguedoctorsuit
	shoes = /obj/item/clothing/shoes/sandal
	backpack_contents = list(
		/obj/item/reagent_containers/glass/primitive_chem_isolator = 1,
		/obj/item/reagent_containers/glass/mortar = 1,
		/obj/item/storage/box/medicine/poultice5 = 1,
		/obj/item/storage/box/medicine/poultice5 = 1)

/datum/outfit/loadout/nurse
	name = "Nurse"
	head = /obj/item/clothing/head/nursehat
	uniform = /obj/item/clothing/under/rank/nursesuit
	shoes = /obj/item/clothing/shoes/sneakers/white
	backpack_contents = list(
		/obj/item/flashlight/pen = 1,
		/obj/item/reagent_containers/food/snacks/lollipop = 5,
		/obj/item/stack/medical/suture/medicated = 1,
		/obj/item/stack/medical/mesh/advanced = 1,
		/obj/item/hypospray/mkii/CMO = 1)

/datum/outfit/job/f13towndoctor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)

//--------------------------------------------------//
/datum/job/oasis/f13preacher
	title = "Preacher"
	flag = F13PREACHER
	faction = DEP_OASIS
	total_positions = 2
	spawn_positions = 2
	supervisors = "God"
	description = "You are the last bastion of faith in this God-forsaken Wasteland. Spread your word and preach to the faithless."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/f13preacher

	loadout_options = list(
	/datum/outfit/loadout/crusader, 	//This is kinda a given. You bet.
	/datum/outfit/loadout/samaritan, 	//Water and food to share with the wastes.
	/datum/outfit/loadout/cleanser		//Just some bombs.
	)

	access = list(ACCESS_BAR, ACCESS_CHAPEL_OFFICE)
	minimal_access = list(ACCESS_BAR, ACCESS_CHAPEL_OFFICE)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/rival = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/mentor = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/disciple = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/patron = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis),
		/datum/matchmaking_pref/protegee = list(/datum/job/wasteland/f13wastelander, /datum/job/oasis))



/datum/outfit/loadout/crusader
	name = "Crusader"
	backpack_contents = list(
		/obj/item/clothing/suit/armor/knight = 1,
		/obj/item/clothing/head/helmet/knight/red = 1,
		/obj/item/melee/onehanded/machete = 1,
	)

/datum/outfit/loadout/samaritan
	name = "Samaritan"
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/store/bread/plain = 5,
		/obj/item/reagent_containers/food/snacks/fishmeat/salmon = 2,
		/obj/item/reagent_containers/glass/beaker/waterbottle = 2,
		/obj/item/nullrod = 1,
	)	//Matthew 14:17 RSVCE and KJV - Kitsunemitsu

/datum/outfit/loadout/cleanser
	name = "Cleanser"
	backpack_contents = list(
		/obj/item/grenade/homemade/coffeepotbomb = 2,	//This is funny. I swear guys.
		/obj/item/gun/ballistic/revolver/m29 = 1,		//Moved here for more *variety*
		/obj/item/ammo_box/m44 = 2
	)


/datum/job/oasis/f13preacher/after_spawn(mob/living/H, mob/M)
	. = ..()
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(GLOB.religion)
		B.deity_name = GLOB.deity
		B.name = GLOB.bible_name
		B.icon_state = GLOB.bible_icon_state
		B.item_state = GLOB.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [GLOB.deity]. Defer to the Chaplain.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = GLOB.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = DEFAULT_RELIGION
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = DEFAULT_DEITY
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("christianity") // DEFAULT_RELIGION
			B.name = pick("The Holy Bible","The Dead Sea Scrolls")
		if("buddhism")
			B.name = "The Sutras"
		if("clownism","honkmother","honk","honkism","comedy")
			B.name = pick("The Holy Joke Book", "Just a Prank", "Hymns to the Honkmother")
		if("chaos")
			B.name = "The Book of Lorgar"
		if("cthulhu")
			B.name = "The Necronomicon"
		if("hinduism")
			B.name = "The Vedas"
		if("homosexuality")
			B.name = pick("Guys Gone Wild","Coming Out of The Closet")
		if("imperium")
			B.name = "Uplifting Primer"
		if("islam")
			B.name = "Quran"
		if("judaism")
			B.name = "The Torah"
		if("lampism")
			B.name = "Fluorescent Incandescence"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes")
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition", "F.A.T.A.L. Rulebook")
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 100) // starts off dumb as fuck
		if("monkeyism","apism","gorillism","primatism")
			B.name = pick("Going Bananas", "Bananas Out For Harambe")
		if("mormonism")
			B.name = "The Book of Mormon"
		if("pastafarianism")
			B.name = "The Gospel of the Flying Spaghetti Monster"
		if("rastafarianism","rasta")
			B.name = "The Holy Piby"
		if("satanism")
			B.name = "The Unholy Bible"
		if("science")
			B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		if("servicianism", "partying")
			B.name = "The Tenets of Servicia"
			B.deity_name = pick("Servicia", "Space Bacchus", "Space Dionysus")
			B.desc = "Happy, Full, Clean. Live it and give it."
		if("subgenius")
			B.name = "Book of the SubGenius"
		if("toolboxia","greytide")
			B.name = pick("Toolbox Manifesto","iGlove Assistants")
		if("weeaboo","kawaii")
			B.name = pick("Fanfiction Compendium","Japanese for Dummies","The Manganomicon","Establishing Your O.T.P")
		else
			B.name = "The Holy Book of [new_religion]"

	GLOB.religion = new_religion
	GLOB.bible_name = B.name
	GLOB.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)


/datum/outfit/job/f13preacher
	name = "Preacher"
	jobtype = /datum/job/oasis/f13preacher
	id =	/obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/chaplain
	gloves =	/obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/jackboots
	r_pocket = /obj/item/flashlight/flare
	backpack =	/obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack
	backpack_contents = list(
		/obj/item/camera/spooky = 1,
		/obj/item/reagent_containers/food/drinks/flask = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/fancy/candle_box = 1,
		/obj/item/storage/bag/money/small/settler
		)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13barkeep
	title = "Barkeep"
	flag = F13BARKEEP
	department_flag = DEP_OASIS
	total_positions = 2
	spawn_positions = 2
	supervisors = "Oasis Government & Police Department"
	description = "As the innkeeper, you are responsible for comfort and full bellies in town. Hidden safely away behind the town walls, you are free to refine your skills without always watching your back. As a citizen of the town you must follow its laws. However the inn is your private business, and you decide who is allowed to dine or reside in your hospitality."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13barkeep

	loadout_options = list(
	/datum/outfit/loadout/rugged,
	/datum/outfit/loadout/frontier,
	/datum/outfit/loadout/richmantender,
	/datum/outfit/loadout/diner)

	access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)


/datum/outfit/job/den/f13barkeep
	name = "Barkeep"
	jobtype = /datum/job/oasis/f13barkeep

	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/book/granter/action/drink_fling = 1,
		/obj/item/ammo_box/shotgun/bean = 2,
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/stack/f13Cash/caps/onezerozero = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1,
		)

/datum/outfit/loadout/rugged
	name = "Rugged"
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	uniform = /obj/item/clothing/under/f13/cowboyb
	suit = /obj/item/clothing/suit/f13/cowboybvest
	gloves = /obj/item/clothing/gloves/color/brown
	shoes = /obj/item/clothing/shoes/f13/brownie

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy

/datum/outfit/loadout/richmantender
	name = "Fancy"
	head = /obj/item/clothing/head/fedora
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy
	neck = /obj/item/clothing/neck/tie/black

/datum/outfit/loadout/diner
	name = "Diner"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/brahminf
	neck = /obj/item/clothing/neck/apron/chef
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/f13/military/ncr

/*--------------------------------------------------------------*/
/datum/job/oasis/f13settler
	title = "Citizen"
	flag = F13SETTLER
	department_flag = DEP_OASIS
	total_positions = 8
	spawn_positions = 8
	supervisors = "Oasis Government & Police Department"
	description = "You are a citizen living in the Town of Oasis - as the name suggests, it is a somewhat safe place amidst the chaos of the continent. Treat it as such, be sure to follow the laws of the land and do not associate with those who have a tendency not to, or you are likely to face exile. Remember that Oasis is your home, DO NOT act in a manner that would threaten it's safety or other citizens."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13settler

	loadout_options = list(
		/datum/outfit/loadout/provisioner,
		/datum/outfit/loadout/groundskeeper,
		/datum/outfit/loadout/artisan,
		/datum/outfit/loadout/outdoorsman,
		/datum/outfit/loadout/militia,
		/datum/outfit/loadout/singer,
	)
	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)


/datum/outfit/job/den/f13settler
	name = "Citizen"
	jobtype = /datum/job/oasis/f13settler
	ears = /obj/item/radio/headset/headset_town
	belt = null
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/jackboots
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/book/granter/trait/selection
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/loadout/provisioner
	name = "Provisioner"
	neck = /obj/item/clothing/neck/scarf/cptpatriot
	suit = /obj/item/clothing/suit/jacket/miljacket
	neck = /obj/item/clothing/ears/headphones
	uniform = /obj/item/clothing/under/f13/merca
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/reagent_containers/food/drinks/flask = 1,
	/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
	/obj/item/ammo_box/magazine/m10mm_adv/simple = 1,
	)

/datum/outfit/loadout/groundskeeper
	name = "Groundskeeper"
	head = /obj/item/clothing/head/soft/grey
	belt = /obj/item/storage/belt
	suit = /obj/item/clothing/under/f13/mechanic
	gloves = /obj/item/clothing/gloves/color/yellow
	backpack_contents = list(/obj/item/storage/bag/trash = 1, /obj/item/reagent_containers/spray/cleaner = 1,
	/obj/item/gun/ballistic/revolver/hobo/piperifle = 1,
	/obj/item/ammo_box/a556/stripper = 2,

	)

/datum/outfit/loadout/artisan
	name = "Artisan"
	glasses = /obj/item/clothing/glasses/welding
	suit = /obj/item/clothing/under/f13/petrochico
	belt = /obj/item/storage/belt/utility
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	backpack_contents = list(/obj/item/twohanded/sledgehammer/simple = 1,
	/obj/item/stack/sheet/metal/twenty = 1,
	/obj/item/book/granter/crafting_recipe/ODF = 1,
	)

/datum/outfit/loadout/outdoorsman
	name = "Outdoorsman"
	head = /obj/item/clothing/head/f13/beaver
	suit = /obj/item/clothing/suit/f13/cowboybvest
	belt = /obj/item/storage/belt/bandolier
	uniform = /obj/item/clothing/under/f13/bartenderalt
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(/obj/item/fishingrod = 1,
	/obj/item/storage/fancy/cigarettes/cigars = 1,
	/obj/item/gun/ballistic/revolver/widowmaker = 1,
	/obj/item/ammo_box/shotgun/buck = 2,
	)

/datum/outfit/loadout/militia
	name = "Militia"
	head = /obj/item/clothing/head/helmet/armyhelmet
	suit = /obj/item/clothing/suit/armor/f13/metalarmor/steelbib
	uniform = /obj/item/clothing/under/f13/mercc
	r_hand = /obj/item/gun/ballistic/rifle/hunting
	gloves = /obj/item/clothing/gloves/f13/leather
	backpack_contents = list(/obj/item/ammo_box/a308 = 2,
	)
/*
/datum/outfit/loadout/secretary
	name = "Secretary"
	uniform = /obj/item/clothing/under/suit/black
	glasses = /obj/item/clothing/glasses/regular/hipster
	shoes = /obj/item/clothing/shoes/laceup
	r_hand = /obj/item/storage/briefcase
	backpack_contents = list(/obj/item/pen = 1,
	/obj/item/clipboard = 1,
	/obj/item/paper_bin/bundlenatural = 1,
	/obj/item/clothing/under/suit/black/skirt = 1,
	/obj/item/gun/ballistic/automatic/pistol/pistol22 = 1,
	/obj/item/ammo_box/magazine/m22 = 2,
	)
	///we should find something to do with this
*/
/datum/outfit/loadout/singer
	name = "Singer"
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1,
	/obj/item/gun/ballistic/revolver/police = 1,
	/obj/item/ammo_box/a357 = 2,
	)

/*----------------------------------------------------------------
--							Detective							--
----------------------------------------------------------------*/
/datum/job/oasis/f13detective
	title = "Detective"
	flag = F13DETECTIVE
	total_positions = 0
	spawn_positions = 0
	description = "As a Detective you are a private eye who assists clients to gather evidence, conduct surveillance, find missing people, and verify information. As a private investigator you are not responsible for peacekeeping the valley, but for finding answers. Your life is already over, make the ending mean something."
	supervisors = "paying clients"
	selection_color = "#dcba97"
	outfit = /datum/outfit/job/oasis/f13detective

	access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/oasis/f13detective,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/oasis/f13detective,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
	)


/datum/outfit/job/oasis/f13detective
	name = "Detective"
	jobtype = /datum/job/oasis/f13detective
	suit = /obj/item/clothing/suit/det_suit/grey
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/detectivealt
	head = /obj/item/clothing/head/f13/det_hat_alt
	shoes =  /obj/item/clothing/shoes/laceup
	id = /obj/item/card/id/silver
	l_pocket = /obj/item/storage/bag/money/small/oasis
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	suit_store = /obj/item/gun/ballistic/revolver/police
	backpack_contents = list(
		/obj/item/pda/detective=1,
		/obj/item/camera/detective=1,
		/obj/item/toy/crayon/white=1,
		/obj/item/detective_scanner=1,
		/obj/item/storage/box/gloves=1,
		/obj/item/storage/box/evidence=1,
		/obj/item/ammo_box/a357=2)

/*--------------------------------------------------------------*/

/datum/job/oasis/f13assistant
	title = "Shop Assistant"
	flag = F13ASSIST
	department_flag = DEP_OASIS
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Shopkeeper"
	description = "Sometimes you need a cog in the machine to keep it turning. You are the cog, capitalism is the machine, and the shopkeeper turns the handle. In return for being taught the ways of commerce and crafting, you help keep the shop orderly and customers happy."
	selection_color = "#dcba97"
	exp_requirements = 600
	outfit = /datum/outfit/job/oasis/f13assist

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)
/datum/outfit/job/oasis/f13assist
	name = "Shop Assistant"
	jobtype = /datum/job/oasis/f13assistant

	uniform = /obj/item/clothing/under/f13/mechanic
	suit = /obj/item/clothing/suit/f13/blacksmith_apron
	belt = /obj/item/storage/belt/utility
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	shoes = /obj/item/clothing/shoes/f13/cowboy
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/ = 1)



/datum/outfit/job/oasis/f13assist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)

/datum/outfit/job/oasis/f13assist/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return


/*--------------------------------------------------------------*/
/datum/job/oasis/f13shopkeeper
	title = "Shopkeeper"
	flag = F13SHOPKEEPER
	department_flag = DEP_OASIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "free hand of the market"
	description = "The greed of the United States survived better than its people. You are an organ of this greed. Ensure its continuation."
	selection_color = "#dcba97"
	exp_requirements = 800

	outfit = /datum/outfit/job/den/f13shopkeeper
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13shopkeeper
	name = "Shopkeeper"
	jobtype = /datum/job/oasis/f13shopkeeper

	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/roving
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/storage/bag/money/small/den
	r_pocket = /obj/item/flashlight/glowstick
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/storage/box/shopkeeper = 1)

/datum/outfit/job/den/f13shopkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/a180)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/uzi)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg10mm)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/shrapnelmine)

/datum/outfit/job/den/f13shopkeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
