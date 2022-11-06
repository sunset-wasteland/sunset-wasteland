
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Security ////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/security
	group = "Security"
	crate_type = /obj/structure/closet/crate/secure/gear
	can_private_buy = FALSE

//fallout changes

/datum/supply_pack/security/energyweapons
	name = "Energy Weapons Crate"
	desc = "Contains one randomly selected gun from HQ for any brotherhood member that needs a spare."
	cost = 25000
	contains = list(/obj/effect/spawner/lootdrop/f13/weapon/gun/energy/buyable)

/datum/supply_pack/security/grenadef13
	name = "Grenade Crate"
	desc = "Contains two randomly selected grenades from HQ for any brotherhood member that needs a spare."
	cost = 15000
	contains = list(/obj/effect/spawner/lootdrop/f13/bomb/tier2)

/datum/supply_pack/security/attachmentslowtf13
	name = "Low tier Attachments Crate"
	desc = "Contains three randomly selected attachments from HQ, one of the finest and few gunsmiths have made these."
	cost = 9000
	contains = list(/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/gunparts/tier1)

/datum/supply_pack/security/attachmentshightf13
	name = "High tier Attachments Crate"
	desc = "Contains three randomly selected attachments from HQ, one of the finest and few gunsmiths have made these."
	cost = 18000
	contains = list(/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/gunparts/tier2)

/datum/supply_pack/security/attachmentsbesttf13
	name = "Highest tier Attachments Crate"
	desc = "Contains three randomly selected attachments from HQ, one of the finest and few gunsmiths have made these."
	cost = 27000
	contains = list(/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/attachments,
					/obj/effect/spawner/lootdrop/f13/gunparts/tier3)

/datum/supply_pack/security/binocularamapf13
	name = "Binoculars and map Crate"
	desc = "Contains three Binoculars and a map. A must for any scouts of the brotherhood."
	cost = 10000
	contains = list(/obj/item/binoculars,
					/obj/item/binoculars,
					/obj/item/binoculars,
					/obj/item/weapon/maptool)

/datum/supply_pack/security/binocularamapf13
	name = "Mortar shells Crate"
	desc = "Contains five mortars. Make sure to aim for the enemy."
	cost = 40000
	contains = list(/obj/item/mortar_shell,
					/obj/item/mortar_shell,
					/obj/item/mortar_shell,
					/obj/item/mortar_shell,
					/obj/item/mortar_shell)

//fallout changes ends here

/datum/supply_pack/security/ammo
	name = "Ammo Crate - General Purpose"
	desc = "Contains two 20-round magazines for the WT-550 Auto Rifle, three boxes of buckshot ammo, three boxes of rubber ammo and special .38 speedloarders. Requires Security access to open."
	cost = 2500
	contains = list(/obj/item/ammo_box/shotgun/buck,
					/obj/item/ammo_box/shotgun/buck)
	crate_name = "ammo crate"

/datum/supply_pack/security/armor
	name = "Armor Crate"
	desc = "Three vests of well-rounded, decently-protective armor. Requires Security access to open."
	cost = 1200
	contains = list(/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/armor/vest)
	crate_name = "armor crate"
/*
/datum/supply_pack/security/disabler
	name = "Disabler Crate"
	desc = "Three stamina-draining disabler weapons. Requires Security access to open."
	cost = 1300
	contains = list(/obj/item/gun/energy/disabler,
					/obj/item/gun/energy/disabler,
					/obj/item/gun/energy/disabler)
	crate_name = "disabler crate"
*/
/datum/supply_pack/security/forensics
	name = "Forensics Crate"
	desc = "Stay hot on the criminal's heels with brotherhoods's Detective Essentials(tm). Contains a forensics scanner, six evidence bags, camera, tape recorder, white crayon, and of course, a fedora. Requires Security access to open."
	cost = 1800
	contains = list(/obj/item/detective_scanner,
					/obj/item/storage/box/evidence,
					/obj/item/camera,
					/obj/item/taperecorder,
					/obj/item/toy/crayon/white,
					/obj/item/clothing/head/fedora/det_hat)
	crate_name = "forensics crate"
	can_private_buy = TRUE

