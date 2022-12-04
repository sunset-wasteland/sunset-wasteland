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

/datum/gear/donator/kits/finlayranger
	name = "Stolen Ranger"
	path = /obj/item/storage/box/large/custom_kit/finlayranger
	ckeywhitelist = list ("metrobotic")

/obj/item/storage/box/large/custom_kit/finlayranger/PopulateContents()
	new /obj/item/clothing/glasses/hud/health(src)
	new /obj/item/clothing/head/helmet/f13/ncr/rangercombat/finlayranger(src)
	new /obj/item/clothing/suit/armor/f13/rangercombat/finlayranger(src)
	new /obj/item/gun/ballistic/revolver/revolver45(src) //Doesn't come with ammo, You can print it anyway
	new /obj/item/melee/powered/ripper(src)
/datum/gear/donator/kits/bibledog
	name = "Bible Canid"
	path = /obj/item/storage/box/large/custom_kit/bibledog
	ckeywhitelist = list ("especiallystrange")

/obj/item/storage/box/large/custom_kit/bibledog/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/m1911/bibledog(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/clothing/under/f13/bibledog(src)
	new /obj/item/gunpart/BHS_Receiver(src)
	new /obj/item/clothing/suit/armored/medium/combat/swat(src)
	new /obj/item/book/granter/trait/bibledog(src) //being able to use the bible
	new /obj/item/storage/book/bible(src) //Would kinda defeat the point if I don't actually get a bible with it


