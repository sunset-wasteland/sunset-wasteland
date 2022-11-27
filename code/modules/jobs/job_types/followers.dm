/datum/job/followers //do NOT use this for anything, it's just to store faction datums
	department_flag = FOLLOWERS
	selection_color = "#ffeeaa"
	exp_type = EXP_TYPE_FOLLOWERS
	access = list(ACCESS_FOLLOWER, ACCESS_FUSION)
	minimal_access = list(ACCESS_FOLLOWER, ACCESS_FUSION)
	roleplay_exclusive_notify = 1
	forbids = "Aligning oneself with a faction exclusively. Acting in an aggressive and violent way on the offensive, not in defense. Abandoning your facility, peers, and community."
	enforces = "Preaching humanitarianism and valuing human life. Assist and provide medical services to those in need. Provide free education for all those who are willing to learn."
	objectivesList = list("Leadership recommends the following goal for this week: Establish medical outposts throughout the wasteland","Leadership recommends the following goal for this week: Experiment with and improve medical techniques and equipment", "Leadership recommends the following goal for this week: Replenish the operation's funds through donations and sales.")

/datum/outfit/job/followers
	name =		"FOLLOWERSdatums"
	jobtype =	/datum/job/followers/
	shoes =		/obj/item/clothing/shoes/sneakers/black
	id =		null
	ears =		/obj/item/radio/headset/headset_followers
	uniform =	/datum/outfit/job/followers/f13followers

/datum/outfit/job/followers/f13followers
	name =		"Followers"
	uniform =	/obj/item/clothing/under/f13/follower

/datum/outfit/job/followers/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/set_vrboard/followers)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/follower_light)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/follower_medium)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/follower_heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rechargerpistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rechargerrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/melee/forged/surgripper)

//datum/outfit/job/followers/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
//	..()
//	if(visualsOnly)
//		return
//	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)

/*
Administrator
*/
/datum/job/followers/f13leadpractitioner
	title = "Followers Administrator"
	flag = F13LEADPRACTITIONER
	department_flag = FOLLOWERS
	head_announce = list("Security")
	faction = "Followers"
	total_positions = 1
	spawn_positions = 1
	supervisors = "No one."
	description = "You are the Follower Administrator. You are the administrator for the on-site followers. While there is no tradtional chain of command that is used, you have been chosen to lead due to your expert knowledge in the field of medicine and other general knowledges. Make sure that the supplies donated are being put to use, help secure more donations, and fill in as needed whenever short staffed or if the clinic is busy."
	forbids = "Causing harm to others except in times of self-defense."
	enforces = "Followers are not fond of the NCR due to their corruption, but they will help them. They dislike the Brotherhood for hoarding tech, but will make deals to work with them if it furthers the spreading of knowledge. While your goal is to assist those who need your help, you do not have to help everyone, and may turn away anyone - you are not obligated to revive a raider or Legionnaire dropped at your doorstep. Preaching humanitarianism and valuing human life. Assist and provide medical services to those in need. Provide free education for all those who are willing to learn."
	selection_color = "#FF95FF"
	exp_requirements = 750

	outfit = /datum/outfit/job/followers/f13leadpractitioner

	access = list(ACCESS_FOLLOWER, ACCESS_COMMAND, ACCESS_MILITARY, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_ATMOSPHERICS, ACCESS_FUSION)
	minimal_access = list(ACCESS_FOLLOWER, ACCESS_COMMAND, ACCESS_MILITARY, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_ATMOSPHERICS, ACCESS_FUSION)


/datum/outfit/job/followers/f13leadpractitioner/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, src)

/datum/outfit/job/followers/f13leadpractitioner
	name =	"Followers Administrator"
	jobtype =	/datum/job/followers/f13leadpractitioner
	id =	/obj/item/card/id/silver
	chemwhiz =	TRUE
	uniform =	/obj/item/clothing/under/f13/followers
	suit=	/obj/item/clothing/suit/hooded/followerlight
	shoes =	/obj/item/clothing/shoes/f13/brownie
	belt =	/obj/item/healthanalyzer/advanced
	backpack =	/obj/item/storage/backpack/medic
	satchel =	/obj/item/storage/backpack/satchel/med
	duffelbag =	/obj/item/storage/backpack/duffelbag/med
	backpack_contents = list(
		/obj/item/reagent_containers/glass/beaker/bluespace = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/reagent_containers/medspray/synthflesh = 2,
		/obj/item/reagent_containers/hypospray/combat = 1,
		/obj/item/clothing/glasses/hud/health = 1,
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/book/granter/trait/techno = 1,
	)

