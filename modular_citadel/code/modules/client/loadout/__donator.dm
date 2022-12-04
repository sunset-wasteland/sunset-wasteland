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

/datum/gear/donnator/kits/fluffysleepwear
	name = "Sleeping Equipment"
	path = /obj/item/storage/custom_kit/fluffycampinglads
	ckeywhitelist = list("bonirus")

/obj/item/storage/custom_kit/fluffycampinglads/PopulateContents()
	new /obj/item/clothing/shoes/sneakers/white(src)
	new /obj/item/clothing/under/syndicate/bloodred/sleepytime(src)
	new /obj/item/clothing/under/sweater(src)
	new /obj/item/clothing/under/sweater/blue(src)
	new /obj/item/clothing/under/syndicate/rus_army(src)
	new /obj/item/clothing/under/misc/pj/red(src)
	new /obj/item/clothing/under/misc/pj/blue(src)
	new /obj/item/toy/plush/borgplushie/medihound(src)
	new /obj/item/gun/ballistic/automatic/c20r/toy/unrestricted/riot(src)
	new /obj/item/ammo_box/magazine/toy/smgm45/riot(src)
	new /obj/item/bedsheet/medical(src)
	new /obj/item/bedsheet/patriot(src)
	new /obj/item/stack/sheet/cloth/thirty(src)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)

/datum/gear/donator/kits/moribund  //basically enough to set up his own clinic/lab. when off-duty. or to Rp properly as vault dwelling moribund FEV scientist man
	name = "moribunds supplies"
	path = /obj/item/storage/box/large/custom_kit/moribund
	ckeywhitelist = list ("mottedesstriets")

/obj/item/storage/box/large/custom_kit/moribund/PopulateContents()
	new /obj/item/organ/cyberimp/brain/neuro(src)
	new /obj/item/organ/tongue/lizard(src)// nightstalker tongue, cant do in proper character create to get a good looking nightstalker.
	new /obj/item/autosurgeon(src)// ^ for tongue
	new /obj/item/clothing/glasses/hud/health/eyepatch(src)// basic healthhud but cooler.
	new /obj/item/clothing/suit/armored/medium/combat/duster(src)// less faction specific armor
	new /obj/item/clothing/ears/headphones(src)// hard to get for a fluff item
	new /obj/item/clothing/head/f13/stalkerpelt(src)// morbid. but funny.
	new /obj/item/storage/pill_bottle/chem_tin/fixer(src)// not craftable
	new /obj/item/reagent_containers/hypospray/medipen/skillpen(src)// custom pen for skill. all doc skills.
	new /obj/item/reagent_containers/hypospray/medipen/skillpen_na(src)// custom pen for skill. second to use to teach others medicine. dangerous
	new /obj/item/disk/plantgene(src)// store plant data
	new /obj/item/disk/plantgene(src)// store plant data
	new /obj/item/circuitboard/machine/chem_master/advanced(src)//not a dispencer. splitter. can make patches so legion dont bitch.
	new /obj/item/circuitboard/machine/gibber(src)// fetish reason dont ask.
	new /obj/item/circuitboard/machine/plantgenes(src)// plant manipulator
	new /obj/item/stock_parts/manipulator/femto(src)// for gibber, works with clothes on/faster.
	new /obj/item/stock_parts/matter_bin/bluespace(src)// for gibber. gives most meat.
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)

/datum/gear/donator/kits/junkie
	name = "junkie box"
	path = /obj/item/storage/box/large/custom_kit/junkie
	ckeywhitelist = list ("metro_dweller")

/obj/item/storage/box/large/custom_kit/junkie/PopulateContents()
	new /obj/item/twohanded/baseball/golfclub(src)
	new /obj/item/gun/ballistic/automatic/pistol/ninemil/maria(src)
	new /obj/item/clothing/head/helmet/f13/fiend_reinforced(src)
	new /obj/item/reagent_containers/hypospray/medipen/psycho(src)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)

/datum/gear/donator/kits/whorewolf
	name = "whore wolf box"
	path = /obj/item/storage/box/large/custom_kit/whorewolf
	ckeywhitelist = list ("usuario2")

/obj/item/storage/box/large/custom_kit/whorewolf/PopulateContents()
	new /obj/item/clothing/under/shorts/polychromic/pantsu(src)
	new /obj/item/clothing/under/dress/skirt/polychromic(src)
	new /obj/item/clothing/under/suit/polychromic(src)
	new /obj/item/clothing/accessory/armband/hydro(scr)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)
	new /obj/item/kinetic_crusher/glaive(src)

/datum/gear/donator/kits/catcrown
	name = "Cat Crown"
	path = /obj/item/storage/box/large/custom_kit/catcrown
	ckeywhitelist = list ("lowpowermia")

/obj/item/storage/box/large/custom_kit/catcrown/PopulateContents()
	new /obj/item/clothing/head/crown(src)
	new /obj/item/clothing/head/jester/alt(src)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(src)
	new /obj/item/twohanded/baseball/louisville(src)

/datum/gear/donator/kits/shurk
	name = "Tribal Shurk"
	path = /obj/item/storage/box/large/custom_kit/shurk
	ckeywhitelist = list ("hyroFox")

/obj/item/storage/box/large/custom_kit/shurk/PopulateContents()
	new /obj/item/gun/ballistic/bow/crossbow(src)
	new /obj/item/clothing/suit/armor/f13/combat/tribal(src)
	new /obj/item/clothing/head/helmet/f13/combat/tribal(src)
	new /obj/item/reagent_containers/pill/patch/hydra(src)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)

/datum/gear/donator/kits/goia
	name = "Goia Soul Box"
	path = /obj/item/storage/box/large/custom_kit/goia
	ckeywhitelist = list ("smdytb1")

/obj/item/storage/box/large/custom_kit/goia/PopulateContents()
	new /obj/item/soulstone(src)
	new /obj/item/pet_carrier/bluespace(src)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)

/datum/gear/donator/kits/mutt
	name = "Mutt Box"
	path = /obj/item/storage/box/large/custom_kit/mutt
	ckeywhitelist = list ("thedarkninja207")

/obj/item/storage/box/large/custom_kit/mutt/PopulateContents()
	new /obj/item/card/id/rusted(src)
	new /obj/item/clothing/head/beanie/black(src)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)
	new /obj/item/reagent_containers/food/snacks/f13/canned/dog(scr)

/datum/gear/donator/kits/bad
	name = "Bad Dog Box"
	path = /obj/item/storage/box/large/custom_kit/bad
	ckeywhitelist = list ("jglitch")

/obj/item/storage/box/large/custom_kit/bad/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/f13/canned/ncr/bighorner_sausage(scr)
	new /obj/item/reagent_containers/food/snacks/f13/canned/dog(scr)

