// Icon definition overrides. These are duplicates, but here to reference for future reorganization.
/obj/item/shield
	icon = 'icons/fallout/objects/melee/shields.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/shields_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/shields_righthand.dmi'

//Bulletproof riot shield
/obj/item/shield/riot/bullet_proof
	name = "bullet resistant shield"
	desc = "Kevlar coated surface makes this riot shield a lot better for blocking projectiles."
	icon_state = "shield_bulletproof"
	item_state = "shield_bulletproof"
	block_parry_data = /datum/block_parry_data/shield/bulletproof
	armor = list("melee" = 50, "bullet" = 90, "laser" = 50, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 70)
	max_integrity = 1750
	slowdown = 0.2
	custom_materials = list(/datum/material/plastic=8000, /datum/material/titanium=1000)
	repair_material = /obj/item/stack/sheet/mineral/titanium

/datum/block_parry_data/shield/bulletproof
	block_damage_multiplier_override = list(ATTACK_TYPE_PROJECTILE_TEXT = 0.65)
	block_damage_absorption_override = list(ATTACK_TYPE_PROJECTILE_TEXT = 12.5)
	block_resting_stamina_penalty_multiplier = 2
	block_projectile_mitigation = 90
	block_damage_limit = 100

//Buckler. Cheapest shield, also the worst.
/obj/item/shield/riot/buckler
	name = "wooden buckler"
	desc = "A small wooden shield."
	icon_state = "shield_buckler"
	item_state = "shield_buckler"
	block_parry_data = /datum/block_parry_data/shield/scrap
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 40)
	max_integrity = 150
	custom_materials = list(/datum/material/wood = 18000)
	resistance_flags = FLAMMABLE
	repair_material = /obj/item/stack/sheet/mineral/wood
	shield_flags = SHIELD_FLAGS_LIGHT
	shieldbash_push_distance = 0
	shieldbash_knockback = 0

// Stop sign shield.
/obj/item/shield/riot/buckler/stop
	name = "stop sign buckler"
	desc = "Made from a ancient roadsign, with handles made of rope."
	icon_state = "shield_stop"
	item_state = "shield_stop"
	armor = list("melee" = 65, "bullet" = 60, "laser" = 65, "energy" = 0, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 40)
	max_integrity = 300
	slowdown = 0
	resistance_flags = null
	repair_material = /obj/item/stack/sheet/metal


//Legion shield
/obj/item/shield/riot/legion
	name = "legion shield"
	desc = "Heavy shield with metal pieces bolted to a wood backing, with a painted yellow bull insignia in the centre. Repair with metal."
	icon_state = "shield_legion"
	item_state = "shield_legion"
	block_parry_data = /datum/block_parry_data/shield/legion
	armor = list("melee" = 70, "bullet" = 60, "laser" = 60, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 40)
	force = 13
	slowdown = 0
	max_integrity = 500
	custom_materials = list(/datum/material/wood = 16000, /datum/material/iron= 16000)
	repair_material = /obj/item/stack/sheet/metal
	shield_flags = SHIELD_FLAGS_HEAVY

/obj/item/shield/riot/legion/shatter(mob/living/carbon/human/owner)
	playsound(owner, 'sound/effects/grillehit.ogg', 100)
	new /obj/item/stack/sheet/metal(get_turf(src))

/datum/block_parry_data/shield/legion
	block_damage_multiplier = 0.3
	block_damage_absorption = 7.5
	block_damage_limit = 30

//Scrap shield. Somewhat cheaper, simpler and worse than Legion shield but basically similar.
/obj/item/shield/riot/scrapshield
	name = "scrap shield"
	desc = "A large shield made of glued and welded sheets of metal. Heavy and clumsy, but at least its handle is wrapped in some cloth."
	icon_state = "shield_scrap"
	item_state = "shield_scrap"
	block_parry_data = /datum/block_parry_data/shield/scrap
	armor = list("melee" = 60, "bullet" = 60, "laser" = 60, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 40)
	max_integrity = 500
	slowdown = 0.1
	force = 13
	custom_materials = list(/datum/material/iron = 16000)
	repair_material = /obj/item/stack/sheet/metal
	shield_flags = SHIELD_FLAGS_DEFAULT