/*
Practitioner
*/
/datum/job/followers/f13practitioner
	title = "Followers Doctor"
	flag = F13PRACTITIONER
	department_flag = FOLLOWERS
	faction = "Followers"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Followers having no strict command structure, don't report to anyone- though they will look to the Administrator for guidance."
	description ="You are a Followers Doctor. As a Followers Doctor it is your responsibility to maintain working order in the hospital and to manage its staff and to treat patients who come in regardless of whether or not they can afford care. Some Doctors are known for leaving the hospital to look for injured or those who need help who may not come to a health facility, however it is key that those who do travel around to give aid keep in touch with the rest of staff and if there are no other able physicans or chemist that they stay to offer the best aid possible."
	forbids = "Causing harm to others except in times of self-defense."
	enforces = "Followers are not fond of the NCR due to their corruption, but they will help them. They dislike the Brotherhood for hoarding tech, but will make deals to work with them if it furthers the spreading of knowledge. While your goal is to assist those who need your help, you do not have to help everyone, and may turn away anyone - you are not obligated to revive a raider or Legionnaire dropped at your doorstep. Preaching humanitarianism and valuing human life. Assist and provide medical services to those in need. Provide free education for all those who are willing to learn."
	selection_color = "#FFDDFF"
	exp_requirements = 300

	outfit = /datum/outfit/job/followers/f13practitioner
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/followers/f13practitioner,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/followers/f13practitioner,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/followers/f13followervolunteer,
		),
	)

	loadout_options = list(
	/datum/outfit/loadout/physician,
	/datum/outfit/loadout/pharmacist,
	/datum/outfit/loadout/paramedic,
	/datum/outfit/loadout/medical_researcher,
	)

/datum/outfit/job/followers/f13practitioner/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, src)

	//the follower practitioner doesn't need access because it's already set in the /datum/job/follower
	//personally, I don't think a practitioner should have more access than a volunteer.


/datum/outfit/job/followers/f13practitioner
	name =	"Followers Doctor"
	jobtype =	/datum/job/followers/f13practitioner
	uniform =	/obj/item/clothing/under/f13/followers
	suit=	/obj/item/clothing/suit/hooded/followerlight
	id =	/obj/item/card/id/silver
	chemwhiz =	TRUE
	backpack =	/obj/item/storage/backpack/medic
	belt = /obj/item/gun/energy/laser/complianceregulator
	satchel =	/obj/item/storage/backpack/satchel/med
	duffelbag =	/obj/item/storage/backpack/duffelbag/med
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/reagent_containers/medspray/synthflesh = 1,
		/obj/item/storage/firstaid/ancient = 1,
	)

/datum/outfit/loadout/physician
	name =	"Emergency Physician"
	suit =	/obj/item/clothing/suit/toggle/labcoat/f13/followers
	mask =	/obj/item/clothing/mask/surgical
	gloves =	/obj/item/clothing/gloves/color/latex/nitrile
	glasses =	/obj/item/clothing/glasses/hud/health
	backpack_contents = list(
		/obj/item/clothing/suit/hooded/surgical = 1,
		/obj/item/reagent_containers/medspray/synthflesh = 1,
		/obj/item/healthanalyzer/advanced = 1,
	)

/datum/outfit/loadout/pharmacist
	name =	"Pharmacist"
	suit =	/obj/item/clothing/suit/toggle/labcoat/chemist
	gloves =	/obj/item/clothing/gloves/color/latex
	glasses =	/obj/item/clothing/glasses/science
	backpack_contents = list(
		/obj/item/flashlight/pen = 1,
		/obj/item/pda/chemist = 1,
	)

/datum/outfit/loadout/paramedic
	name =	"Paramedic"
	head =	/obj/item/clothing/head/soft/emt
	suit =	/obj/item/clothing/suit/toggle/labcoat/emt
	glasses =	/obj/item/clothing/glasses/hud/health
	belt =	/obj/item/storage/belt/medical
	backpack_contents = list(
		/obj/item/reagent_containers/medspray/synthflesh = 2,
		/obj/item/pda/medical = 1,
		/obj/item/healthanalyzer=1,
	)

/datum/outfit/loadout/medical_researcher
	name =	"Medical Researcher"
	suit =	/obj/item/clothing/suit/toggle/labcoat/f13/followers
	backpack_contents = list(
		/obj/item/clothing/accessory/pocketprotector/full = 1,
		/obj/item/folder/white = 1,
		/obj/item/pda/medical = 1,
		/obj/item/book/granter/trait/techno = 1,
	)


