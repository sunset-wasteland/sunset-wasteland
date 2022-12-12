//Synth special snowflake reagents
//Ultra-Lube: Meth
/datum/reagent/drug/ultra
	name = "Ultra-Lube"
	description = "Ultra-Lube is an enhanced lubricant which induces effect similar to Methamphetamine in synthetic users by drastically reducing internal friction and increasing cooling capabilities."
	reagent_state = LIQUID
	color = "#1BB1FF"
	overdose_threshold = 20
	addiction_threshold = 10
	metabolization_rate = 0.75 * REAGENTS_METABOLISM
	var/brain_damage = TRUE
	var/jitter = TRUE
	var/confusion = TRUE
	pH = 5
	value = REAGENT_VALUE_UNCOMMON
	synthfriendly = TRUE

/datum/reagent/drug/ultra/on_mob_metabolize(mob/living/L)
	..()
	if(isrobotic(L))
		L.ignore_slowdown(type)
		ADD_TRAIT(L, TRAIT_TASED_RESISTANCE, type)

/datum/reagent/drug/ultra/on_mob_end_metabolize(mob/living/L)
	L.unignore_slowdown(type)
	REMOVE_TRAIT(L, TRAIT_TASED_RESISTANCE, type)
	..()

/datum/reagent/drug/ultra/on_mob_life(mob/living/carbon/M)
	if(!(isrobotic(M)))
		M.Jitter(20)
		M.Dizzy(20)
		M.adjustToxLoss(5, 0)
		if(prob(50))
			M.emote(pick("twitch","shiver","ping"))
		..()
		. = 1
	var/high_message = pick("You feel your servos whir!", "You feel like you need to go faster.", "You feel like you were just overclocked!")
	if(prob(5))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.AdjustAllImmobility(-40, 0)
	M.AdjustUnconscious(-40, 0)
	M.adjustStaminaLoss(-7.5 * REM, 0)
	if(jitter)
		M.Jitter(2)
	if(brain_damage)
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1,4))
	M.heal_overall_damage(2, 2)
	if(prob(5))
		M.emote(pick("twitch", "shiver", "ping"))
	..()
	. = 1

/datum/reagent/drug/ultra/overdose_process(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i in 1 to 4)
			step(M, pick(GLOB.cardinals))
	if(prob(20))
		M.emote("ping")
	if(prob(33))
		M.visible_message("<span class='danger'>[M]'s hands flip out and flail everywhere!</span>")
		M.drop_all_held_items()
	..()
	M.adjustToxLoss(1, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, pick(0.5, 0.6, 0.7, 0.8, 0.9, 1))
	. = 1

/datum/reagent/drug/ultra/addiction_act_stage1(mob/living/M)
	M.Jitter(5)
	if(prob(20))
		M.emote(pick("twitch","shiver","ping"))
	..()

/datum/reagent/drug/ultra/addiction_act_stage2(mob/living/M)
	M.Jitter(10)
	M.Dizzy(10)
	if(prob(30))
		M.emote(pick("twitch","shiver","ping"))
	..()

/datum/reagent/drug/ultra/addiction_act_stage3(mob/living/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	if(prob(40))
		M.emote(pick("twitch","shiver","ping"))
	..()

/datum/reagent/drug/ultra/addiction_act_stage4(mob/living/carbon/human/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovable(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(20)
	M.Dizzy(20)
	M.adjustToxLoss(5, 0)
	if(prob(50))
		M.emote(pick("twitch","shiver","ping"))
	..()
	. = 1
