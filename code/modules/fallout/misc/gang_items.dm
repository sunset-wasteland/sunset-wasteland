/datum/gang_item
	var/name
	var/item_path
	var/cost
	var/spawn_msg
	var/category
	var/id

/datum/gang_item/proc/purchase(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool, check_canbuy = TRUE)
	if(check_canbuy && !can_buy(user, gang, gangtool))
		return FALSE
	var/real_cost = get_cost(user, gang, gangtool)
	gang.influence -= real_cost
	spawn_item(user, gang, gangtool)
	return TRUE

/datum/gang_item/proc/spawn_item(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	if(item_path)
		var/obj/item/O = new item_path(user.loc)
		user.put_in_hands(O)
	if(spawn_msg)
		to_chat(user, spawn_msg)

/datum/gang_item/proc/can_buy(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return gang && (gang.influence >= get_cost(user, gang, gangtool))

/datum/gang_item/proc/get_cost(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return cost

/datum/gang_item/proc/get_cost_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return "([get_cost(user, gang, gangtool)] Influence)"

/datum/gang_item/proc/get_name_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return name

/datum/gang_item/proc/get_extra_info(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return

///////////////////
//FUNCTIONS
///////////////////

/datum/gang_item/function
	category = "Gangtool Functions:"
	cost = 0

/datum/gang_item/function/get_cost_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return ""


///////////////////
//CLOTHING
///////////////////

/datum/gang_item/clothing
	category = "Purchase Clothes:"

// ---------------------------
//Great Khans stuff was moved into PAPA in there khamp

//Raider gangs

/datum/gang_item/clothing/prostitute_dress
	name = "Prostitute dress"
	id = "prostitute_dress"
	cost = 10
	item_path = /obj/item/clothing/under/f13/female/flapper

/datum/gang_item/clothing/hat
	name = "Pimp Hat"
	id = "hat"
	cost = 20
	item_path = /obj/item/clothing/head/collectable/petehat/gang

/obj/item/clothing/head/collectable/petehat/gang
	name = "pimpin' hat"
	desc = "The undisputed king of style."

/datum/gang_item/clothing/glasses/sunglasses
	name = "Sunglasses"
	id = "sunglasses"
	cost = 30
	item_path = /obj/item/clothing/glasses/sunglasses

/datum/gang_item/clothing/raider_uniform
	name = "Raider uniform"
	id = "raider_uniform"
	cost = 10
	item_path = /obj/item/clothing/under/f13/raider_leather

/datum/gang_item/clothing/jester_uniform
	name = "Jester suit"
	id = "jester_uniform"
	cost = 20
	item_path = /obj/item/clothing/under/jester

/datum/gang_item/clothing/biker_uniform
	name = "Biker uniform"
	id = "biker_uniform"
	cost = 20
	item_path = /obj/item/clothing/under/f13/Retro_Biker_Vest

/datum/gang_item/clothing/scarecrow_uniform
	name = "Scarecrow uniform"
	id = "scarecrow_uniform"
	cost = 10
	item_path = /obj/item/clothing/under/scarecrow

/datum/gang_item/clothing/soviet_uniform
	name = "Soviet uniform"
	id = "soviet_uniform"
	cost = 10
	item_path = /obj/item/clothing/under/soviet

/datum/gang_item/clothing/chairmen_uniform
	name = "Chairmen uniform"
	id = "chairmen_uniform"
	cost = 10
	item_path = /obj/item/clothing/under/f13/bennys/gang

/obj/item/clothing/under/f13/bennys/gang
	name = "Chairmen uniform"
	desc = "A black and white buffalo plaid suit, most often seen on the Chairmen."

///////////////////
//WEAPONS
///////////////////

/datum/gang_item/weapon
	category = "Purchase Weapons:"

/datum/gang_item/weapon/ammo

/datum/gang_item/weapon/ammo/get_cost_display(mob/living/carbon/user, datum/gang/gang, obj/item/device/gangtool/gangtool)
	return "&nbsp;&#8627;" + ..() //this is pretty hacky but it looks nice on the popup

/datum/gang_item/weapon/shuriken
	name = "Shuriken"
	id = "shuriken"
	cost = 10
	item_path = /obj/item/throwing_star

/datum/gang_item/weapon/switchblade
	name = "Switchblade"
	id = "switchblade"
	cost = 20
	item_path = /obj/item/melee/onehanded/knife/switchblade

/datum/gang_item/weapon/brass
	name = "Brass knuckles"
	id = "brassknuckles"
	cost = 20
	item_path = /obj/item/melee/unarmed/brass

/datum/gang_item/weapon/spikedbaseball
	name = "Spiked baseball bat"
	id = "spikedbaseball"
	cost = 20
	item_path = /obj/item/twohanded/baseball/spiked

/datum/gang_item/weapon/slugger
	name = "Louiseville Slugger"
	id = "slugger"
	cost = 40
	item_path = /obj/item/twohanded/baseball/louisville

/datum/gang_item/weapon/sappers
	name = "Sappers"
	id = "sappers"
	cost = 35
	item_path = /obj/item/melee/unarmed/sappers

/datum/gang_item/weapon/greasegun
	name = "Grease Gun"
	id = "greasegun"
	cost = 120
	item_path = /obj/effect/spawner/bundle/f13/greasegun

/datum/gang_item/weapon/uzi
	name = "Uzi"
	id = "uzi"
	cost = 300
	item_path = /obj/effect/spawner/bundle/f13/miniuzi

/datum/gang_item/weapon/type17
	name = "Type 17 Pistol"
	id = "type17"
	cost = 50
	item_path = /obj/item/storage/box/bundletype17kit

/obj/item/storage/box/bundletype17kit
	name = "Type 17 kit"
	desc = "Imported but still great."

/obj/item/storage/box/bundletype17kit/PopulateContents()
	new /obj/item/ammo_box/magazine/m10mm_adv/simple(src)
	new /obj/item/gun/ballistic/automatic/pistol/type17(src)

/datum/gang_item/weapon/ninemil
	name = "9mm Pistol"
	id = "gangninemil"
	cost = 80
	item_path = /obj/effect/spawner/bundle/f13/ninemil

/datum/gang_item/weapon/caravan
	name = "Caravan Shotgun"
	id = "caravanshotgun"
	cost = 110
	item_path = /obj/effect/spawner/bundle/f13/caravan_shotgun

/datum/gang_item/weapon/varmint
	name = "Varmint"
	id = "varmints"
	cost = 110
	item_path = /obj/effect/spawner/bundle/f13/varmint

/datum/gang_item/weapon/type93
	name = "Worn Type 93"
	id = "worntype93"
	cost = 250
	item_path = /obj/item/storage/box/bundletype93kit

/obj/item/storage/box/bundletype93kit
	name = "type 93 kit"
	desc = "Rule the wasteland, one bullet at a time."

/obj/item/storage/box/bundletype93kit/PopulateContents()
	new /obj/item/gun/ballistic/automatic/type93/worn(src)
	new /obj/item/ammo_box/magazine/m556/rifle(src)

/datum/gang_item/weapon/energylow
	name = "Unknown Energy Gun"
	id = "gangenergygun"
	cost = 200
	item_path = /obj/effect/spawner/lootdrop/f13/weapon/gun/energy/low

/datum/gang_item/weapon/gunsuperlow
	name = "Unknown Ballistic Gun"
	id = "gangshitbalisticgun"
	cost = 90
	item_path = /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/superlow

/datum/gang_item/weapon/gunlow
	name = "Unknown Good Ballistic Gun"
	id = "ganggoodbalisticgun"
	cost = 140
	item_path = /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/gang/low

/datum/gang_item/weapon/gunmid
	name = "Unknown AWESOME Ballistic Gun"
	id = "gangawesomebalisticgun"
	cost = 180
	item_path = /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/gang/lowmid

/datum/gang_item/weapon/gunawesome
	name = "Unknown EXTREMELY AWESOME Ballistic Gun"
	id = "gangextremeawesomebalisticgun"
	cost = 280
	item_path = /obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/gang/mid

/datum/gang_item/weapon/melekit
	name = "Unknown Melee Weapon"
	id = "gangmelee"
	cost = 140
	item_path = /obj/effect/spawner/lootdrop/f13/weapon/melee/tier3

///////////////////
//EQUIPMENT
///////////////////

/datum/gang_item/equipment
	category = "Purchase Equipment:"

/datum/gang_item/equipment/spraycan
	name = "Spraycan"
	id = "spraycan"
	cost = 5
	item_path = /obj/item/toy/crayon/spraycan

/datum/gang_item/equipment/mentats
	name = "Mentats"
	id = "mentats"
	cost = 90
	item_path = /obj/item/storage/pill_bottle/chem_tin/mentats

/datum/gang_item/equipment/fixer
	name = "Fixer"
	id = "fixer"
	cost = 90
	item_path = /obj/item/storage/pill_bottle/chem_tin/fixer

/datum/gang_item/equipment/stimpak
	name = "Stimpak"
	id = "stimpake"
	cost = 95
	item_path = /obj/item/reagent_containers/hypospray/medipen/stimpak

/datum/gang_item/equipment/healingpowder
	name = "Healing Powder"
	id = "healingpowder"
	cost = 55
	item_path = /obj/item/reagent_containers/pill/patch/healingpowder

/datum/gang_item/equipment/emp
	name = "EMP Grenade"
	id = "EMP"
	cost = 135
	item_path = /obj/item/grenade/empgrenade

/datum/gang_item/equipment/necklace
	name = "Gold Necklace"
	id = "necklace"
	cost = 70
	item_path = /obj/item/clothing/neck/necklace/dope

/datum/gang_item/equipment/c4
	name = "C4 Explosive"
	id = "c4"
	cost = 150
	item_path = /obj/item/grenade/plastic/c4

/datum/gang_item/equipment/stinger
	name = "Stinger"
	id = "stingers"
	cost = 100
	item_path = /obj/item/grenade/f13/stinger

/datum/gang_item/equipment/molotov
	name = "Firebomb"
	id = "Molotovg"
	cost = 70
	item_path = /obj/item/grenade/homemade/firebomb

/datum/gang_item/equipment/dynamite
	name = "Dynamite Stick"
	id = "dynamitegrenade"
	cost = 150
	item_path = /obj/item/grenade/f13/dynamite

/datum/gang_item/equipment/he
	name = "Frag Grenade"
	id = "hegrenade"
	cost = 130
	item_path = /obj/item/grenade/f13/frag


///////////////////
//EQUIPMENT
///////////////////

/datum/gang_item/equipment/chemmakingkit
	name = "Chem Machine Bundle"
	id = "Chemmakingmachine"
	cost = 655
	item_path = /obj/item/storage/box/chemmachine

/obj/item/storage/box/chemmachine
	name = "chem machine bundle"
	desc = "You made a bomb, blew up a village, and still, you kept making the machines..."

/obj/item/storage/box/chemmachine/PopulateContents()
	new /obj/item/circuitboard/machine/chem_dispenser(src)
	new /obj/item/circuitboard/machine/chem_master(src)
	new /obj/item/circuitboard/machine/chem_heater(src)

///////////////////
//BUNDLES
///////////////////

/datum/gang_item/equipment/bundledenboss
	name = "Drug Lord Bundle"
	id = "bundledenboss"
	cost = 420
	item_path = /obj/item/storage/box/bundledenboss

/obj/item/storage/box/bundledenboss
	name = "Drug Lord Bundle"
	desc = "Rule the underworld like the Den Mob of old."

/obj/item/storage/box/bundledenboss/PopulateContents()
	new /obj/item/gun/ballistic/automatic/type93/worn(src)
	new /obj/item/reagent_containers/hypospray/medipen/medx(src)
	new /obj/item/reagent_containers/hypospray/medipen/medx(src)
	new /obj/item/reagent_containers/hypospray/medipen/medx(src)
	new /obj/item/reagent_containers/hypospray/medipen/psycho(src)
	new /obj/item/reagent_containers/hypospray/medipen/psycho(src)
	new /obj/item/clothing/under/f13/densuit(src)

/datum/gang_item/equipment/bundleanarchist
	name = "Mad Bomber Bundle"
	id = "bundleanarchist"
	cost = 550
	item_path = /obj/item/storage/box/bundleanarchist

/obj/item/storage/box/bundleanarchist
	name = "Mad Bomber Bundle"
	desc = "Come on feel the noise. The noise of explosions, specifically."

/obj/item/storage/box/bundleanarchist/PopulateContents()
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/plastic/c4(src)
	new /obj/item/grenade/plastic/c4(src)
	new /obj/item/grenade/syndieminibomb/concussion(src)
	new /obj/item/clothing/suit/bomb_suit(src)

/datum/gang_item/equipment/bundleboss
	name = "Big Boss"
	id = "bundleboss"
	cost = 1200
	item_path = /obj/item/storage/box/bundleboss

/obj/item/storage/box/bundleboss
	name = "Big Boss"
	desc = "For the Biggest Outlaw around"

/obj/item/storage/box/bundleboss/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/medx(src)
	new /obj/item/reagent_containers/hypospray/medipen/psycho(src)
	new /obj/item/clothing/suit/armored/heavy/salvaged_pa/t45b/raider(src)
	new /obj/item/gun/ballistic/shotgun/automatic/combat/citykiller(src)
	new /obj/item/clothing/head/helmet/f13/heavy/salvaged_pa/t45b/raider(src)
	new /obj/item/ammo_box/shotgun/slug(src)


/datum/gang_item/equipment/bundlegunner
	name = "Old Soldier Bundle"
	id = "bundlegunner"
	cost = 350
	item_path = /obj/item/storage/box/bundlegunner

/obj/item/storage/box/bundlegunner
	name = "Old Soldier Bundle"
	desc = "This wasteland needs a classier kind of raider. Back in my day, we walked uphill both ways to find some victims. "

/obj/item/storage/box/bundlegunner/PopulateContents()
	new /obj/item/gun/ballistic/automatic/smg/greasegun(src)
	new /obj/item/ammo_box/magazine/greasegun(src)
	new /obj/item/clothing/head/helmet/armyhelmet(src)
	new /obj/item/storage/belt(src)
	new /obj/item/clothing/under/f13/army(src)
	new /obj/item/gun/ballistic/automatic/pistol/m1911(src)
	new /obj/item/grenade/frag(src)

/datum/gang_item/equipment/bundleelguapo
	name = "Bandito Bundle"
	id = "bundleelguapo"
	cost = 350
	item_path = /obj/item/storage/box/bundleelguapo

/obj/item/storage/box/bundleelguapo
	name = "Bandito Bundle"
	desc = "You burned the Village, raped the horses, and rode off on their women. It was a long time ago, so the details got mixed up, but you get the point. "

/obj/item/storage/box/bundleelguapo/PopulateContents()
	new /obj/item/gun/ballistic/rifle/repeater/cowboy(src)
	new /obj/item/ammo_box/a357box/ricochet(src)
	new /obj/item/gun/ballistic/revolver/colt357(src)
	new /obj/item/clothing/head/f13/ranger_hat(src)
	new /obj/item/clothing/suit/armor/f13/leather_jacket/combat/coat(src)

/obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/gang/low
	name = "low tier gang ballistic gun"
	loot = list(/obj/effect/spawner/bundle/f13/thatgun,
				/obj/effect/spawner/bundle/f13/huntingshotgun,
				/obj/effect/spawner/bundle/f13/m1carbine,
				)

/obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/gang/lowmid
	name = "low-mid gang tier ballistic gun"
	loot = list(/obj/effect/spawner/bundle/f13/cowboy,
				/obj/effect/spawner/bundle/f13/trenchshotgun,
				/obj/effect/spawner/bundle/f13/m1carbine,
				/obj/effect/spawner/bundle/f13/huntingshotgun,
		)

/obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/gang/mid
	name = "mid tier ballistic gun"
	loot = list(/obj/effect/spawner/bundle/f13/trail,
				/obj/effect/spawner/bundle/f13/service,
				/obj/effect/spawner/bundle/f13/miniuzi,
				/obj/effect/spawner/bundle/f13/auto5,
				/obj/effect/spawner/bundle/f13/marksman,
				/obj/effect/spawner/bundle/f13/m1garand,
				)