/*
Follower Volunteer
*/

/datum/job/followers/f13followervolunteer
	title = "Followers Volunteer"
	flag = F13FOLLOWERVOLUNTEER
	department_flag = FOLLOWERS
	faction = "Followers"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Followers having no strict command structure, don't report to anyone- though they will look to the Administrator for guidance and the other Doctors as well."
	description = "You are a Follower Volunteer. As a Volunteer, you make sure they get connected to the right people to find treatment, assist in the functions of the hospital, learn from senior Followers, and utilize first aid to the best of your capacity when Doctors are not present."
	forbids = "Causing harm to others except in times of self-defense."
	enforces = "Followers are not fond of the NCR due to their corruption, but they will help them. They dislike the Brotherhood for hoarding tech, but will make deals to work with them if it furthers the spreading of knowledge. Legion is our mistake and its our job to correct the mistake by speaking of the truth, but recognize that the best way to fight the legion is to teach them and sometimes that can mean helping them. Preaching humanitarianism and valuing human life. Assist and provide medical services to any who require it, regardless of faction. Provide free education for all those who are willing to learn."
	selection_color = "#FFDDFF"
	outfit = /datum/outfit/job/followers/f13followervolunteer
	loadout_options = list(
	/datum/outfit/loadout/volunteer_emt,
	/datum/outfit/loadout/volunteer_mechanic,
	/datum/outfit/loadout/volunteer_farmer,
	/datum/outfit/loadout/volunteer_student
	)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/followers/f13followervolunteer,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/followers/f13followervolunteer,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/followers/f13practitioner,
		),
	)

	//the follower volunteer doesn't need more access as it is already stored in the /datum/job/followers

/datum/outfit/job/followers/f13followervolunteer
	name = "Followers Volunteer"
	jobtype = /datum/job/followers/f13followervolunteer
	id = 		/obj/item/card/id/silver
	uniform = 	/obj/item/clothing/under/f13/followers
	shoes = 	/obj/item/clothing/shoes/f13/explorer
	r_hand =	/obj/item/book/granter/trait/medical
	backpack = 	/obj/item/storage/backpack/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	backpack_contents =  list(
		/obj/item/storage/firstaid/ancient = 1,
	)

/datum/outfit/loadout/volunteer_emt
	name = "EMT"
	suit = /obj/item/clothing/suit/toggle/labcoat/emt
	head = /obj/item/clothing/head/soft/emt
	backpack_contents = list(
		/obj/item/healthanalyzer = 1,
		/obj/item/reagent_containers/medspray/synthflesh = 1,
	)

/datum/outfit/loadout/volunteer_mechanic
	name =	"Mechanic"
	neck =	/obj/item/clothing/neck/apron/labor
	head =	/obj/item/clothing/head/hardhat/orange
	belt =	/obj/item/storage/belt/utility/full
	gloves =	/obj/item/clothing/gloves/color/yellow
	glasses =	/obj/item/clothing/glasses/welding
	backpack_contents = list(
		/obj/item/flashlight/pen = 1,
		/obj/item/pda/chemist = 1,
	)

/datum/outfit/loadout/volunteer_farmer
	name =	"Farmer"
	head =	/obj/item/clothing/head/helmet/f13/vaquerohat
	suit =	/obj/item/clothing/suit/overalls
	belt =	/obj/item/storage/bag/plants/portaseeder
	backpack_contents = list(
		/obj/item/hatchet = 1,
		/obj/item/cultivator = 1,
		/obj/item/shovel/spade = 1,
	)

/datum/outfit/loadout/volunteer_student
	name = "Student"
	backpack_contents = list(
		/obj/item/taperecorder = 1,
		/obj/item/clothing/accessory/pocketprotector/full = 1,
		/obj/item/clipboard = 1,
		/obj/item/pen/fourcolor = 1,
	)


// Formerly Follower Guard - It was desperately in need of an overhaul

