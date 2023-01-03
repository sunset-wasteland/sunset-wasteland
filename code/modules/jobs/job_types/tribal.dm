/*
This entire file is a replacement for the horrible mess that was Tribals in 'wasteland.dm'.
Within this file is the material to turn the previous odd-inclusion into a proper faction.
*/

/datum/job/tribal //do NOT use this for anything, it's just to store faction datums
	selection_color = "#825b73"
	department_flag = TRIBAL
	faction = FACTION_TRIBAL
	exp_type = EXP_TYPE_TRIBAL
	access = list(ACCESS_TRIBE)
	social_faction = "Tribal"
	description = "You're a member of one of many tribes, all brought together in a singular goal after the arrival of the Legion and NCR. Survival. \
	Who you were no longer matters. What you do is prime. Especially so in the newfound faith, that of the machine spirits. Should you follow it. They surround you. \
	Are you worthy of their attention?"
	supervisors = "the stars above"

/datum/outfit/job/tribal/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TRAPPER, src)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)
	ADD_TRAIT(H, TRAIT_AUTO_DRAW, src)
	H.grant_language(/datum/language/tribal)
	var/list/recipes = list(
		/datum/crafting_recipe/tribal_pa,
		/datum/crafting_recipe/tribal_pa_helmet,
		/datum/crafting_recipe/tribal_combat_armor,
		/datum/crafting_recipe/tribal_combat_armor_helmet,
		/datum/crafting_recipe/tribal_r_combat_armor,
		/datum/crafting_recipe/tribal_r_combat_armor_helmet,
		/datum/crafting_recipe/tribalwar/chitinarmor,
		/datum/crafting_recipe/tribalwar/deathclawspear,
		/datum/crafting_recipe/tribalwar/lightcloak,
		/datum/crafting_recipe/tribalwar/legendaryclawcloak,
		/datum/crafting_recipe/warpaint,
		/datum/crafting_recipe/tribalradio,
		/datum/crafting_recipe/tribalwar/goliathcloak,
		/datum/crafting_recipe/tribalwar/bonebow,
		/datum/crafting_recipe/tribalwar/tribe_bow,
		/datum/crafting_recipe/tribalwar/sturdybow,
		/datum/crafting_recipe/tribalwar/warclub,
		/datum/crafting_recipe/tribalwar/silverbow,
		/datum/crafting_recipe/tribalwar/arrowbone,
		/datum/crafting_recipe/tribalwar/bonespear,
		/datum/crafting_recipe/tribalwar/bonecodpiece,
		/datum/crafting_recipe/tribalwar/bracers,
		/datum/crafting_recipe/tribal/bonetalisman,
		/datum/crafting_recipe/tribal/bonebag
	)
	for(var/datum/crafting_recipe/recipe as() in recipes)
		H.mind.teach_crafting_recipe(recipe)
	H.grant_language(/datum/language/tribal)
	H.social_faction = FACTION_WASTELAND
	add_verb(H, /mob/living/proc/create_tribe)

