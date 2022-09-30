/datum/weather/snow_storm
	name = "snow storm"
	desc = "An incredibly harsh snowstorm."
	probability = 90

	telegraph_message = "<span class='warning'>Drifting particles of snow begin to dust the surrounding area..</span>"
	telegraph_duration = 300
	telegraph_overlay = "light_snow"

	weather_message = "<span class='userdanger'><i>Harsh winds pick up as dense snow begins to fall from the sky! Seek shelter!</i></span>"
	weather_overlay = "snow_storm"
	weather_duration_lower = 600
	weather_duration_upper = 1500

	end_duration = 100
	end_message = "<span class='boldannounce'>The snowfall dies down, it should be safe to go outside again.</span>"
	end_overlay = "light_snow"

	area_types = list(/area/f13/mountain_area)
	protect_indoors = TRUE
//	target_trait = ZTRAIT_SNOWSTORM
	target_trait = ZTRAIT_SURFACE

	immunity_type = "snow"

	barometer_predictable = TRUE


/datum/weather/snow_storm/weather_act(mob/living/L)
	L.adjust_bodytemperature(-rand(15,25))//raised from 5 - 15

