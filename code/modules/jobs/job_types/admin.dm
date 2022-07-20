/datum/job/wasteland/f13adminboos
	title = "Death"
	flag = F13ADMINBOOS
	faction = FACTION_WASTELAND
	total_positions = 0
	spawn_positions = 0
	description = ""
	supervisors = "no one"
	selection_color = "#76885f"

	outfit = /datum/outfit/job/wasteland/f13adminboos

/datum/outfit/job/wasteland/f13adminboos
	name = "Death"
	jobtype = /datum/job/wasteland/f13vigilante
	id = /obj/item/card/id/dogtag/vigilante
	belt = /obj/item/storage/belt/military
	shoes = /obj/item/clothing/shoes/f13/explorer
	l_pocket = /obj/item/melee/onehanded/knife/hunting
	r_pocket = /obj/item/flashlight/seclite
	uniform = /obj/item/clothing/under/f13/merca
	backpack = /obj/item/storage/backpack/satchel/trekker
	gloves = /obj/item/clothing/gloves/f13/military
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert
	suit = /obj/item/clothing/suit/armor/f13/rangercombat/desert
	suit_store = /obj/item/gun/ballistic/revolver/sequoia/death
	glasses = /obj/item/clothing/glasses/hud/health/night
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super=4, \
		/obj/item/reagent_containers/pill/radx=1, \
		/obj/item/restraints/handcuffs=2, \
		/obj/item/ammo_box/c4570/explosive=6)

/datum/outfit/job/wasteland/f13adminboos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	var/obj/item/implant/explosive/E = new
	E.implant(H)

	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)