/*
/datum/job/tribal/hunter
	title = "Tribal Hunter"
	flag = F13TRIBAL
	total_positions = -1
	spawn_positions = -1

	outfit = /datum/outfit/job/tribal/hunter

	loadout_options = list(
	/datum/outfit/loadout/wayfarerranged
	)

/datum/outfit/job/tribal/hunter
	name = "Tribal"
	jobtype = /datum/job/tribal/hunter

	id = /obj/item/card/id/tribetattoo
	ears = null
	belt = /obj/item/melee/onehanded/knife/bone
	uniform =     /obj/item/clothing/under/f13/settler
	box =         /obj/item/storage/survivalkit_tribal
	shoes =     /obj/item/clothing/shoes/sandal
	gloves =    /obj/item/clothing/gloves/f13/handwraps
	r_hand = /obj/item/book/granter/trait/selection/tribal
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/flashlight/lantern = 1,
		)

/datum/job/tribal/gatherer
	title = "Tribal Gatherer"
	flag = F13TRIBAL_GATHERER
	exp_type = EXP_TYPE_WASTELAND
	exp_requirements = 300
	total_positions = -1
	spawn_positions = -1
	roleplay_exclusive_notify = 1

	outfit = /datum/outfit/job/tribal/gatherer

	loadout_options = list(
	/datum/outfit/loadout/wayfarermelee
	)

/datum/outfit/job/tribal/gatherer
	name = "Tribal Gatherer"
	jobtype = /datum/job/tribal/gatherer

	id = /obj/item/card/id/tribetattoo
	ears = null
	belt = /obj/item/melee/onehanded/knife/bone
	uniform =     /obj/item/clothing/under/f13/settler
	box =         /obj/item/storage/survivalkit_tribal
	shoes =     /obj/item/clothing/shoes/sandal
	gloves =    /obj/item/clothing/gloves/f13/handwraps
	r_hand = /obj/item/book/granter/trait/selection/tribal
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/flashlight/lantern = 1,
		)


/datum/job/tribal/shaman
	title = "Tribal Shaman"
	flag = F13TRIBAL_SHAMAN
	exp_requirements = 300
	total_positions = 1
	spawn_positions = 1
	roleplay_exclusive_notify = 1

	outfit = /datum/outfit/job/tribal/shaman

	loadout_options = list(
	/datum/outfit/loadout/wayfarershaman
	)

/datum/outfit/job/tribal/shaman
	name = "Tribal Shaman"
	jobtype = /datum/job/tribal/shaman

	id = /obj/item/card/id/tribetattoo
	ears = null
	belt = /obj/item/melee/onehanded/knife/bone
	uniform =     /obj/item/clothing/under/f13/settler
	box =         /obj/item/storage/survivalkit_tribal
	shoes =     /obj/item/clothing/shoes/sandal
	gloves =    /obj/item/clothing/gloves/f13/handwraps
	r_hand = /obj/item/book/granter/trait/selection/tribal
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/flashlight/lantern = 1,
		)

//Wayfarers - NOT. :)
/datum/outfit/loadout/wayfarermelee
	name = "Tribal Warrior"
	suit = /obj/item/clothing/suit/armor/f13/lightcloak
	backpack_contents = list(
		/obj/item/clothing/under/f13/wayfarer = 1,
		/obj/item/clothing/head/helmet/f13/wayfarer/hunter = 1,
		/obj/item/twohanded/spear/bonespear = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		/obj/item/book/granter/crafting_recipe/tribal/all = 1,
	)

/datum/outfit/loadout/wayfarerranged
	name = "Tribal Archer"
	suit = /obj/item/clothing/suit/armor/f13/kit
	head = /obj/item/clothing/head/helmet/f13/wayfarer/antler
	neck = /obj/item/clothing/neck/mantle/brown
	backpack_contents = list(
		/obj/item/gun/ballistic/bow/sturdy = 1,
		/obj/item/storage/belt/tribe_quiver/bone = 1,
		/obj/item/binoculars = 1,
		/obj/item/melee/onehanded/club/warclub = 1,
		/obj/item/book/granter/crafting_recipe/tribal/all = 1,
		)

/datum/outfit/loadout/wayfarershaman
	name = "Tribal Shaman"
	suit = /obj/item/clothing/suit/armor/f13/lightcloak
	backpack_contents = list(
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/reagent_containers/glass/bucket/wood=1,
		/obj/item/warpaint_bowl=1,
		/obj/item/melee/onehanded/knife/ritualdagger = 1,
		/obj/item/stack/medical/gauze/improvised = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/book/granter/crafting_recipe/tribal/all = 1,
	)
*/
/*
------------
Below are the original loadouts and the temporarily used Tribal. Pending rework into the above.
------------
*/


