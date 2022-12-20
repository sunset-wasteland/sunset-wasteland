///////////////////
// GLOVE WEAPONS //
///////////////////		-faster attack speed

// When you attack empty-handed with these equipped,
// you use it to attack instead of punching.
// It still triggers martial arts combos.

/obj/item/melee/unarmed
	name = "glove weapon template"
	desc = "should not be here"
	icon = 'icons/fallout/objects/melee/melee.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee1h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee1h_righthand.dmi'
	attack_speed = CLICK_CD_MELEE * 0.9
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_GLOVES
	w_class = WEIGHT_CLASS_SMALL
	flags_1 = CONDUCT_1
	sharpness = SHARP_NONE
	throwforce = 10
	throw_range = 5
	attack_verb = list("punched", "jabbed", "whacked")

/obj/item/melee/unarmed/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_ITEM_EQUIPPED, .proc/on_equip)
	RegisterSignal(src, COMSIG_ITEM_DROPPED, .proc/on_drop)

// When on help intent: attack simplemobs only
// When not on help intent: attack structures, turfs, and all mobs
/obj/item/melee/unarmed/proc/do_unarmed_attack(mob/living/carbon/source, atom/target)
	if (istype(target, /obj/item))
		return
	if (source.a_intent == INTENT_HARM)
		if(ishuman(target) && source.mind?.martial_art)
			// This code sucks.
			// TODO: Rewrite martial arts to be less shit.
			var/datum/martial_art/attacker_style = source.mind.martial_art
			if(attacker_style.pacifism_check && HAS_TRAIT(source, TRAIT_PACIFISM))
				return
			attacker_style.add_to_streak("H",target)
			if(attacker_style.check_streak(source, target))
				return
	else if (!istype(target, /mob/living/simple_animal/hostile)) // so that disarming + martial arts streaks still work
		return
	melee_attack_chain(source, target)
	return INTERRUPT_UNARMED_ATTACK

/obj/item/melee/unarmed/proc/on_equip(source, mob/equipper, slot)
	SIGNAL_HANDLER
	if (slot != SLOT_GLOVES)
		UnregisterSignal(equipper, COMSIG_HUMAN_MELEE_UNARMED_ATTACK)
		if (HAS_TRAIT(equipper, TRAIT_UNARMED_WEAPON))
			REMOVE_TRAIT(equipper, TRAIT_UNARMED_WEAPON, GLOVE_TRAIT)
		return
	if(HAS_TRAIT(equipper, TRAIT_UNARMED_WEAPON))
		return
	ADD_TRAIT(equipper, TRAIT_UNARMED_WEAPON, GLOVE_TRAIT)
	RegisterSignal(equipper, COMSIG_HUMAN_MELEE_UNARMED_ATTACK, .proc/do_unarmed_attack)

/obj/item/melee/unarmed/proc/on_drop(source, mob/dropper)
	// This might remove it too early if someone has multiple,
	// but it's better than letting them run around with the bonus and nothing equipped.
	if(!HAS_TRAIT_FROM(dropper, TRAIT_UNARMED_WEAPON, GLOVE_TRAIT))
		return
	REMOVE_TRAIT(dropper, TRAIT_UNARMED_WEAPON, GLOVE_TRAIT)
	UnregisterSignal(dropper, COMSIG_HUMAN_MELEE_UNARMED_ATTACK)

/////
// NOTE: THE DAMAGE FROM THESE DOES NOT INCLUDE THE BONUS FROM BASE PUNCH DAMAGE
// OR FROM IRON FIST.
/////

// Brass knuckles	Keywords: Damage 17
/obj/item/melee/unarmed/brass
	name = "brass knuckles"
	desc = "Hardened knuckle grip that is actually made out of steel. They protect your hand, and do more damage, in unarmed combat."
	icon_state = "brass"
	item_state = "brass"
	attack_verb = list("punched", "jabbed", "whacked")
	force = 17
	custom_materials = list(/datum/material/iron = 2000)

// Brass knuckles	Keywords: Damage 21, Stamina
/obj/item/melee/unarmed/brass/lovetap
	name = "Love Tap"
	desc = "Specially made brass knuckles, designed to get the most out of your love taps."
	icon_state = "brass"
	item_state = "brass"
	attack_verb = list("tapped", "punched", "jabbed", "whacked")
	force = 21

/obj/item/melee/unarmed/brass/lovetap/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(25, STAMINA, null, 0)

// Spiked knuckles	Keywords: Damage 18
/obj/item/melee/unarmed/brass/spiked
	name = "spiked knuckes"
	desc = "Unlike normal brass knuckles, these have a metal plate across the knuckles with four spikes on, one for each knuckle. So not only does the victim feel the force of the punch, but also the devastating effects of spikes being driven in."
	icon_state = "spiked"
	item_state = "spiked"
	sharpness = SHARP_POINTY
	force = 18

