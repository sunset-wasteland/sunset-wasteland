/*
This entire file is a replacement for the horrible mess that was 'Outlaws' in 'wasteland.dm'.
Within this file is the material to turn the previous odd-inclusion into a proper faction.
*/

/datum/job/raider //do NOT use this for anything, it's just to store faction datums
	selection_color = "#db3529"
	department_flag = RAIDER
	faction = FACTION_RAIDERS
	access = list(ACCESS_RAIDER)
	minimal_access = list(ACCESS_RAIDER)
	exp_requirements = 300
	exp_type = EXP_TYPE_OUTLAW

/datum/job/raider/f13raider
	title = "Raider"
	flag = F13RAIDER
	faction = FACTION_RAIDERS
	social_faction = FACTION_RAIDERS
	exp_requirements = 300
	exp_type = EXP_TYPE_FALLOUT
	total_positions = -1
	spawn_positions = -1
	description = "You are an undesirable figure of some kind- perhaps a corrupt official, or a cannibalistic bartender, or a devious conman, to name a few examples. \
	You have more freedom than anyone else in the wastes. \
	You're not held by the same moral code as others, but though you may only be interested in self-gain, you still have a responsibility to make your time here interesting. \
	(Adminhelp if you require help setting up your character for the round.)"
	supervisors = "The Captain"

	outfit = /datum/outfit/job/raider/f13raider

	matchmaking_allowed = list(
		/datum/matchmaking_pref/patron = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/raider/f13raider,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/raider_supafly,
	/datum/outfit/loadout/raider_yankee,
	/datum/outfit/loadout/raider_blast,
	/datum/outfit/loadout/raider_sadist,
	/datum/outfit/loadout/raider_painspike,
	/datum/outfit/loadout/raider_badlands,
	/datum/outfit/loadout/raider_smith,
	/datum/outfit/loadout/quack_doctor
	)


/datum/outfit/job/raider/f13raider/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/f13/mercc, \
		/obj/item/clothing/under/f13/cowboyb, \
		/obj/item/clothing/under/f13/cowboyg, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/raider/supafly,\
		/obj/item/clothing/suit/armor/f13/raider/yankee, \
		/obj/item/clothing/suit/armor/f13/raider/sadist, \
		/obj/item/clothing/suit/armor/f13/raider/blastmaster, \
		/obj/item/clothing/suit/armor/f13/raider/badlands, \
		/obj/item/clothing/suit/armor/f13/raider/painspike)
	if(prob(10))
		mask = pick(
			/obj/item/clothing/mask/bandana/red,\
			/obj/item/clothing/mask/bandana/blue,\
			/obj/item/clothing/mask/bandana/green,\
			/obj/item/clothing/mask/bandana/gold,\
			/obj/item/clothing/mask/bandana/black,\
			/obj/item/clothing/mask/bandana/skull)
	head = pick(
		/obj/item/clothing/head/sombrero,\
		/obj/item/clothing/head/helmet/f13/raider,\
		/obj/item/clothing/head/helmet/f13/raider/eyebot,\
		/obj/item/clothing/head/helmet/f13/raider/arclight,\
		/obj/item/clothing/head/helmet/f13/raider/blastmaster,\
		/obj/item/clothing/head/helmet/f13/raider/yankee,\
		/obj/item/clothing/head/helmet/f13/raider/psychotic,\
		/obj/item/clothing/head/helmet/f13/fiend)
	shoes = pick(
			/obj/item/clothing/shoes/jackboots,\
			/obj/item/clothing/shoes/f13/raidertreads)

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/detective, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil,\
		/obj/item/gun/ballistic/automatic/pistol/m1911, \
		/obj/item/gun/ballistic/automatic/pistol/type17, \
		)


/datum/outfit/job/raider/f13raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LONGPORKLOVER, src)

	H.social_faction = FACTION_RAIDERS

/datum/outfit/job/raider/f13raider
	name = "Raider"
	jobtype = /datum/job/raider/f13raider

	id = /obj/item/card/id/raider_tags
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/handwraps
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/onehanded/club = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/bag/money/small/raider = 1,
		)

/datum/outfit/loadout/raider_supafly
	name = "Supa-fly"
	suit = /obj/item/clothing/suit/armor/f13/raider/supafly
	head = /obj/item/clothing/head/helmet/f13/raider/supafly
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/varmint = 1,
		/obj/item/ammo_box/magazine/m556/rifle/assault = 1,
		/obj/item/gun/ballistic/revolver/hobo/knucklegun = 1,
		/obj/item/ammo_box/c45rev = 2,
		/obj/item/attachments/scope = 1,
		/obj/item/reagent_containers/food/drinks/bottle/f13nukacola/radioactive = 1,
		/obj/item/grenade/smokebomb = 2,
		/obj/item/book/granter/trait/trekking = 1
		)