/datum/supply_pack/security/helmets
	name = "Helmets Crate"
	desc = "Contains three standard-issue brain buckets. Requires Security access to open."
	cost = 1200
	contains = list(/obj/item/clothing/head/helmet/sec,
					/obj/item/clothing/head/helmet/sec,
					/obj/item/clothing/head/helmet/sec)
	crate_name = "helmet crate"

/datum/supply_pack/security/laser //wattz instead
	name = "Lasers Crate"
	desc = "Contains three lethal, Wattz laser pistols.."
	cost = 1750
	contains = list(/obj/item/gun/energy/laser/wattz,
					/obj/item/gun/energy/laser/wattz,
					/obj/item/gun/energy/laser/wattz)
	crate_name = "laser crate"

/datum/supply_pack/security/russianclothing
	name = "Russian Surplus Clothing"
	desc = "An old russian crate full of surplus armor that they used to use! Has two sets of bulletproff armor, a few union suits and some warm hats!"
	cost = 5750 // Its basicly sec suits, good boots/gloves
	contains = list(/obj/item/clothing/suit/armor/navyblue/russian,
					/obj/item/clothing/suit/armor/navyblue/russian,
					/obj/item/clothing/shoes/combat,
					/obj/item/clothing/shoes/combat,
					/obj/item/clothing/head/ushanka,
					/obj/item/clothing/head/ushanka,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/head/helmet/alt,
					/obj/item/clothing/head/helmet/alt,
					/obj/item/clothing/gloves/tackler/combat/insulated,
					/obj/item/clothing/gloves/tackler/combat/insulated,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas)
	crate_name = "surplus russian clothing"
	crate_type = /obj/structure/closet/crate/internals
/*
/datum/supply_pack/security/sechardsuit
	name = "Sec Hardsuit"
	desc = "One Sec Hardsuit with a small air tank and mask."
	cost = 3000 // half of SWAT gear for have the armor and half the gear
	contains = list(/obj/item/clothing/suit/space/hardsuit/security,
					/obj/item/tank/internals/air,
					/obj/item/clothing/mask/gas)
	crate_name = "sec hardsuit crate"
*/
/datum/supply_pack/security/securitybarriers
	name = "Security Barrier Grenades"
	desc = "Stem the tide with four Security Barrier grenades. Requires Security access to open."
	contains = list(/obj/item/grenade/barrier,
					/obj/item/grenade/barrier,
					/obj/item/grenade/barrier,
					/obj/item/grenade/barrier)
	cost = 2000
	crate_name = "security barriers crate"
	can_private_buy = TRUE

/datum/supply_pack/security/securityclothes
	name = "Security Clothing Crate"
	desc = "Contains appropriate outfits for the station's private security force. Contains outfits for the Warden, Head of Security, and two Security Officers. Each outfit comes with a rank-appropriate jumpsuit, suit, and beret. Requires Security access to open."
	cost = 3250
	contains = list(/obj/item/clothing/under/rank/security/officer/formal,
					/obj/item/clothing/under/rank/security/officer/formal,
					/obj/item/clothing/suit/armor/navyblue,
					/obj/item/clothing/suit/armor/navyblue,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/head/beret/sec/navyofficer,
					/obj/item/clothing/under/rank/security/warden/formal,
					/obj/item/clothing/suit/armor/vest/warden/navyblue,
					/obj/item/clothing/head/beret/sec/navywarden,
					/obj/item/clothing/under/rank/security/head_of_security/formal,
					/obj/item/clothing/suit/armor/hos/navyblue,
					/obj/item/clothing/head/beret/sec/navyhos)
	crate_name = "security clothing crate"
	can_private_buy = TRUE

/datum/supply_pack/security/supplies
	name = "Security Supplies Crate"
	desc = "Contains seven flashbangs, seven teargas grenades, six flashes, and seven handcuffs. Requires Security access to open."
	cost = 1200
	contains = list(/obj/item/storage/box/flashbangs,
					/obj/item/storage/box/teargas,
					/obj/item/storage/box/flashes,
					/obj/item/storage/box/handcuffs)
	crate_name = "security supply crate"

