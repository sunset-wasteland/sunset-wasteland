/datum/unit_test/harm_punch/Run()
	var/mob/living/carbon/human/puncher = allocate(/mob/living/carbon/human)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)

	// Avoid all randomness in tests
	ADD_TRAIT(puncher, TRAIT_PERFECT_ATTACKER, INNATE_TRAIT)

	puncher.a_intent_change(INTENT_HARM)
	puncher.UnarmedAttack(victim)

	TEST_ASSERT(victim.getBruteLoss() > 0, "Victim took no brute damage after being punched")

/datum/unit_test/harm_melee/Run()
	var/mob/living/carbon/human/tider = allocate(/mob/living/carbon/human)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)
	var/obj/item/storage/toolbox/toolbox = allocate(/obj/item/storage/toolbox)

	tider.put_in_active_hand(toolbox, forced = TRUE)
	tider.a_intent_change(INTENT_HARM)
	victim.attackby(toolbox, tider)

	TEST_ASSERT(victim.getBruteLoss() > 0, "Victim took no brute damage after being hit by a toolbox")

/datum/unit_test/harm_different_damage/Run()
	var/mob/living/carbon/human/attacker = allocate(/mob/living/carbon/human)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)
	var/obj/item/weldingtool/welding_tool = allocate(/obj/item/weldingtool)

	attacker.put_in_active_hand(welding_tool, forced = TRUE)
	attacker.a_intent_change(INTENT_HARM)
	welding_tool.attack_self(attacker) // Turn it on
	victim.attackby(welding_tool, attacker)

	TEST_ASSERT_EQUAL(victim.getBruteLoss(), 0, "Victim took brute damage from a lit welding tool")
	TEST_ASSERT(victim.getFireLoss() > 0, "Victim took no burn damage after being hit by a lit welding tool")

/datum/unit_test/attack_chain
	var/attack_hit
	var/post_attack_hit
	var/pre_attack_hit

/datum/unit_test/attack_chain/proc/attack_hit()
	SIGNAL_HANDLER
	attack_hit = TRUE

/datum/unit_test/attack_chain/proc/post_attack_hit()
	SIGNAL_HANDLER
	post_attack_hit = TRUE

/datum/unit_test/attack_chain/proc/pre_attack_hit()
	SIGNAL_HANDLER
	pre_attack_hit = TRUE

/datum/unit_test/attack_chain/Run()
	var/mob/living/carbon/human/attacker = allocate(/mob/living/carbon/human)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)
	var/obj/item/storage/toolbox/toolbox = allocate(/obj/item/storage/toolbox)

	RegisterSignal(toolbox, COMSIG_ITEM_PRE_ATTACK, .proc/pre_attack_hit)
	RegisterSignal(toolbox, COMSIG_ITEM_ATTACK, .proc/attack_hit)
	RegisterSignal(toolbox, COMSIG_ITEM_AFTERATTACK, .proc/post_attack_hit)

	attacker.put_in_active_hand(toolbox, forced = TRUE)
	attacker.a_intent_change(INTENT_HARM)
	toolbox.melee_attack_chain(attacker, victim)

	TEST_ASSERT(pre_attack_hit, "Pre-attack signal was not fired")
	TEST_ASSERT(attack_hit, "Attack signal was not fired")
	TEST_ASSERT(post_attack_hit, "Post-attack signal was not fired")

/datum/unit_test/harm_unarmed_weapon/Run()
	var/mob/living/carbon/human/puncher = allocate(/mob/living/carbon/human)
	var/obj/item/melee/unarmed/brass/brass_knuckles = allocate(/obj/item/melee/unarmed/brass)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)

	// Avoid all randomness in tests
	ADD_TRAIT(puncher, TRAIT_PERFECT_ATTACKER, INNATE_TRAIT)
	
	puncher.equip_to_slot(brass_knuckles, SLOT_GLOVES)
	puncher.a_intent_change(INTENT_HARM)
	puncher.UnarmedAttack(victim)

	var/expected_damage = brass_knuckles.force + puncher.dna.species.punchdamagehigh
	TEST_ASSERT(victim.getBruteLoss() >= expected_damage, "Victim took too little damage after being punched")
	TEST_ASSERT(victim.getBruteLoss() <= expected_damage, "Victim took too much damage after being punched")