/datum/job/tribal/temp
	title = "Tribal"
	flag = F13TRIBAL
	total_positions = -1
	spawn_positions = -1
	exp_type = EXP_TYPE_WASTELAND
	exp_requirements = 300

	outfit = /datum/outfit/job/tribal/temp

	loadout_options = list(
	/datum/outfit/loadout/brawler,
	/datum/outfit/loadout/spearman,
	/datum/outfit/loadout/shaman,
	/datum/outfit/loadout/wayfarermelee,
	/datum/outfit/loadout/wayfarerranged,
	/datum/outfit/loadout/wayfarershaman,
	/datum/outfit/loadout/whitelegsmelee,
	/datum/outfit/loadout/whitelegsranged,
	/datum/outfit/loadout/whitelegsshaman,
	/datum/outfit/loadout/deadhorsesmelee,
	/datum/outfit/loadout/deadhorsesranged,
	/datum/outfit/loadout/deadhorsesshaman,
	/datum/outfit/loadout/sorrowshunter,
	/datum/outfit/loadout/sorrowsshaman,
	/datum/outfit/loadout/eightiesmelee,
	/datum/outfit/loadout/eightiesranged,
	/datum/outfit/loadout/eightiesshaman,
	/datum/outfit/loadout/rustwalkersscipher,
	/datum/outfit/loadout/rustwalkersscrapper,
	/datum/outfit/loadout/rustwalkersshaman,
	/datum/outfit/loadout/bonedancerexile
	)

/datum/outfit/job/tribal/temp
	name = "Tribal"
	jobtype = /datum/job/tribal/temp

	id = /obj/item/card/id/tribetattoo
	ears = null
	belt = /obj/item/melee/onehanded/knife/bone
	uniform =     /obj/item/clothing/under/f13/settler
	box =         /obj/item/storage/survivalkit_tribal
	shoes =     /obj/item/clothing/shoes/sandal
	gloves =    /obj/item/clothing/gloves/f13/handwraps
	r_hand = /obj/item/book/granter/trait/selection/tribal
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/flashlight/lantern = 1,
		)

//Generic Tribals
/datum/outfit/loadout/brawler
	name = "Tribal Brawler"
	suit = /obj/item/clothing/suit/armor/f13/tribal
	head = /obj/item/clothing/head/helmet/f13/deathskull
	backpack_contents = list(
		/obj/item/twohanded/fireaxe/bmprsword = 1,
		/obj/item/restraints/legcuffs/bola = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/stack/medical/gauze = 1,
		)

/datum/outfit/loadout/spearman
	name = "Tribal Spearman"
	suit = /obj/item/clothing/suit/armored/light/tribalraider
	head = /obj/item/clothing/head/helmet/f13/fiend
	mask = /obj/item/clothing/mask/facewrap
	neck = /obj/item/clothing/neck/mantle/gray
	backpack_contents = list(
		/obj/item/twohanded/spear = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2
		)

/datum/outfit/loadout/shaman
	name = "Tribal Shaman"
	suit = /obj/item/clothing/suit/hooded/cloak/desert
	backpack_contents = list(
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/reagent_containers/glass/bucket/wood=1,
		/obj/item/twohanded/sledgehammer/warmace = 1,
		/obj/item/melee/onehanded/knife/ritualdagger = 1,
		/obj/item/stack/medical/gauze/improvised = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/book/granter/crafting_recipe/tribal = 1,
	)

//Wayfarers
/datum/outfit/loadout/wayfarermelee
	name = "Wayfarer Warrior"
	suit = /obj/item/clothing/suit/armor/f13/lightcloak
	backpack_contents = list(
		/obj/item/clothing/under/f13/wayfarer = 1,
		/obj/item/clothing/head/helmet/f13/wayfarer/hunter = 1,
		/obj/item/twohanded/spear/bonespear = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		/obj/item/book/granter/crafting_recipe/tribal/all = 1,
	)

