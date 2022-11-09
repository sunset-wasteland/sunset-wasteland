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

/datum/job/khan/senior_enforcer
	title = "Khan Senior Enforcer"
	flag = F13KHANSEN
	faction = FACTION_KHAN
	total_positions = 1
	spawn_positions = 1
	description = "You are a Khan, atop being the senior of all within this camp. Maintain some manner of control and assure the Chemist doesn't blow their hands off."
	supervisors = "the Senior Enforcer"
	selection_color = "#ff915e"
	exp_requirements = 320
	exp_type = EXP_TYPE_KHAN
	outfit = /datum/outfit/job/khan/senior_enforcer

	loadout_options = list(
		/datum/outfit/loadout/senior,
		)

/datum/job/khan/enforcer
	title = "Khan Enforcer"
	flag = F13KHAN
	faction = FACTION_KHAN
	total_positions = 6
	spawn_positions = 6
	description = "You are a Khan, a member of the local band that the Chief has sent to scout these lands. Listen to the Chemist and Senior Enforcer. Assure you've a steady supply of caps for the Chief."
	supervisors = "the Senior Enforcer"
	selection_color = "#ff915e"
	exp_requirements = 240
	exp_type = EXP_TYPE_WASTELAND
	outfit = /datum/outfit/job/khan/enforcer

	loadout_options = list(
		/datum/outfit/loadout/soldier,
		/datum/outfit/loadout/soldierb,
		)

/datum/job/khan/chemist
	title = "Khan Chemist"
	flag = F13KHANCHEMIST
	faction = FACTION_KHAN
	total_positions = 2
	spawn_positions = 2
	description = "You are a Chemist, one of the few Khans present in this camp that can produce those sweet, sweet chems. Keep them flowing and assure a supply of caps, so you can send them back to the Chief."
	enforces = "You have control over the lab, a valuable asset in generating profit."
	supervisors = "the Senior Enforcer"
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

/datum/outfit/job/khan/senior_enforcer
	jobtype = /datum/job/khan/senior_enforcer

//KHAN =================================================================

/datum/outfit/loadout/soldier
	name = "Heavy Enforcer"
	belt = /obj/item/storage/backpack/spearquiver
	l_hand = /obj/item/shield/riot/buckler/stop
	r_hand = /obj/item/melee/onehanded/machete/scrapsabre/khan
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket/armored
	head = /obj/item/clothing/head/helmet/f13/khan
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/book/granter/trait/bigleagues = 1)

/datum/outfit/loadout/soldierb
	name = "Light Enforcer"
	belt = /obj/item/storage/belt/bandolier
	r_hand = /obj/item/gun/ballistic/automatic/marksman/khans
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket/armored
	head = /obj/item/clothing/head/helmet/f13/khan/bandana
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle = 3,
		/obj/item/book/granter/trait/trekking = 1)

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

//SENIOR =================================================================

/datum/outfit/loadout/senior
	name = "True Enforcer"
	belt = /obj/item/storage/belt/bandolier
	r_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/neostead
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket/coat
	head = /obj/item/clothing/head/helmet/f13/khan/fullhelm
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/trainshot = 3,
		/obj/item/storage/box/medicine/stimpaks/stimpaks5 = 1,
		/obj/item/stack/f13Cash/caps/onezerozerozero = 3)//LOTS of caps.

/datum/outfit/job/khan/senior_enforcer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)