/datum/unit_test/harm_punch_ironfist/Run()
	var/mob/living/carbon/human/puncher = allocate(/mob/living/carbon/human)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)

	// Avoid all randomness in tests
	ADD_TRAIT(puncher, TRAIT_PERFECT_ATTACKER, INNATE_TRAIT)
	
	ADD_TRAIT(puncher, TRAIT_IRONFIST, INNATE_TRAIT)
	puncher.a_intent_change(INTENT_HARM)
	puncher.UnarmedAttack(victim)

	// todo: add a getter or define for the iron fist damage modifier
	// so we can check exact values rather than just if it's too low
	var/expected_damage = puncher.dna.species.punchdamagehigh
	TEST_ASSERT(victim.getBruteLoss() > expected_damage, "Victim took too little damage after being punched")

/datum/unit_test/harm_punch_bigleagues/Run()
	var/mob/living/carbon/human/puncher = allocate(/mob/living/carbon/human)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)

	// Avoid all randomness in tests
	ADD_TRAIT(puncher, TRAIT_PERFECT_ATTACKER, INNATE_TRAIT)
	
	ADD_TRAIT(puncher, TRAIT_BIG_LEAGUES, INNATE_TRAIT)
	puncher.a_intent_change(INTENT_HARM)
	puncher.UnarmedAttack(victim)

	var/expected_damage = puncher.dna.species.punchdamagehigh
	TEST_ASSERT(victim.getBruteLoss() >= expected_damage, "Victim took too little damage after being punched")
	TEST_ASSERT(victim.getBruteLoss() <= expected_damage, "Victim took too much damage after being punched")

/datum/unit_test/harm_unarmed_weapon_ironfist/Run()
	var/mob/living/carbon/human/puncher = allocate(/mob/living/carbon/human)
	var/obj/item/melee/unarmed/brass/brass_knuckles = allocate(/obj/item/melee/unarmed/brass)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)

	// Avoid all randomness in tests
	ADD_TRAIT(puncher, TRAIT_PERFECT_ATTACKER, INNATE_TRAIT)
	
	ADD_TRAIT(puncher, TRAIT_IRONFIST, INNATE_TRAIT)
	puncher.equip_to_slot(brass_knuckles, SLOT_GLOVES)
	puncher.a_intent_change(INTENT_HARM)
	puncher.UnarmedAttack(victim)

	var/expected_damage = brass_knuckles.force + puncher.dna.species.punchdamagehigh
	TEST_ASSERT(victim.getBruteLoss() > expected_damage, "Victim took too little damage after being punched")

/datum/unit_test/harm_unarmed_weapon_bigleagues/Run()
	var/mob/living/carbon/human/puncher = allocate(/mob/living/carbon/human)
	var/obj/item/melee/unarmed/brass/brass_knuckles = allocate(/obj/item/melee/unarmed/brass)
	var/mob/living/carbon/human/victim = allocate(/mob/living/carbon/human)

	// Avoid all randomness in tests
	ADD_TRAIT(puncher, TRAIT_PERFECT_ATTACKER, INNATE_TRAIT)
	
	ADD_TRAIT(puncher, TRAIT_BIG_LEAGUES, INNATE_TRAIT)
	puncher.equip_to_slot(brass_knuckles, SLOT_GLOVES)
	puncher.a_intent_change(INTENT_HARM)
	puncher.UnarmedAttack(victim)

	var/expected_damage = brass_knuckles.force + puncher.dna.species.punchdamagehigh
	TEST_ASSERT(victim.getBruteLoss() >= expected_damage, "Victim took too little damage after being punched")
	TEST_ASSERT(victim.getBruteLoss() <= expected_damage, "Victim took too much damage after being punched")