// Sappers			Keywords: Damage 18, Stamina
/obj/item/melee/unarmed/sappers
	name = "sappers"
	desc = "Lead filled gloves which are ideal for beating the crap out of opponents."
	icon_state = "sapper"
	item_state = "sapper"
	w_class = WEIGHT_CLASS_NORMAL
	force = 18

/obj/item/melee/unarmed/sappers/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(15, STAMINA, BODY_ZONE_HEAD, M.run_armor_check(BODY_ZONE_HEAD, "melee"))

// Tiger claws		Keywords: Damage 23, Pointy
/obj/item/melee/unarmed/tigerclaw
	name = "tiger claws"
	desc = "Gloves with short claws built into the palms."
	icon_state = "tiger_claw"
	item_state = "tiger_claw"
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("slashed", "sliced", "torn", "ripped", "diced", "cut")
	sharpness = SHARP_POINTY
	force = 23
	hitsound = 'sound/weapons/bladeslice.ogg'

// Lacerator		Keywords: Damage 20, Edged, Wound bonus
/obj/item/melee/unarmed/lacerator
	name = "lacerator"
	desc = "Leather gloves with razor blades built into the back of the hand."
	icon_state = "lacerator"
	item_state = "lacerator"
	w_class = WEIGHT_CLASS_NORMAL
	force = 20
	bare_wound_bonus = 5
	sharpness = SHARP_EDGED
	attack_verb = list("slashed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'

// Mace Glove		Keywords: Damage 23
/obj/item/melee/unarmed/maceglove
	name = "mace glove"
	desc = "Weighted metal gloves that are covered in spikes.  Don't expect to grab things with this."
	icon_state = "mace_glove"
	item_state = "mace_glove"
	w_class = WEIGHT_CLASS_BULKY
	force = 23
	sharpness = SHARP_NONE

// Punch Dagger		Keywords: Damage 22, Pointy
/obj/item/melee/unarmed/punchdagger
	name = "punch dagger"
	desc = "A dagger designed to be gripped in the user�s fist with the blade protruding between the middle and ring fingers, to increase the penetration of a punch."
	icon_state = "punch_dagger"
	item_state = "punch_dagger"
	force = 22
	sharpness = SHARP_POINTY
	attack_verb = list("stabbed", "sliced", "pierced", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/melee/unarmed/punchdagger/cyborg
	name = "assaultron claws"
	desc = "Razor sharp blades embedded into the grippers of an assaultron. Sharp."
	icon_state = "tiger_claw"
	item_state = "tiger_claw"
	// Staying at 40 instead of 23 since I don't think the punch code will work with borgs.
	force = 40 //Assaultron, so, makes sense.
	armour_penetration = 0.5

// Deathclaw Gauntlet	Keywords: Damage 21, AP 1
/obj/item/melee/unarmed/deathclawgauntlet
	name = "deathclaw gauntlet"
	desc = "The severed hand of a mighty Deathclaw, cured, hollowed out, and given a harness to turn it into the deadliest gauntlet the wastes have ever seen."
	icon_state = "deathclaw_g"
	item_state = "deathclaw_g"
	slot_flags = ITEM_SLOT_GLOVES
	w_class = WEIGHT_CLASS_NORMAL
	force = 21
	armour_penetration = 1
	sharpness = SHARP_EDGED
	attack_verb = list("slashed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'

// Sentient Deathclaw Gauntlet	Keywords: Damage 23, AP 1
/obj/item/melee/unarmed/sentientdeathclawgauntlet
	name = "sentient deathclaw gauntlet"
	desc = "This is an item created for the sentient deathclaws and is unique, DO NOT USE."
	icon_state = "sentientdeathclaw_g"
	item_state = "sentientdeathclaw_g"
	slot_flags = ITEM_SLOT_GLOVES
	w_class = WEIGHT_CLASS_NORMAL
	force = 23
	armour_penetration = 1
	sharpness = SHARP_EDGED
	attack_verb = list("slashed", "sliced", "torn", "ripped", "diced", "mauled")
	hitsound = 'sound/f13npc/deathclaw/aggro2.ogg'

//Yao Guai Gauntlet	Keywords: Damage 13, Fast, "Saw Bleed" Effect
/obj/item/melee/unarmed/yaoguaigauntlet
	name = "yao guai gauntlet"
	desc = "The severed hand of a yao guai, the hide cured, the muscles and bone removed, and given a harness to turn it into a deadly gauntlet. Usually seen around the hands of the Sorrows tribe."
	icon_state = "yao_guai_g"
	item_state = "deathclaw_g"
	slot_flags = ITEM_SLOT_GLOVES
	w_class = WEIGHT_CLASS_NORMAL
	force = 13
	sharpness = SHARP_EDGED
	attack_verb = list("slashed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_speed = CLICK_CD_MELEE * 0.7

/obj/item/melee/unarmed/yaoguaigauntlet/attack(mob/living/target, mob/living/user)
	. = ..()
	if(!isliving(target))
		return
	target.apply_status_effect(/datum/status_effect/stacking/saw_bleed/yaoguaigauntlet)
