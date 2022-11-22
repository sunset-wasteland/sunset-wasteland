//fallout teas

/datum/reagent/consumable/tea/buffalotea
	name = "Buffalo Tea"
	description = "A soothing herbal remedy from the buffalo gourd, commonly used to treat headaches and psychosis."
	color = "#FFFF91"
	nutriment_factor = 0
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	taste_description = "Knowledge and Unity"
	glass_icon_state = "spiritcleanserglass"
	glass_name = "Buffalo Tea"
	glass_desc = "A soothing herbal remedy steeped from buffalo gourd juice. It's often used to treat headaches and psychosis."

/datum/reagent/consumable/tea/buffalotea/on_mob_life(mob/living/carbon/M)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -3)
	if(prob(20))
		M.cure_trauma_type(resilience = TRAUMA_RESILIENCE_BASIC)
	if(prob(3))
		to_chat(M, "[pick(GLOB.wisdoms)]") //give them a random wisdom
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, updating_health = FALSE)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/agavetea
	name = "Agave Tea"
	description = "A soothing herbal remedy steeped from the agave plant. Promotes increased healing of burns and sores."
	color = "#FFFF91"
	nutriment_factor = 0
	taste_description = "bitterness"
	glass_icon_state = "tea"
	glass_name = "Agave Tea"
	glass_desc = "A soothing herbal remedy steeped from the agave plant. Promotes increased healing of burns and sores."

/datum/reagent/consumable/tea/agavetea/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-3*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.nutrition = max(M.nutrition - 3, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, updating_health = FALSE)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/broctea
	name = "Broc Tea"
	description = "A soothing herbal remedy steeped from the broc flower, used to treat shortness of breath."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "bitterness"
	glass_icon_state = "tea"
	glass_name = "Broc Tea"
	glass_desc = "A soothing herbal remedy steeped from the broc flower, used to treat shortness of breath."

/datum/reagent/consumable/tea/broctea/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-4*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.nutrition = max(M.nutrition - 3, 0)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, updating_health = FALSE)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE



/datum/reagent/consumable/tea/coyotetea
	name = "Coyote Tea"
	description = "A smokey herbal remedy steeped from coyote tobacco stems. Natural stimulants keep the drinker alert and awake while numbing the senses."
	color = "#008000"
	nutriment_factor = 0
	taste_description = "smoke"
	glass_icon_state = "coyotetea"
	glass_name = "Coyote Tea"
	glass_desc = "A smokey herbal remedy steeped from coyote tobacco stems. Natural stimulants keep the drinker alert and awake while numbing the senses."

/datum/reagent/consumable/tea/coyotetea/on_mob_life(mob/living/carbon/M)
	if(prob(10))
		var/smoke_message = pick("You feel relaxed.", "You feel calmed.","You feel alert.","You feel rugged.")
		to_chat(M, "<span class='notice'>[smoke_message]</span>")
	M.AdjustStun(-40, 0)
	M.AdjustKnockdown(-40, 0)
	M.AdjustUnconscious(-40, 0)
	M.adjustStaminaLoss(-1*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, updating_health = FALSE)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/feratea
	name = "Barrel Tea"
	description = "A sour and dry remedy steeped from barrel cactus fruit, used as an antitoxin for some of the most common toxins in the wasteland."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "bitterness"
	glass_icon_state = "tea"
	glass_name = "Barrel Tea"
	description = "A sour and dry remedy steeped from barrel cactus fruit, used as an antitoxin for some of the most common toxins in the wasteland."

/datum/reagent/consumable/tea/feratea/on_mob_life(mob/living/carbon/M)
	if(prob(80))
		M.Dizzy(-2)
		M.Jitter(-2)
	for(var/datum/reagent/R in M.reagents.reagent_list)
		if(R != src)
			M.reagents.remove_reagent(R.type,2.5)
	if(M.health > 20)
		M.adjustToxLoss(-3*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.radiation += 0.1
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, updating_health = FALSE)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	return TRUE // update health at end of tick

/datum/reagent/consumable/tea/pricklytea
	name = "Prickly Tea"
	description = "A sweet and fruity remedy steeped from prickly pear fruit. Keeps you on edge."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "sweetness"
	glass_icon_state = "cafe_latte"
	glass_name = "Prickly Tea"
	glass_desc = "A sweet and fruity remedy steeped from prickly pear fruit. Keeps you on edge."

/datum/reagent/consumable/tea/pricklytea/on_mob_life(mob/living/carbon/M)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
	..()
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, updating_health = FALSE)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE

/datum/reagent/consumable/tea/xandertea
	name = "Xander Tea"
	description = "A stimulating herbal remedy steeped from xander root extract. Promotes bloodflow, liver function, and blood production."
	color = "#FF6347"
	nutriment_factor = 0
	taste_description = "earthy"
	glass_icon_state = "coffee"
	glass_name = "Xander Tea"
	glass_desc = "A stimulating herbal remedy steeped from xander root extract. Promotes bloodflow, liver function, and blood production."

/datum/reagent/consumable/tea/xandertea/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(BLOOD_VOLUME_NORMAL, M.blood_volume + 3)
	M.adjustToxLoss(-4*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	M.dizziness = max(0,M.dizziness-2)
	M.drowsyness = max(0,M.drowsyness-1)
	M.jitteriness = max(0,M.jitteriness-3)
	M.AdjustSleeping(-20, FALSE)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1, updating_health = FALSE)
	M.adjust_bodytemperature(20 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, BODYTEMP_NORMAL)
	..()
	. = TRUE
