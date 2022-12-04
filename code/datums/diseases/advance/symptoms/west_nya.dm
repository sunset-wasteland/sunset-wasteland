/*
//////////////////////////////////////
West Nya Virus

	Noticeable.
	Lowers resistance.
	Decreases stage speed.
	Increased transmittable.
	Fatal Level.

Bonus
	Scrambles a mobs brain. Causing confusion in communication.

//////////////////////////////////////
*/

/datum/symptom/west_nya_virus

	name = "West Nya"
	desc = "The virus alters the language centers of the brain, changing how they communicate."
	stealth = -1
	resistance = -2
	stage_speed = -2
	transmittable = 2
	level = 6
	severity = 2
	base_message_chance = 100
	symptom_delay_min = 60
	symptom_delay_max = 120
	var/howls = FALSE
	threshold_desc = list(
		"Transmission 14" = "The host's language center of the brain is damaged, leading to bouts of animal noises.",
		"Stage Speed 7" = "Changes voice faster.",
		"Stealth 3" = "The symptom remains hidden until active."
	)

/datum/symptom/west_nya_virus/Start(datum/disease/advance/A)
	if(!..())
		return
	if(A.properties["stealth"] >= 3)
		suppress_warning = TRUE
	if(A.properties["stage_rate"] >= 7) //faster change of voice
		symptom_delay_min = 25
		symptom_delay_max = 85
	if(A.properties["transmittable"] >= 14) //random howls
		howls = TRUE

/datum/symptom/west_nya_virus/Activate(datum/disease/advance/A)
	if(!..())
		return
	var/mob/living/carbon/M = A.affected_mob
	switch(A.stage)
		if(1, 2, 3, 4)
			if(prob(base_message_chance) && !suppress_warning) //Stolen from furranium
				var/list/seen = M.fov_view() - M //Sound and sight checkers
				for(var/victim in seen)
					if(isanimal(victim) || !isliving(victim))
						seen -= victim
				if(LAZYLEN(seen))
					to_chat(M, "You notice [pick(seen)]'s bulge [pick("OwO!", "uwu!")]")
		else
			M.uwuslurring = 100 // It can be a long time between ticks, cost is you may have uwu speak for a bit after its cured.
			if(howls)	
				if(prob(10))
					to_chat(M, "You find yourself unable to supress the desire to meow!")
					M.emote("nya")
				if(prob(10))
					to_chat(M, "You find yourself unable to supress the desire to howl!")
					M.emote("wolfhowl")
