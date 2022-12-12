/datum/species/synthanthro
	name = "Synthetic Anthromorph"
	id = "synthanthro"
	say_mod = "beeps"
	default_color = "00FF00"
	allowed_limb_ids = list("mammal","aquatic","avian", "human")
	limbs_id = "mammal"
	species_traits = list(MUTCOLORS,NOTRANSSTING,EYECOLOR,LIPS,HAIR,HORNCOLOR,WINGCOLOR,HAS_FLESH,HAS_BONE,ROBOTIC_LIMBS,NO_DNA_COPY,NOAPPENDIX)
	inherent_traits = list(TRAIT_VIRUSIMMUNE,TRAIT_EASYDISMEMBER,TRAIT_LIMBATTACHMENT,TRAIT_NO_PROCESS_FOOD,TRAIT_NOBREATH,TRAIT_MUTATION_STASIS)
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID|MOB_BEAST|MOB_SYNTH
	mutant_bodyparts = list("mcolor" = "FFFFFF","mcolor2" = "FFFFFF","mcolor3" = "FFFFFF", "mam_snouts" = "Husky", "mam_tail" = "Husky", "mam_ears" = "Husky", "deco_wings" = "None", "mam_body_markings" = "Husky", "taur" = "None", "horns" = "None", "legs" = "Plantigrade")
	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/ipc
	gib_types = list(/obj/effect/gibspawner/ipc, /obj/effect/gibspawner/ipc/bodypartless)
	liked_food = MEAT | FRIED
	disliked_food = TOXIC

	//Just robo looking parts.
	mutant_heart = /obj/item/organ/heart/ipc
	mutantlungs = /obj/item/organ/lungs/ipc
	mutantliver = /obj/item/organ/liver/ipc
	mutantstomach = /obj/item/organ/stomach/ipc
	mutanteyes = /obj/item/organ/eyes/ipc
	mutantears = /obj/item/organ/ears/ipc
	mutanttongue = /obj/item/organ/tongue/robot/ipc
	mutant_brain = /obj/item/organ/brain/ipc

	//special cybernetic organ for getting power from apcs
	mutant_organs = list(/obj/item/organ/cyberimp/arm/power_cord)

	exotic_bloodtype = "S"
	exotic_blood_color = BLOOD_COLOR_OIL

	tail_type = "mam_tail"
	wagging_type = "mam_waggingtail"
	species_type = "robotic"

/datum/species/synthanthro/handle_chemicals(datum/reagent/chem, mob/living/carbon/human/H)
	if(istype(chem) && !chem.synthfriendly)
		H.reagents.remove_reagent(chem.type, REAGENTS_METABOLISM * 1000)
		return TRUE
	return ..()

/datum/species/synthanthro/spec_life(mob/living/carbon/human/H)
	if(H.water < THIRST_LEVEL_FULL)
		H.water = THIRST_LEVEL_FULL
	if(H.water > THIRST_LEVEL_FULL)
		H.water = THIRST_LEVEL_FULL
	var/clone_damage = H.getCloneLoss()
	var/toxin_damage = H.getToxLoss()
	var/oxygen_damage = H.getOxyLoss()
	if(clone_damage > 0)
		H.setCloneLoss(0)
		H.apply_damage(clone_damage, BURN)
	if(toxin_damage > 0)
		H.setToxLoss(0)
		H.apply_damage(toxin_damage, BURN)
	if(oxygen_damage > 0)
		H.setToxLoss(0)
		H.apply_damage(oxygen_damage, BURN)
