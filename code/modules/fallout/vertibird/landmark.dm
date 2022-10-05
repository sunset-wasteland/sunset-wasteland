/obj/effect/landmark/vertibird
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x"
	anchored = 1
	invisibility = INVISIBILITY_ABSTRACT
	var/id

/obj/effect/landmark/vertibird/New()
	GLOB.vertibirdLandZone += src
	..()

/obj/effect/landmark/vertibird_enter
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "x"
	anchored = 1
	invisibility = INVISIBILITY_ABSTRACT
	var/id

/obj/effect/landmark/vertibird_enter/New()
	GLOB.vertibirdEnterZone = locate(src.x, src.y, src.z)
	..()

/obj/effect/landmark/vertibird/flare/New()
	..()
//	var/message = "Long-range scanners detected new emergency signal. Landing locations updated"
	for(var/obj/machinery/computer/vertibird_console/C in GLOB.vertibird_console)
//		C.radio.talk_into("traffic control beacon", message, RADIO_CHANNEL_ENCLAVE, get_spans())
		C.say("Long-range scanners detected new emergency signal. Landing locations updated")