/datum/outfit/loadout/raider_yankee
	name = "Yankee"
	suit = /obj/item/clothing/suit/armor/f13/raider/yankee
	head = /obj/item/clothing/head/helmet/f13/raider/yankee
	backpack_contents = list(
		/obj/item/shishkebabpack = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis=1,
		/obj/item/megaphone=1,
		/obj/item/storage/pill_bottle/chem_tin/buffout = 1)

/datum/outfit/loadout/raider_blast
	name = "Blastmaster"
	suit = /obj/item/clothing/suit/armor/f13/raider/blastmaster
	head = /obj/item/clothing/head/helmet/f13/raider/blastmaster
	backpack_contents = list(
		/obj/item/kitchen/knife/butcher = 1,
		/obj/item/grenade/homemade/firebomb = 4,
		/obj/item/bottlecap_mine = 1,
		/obj/item/grenade/homemade/coffeepotbomb = 4,
		/obj/item/book/granter/crafting_recipe/blueprint/trapper = 1,
		/obj/item/book/granter/trait/explosives = 1
		)

/datum/outfit/loadout/raider_sadist
	name = "Sadist"
	suit = /obj/item/clothing/suit/armor/f13/raider/sadist
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/throwing = 5,
		/obj/item/clothing/mask/gas/explorer/folded=1,
		/obj/item/storage/belt = 1,
		/obj/item/restraints/legcuffs/beartrap = 2,
		/obj/item/reverse_bear_trap = 1,
		/obj/item/melee/unarmed/lacerator = 1,
		/obj/item/book/granter/trait/trekking = 1)

/datum/outfit/loadout/raider_badlands
	name = "Fiend"
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	head = /obj/item/clothing/head/helmet/f13/fiend
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz/magneto = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 3,
		/obj/item/reagent_containers/pill/patch/turbo = 2,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/book/granter/trait/bigleagues = 1)


/datum/outfit/loadout/raider_painspike
	name = "Painspike"
	suit = /obj/item/clothing/suit/armor/f13/raider/painspike
	head = /obj/item/clothing/head/helmet/f13/raider/psychotic
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/melee/onehanded/club/fryingpan = 1,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		)

/datum/outfit/loadout/quack_doctor
	name = "Quack Doctor"
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/followers
	l_hand = /obj/item/storage/backpack/duffelbag/med/surgery
	r_hand = /obj/item/book/granter/trait/midsurgery
	suit_store = /obj/item/gun/energy/laser/wattz
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec=1,
		/obj/item/reagent_containers/pill/patch/jet = 3,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/storage/pill_bottle/aranesp = 1,
		/obj/item/storage/pill_bottle/happy = 1,
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/stack/sheet/mineral/silver=2,
		/obj/item/defibrillator/primitive=1,
		)

/datum/outfit/loadout/raider_smith
	name = "Raider Smith"
	suit = /obj/item/clothing/suit/armored/heavy/raidermetal
	uniform = /obj/item/clothing/under/f13/raider_leather
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911/custom = 1,
		/obj/item/ammo_box/magazine/m45 = 1,
		/obj/item/twohanded/steelsaw = 1,
		/obj/item/melee/smith/hammer = 1,
		/obj/item/stack/sheet/mineral/sandstone = 50,
		/obj/item/book/granter/trait/techno = 1,
		/obj/item/book/granter/crafting_recipe/scav_one = 1,
		)


/datum/job/raider/outsiders
	title = "Outsider"
	flag = F13RAIDER_OUTSIDER
	faction = FACTION_RAIDERS
	social_faction = FACTION_RAIDERS
	exp_requirements = 60
	exp_type = EXP_TYPE_OUTLAW
	total_positions = -1
	spawn_positions = -1
	description = "You're an outcast. Someone even the lowest of the low hates. \
	You have more freedom than anyone else in the wastes. \
	You're not held by the same moral code as others, but though you may only be interested in self-gain, you still have a responsibility to make your time here interesting. \
	(Adminhelp if you require help setting up your character for the round.)"
	supervisors = "Your desire to make things interesting and fun"

	matchmaking_allowed = list(
		/datum/matchmaking_pref/patron = list(
			/datum/job/raider/outsiders,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/raider/outsiders,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/raider/outsiders,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/raider/outsiders,
		),
	)

	loadout_options = list(
	/datum/outfit/loadout/raider_vault,
	/datum/outfit/loadout/raider_ncr,
	/datum/outfit/loadout/raider_legion,
	/datum/outfit/loadout/raider_bos,
	/datum/outfit/loadout/raider_enclave,
	/datum/outfit/loadout/raider_highway,
	)

/datum/outfit/job/raider/outsiders
	name = "Outsider"
	jobtype = /datum/job/raider/outsiders

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/onehanded/club = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/bag/money/small/raider = 1,
		)