/datum/supply_pack/security/firingpins
	name = "Standard Firing Pins Crate"
	desc = "Upgrade your arsenal with 10 standard firing pins. Requires Security access to open."
	cost = 2000
	contains = list(/obj/item/storage/box/firingpins,
					/obj/item/storage/box/firingpins)
	crate_name = "firing pins crate"

/datum/supply_pack/security/justiceinbound
	name = "Standard Justice Enforcer Crate"
	desc = "This is it. The Bee's Knees. The Creme of the Crop. The Pick of the Litter. The best of the best of the best. The Crown Jewel of brotherhood. The Alpha and the Omega of security headwear. Guaranteed to strike fear into the hearts of each and every criminal aboard the station. Also comes with a security gasmask. Requires Security access to open."
	cost = 6000 //justice comes at a price. An expensive, noisy price.
	contains = list(/obj/item/clothing/head/helmet/justice,
					/obj/item/clothing/mask/gas/sechailer)
	crate_name = "security clothing crate"
	can_private_buy = TRUE

/datum/supply_pack/security/baton
	name = "Stun Batons Crate"
	desc = "Arm the Civil Protection Forces with three stun batons. Batteries included. Requires Security access to open."
	cost = 100000
	contains = list(/obj/item/melee/baton/loaded,
					/obj/item/melee/baton/loaded,
					/obj/item/melee/baton/loaded)
	crate_name = "stun baton crate"

/datum/supply_pack/security/taser //Fallout themed
	name = "Disabler Crate"
	desc = "Contains three disablers tasers, capable of firing disabling shots."
	cost = 3500
	contains = list(/obj/item/gun/energy/laser/complianceregulator,
					/obj/item/gun/energy/laser/complianceregulator,
					/obj/item/gun/energy/laser/complianceregulator)
	crate_name = "taser crate"

/datum/supply_pack/security/wall_flash
	name = "Wall-Mounted Flash Crate"
	desc = "Contains four wall-mounted flashes. Requires Security access to open."
	cost = 1000
	contains = list(/obj/item/storage/box/wall_flash,
					/obj/item/storage/box/wall_flash,
					/obj/item/storage/box/wall_flash,
					/obj/item/storage/box/wall_flash)
	crate_name = "wall-mounted flash crate"

/datum/supply_pack/security/hunting
	name = "Hunting Gear"
	desc = "Even in space, we can find prey to hunt, this crate contains everthing a fine hunter needs to have a sporting time. This crate needs armory access to open. A true huntter only needs a fine bottle of cognac, a nice coat, some good o' cigars, and of cource a hunting shotgun. "
	cost = 3500
	contains = list(/obj/item/clothing/head/flatcap,
					/obj/item/clothing/suit/hooded/wintercoat/captain,
					/obj/item/reagent_containers/food/drinks/bottle/cognac,
					/obj/item/storage/fancy/cigarettes/cigars/havana,
					/obj/item/clothing/gloves/color/white,
					/obj/item/clothing/under/rank/civilian/curator,
					/obj/item/gun/ballistic/shotgun/trench)
	crate_name = "sporting crate"
	crate_type = /obj/structure/closet/crate/secure // Would have liked a wooden crate but access >:(

/datum/supply_pack/security/stingpack
	name = "Stingbang Grenade Pack"
	desc = "Contains five \"stingbang\" grenades, perfect for stopping riots and playing morally unthinkable pranks. Requires Security access to open."
	cost = 2500
	contains = list(/obj/item/storage/box/stingbangs)
	crate_name = "stingbang grenade pack crate"

/datum/supply_pack/security/stingpack/single
	name = "Stingbang Single-Pack"
	desc = "Contains one \"stingbang\" grenade, perfect for playing meanhearted pranks. Requires Security access to open."
	cost = 1400
	contains = list(/obj/item/grenade/stingbang)

