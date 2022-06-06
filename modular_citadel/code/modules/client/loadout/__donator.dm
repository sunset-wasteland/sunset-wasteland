//This is the file that handles donator loadout items.

/datum/gear/donator
	name = "IF YOU SEE THIS, PING A CODER RIGHT NOW!"
	slot = SLOT_IN_BACKPACK
	path = /obj/item/storage/belt/holster/ranger45
	category = LOADOUT_CATEGORY_DONATOR
	ckeywhitelist = list("This entry should never appear with this variable set.") //If it does, then that means somebody fucked up the whitelist system pretty hard
	cost = 0

/datum/gear/donator/donortestingbikehorn
	name = "Donor item testing"
	slot = SLOT_IN_BACKPACK
	path = /obj/item/storage/belt/holster/ranger45
	geargroupID = list("DONORTEST") //This is a list mainly for the sake of testing, but geargroupID works just fine with ordinary strings

/datum/gear/donator/monke1818
	name = "CIA Badge"
	slot = SLOT_IN_BACKPACK
	path = /obj/item/clothing/accessory/cia_badge
	ckeywhitelist = list("monke1818")

/////////////////////
///Loadout Boxes///// See kits.dm, use this model for loadouts that have more than one item per character.
/////////////////////
/datum/gear/donator/kits
	slot = SLOT_IN_BACKPACK

/*example
/datum/gear/donator/kits/averyamadeus
	name = "Avery Amadeus' belongings"
	path = /obj/item/storage/box/large/custom_kit/averyamadeus
	ckeywhitelist = list("topbirb")
*/

/obj/item/storage/box/large/custom_kit/cayce/PopulateContents()
    new /obj/item/storage/backpack/security(src)
    new /obj/item/stack/f13Cash/caps/threefivezero(src)
    new /obj/item/gun/ballistic/shotgun/automatic/combat/citykiller(src)
    new /obj/item/ammo_box/shotgun/slug(src)
    new /obj/item/ammo_box/shotgun/slug(src)
    new /obj/item/storage/belt/military(src)
    new /obj/item/pda(src)

/datum/gear/donator/kits/cayce
    name = "Nearly Feral Fred's Junk"
    path = /obj/item/storage/box/large/custom_kit/cayce
    ckeywhitelist = list("cayce")

/obj/item/storage/box/large/custom_kit/sugga/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/combat(src)
	new /obj/item/clothing/head/helmet/f13/combat(src)
	new /obj/item/gun/ballistic/automatic/pistol/beretta(src)
	new /obj/item/ammo_box/magazine/m9mmds(src)
	new /obj/item/ammo_box/magazine/m9mmds(src)
	new /obj/item/ammo_box/magazine/m9mmds(src)
	new /obj/item/melee/rapier(src)

/datum/gear/donator/kits/sugga
	name = "Suggas box"
	path = /obj/item/storage/box/large/custom_kit/sugga
	ckeywhitelist = list("sugga")

/obj/item/storage/box/large/custom_kit/klatue/PopulateContents()
	new /obj/item/storage/belt/holster(src)
	new /obj/item/gun/ballistic/revolver/hunting/klatue(src)
	new /obj/item/gun/ballistic/revolver/hunting/klatue(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/clothing/suit/armor/hos/trenchcoat(src)
	new /obj/item/clothing/head/helmet/riot(src)

/datum/gear/donator/kits/klatue
	name = "Klatue box"
	path = /obj/item/storage/box/large/custom_kit/klatue
	ckeywhitelist = list("klatue9")

/obj/item/storage/box/large/custom_kit/canadian/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/legion/vet/explorercanada(src)
	new /obj/item/clothing/neck/mantle/umbo(src)
	new /obj/item/gun/ballistic/automatic/service/carbine(src)
	new /obj/item/ammo_box/magazine/m556/rifle/assault(src)
	new /obj/item/ammo_box/magazine/m556/rifle/assault(src)
	new /obj/item/toy/figure/dsquad(src)


/datum/gear/donator/kits/canadian
	name = "Canadian"
	path = /obj/item/storage/box/large/custom_kit/canadian
	ckeywhitelist = list("comradesocks")
/*
/obj/item/storage/box/large/custom_kit/vaktus/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/combat/riotpolice(src)
	new /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert(src)
	new /obj/item/storage/belt/military(src)
	new /obj/item/melee/onehanded/knife/survival(src)


/datum/gear/donator/kits/vaktus
	name = "Vaks goods"
	path = /obj/item/storage/box/large/custom_kit/vaktus
	ckeywhitelist = list("vaktus4")
*/
/obj/item/storage/box/large/custom_kit/burningcold/PopulateContents()
	new /obj/item/clothing/gloves/f13/leather/fingerless(src)
	new /obj/item/clothing/mask/bandana/blue(src)
	new /obj/item/clothing/suit/armored/light/kit/punk(src)

// DaemonTinadel Custom Vet Decanus
/datum/gear/donator/kits/daemon
	name = "Daemon's small wiener"
	path = /obj/item/storage/box/large/custom_kit/daemon
	ckeywhitelist = list("DaemonTinadel")

/obj/item/storage/box/large/custom_kit/daemon/PopulateContents()
	new /obj/item/clothing/head/helmet/f13/legion/vet/decan/daemon(src)
	new /obj/item/clothing/suit/armor/f13/legion/heavy/daemon(src)

/datum/gear/donator/kits/burningcold
	name = "Burnings Goods"
	path = /obj/item/storage/box/large/custom_kit/burningcold
	ckeywhitelist = list("myguy49")
	
/obj/item/storage/box/large/custom_kit/pineapple/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/combat/environmental(src)
	new /obj/item/clothing/head/helmet/f13/combat/environmental(src)
	new /obj/item/gun/energy/laser/plasma/glock(src)
	new /obj/item/stock_parts/cell/ammo/ec(src)


/datum/gear/donator/kits/pineapple
	name = "Silvers goods"
	path = /obj/item/storage/box/large/custom_kit/pineapple
	ckeywhitelist = list("silveredsoul")

/obj/item/storage/box/large/custom_kit/evosolus/PopulateContents()
	new /obj/item/melee/powered/ripper(src)
	new /obj/item/clothing/suit/armor/f13/harbingermantle(src)
	new /obj/item/clothing/head/beret/ncr/ncr_recon(src)
	new /obj/item/clothing/mask/gas/sechailer(src)

/datum/gear/donator/kits/evosolus
	name = "Evos goods"
	path = /obj/item/storage/box/large/custom_kit/evosolus
	ckeywhitelist = list("evosolus")

/obj/item/storage/box/large/custom_kit/snugglytrap/PopulateContents()
	new /obj/item/clothing/neck/mantle/snugglycape(src)
	new /obj/item/mmi/posibrain(src)

/datum/gear/donator/kits/snugglytrap
	name = "Good boy kit"
	path = /obj/item/storage/box/large/custom_kit/snugglytrap
	ckeywhitelist = list("snugglytrap")	
	
/obj/item/storage/box/large/custom_kit/erabite/PopulateContents()
	new /obj/item/clothing/head/helmet/f13/rangercombat/rangertrauma(src)
	new /obj/item/clothing/suit/armor/f13/rangercombat/degancustom(src)
	new /obj/item/storage/belt/holster(src)
	new /obj/item/gun/ballistic/revolver/m29(src)
	new /obj/item/gun/ballistic/revolver/m29(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)

/datum/gear/donator/kits/erabite
	name = "Era stuff"
	path = /obj/item/storage/box/large/custom_kit/erabite
	ckeywhitelist = list("erabite")	

/obj/item/storage/box/large/custom_kit/flaka/PopulateContents()
	new /obj/item/clothing/head/f13/enclave/hood(src)
	new /obj/item/clothing/suit/armor/f13/enclavetrenchcoat/gunny(src)
	new /obj/item/melee/powered/ripper(src)

/datum/gear/donator/kits/flaka
	name = "Flaka stuff"
	path = /obj/item/storage/box/large/custom_kit/flaka
	ckeywhitelist = list("flaka")

/obj/item/storage/box/large/custom_kit/rix/PopulateContents()
	new /obj/item/gun/ballistic/revolver/ballisticfist(src)
	
/datum/gear/donator/kits/rix
	name = "Dark stuff"
	path = /obj/item/storage/box/large/custom_kit/rix
	ckeywhitelist = list("darkrixd")

/obj/item/storage/box/large/custom_kit/sunny/PopulateContents()
	new /obj/item/clothing/mask/gas/sechailer(src)
	new /obj/item/gun/energy/laser/plasma/glock(src)
	new /obj/item/clothing/shoes/kindleKicks(src)
	new /obj/item/storage/belt/military/assault(src)
	new /obj/item/clothing/suit/armor/f13/combat/khan(src)
	
/datum/gear/donator/kits/sunny
	name = "Sunnys stuff"
	path = /obj/item/storage/box/large/custom_kit/sunny
	ckeywhitelist = list("nirzak")						

/obj/item/storage/box/large/custom_kit/sokkxx/PopulateContents()
	new /obj/item/modkit/sokkxxarmor(src)
	new /obj/item/modkit/sokkxxhelm(src)
	new /obj/item/gun/energy/laser/plasma(src)

/datum/gear/donator/kits/sokkxx
	name = "Sokkxx's belongings"
	path = /obj/item/storage/box/large/custom_kit/sokkxx
	ckeywhitelist = list("sokkxx")

/obj/item/storage/box/large/custom_kit/pug/PopulateContents()
	new /obj/item/melee/transforming/cleaving_saw/old_rusty(src)

/obj/item/storage/box/large/custom_kit/pug2/PopulateContents()
	new /obj/item/melee/onehanded/dragonfire(src)

/obj/item/storage/box/large/custom_kit/mutie/PopulateContents()
	new /obj/item/clothing/shoes/f13/mutie/boots(src)
	new /obj/item/clothing/gloves/f13/mutant/mk2(src)
	new /obj/item/clothing/under/f13/vaultmutie(src)
	new /obj/item/clothing/suit/armor/f13/mutant/poncho(src)

/datum/gear/donator/kits/pug
	name = "I die to mobs"
	path = /obj/item/storage/box/large/custom_kit/pug
	ckeywhitelist = list("puglord777")

/datum/gear/donator/kits/pug2
	name = "I die to mobsx2"
	path = /obj/item/storage/box/large/custom_kit/pug2
	ckeywhitelist = list("puglord777")
	
/datum/gear/donator/kits/mutie
	name = "Muties"
	path = /obj/item/storage/box/large/custom_kit/mutie
	ckeywhitelist = list("puglord777")