/datum/outfit/loadout/raider_highway
	name = "Highwayman"
	uniform = /obj/item/clothing/under/f13/combat
	shoes = /obj/item/clothing/shoes/f13/cowboy
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357=1,
		/obj/item/ammo_box/a357=2, \
		/obj/item/binoculars=1,
		/obj/item/radio=1,
		/obj/item/weapon/maptool=1)

/datum/outfit/loadout/raider_vault
	name = "Vault Renegade"
	suit = /obj/item/clothing/suit/armor/vest/big
	uniform = /obj/item/clothing/under/f13/exile/vault
	id = /obj/item/card/id/rusted/fadedvaultid
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/smg10mm = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 3,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/imitation = 2,
		)

/datum/outfit/loadout/raider_enclave
	name = "Enclave Remnant"
	suit = /obj/item/clothing/suit/armor/f13/combat/mk2/remnant
	head = /obj/item/clothing/head/helmet/f13/combat/mk2/remnant
	id = /obj/item/card/id/rusted/brokenholodog/enclave
	backpack_contents = list(
		/obj/item/clothing/under/f13/exile/enclave = 1,
		/obj/item/clothing/mask/gas/enclave = 1,
		/obj/item/gun/energy/laser/plasma/pistol/remnant=1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/book/granter/crafting_recipe/blueprint/plasmapistol_rem = 1,
		/obj/item/grenade/f13/plasma/remnant = 2,
		)

/datum/outfit/loadout/raider_bos
	name = "Brotherhood Outcast"
	suit = /obj/item/clothing/suit/armor/f13/combat/brotherhood/outcast
	head = /obj/item/clothing/head/helmet/f13/combat/brotherhood/outcast
	id = /obj/item/card/id/rusted/brokenholodog
	backpack_contents = list(
		/obj/item/clothing/under/f13/recon/outcast = 1,
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/grenade/f13/frag = 2,
		)

/datum/outfit/loadout/raider_ncr
	name = "NCR Deserter"
	suit = /obj/item/clothing/suit/armor/f13/exile/ncrexile
	uniform = /obj/item/clothing/under/f13/exile
	id = /obj/item/card/id/rusted
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/service = 1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/storage/box/ration/ranger_breakfast = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/r82 = 1)

/datum/outfit/loadout/raider_legion
	name = "Disgraced Legionnaire"
	suit = /obj/item/clothing/suit/armor/f13/exile/legexile
	uniform = /obj/item/clothing/under/f13/exile/legion
	id = /obj/item/card/id/rusted/rustedmedallion
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/gun/ballistic/automatic/smg/greasegun = 1,
		/obj/item/ammo_box/magazine/greasegun = 1,
		/obj/item/book/granter/trait/trekking = 1
		)

/datum/job/raider/raider_captain
	title = "Raider Captain"
	flag = F13RAIDER_BOSS
	faction = FACTION_RAIDERS
	social_faction = FACTION_RAIDERS
	exp_requirements = 600
	exp_type = EXP_TYPE_OUTLAW
	total_positions = 1
	spawn_positions = 1
	description = "You're one of the most powerful figures in Wyoming. With a band of drug-addled psychopaths at your beck and call? \
	There's nothing to stand in your way. \
	Assure your thugs remain loyal, find new ways to terrorise the locals and retain your control. \
	(Adminhelp if you require help setting up your character for the round.)"
	supervisors = "Your desire to make things interesting and fun"

	outfit = /datum/outfit/job/raider/raider_captain

	access = list(ACCESS_RAIDER, ACCESS_RAIDER_BOSS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/patron = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/raider/f13raider,
		),
	)

/datum/outfit/job/raider/raider_captain
	name = "Raider Captain"
	jobtype = /datum/job/raider/raider_captain
	id = /obj/item/card/id/boss_raider_tags

	belt = 		null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

	ears = 			null
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	neck =			/obj/item/storage/belt/holster/regulator// :)
	mask = 			/obj/item/clothing/mask/bandana/skull
	r_hand = 		/obj/item/clothing/suit/armor/f13/power_armor/t45d/raider
	l_hand = 		/obj/item/clothing/head/helmet/f13/power_armor/t45d/raider
	glasses =		/obj/item/clothing/glasses/sunglasses
	l_pocket =		/obj/item/storage/bag/money/small/mayor//Shouldn't be doing anything but paying his boys and buying gear. Change if abused. - Carl
	r_pocket = 		null

	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/melee/classic_baton=1,
		/obj/item/melee/onehanded/knife/survival = 1)

/datum/outfit/job/raider/raider_captain/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
	add_verb(H, /mob/living/proc/creategang)
	H.social_faction = FACTION_RAIDERS//Probably not needed twice, but may as well.