/datum/block_parry_data/shield/scrap
	block_damage_multiplier = 0.3
	block_damage_limit = 22

//Energy shield. Placeholder for the experimental BoS shield concept that never got implemented I suppose.
/obj/item/shield/energy
	name = "experimental energy shield"
	desc = "A forcefield that reflects almost all energy projectiles, but is useless against physical attacks. It can be retracted, expanded, and stored anywhere."
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("shoved", "bashed")
	throw_range = 5
	force = 3
	throwforce = 3
	throw_speed = 3
	var/base_icon_state = "shield_energy" // [base_icon_state]1 for expanded, [base_icon_state]0 for contracted
	var/on_force = 10
	var/on_throwforce = 8
	var/on_throw_speed = 2
	var/active = 0
	var/clumsy_check = TRUE

/obj/item/shield/energy/Initialize()
	. = ..()
	icon_state = "[base_icon_state]0"

/obj/item/shield/energy/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if((attack_type & ATTACK_TYPE_PROJECTILE) && is_energy_reflectable_projectile(object))
		block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
		return BLOCK_SUCCESS | BLOCK_REDIRECTED | BLOCK_SHOULD_REDIRECT
	return ..()

/obj/item/shield/energy/active_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return, override_direction)
	if((attack_type & ATTACK_TYPE_PROJECTILE) && is_energy_reflectable_projectile(object))
		block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
		return BLOCK_SUCCESS | BLOCK_REDIRECTED | BLOCK_SHOULD_REDIRECT
	return ..()

/obj/item/shield/energy/attack_self(mob/living/carbon/human/user)
	if(clumsy_check && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		to_chat(user, "<span class='userdanger'>You beat yourself in the head with [src]!</span>")
		user.take_bodypart_damage(5)
	active = !active
	icon_state = "[base_icon_state][active]"

	if(active)
		force = on_force
		throwforce = on_throwforce
		throw_speed = on_throw_speed
		w_class = WEIGHT_CLASS_BULKY
		playsound(user, 'sound/weapons/saberon.ogg', 35, TRUE)
		to_chat(user, "<span class='notice'>[src] is now active.</span>")
	else
		force = initial(force)
		throwforce = initial(throwforce)
		throw_speed = initial(throw_speed)
		w_class = WEIGHT_CLASS_TINY
		playsound(user, 'sound/weapons/saberoff.ogg', 35, TRUE)
		to_chat(user, "<span class='notice'>[src] can now be concealed.</span>")
	add_fingerprint(user)

/obj/item/shield/riot/tower
	name = "tower shield"
	desc = "A heavy metal tower shield. Very unwieldly."
	icon_state = "shield_tower"
	item_state = "shield_tower"
	slot_flags = ITEM_SLOT_BACK
	shieldbash_cooldown = 8 SECONDS
	shieldbash_brutedamage = 50//if you close in with this, and land a shieldbash you should deal a good bit of damage
	shieldbash_stamdmg = 80//and stamina
	force = 25
	block_parry_data = /datum/block_parry_data/shield/tower
	throwforce = 5
	throw_speed = 1
	throw_range = 1
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = list(/datum/material/iron = 32000)
	repair_material = /obj/item/stack/sheet/metal
	shield_flags = SHIELD_FLAGS_HEAVY
	max_integrity = 3000

/datum/block_parry_data/shield/tower
	block_slowdown = 0.75
	block_damage_multiplier = 0.7
	block_stamina_efficiency = 10
	block_stamina_cost_per_second = 5
	block_damage_absorption = 20
	block_damage_limit = 160
	block_start_delay = 10 //1 second to start blocking

/obj/item/shield/riot/tower/scrap
	name = "scrap-tower shield"
	desc = "A heavy metal tower shield, made from scrap metal. Very unwieldly."
	icon_state = "shield_scraptower"
	item_state = "shield_scraptower"
	shieldbash_brutedamage = 40
	shieldbash_stamdmg = 60
	shield_flags = SHIELD_FLAGS_DEFAULT //no guaranteed kd on bash, sorry
	block_parry_data = /datum/block_parry_data/shield/tower/scrap
	max_integrity = 1500

/datum/block_parry_data/shield/tower/scrap
	block_damage_multiplier = 0.6
	block_stamina_efficiency = 7.5
	block_damage_absorption = 15