/datum/job/followers/f13followerscholar
	title = "Followers Scholar"
	flag = F13FOLLOWERGUARD
	department_flag = FOLLOWERS
	faction = "Followers"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Followers having no strict command structure, don't report to anyone- though they will look to the Administrator for guidance and the other Doctors as well."
	description = "You are a field agent for the Followers. As a Scholar, you are responsible for searching the wasteland for old books, documents, and other items of interest. Your reason for being here is to further research in non-military matters, as well as helping local communities get access to basic necessities, though you may be called on to defend the clinic as well. "
	forbids = "Causing harm to others except in times of self-defense or in defense of other followers."
	enforces = "Followers are not fond of the NCR due to their corruption, but they will help them. They dislike the Brotherhood for hoarding tech, but will make deals to work with them if it furthers the spreading of knowledge. While your goal is to assist those who need your help, you do not have to help everyone, and may turn away anyone - you are not obligated to revive a raider or Legionnaire dropped at your doorstep. Preaching humanitarianism and valuing human life. Assist and provide medical services to those in need. Provide free education for all those who are willing to learn."
	selection_color = "#FFDDFF"
	exp_requirements = 300

	outfit = /datum/outfit/job/followers/f13followerscholar

	loadout_options = list(/datum/outfit/loadout/engineer, //toolbelt
	/datum/outfit/loadout/miner, //ore-bag
	/datum/outfit/loadout/combat //guard-on-crack
	)
	access = list(ACCESS_FOLLOWER, ACCESS_MILITARY, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_ATMOSPHERICS, ACCESS_FUSION)
	minimal_access = list(ACCESS_FOLLOWER, ACCESS_MILITARY, ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_ATMOSPHERICS, ACCESS_FUSION)

/datum/outfit/job/followers/f13followerscholar
	name =	"Followers Scholar"
	jobtype =	/datum/job/followers/f13followerscholar
	id =	/obj/item/card/id/silver
	uniform =	/obj/item/clothing/under/f13/bodyguard
	suit = /obj/item/clothing/suit/hooded/followermedium
	glasses =	/obj/item/clothing/glasses/welding
	shoes =	/obj/item/clothing/shoes/combat
	neck =	/obj/item/storage/belt/holster
	backpack =	/obj/item/storage/backpack/explorer
	satchel =	/obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/gun/energy/laser/complianceregulator = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/melee/onehanded/knife/hunting=1,
	)

/datum/outfit/job/followers/f13followerscholar/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_RESEARCHER, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST, src)

/datum/outfit/loadout/engineer //Upgraded tools, Materials
	name = "Followers Engineer"
	belt = /obj/item/storage/belt/utility/full/engi
	head =	/obj/item/clothing/head/hardhat
	gloves =	/obj/item/clothing/gloves/color/yellow
	backpack_contents = list(
		/obj/item/stack/sheet/metal/fifty = 1,
		/obj/item/stack/sheet/glass/fifty = 1,
		/obj/item/lightreplacer = 1,

	)

/datum/outfit/loadout/miner //Quick access to mining, scanner
	name = "Followers Miner"
	mask = /obj/item/clothing/mask/gas/explorer
	head =	/obj/item/clothing/head/hardhat/orange
	backpack_contents = list(
		/obj/item/storage/bag/ore/large = 2,
		/obj/item/pickaxe/titanium = 1,
		/obj/item/t_scanner/adv_mining_scanner = 1,
	)

/datum/outfit/loadout/combat //Guard, but actually good.
	name = "Followers Crusader"
	suit = /obj/item/clothing/suit/hooded/followerheavy
	belt = /obj/item/storage/belt/military/army/military/
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz/recharger = 1,
		/obj/item/gun/ballistic/shotgun/police = 1,
		/obj/item/shield/riot = 1,
		/obj/item/melee/classic_baton/telescopic = 1,
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/shotgun/slug = 1,
	)




// Special - 'Borg
/datum/job/followers/f13folborg
	title = "Followers Robot"
	flag = F13FOLCYBORG
	department_flag = FOLLOWERS
	faction = "Followers"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Administrator and Doctors, in that order"
	exp_requirements = 300
	description = "You are a Robotic unit assigned to this clinic. As a Robot for the Followers, you're bound to the orders of the Administrator and Doctors, in that order for priority. Should the Administrator declare something, you must follow it."
	forbids = "Abandoning your post and not defending the clinic."
	selection_color = "#FFDDFF"

/datum/job/followers/f13folborg/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	return H.Robotize(FALSE, latejoin)

/datum/job/followers/f13folborg/override_latejoin_spawn()
	return TRUE

/datum/job/followers/f13folborg/after_spawn(mob/living/silicon/robot/R, mob/M)
	. = ..()
	ADD_TRAIT(R, TRAIT_TECHNOPHREAK, TRAIT_GENERIC)
	R.apply_pref_name("human", M.client)
	R.gender = NEUTER
	R.forceMove(pick(GLOB.special_borg_start))