/datum/outfit/loadout/wayfarerranged
	name = "Wayfarer Archer"
	suit = /obj/item/clothing/suit/armor/f13/kit
	head = /obj/item/clothing/head/helmet/f13/wayfarer/antler
	neck = /obj/item/clothing/neck/mantle/brown
	backpack_contents = list(
		/obj/item/gun/ballistic/bow/sturdy = 1,
		/obj/item/storage/belt/tribe_quiver/bone = 1,
		/obj/item/binoculars = 1,
		/obj/item/melee/onehanded/club/warclub = 1,
		/obj/item/book/granter/crafting_recipe/tribal/all = 1,
		)

/datum/outfit/loadout/wayfarershaman
	name = "Wayfarer Shaman"
	suit = /obj/item/clothing/suit/armor/f13/lightcloak
	backpack_contents = list(
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/reagent_containers/glass/bucket/wood=1,
		/obj/item/warpaint_bowl=1,
		/obj/item/melee/onehanded/knife/ritualdagger = 1,
		/obj/item/stack/medical/gauze/improvised = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/book/granter/crafting_recipe/tribal/all = 1,
	)

//White Legs
/datum/outfit/loadout/whitelegsmelee
	name = "White Legs Bone-Breaker"
	suit = /obj/item/clothing/suit/f13/tribal/light/whitelegs
	backpack_contents = list(
		/obj/item/clothing/under/f13/whitelegs = 1,
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/melee/unarmed/maceglove = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
	)

/datum/outfit/loadout/whitelegsranged
	name = "White Legs Storm-Drummer"
	suit = /obj/item/clothing/suit/f13/tribal/whitelegs
	backpack_contents = list(
		/obj/item/clothing/under/f13/whitelegs = 1,
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/gun/ballistic/automatic/smg/tommygun/whitelegs = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/ammo_box/magazine/tommygunm45/stick = 2
	)

/datum/outfit/loadout/whitelegsshaman
	name = "White Legs Arm-Makers"
	backpack_contents = list(
		/obj/item/clothing/under/f13/whitelegs = 1,
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/twohanded/fireaxe = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/book/granter/crafting_recipe/tribal/whitelegs = 1
	)

//Dead Horses
/datum/outfit/loadout/deadhorsesmelee
	name = "Dead Horses Stalker"
	suit = /obj/item/clothing/suit/f13/tribal/deadhorses
	backpack_contents = list(
		/obj/item/clothing/under/f13/deadhorses = 1,
		/obj/item/clothing/under/f13/female/deadhorses = 1,
		/obj/item/melee/onehanded/club/warclub = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2
	)

/datum/outfit/loadout/deadhorsesranged
	name = "Dead Horses Disciple"
	suit = /obj/item/clothing/suit/f13/tribal/heavy/deadhorses
	backpack_contents = list(
		/obj/item/clothing/under/f13/deadhorses = 1,
		/obj/item/clothing/under/f13/female/deadhorses = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911=1,
		/obj/item/ammo_box/magazine/m45 = 2,
		/obj/item/reagent_containers/pill/patch/healpoultice =2
	)

/datum/outfit/loadout/deadhorsesshaman
	name = "Dead Horses Shaman"
	backpack_contents = list(
		/obj/item/clothing/under/f13/deadhorses = 1,
		/obj/item/clothing/under/f13/female/deadhorses = 1,
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/reagent_containers/glass/bucket/wood=1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/book/granter/crafting_recipe/tribal/deadhorses = 1
	)

//Sorrows
/datum/outfit/loadout/sorrowshunter
	name = "Sorrows Hunter-Guardian"
	suit = /obj/item/clothing/suit/f13/tribal/light/sorrows
	backpack_contents = list(
		/obj/item/clothing/under/f13/sorrows = 1,
		/obj/item/clothing/under/f13/female/sorrows = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/melee/unarmed/yaoguaigauntlet = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/gun/ballistic/bow = 1,
		/obj/item/storage/belt/tribe_quiver = 1,
		/obj/item/book/granter/crafting_recipe/tribal/sorrows = 1
	)

