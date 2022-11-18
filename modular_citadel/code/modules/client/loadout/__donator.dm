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

/obj/item/storage/box/large/custom_kit/mutie/PopulateContents()
	new /obj/item/clothing/shoes/f13/mutie/boots(src)
	new /obj/item/clothing/gloves/f13/mutant/mk2(src)
	new /obj/item/clothing/under/f13/vaultmutie(src)
	new /obj/item/clothing/suit/armor/f13/mutant/metal(src)

/datum/gear/donator/kits/pug
	name = "I die to mobs"
	path = /obj/item/storage/box/large/custom_kit/pug
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

/datum/gear/donator/kits/cassidy
	name = "Cassidy's Ring"
	path = /obj/item/storage/box/large/custom_kit/cassidy
	ckeywhitelist = list ("nicodeimos")

/obj/item/storage/box/large/custom_kit/cassidy/PopulateContents()
	new /obj/item/clothing/gloves/ring/diamond(src)

/datum/gear/donator/kits/tzzshali
	name = "Tzzshali's Form"
	path = /obj/item/storage/box/large/custom_kit/tzzshali
	ckeywhitelist = list ("irkallaepsilon")

/obj/item/storage/box/large/custom_kit/tzzshali/PopulateContents()
	new /obj/item/clothing/under/misc/polyjumpsuit(src)
	new /obj/item/clothing/suit/hooded/wintercoat/polychromic(src)

/datum/gear/donator/kits/aim
	name = "Baghead's Face"
	path = /obj/item/storage/box/large/custom_kit/aim
	ckeywhitelist = list ("anythingisme")

/obj/item/storage/box/large/custom_kit/aim/PopulateContents()
	new /obj/item/clothing/mask/scarecrow/baghead(src)
	new /obj/item/melee/onehanded/knife/ritualdagger/baghead(src)
	new /obj/item/book/granter/trait/chemistry(src)

/datum/gear/donator/kits/emma
	name = "Emma's Equipment"
	path = /obj/item/storage/box/large/custom_kit/emma
	ckeywhitelist = list ("potatoperson993")

/obj/item/storage/box/large/custom_kit/emma/PopulateContents()
	new /obj/item/gun/energy/laser/wattz/recharger(src)
	new /obj/item/clothing/under/f13/recon/outcast(src)
	new /obj/item/clothing/head/helmet/f13/combat/brotherhood/outcast(src)
	new /obj/item/clothing/suit/armor/f13/combat/brotherhood/outcast(src)

/datum/gear/donator/kits/lpohone
	name = "Souren's Lament"
	path = /obj/item/storage/box/large/custom_kit/lpohone
	ckeywhitelist = list ("littleplayer0102")

/obj/item/storage/box/large/custom_kit/lpohone/PopulateContents()
	new /obj/item/card/id/rusted/brokenholodog(src)
	new /obj/item/clothing/under/f13/recon/outcast(src)
	new /obj/item/gun/energy/laser/aer14/refurb(src)
	new /obj/item/clothing/accessory/bos/paladin(src)
	new /obj/item/book/granter/trait/pa_wear(src)
	new /obj/item/clothing/suit/armor/f13/power_armor/t45d/refurb(src)
	new /obj/item/clothing/head/helmet/f13/power_armor/t45d/refurb(src)

/datum/gear/donator/kits/ripper// basically enough to set up his own clinic/lab. when off-duty.
	name = "Rippers Belonging"
	path = /obj/item/storage/box/large/custom_kit/ripper
	ckeywhitelist = list ("mottedesstriets")

/obj/item/storage/box/large/custom_kit/ripper/PopulateContents()
	new /obj/item/clothing/glasses/hud/health/eyepatch(src)// basic healthhud but cooler.
	new /obj/item/melee/powered/surgripper(src)// easier than coding a skill-book giver for him to craft them
	new /obj/item/clothing/suit/armored/medium/combat/flatline/prototype(src)// flatlines armor prototype
	new /obj/item/clothing/ears/headphones(src)// hard to get for a fluff item
	new /obj/item/clothing/head/f13/stalkerpelt(src)// morbid. but funny.
	new /obj/item/storage/pill_bottle/chem_tin/mentats(src)// entirely for RP reasons
	new /obj/item/book/granter/trait/midsurgery(src)// skill level for surgery of basic doctor
	new /obj/item/book/granter/trait/chemistry(src)// chem whiz
	new /obj/item/disk/plantgene(src)// store plant data
	new /obj/item/disk/plantgene(src)// store plant data
	new /obj/item/circuitboard/machine/chem_master/advanced(src)//not a dispencer. splitter. can make patches so legion dont bitch.
	new /obj/item/circuitboard/machine/gibber(src)// fetish reason dont ask.
	new /obj/item/circuitboard/machine/plantgenes(src)// plant manipulator
	new /obj/item/stock_parts/manipulator/femto(src)// for gibber, works with clothes on/faster.
	new /obj/item/stock_parts/matter_bin/bluespace(src)// for gibber. gives most meat.

/datum/gear/donator/kits/transhumanism
	name = "Half-Synth"
	path = /obj/item/storage/box/large/custom_kit/transhumanism
	ckeywhitelist = list ("alffd")

/obj/item/storage/box/large/custom_kit/transhumanism/PopulateContents()
	var/player = get_mob_by_key("alffd")
	if(!ishuman(player)) //This should never be true, but who knows.
		return
	var/mob/living/carbon/human/P = player
	implant(player, new /obj/item/organ/tongue/robot/gen2synth(src)) //Robotic voice.
	implant(player, new /obj/item/organ/ears/cybernetic(src))  //Hearing loss on EMP
	implant(player, new /obj/item/organ/cyberimp/brain(src)) //Causes a large stun if EMPed.
	if(cmptext(P.mind.assigned_role, "Enclave Scientist"))
		implant(player, new /obj/item/organ/lungs/cybernetic/tier2(src)) //Lack of atmos negates any buffs, massive Oxy loss on EMP.
		implant(player, new /obj/item/organ/liver/cybernetic/upgraded(src)) //Better at filtering toxins, but twice EMP damage.
		implant(player, new /obj/item/organ/heart/cybernetic/upgraded(src)) //Has epinephrine, heart attack on EMP.
		implant(player, new /obj/item/organ/cyberimp/arm/toolset(src)) //Does not work on faction doors.
		implant(player, new /obj/item/organ/cyberimp/chest/nutriment/plus(src)) //Simulates current synth hunger mechanics.
		implant(player, new /obj/item/organ/cyberimp/chest/reviver(src)) //Reviver implant
		implant(player, new /obj/item/organ/eyes/robotic/shield(src)) //Welding shield eyes.
		implant(player, new /obj/item/organ/cyberimp/eyes/hud/medical(src)) //Medical hud for testing xeno-bio monkeys
	else
		implant(player, new /obj/item/organ/lungs/cybernetic(src))
		implant(player, new /obj/item/organ/liver/cybernetic(src))
		implant(player, new /obj/item/organ/heart/cybernetic(src))
	qdel(src)

/obj/item/storage/box/large/custom_kit/transhumanism/proc/implant(player, obj/item/organ/I)
	I.Insert(player, drop_if_replaced = FALSE)
