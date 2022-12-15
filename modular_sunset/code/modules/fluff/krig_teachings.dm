/datum/martial_art/krigserker
	name = "Krigserker"
	id = MARTIALART_KRIGSERKER
	var/datum/action/krigserker/krigserker = new/datum/action/krigserker()

/datum/action/krigserker
	name = "Defensive Takedown - Trips the victim, knocking them down for a brief moment."
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "legsweep"

/datum/action/krigserker/Trigger()
	if(owner.incapacitated())
		to_chat(owner, "<span class='warning'>You can't use [name] while you're incapacitated.</span>")
		return
	var/mob/living/carbon/human/H = owner
	if (H.mind.martial_art.streak == "krigserker")
		owner.visible_message("<span class='danger'>[owner] assumes a neutral stance.</span>", "<b><i>Your next attack is cleared.</i></b>")
		H.mind.martial_art.streak = ""
	else
		if(HAS_TRAIT(H, TRAIT_PACIFISM))
			to_chat(H, "<span class='warning'>You don't want to harm other people!</span>")
			return
		owner.visible_message("<span class='danger'>[owner] assumes a defensive stance!</span>", "<b><i>Your next attack will be a Takedown.</i></b>")
		H.mind.martial_art.streak = "krigserker"

/datum/martial_art/krigserker/disarm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(check_streak(A,D))
		return TRUE

/datum/martial_art/krigserker/grab_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(check_streak(A,D))
		return TRUE
	..()

/datum/martial_art/krigserker/harm_act(mob/living/carbon/human/A, mob/living/carbon/human/D)
	if(check_streak(A,D))
		return TRUE

/datum/martial_art/krigserker/check_streak(mob/living/carbon/human/A, mob/living/carbon/human/D)
	switch(streak)
		if("krigserker")
			streak = ""
			krigserker(A,D)
			return TRUE
	return FALSE

/datum/martial_art/krigserker/proc/krigserker(mob/living/carbon/human/A, mob/living/carbon/human/D)
	var/obj/item/bodypart/affecting = D.get_bodypart(ran_zone(A.zone_selected)) //Applies damage to selected area.
	var/armor_block = D.run_armor_check(affecting, "melee") //Checks Defender's armour.
	var/damage = (damage_roll(A,D) + 5) //Rolls damage based on the Attacker and Defender and if they have combat mode on or not, along with a flat +5 brute damage.
	if(!CHECK_MOBILITY(D, MOBILITY_STAND)) //If the target is not upright, it is a regular disarm.
		return FALSE
	D.visible_message("<span class='warning'>[A] leg sweeps [D], performing a Defensive Takedown!", \
						"<span class='userdanger'>[A] uses the Defensive Takedown on you!</span>")
	A.do_attack_animation(D, ATTACK_EFFECT_PUNCH)
	A.adjustStaminaLoss(30) //The disarm will cost stamina to use. You are able to take down four opponents in quick succession before your stamina caps out.
	playsound(get_turf(A), 'sound/effects/hit_kick.ogg', 50, 1, -1)
	D.apply_damage(damage, BRUTE, affecting, armor_block)
	D.DefaultCombatKnockdown(rand(10,30)) //Due to the defensive nature of the move, it shouldn't be longer than putting on a pair of cuffs. (30)
	log_combat(A, D, "sweeped (Defensive Takedown)")
	return TRUE

/datum/martial_art/krigserker/teach(mob/living/carbon/human/H, make_temporary = FALSE)
	. = ..()
	if(!.)
		return
	ADD_TRAIT(H, TRAIT_PIERCEIMMUNE, KRIGSERKER_TRAIT)
	ADD_TRAIT(H, TRAIT_NODISMEMBER, KRIGSERKER_TRAIT)
	ADD_TRAIT(H, TRAIT_NOHARDCRIT, KRIGSERKER_TRAIT)
	ADD_TRAIT(H, TRAIT_BERSERKER, KRIGSERKER_TRAIT)
	H.physiology.stamina_mod *= 0.3 //more stamina
	H.physiology.stun_mod *= 0.3 //better stun resistance
	H.sprint_stamina_cost = 0 //Infinite sprint. The character that uses this isn't able to engage in combat.
	H.see_in_dark = 8
	H.lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE

/datum/martial_art/krigserker/on_remove(mob/living/carbon/human/H)
	. = ..()
	REMOVE_TRAIT(H, TRAIT_PIERCEIMMUNE, KRIGSERKER_TRAIT)
	REMOVE_TRAIT(H, TRAIT_NODISMEMBER, KRIGSERKER_TRAIT)
	REMOVE_TRAIT(H, TRAIT_NOHARDCRIT, KRIGSERKER_TRAIT)
	REMOVE_TRAIT(H, TRAIT_BERSERKER, KRIGSERKER_TRAIT)
	H.physiology.stamina_mod = initial(H.physiology.stamina_mod)
	H.physiology.stun_mod = initial(H.physiology.stun_mod)
	H.sprint_stamina_cost = initial(H.sprint_stamina_cost)
	H.see_in_dark = initial(H.see_in_dark)
	H.lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE
