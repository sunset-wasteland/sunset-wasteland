#define STUN_SET_AMOUNT 40

/obj/item/organ/cyberimp
	name = "cybernetic implant"
	desc = "A state-of-the-art implant that improves a baseline's functionality."
	status = ORGAN_ROBOTIC
	organ_flags = ORGAN_SYNTHETIC
	var/implant_color = "#FFFFFF"
	var/implant_overlay
	var/syndicate_implant = FALSE //Makes the implant invisible to health analyzers and medical HUDs.

/obj/item/organ/cyberimp/New(mob/M = null)
	if(iscarbon(M))
		src.Insert(M)
	if(implant_overlay)
		var/mutable_appearance/overlay = mutable_appearance(icon, implant_overlay)
		overlay.color = implant_color
		add_overlay(overlay)
	return ..()



//[[[[BRAIN]]]]

/obj/item/organ/cyberimp/brain
	name = "cybernetic brain implant"
	desc = "Injectors of extra sub-routines for the brain."
	icon_state = "brain_implant"
	implant_overlay = "brain_implant_overlay"
	zone = BODY_ZONE_HEAD
	w_class = WEIGHT_CLASS_TINY

/obj/item/organ/cyberimp/brain/emp_act(severity)
	. = ..()
	if(!owner || . & EMP_PROTECT_SELF)
		return
	var/stun_amount = 2*severity
	owner.Stun(stun_amount)
	to_chat(owner, "<span class='warning'>Your body seizes up!</span>")

/obj/item/organ/cyberimp/brain/anti_drop
	name = "anti-drop implant"
	desc = "This cybernetic brain implant will allow you to force your hand muscles to contract, preventing item dropping. Twitch ear to toggle."
	var/active = 0
	var/list/stored_items = list()
	implant_color = "#DE7E00"
	slot = ORGAN_SLOT_BRAIN_ANTIDROP
	actions_types = list(/datum/action/item_action/organ_action/toggle)

/obj/item/organ/cyberimp/brain/anti_drop/ui_action_click()
	active = !active
	if(active)
		for(var/obj/item/I in owner.held_items)
			stored_items += I

		var/list/L = owner.get_empty_held_indexes()
		if(LAZYLEN(L) == owner.held_items.len)
			to_chat(owner, "<span class='notice'>You are not holding any items, your hands relax...</span>")
			active = 0
			stored_items = list()
		else
			for(var/obj/item/I in stored_items)
				to_chat(owner, "<span class='notice'>Your [owner.get_held_index_name(owner.get_held_index_of_item(I))]'s grip tightens.</span>")
				ADD_TRAIT(I, TRAIT_NODROP, ANTI_DROP_IMPLANT_TRAIT)

	else
		release_items()
		to_chat(owner, "<span class='notice'>Your hands relax...</span>")

/obj/item/organ/cyberimp/brain/anti_drop/emp_act(severity)
	. = ..()
	if(!owner || . & EMP_PROTECT_SELF)
		return
	var/range = severity/10
	var/atom/A
	if(active)
		release_items()
	for(var/obj/item/I in stored_items)
		A = pick(oview(range))
		I.throw_at(A, range, 2)
		to_chat(owner, "<span class='warning'>Your [owner.get_held_index_name(owner.get_held_index_of_item(I))] spasms and throws the [I.name]!</span>")
	stored_items = list()

/obj/item/organ/cyberimp/brain/anti_drop/proc/release_items()
	for(var/obj/item/I in stored_items)
		REMOVE_TRAIT(I, TRAIT_NODROP, ANTI_DROP_IMPLANT_TRAIT)
	stored_items = list()


/obj/item/organ/cyberimp/brain/anti_drop/Remove(special = FALSE)
	if(active)
		ui_action_click()
	return ..()


/obj/item/organ/cyberimp/brain/anti_stun
	name = "CNS Rebooter implant"
	desc = "This implant will automatically give you back control over your central nervous system, reducing downtime when stunned."
	implant_color = "#FFFF00"
	slot = ORGAN_SLOT_BRAIN_ANTISTUN

/obj/item/organ/cyberimp/brain/anti_stun/on_life()
	. = ..()
	if(!. || crit_fail)
		return
	owner.adjustStaminaLoss(-3.5, FALSE) //Citadel edit, makes it more useful in Stamina based combat
	owner.HealAllImmobilityUpTo(STUN_SET_AMOUNT)

/obj/item/organ/cyberimp/brain/anti_stun/emp_act(severity)
	. = ..()
	if(crit_fail || (organ_flags & ORGAN_FAILING) || . & EMP_PROTECT_SELF)
		return
	crit_fail = TRUE
	organ_flags |= ORGAN_FAILING
	addtimer(CALLBACK(src, .proc/reboot), 0.9 * severity)

/obj/item/organ/cyberimp/brain/anti_stun/proc/reboot()
	crit_fail = FALSE
	organ_flags &= ~ORGAN_FAILING


//[[[[MOUTH]]]]
/obj/item/organ/cyberimp/mouth
	zone = BODY_ZONE_PRECISE_MOUTH

/obj/item/organ/cyberimp/mouth/breathing_tube
	name = "breathing tube implant"
	desc = "This simple implant adds an internals connector to your back, allowing you to use internals without a mask and protecting you from being choked."
	icon_state = "implant_mask"
	slot = ORGAN_SLOT_BREATHING_TUBE
	w_class = WEIGHT_CLASS_TINY

/obj/item/organ/cyberimp/mouth/breathing_tube/emp_act(severity)
	. = ..()
	if(!owner || . & EMP_PROTECT_SELF)
		return
	if(prob(0.6*severity))
		to_chat(owner, "<span class='warning'>Your breathing tube suddenly closes!</span>")
		owner.losebreath += 2

// [[[[Custom]]]]

/obj/item/organ/cyberimp/brain/neuro
	name = "experimental neuro-editor implant"
	desc = "This cybernetic brain implant is borderline alien; it has pre-war tech combined with experimental technology. You aren't entirely sure what it does, but it seems to almost entirely rewire the neuropaths of the brain. This must heavily tax the body."
	var/active = 0
	var/list/stored_items = list()
	slot = ORGAN_SLOT_BRAIN_ANTISTUN
	actions_types = list(/datum/action/item_action/organ_action/toggle)

/obj/item/organ/cyberimp/chest/neuro/on_life()
	ADD_TRAIT(owner, TRAIT_FEARLESS, type)
	if(mood.sanity <= SANITY_NEUTRAL) //joywire
		mood.setSanity(min(mood.sanity+5, SANITY_NEUTRAL))
		to_chat(owner, "<span class='notice'>You feel more stable...</span>")
	owner.adjustStaminaLoss(-3.5, FALSE) //CNS reboot
	owner.HealAllImmobilityUpTo(STUN_SET_AMOUNT)
	var/mob/living/carbon/C = M //pain editor start. surg success 80% on self
			for(var/s in C.surgeries)
				var/datum/surgery/S = s
				S.success_multiplier = max(0.8, S.success_multiplier)
	ADD_TRAIT(owner, TRAIT_IGNOREDAMAGESLOWDOWN, type)
	owner.adjustOrganLoss(ORGAN_SLOT_BRAIN, 0.001)// it slowly kills you over time, requiring medicine.
	owner.adjustOrganLoss(ORGAN_SLOT_HEART, 0.001)
	

/obj/item/organ/cyberimp/brain/neuro/ui_action_click()
	active = !active
	if(active)
		for(mob/living/owner)
			var/obj/item/organ/brain/B = M.getorganslot(ORGAN_SLOT_BRAIN)// synaptic burnout
			B.applyOrganDamage(100)
			M.visible_message("<span class='danger'>[M]'s eyes roll into the back of their head and blood flows out of their nostrils. almost as if their brain fryed.</span>")
			
