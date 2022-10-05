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
	new /obj/item/clothing/suit/armored/medium/steelbib(src)
	new /obj/item/clothing/head/helmet/armyhelmet/heavy(src)
	new /obj/item/twohanded/sledgehammer/simple(src)
	new /obj/item/pda(src)

/datum/gear/donator/kits/cayce
	name = "Jett Lowes belongings"
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

/obj/item/storage/box/large/custom_kit/vaktus/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/combat/riotpolice(src)
	new /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert(src)
	new /obj/item/storage/belt/military(src)
	new /obj/item/melee/onehanded/knife/survival(src)


/datum/gear/donator/kits/vaktus
	name = "Vaks goods"
	path = /obj/item/storage/box/large/custom_kit/vaktus
	ckeywhitelist = list("vaktus4")

/obj/item/storage/box/large/custom_kit/burningcold/PopulateContents()
	new /obj/item/clothing/gloves/f13/leather/fingerless(src)
	new /obj/item/clothing/mask/bandana/blue(src)
	new /obj/item/clothing/suit/armored/light/kit/punk(src)


/datum/gear/donator/kits/burningcold
	name = "Burnings Goods"
	path = /obj/item/storage/box/large/custom_kit/burningcold
	ckeywhitelist = list("myguy49")

/obj/item/storage/box/large/custom_kit/pug/PopulateContents()
	new /obj/item/melee/transforming/cleaving_saw/old_rusty(src)

/obj/item/storage/box/large/custom_kit/pug2/PopulateContents()
	new /obj/item/melee/onehanded/dragonfire(src)

/obj/item/storage/box/large/custom_kit/mutie/PopulateContents()
	new /obj/item/clothing/shoes/f13/mutie/boots(src)
	new /obj/item/clothing/gloves/f13/mutant/mk2(src)
	new /obj/item/clothing/under/f13/vaultmutie(src)
	new /obj/item/clothing/suit/armor/f13/mutant/metal(src)

/datum/gear/donator/kits/pug
	name = "I die to mobs"
	path = /obj/item/storage/box/large/custom_kit/pug
	ckeywhitelist = list("puglord777")

/datum/gear/donator/kits/pug2
	name = "I die to mobsx2"
	path = /obj/item/storage/box/large/custom_kit/pug2
	ckeywhitelist = list("puglord777")

/datum/gear/donator/kits/mutie
	name = "I die to mobsx2"
	path = /obj/item/storage/box/large/custom_kit/mutie
	ckeywhitelist = list("puglord777")

/datum/gear/donator/kits/kemble
	name = "Trinity Kemble's belongings"
	path = /obj/item/storage/box/large/custom_kit/kemble
	ckeywhitelist = list("yeehawguvnah")

/obj/item/storage/box/large/custom_kit/kemble/PopulateContents()
	new /obj/item/modkit/kemblevest(src)
	new /obj/item/modkit/kemblehat(src)
	new /obj/item/storage/belt/holster/kemble(src)

/datum/gear/donator/kits/tessa
	name ="Scourge custom whip"
	path = /obj/item/storage/box/large/custom_kit/sadismbox
	ckeywhitelist = list ("abelshift")

/obj/item/storage/box/large/custom_kit/sadismbox/PopulateContents()
	new /obj/item/melee/onehanded/scourge(src)

/datum/gear/donator/kits/abel
	name ="modified NCRCF jacket"
	path = /obj/item/storage/box/large/custom_kit/ncrcfbox
	ckeywhitelist = list ("abelshift")

/obj/item/storage/box/large/custom_kit/ncrcfbox/PopulateContents()
	new /obj/item/clothing/suit/toggle/labcoat/abeljacket(src)

/datum/gear/donator/kits/bella
	name ="Bella's Fieldcoat"
	path = /obj/item/storage/box/large/custom_kit/bellacoatbox
	ckeywhitelist = list ("abelshift")

/obj/item/storage/box/large/custom_kit/bellacoatbox/PopulateContents()
	new /obj/item/clothing/suit/armor/f13/ncrarmor/bellacoat(src)

/datum/gear/donator/kits/kemble
	name = "Trinity Kemble's belongings"
	path = /obj/item/storage/box/large/custom_kit/kemble
	ckeywhitelist = list("yeehawguvnah")

/obj/item/storage/box/large/custom_kit/kemble/PopulateContents()
	new /obj/item/modkit/kemblevest(src)
	new /obj/item/modkit/kemblehat(src)
	new /obj/item/storage/belt/holster/kemble(src)

/datum/gear/donator/kits/shark
	name ="Happy Shark Material"
	path = /obj/item/storage/box/large/custom_kit/shark
	ckeywhitelist = list ("mr.sanderp","mrsanderp")

/obj/item/storage/box/large/custom_kit/shark/PopulateContents()
	new /obj/item/book/granter/crafting_recipe/happysharky(src)
	new /obj/item/reagent_containers/food/snacks/sunset/happyshark/jerky(src)
	new /obj/item/reagent_containers/food/snacks/sunset/happyshark/candybar(src)
	new /obj/item/reagent_containers/food/drinks/sunset/happyshark/bittercola(src)

/datum/gear/donator/kits/krig
	name ="Krig's Teachings"
	path = /obj/item/storage/box/large/custom_kit/krig
	ckeywhitelist = list ("lia526")

/obj/item/storage/box/large/custom_kit/krig/PopulateContents()
	new /obj/item/book/granter/trait/krig(src)

/datum/gear/donator/kits/carl
	name ="Hazard Gear"
	path = /obj/item/storage/box/large/custom_kit/carl
	ckeywhitelist = list ("nothingbutcarl")

/obj/item/storage/box/large/custom_kit/carl/PopulateContents()
	new /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert/carl(src)
	new /obj/item/clothing/suit/armor/f13/rangercombat/desert/carl(src)
	new /obj/item/card/id/rusted/brokenholodog/carl(src)
	new /obj/item/clothing/gloves/f13/military/carl(src)
	new /obj/item/clothing/shoes/f13/military/leather/carl(src)
	new /obj/item/clothing/under/f13/ranger/modif_ranger/carl(src)
	new /obj/item/storage/belt/holster/regulator(src)
	new /obj/item/nuke_core_container(src)
	new /obj/item/screwdriver/nuke(src)