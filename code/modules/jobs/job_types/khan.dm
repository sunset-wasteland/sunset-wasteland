/datum/job/khan //do NOT use this for anything, it's just to store faction datums
	department_flag = KHAN
	selection_color = "#ff915e"
	faction = FACTION_KHAN
	exp_type = EXP_TYPE_KHAN
	access = list(ACCESS_KHAN)
	minimal_access = list(ACCESS_KHAN)
	forbids = "THE KHANS DISCOURAGES: Weakness, Sabotaging other Khans."
	enforces = "THE KHANS ENCOURAGES: Displays of Strength. Assisting the 'Trade'."

/datum/outfit/job/khan
	name = "Khan"
	jobtype = /datum/job/khan
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket
	id = /obj/item/card/id/khantattoo
	ears = /obj/item/radio/headset/headset_khans
	head = /obj/item/clothing/head/helmet/f13/khan/bandana
	shoes = /obj/item/clothing/shoes/f13/military/khan
	backpack =	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/old
	uniform = /obj/item/clothing/under/f13/khan
	r_hand = /obj/item/book/granter/trait/selection
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/storage/survivalkit_khan
	gloves = /obj/item/melee/unarmed/brass/spiked
	box = null
	backpack_contents = list(
		/obj/item/storage/bag/money/small/khan = 1
		)

/datum/outfit/job/khan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/set_vrboard/den)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combatrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/uzi)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg10mm)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gate_khanate)

/datum/job/khan/enforcer
	title = "Khan Enforcer"
	flag = F13KHAN
	faction = FACTION_KHAN
	total_positions = 6
	spawn_positions = 6
	description = "You are a Khan, a member of the local band that the Chief has sent to scout these lands. Listen to the Chemist, and assure you've a steady supply of caps for the Chief."
	supervisors = "the Chemist"
	selection_color = "#ff915e"
	exp_requirements = 240
	exp_type = EXP_TYPE_WASTELAND
	outfit = /datum/outfit/job/khan/enforcer

	loadout_options = list(
		/datum/outfit/loadout/soldier
		)

/datum/job/khan/chemist
	title = "Khan Chemist"
	flag = F13KHANCHEMIST
	faction = FACTION_KHAN
	total_positions = 1
	spawn_positions = 1
	description = "You are a Chemist, one of the few Khans present in this camp that can produce those sweet, sweet chems. Keep them flowing and assure a supply of caps, so you can send them back to the Chief."
	enforces = "You have control over the lab, a valuable asset in generating profit."
	supervisors = "the Chief"
	selection_color = "#ff915e"
	req_admin_notify = 1
	exp_requirements = 750
	exp_type = EXP_TYPE_KHAN
	outfit = /datum/outfit/job/khan/chemist

	loadout_options = list(
		/datum/outfit/loadout/chemist,
		/datum/outfit/loadout/quack,
		)

//=========================================================== LOADOUT DATUMS ===========================================================

/datum/outfit/job/khan/enforcer
	jobtype = /datum/job/khan/enforcer

/datum/outfit/job/khan/chemist
	jobtype = /datum/job/khan/chemist

//KHAN =================================================================

/datum/outfit/loadout/soldier
	name = "Soldier"
	belt = /obj/item/storage/backpack/spearquiver
	l_hand = /obj/item/shield/riot/tower
	r_hand = /obj/item/melee/onehanded/machete/scrapsabre
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket/coat
	head = /obj/item/clothing/head/helmet/f13/khan
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/book/granter/trait/bigleagues = 1)


//CHEMIST =================================================================

/datum/outfit/loadout/chemist
	name = "Chemist"
	suit = /obj/item/clothing/suit/toggle/labcoat
	belt = /obj/item/storage/belt/bandolier
	backpack_contents = list(
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/book/granter/trait/lowsurgery =1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3)

/datum/outfit/loadout/quack
	name = "Quack Chemist"
	suit = /obj/item/clothing/suit/jacket/leather/overcoat
	glasses = /obj/item/clothing/glasses/sunglasses
	belt = /obj/item/storage/belt/bandolier
	backpack_contents = list(
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/book/granter/trait/explosives =1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3)
