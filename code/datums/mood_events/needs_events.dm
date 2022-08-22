//nutrition
/datum/mood_event/nutrition/fat
	description = "<span class='warning'><B>I'm so fat...</B></span>\n" //muh fatshaming
	mood_change = -4

/datum/mood_event/nutrition/wellfed
	description = "<span class='nicegreen'>My belly feels round and full.</span>\n"
	mood_change = 6

/datum/mood_event/nutrition/fed
	description = "<span class='nicegreen'>I have recently had some food.</span>\n"
	mood_change = 3

/datum/mood_event/nutrition/hungry
	description = "<span class='warning'>I'm getting a bit hungry.</span>\n"
	mood_change = -8

/datum/mood_event/nutrition/starving
	description = "<span class='boldwarning'>I'm starving!</span>\n"
	mood_change = -15

//water
/datum/mood_event/nutrition/slaked
	description = "<span class='nicegreen'>I'm topped up!</span>\n"
	mood_change = 4

/datum/mood_event/nutrition/thirsty
	description = "<span class='warning'>I'm slightly thirsty.</span>\n"
	mood_change = 6

/datum/mood_event/nutrition/thirsty2
	description = "<span class='warning'>I'm very thirsty!</span>\n"
	mood_change = -4

/datum/mood_event/nutrition/thirsty3
	description = "<span class='boldwarning'>I'm going to die of thirst!</span>\n"
	mood_change = -6

/datum/mood_event/nutrition/thirsty4
	description = "<span class='boldwarning'>This is how I die...</span>\n"
	mood_change = -12

//charge
/datum/mood_event/supercharged
	description = "<span class='boldwarning'>I can't possibly keep all this power inside, I need to release some quick!</span>\n"
	mood_change = -10

/datum/mood_event/overcharged
	description = "<span class='warning'>I feel dangerously overcharged, perhaps I should release some power.</span>\n"
	mood_change = -4

/datum/mood_event/charged
	description = "<span class='nicegreen'>I feel the power in my veins!</span>\n"
	mood_change = 6

/datum/mood_event/lowpower
	description = "<span class='warning'>My power is running low, I should go charge up somewhere.</span>\n"
	mood_change = -6

/datum/mood_event/decharged
	description = "<span class='boldwarning'>I'm in desperate need of some electricity!</span>\n"
	mood_change = -10

//Disgust
/datum/mood_event/gross
	description = "<span class='warning'>I saw something gross.</span>\n"
	mood_change = -2

/datum/mood_event/verygross
	description = "<span class='warning'>I think I'm going to puke...</span>\n"
	mood_change = -5

/datum/mood_event/disgusted
	description = "<span class='boldwarning'>Oh god that's disgusting...</span>\n"
	mood_change = -8

/datum/mood_event/disgust/bad_smell
	description = "<span class='warning'>You smell something horribly decayed inside this room.</span>\n"
	mood_change = -3

/datum/mood_event/disgust/nauseating_stench
	description = "<span class='warning'>The stench of rotting carcasses is unbearable!</span>\n"
	mood_change = -7

//Generic needs events
/datum/mood_event/favorite_food
	description = "<span class='nicegreen'>I really enjoyed eating that.</span>\n"
	mood_change = 3
	timeout = 2400

/datum/mood_event/gross_food
	description = "<span class='warning'>I really didn't like that food.</span>\n"
	mood_change = -2
	timeout = 2400

/datum/mood_event/disgusting_food
	description = "<span class='warning'>That food was disgusting!</span>\n"
	mood_change = -4
	timeout = 2400

/datum/mood_event/nice_shower
	description = "<span class='nicegreen'>I have recently had a nice shower.</span>\n"
	mood_change = 2
	timeout = 3 MINUTES