/datum/outfit/loadout/sorrowsshaman
	name = "Sorrows Ink-Shaman"
	backpack_contents = list(
		/obj/item/clothing/under/f13/sorrows = 1,
		/obj/item/clothing/under/f13/female/sorrows = 1,
		/obj/item/storage/bag/plants = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket/wood = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/melee/unarmed/yaoguaigauntlet = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/toy/crayon/spraycan = 2,
		/obj/item/book/granter/trait/tagger = 1,
		/obj/item/book/granter/crafting_recipe/tribal/sorrows = 1
	)

//Eighties
/datum/outfit/loadout/eightiesmelee
	name = "Eighties Path-Maker"
	suit = /obj/item/clothing/suit/f13/tribal/eighties
	backpack_contents = list(
		/obj/item/clothing/under/f13/eighties = 1,
		/obj/item/clothing/under/f13/female/eighties = 1,
		/obj/item/gun/ballistic/shotgun/trench = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/pill/patch/turbo = 2,
		/obj/item/reagent_containers/pill/patch/jet = 2
	)

/datum/outfit/loadout/eightiesranged
	name = "Eighties Road-Warrior"
	suit = /obj/item/clothing/suit/f13/tribal/heavy/eighties
	backpack_contents = list(
		/obj/item/clothing/under/f13/eighties = 1,
		/obj/item/clothing/under/f13/female/eighties = 1,
		/obj/item/gun/ballistic/revolver/single_shotgun = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/gun/ballistic/automatic/smg/greasegun/worn = 1,
		/obj/item/ammo_box/magazine/greasegun = 2,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2
	)

/datum/outfit/loadout/eightiesshaman
	name = "Eighties Lay-Mechanic"
	suit = /obj/item/clothing/suit/f13/tribal/light/eighties
	backpack_contents = list(
		/obj/item/clothing/under/f13/eighties = 1,
		/obj/item/clothing/under/f13/female/eighties = 1,
		/obj/item/gun/ballistic/revolver/single_shotgun = 1,
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/book/granter/crafting_recipe/tribal/eighties = 1
	)

//Rustwalkers
/datum/outfit/loadout/rustwalkersscipher
	name = "Rustwalkers Scipher"
	suit = /obj/item/clothing/suit/f13/tribal/rustwalkers
	backpack_contents = list(
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/ammo_box/magazine/autopipe = 2,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/circular_saw = 1
	)

/datum/outfit/loadout/rustwalkersscrapper
	name = "Rustwalkers Scrapper"
	suit = /obj/item/clothing/suit/f13/tribal/light/rustwalkers
	backpack_contents = list(
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/gun/ballistic/revolver/hobo/pepperbox = 1,
		/obj/item/ammo_box/c10mm = 1,
		/obj/item/circular_saw = 1,
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
	)

/datum/outfit/loadout/rustwalkersshaman
	name = "Rustwalkers Brain-Jack"
	backpack_contents = list(
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/gun/ballistic/revolver/hobo/knucklegun = 1,
		/obj/item/ammo_box/c45rev = 2,
		/obj/item/circular_saw = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2,
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/book/granter/crafting_recipe/tribal/rustwalkers = 1

	)
//Bone Dancer
/datum/outfit/loadout/bonedancerexile
	name = "Bone Dancer Exile"
	backpack_contents = list(
		/obj/item/clothing/under/f13/bone = 1,
		/obj/item/clothing/head/helmet/skull/bone = 1,
		/obj/item/book/granter/crafting_recipe/tribal/bone = 1,
		/obj/item/twohanded/spear/bonespear = 1,
		/obj/item/warpaint_bowl=1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 2

	)
