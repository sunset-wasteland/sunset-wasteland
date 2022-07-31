/obj/machinery/computer/vertibird_console
	name = "Vertibird control"
	desc = "Used to control the autopilot on linked vertibirds."
	icon = 'icons/fallout/machines/terminals.dmi'
	icon_state = "enclave"
	icon_screen = "enclave_on"
	connectable = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/machinery/computer/vertibird_console/attack_hand(mob/user)
	if(!HAS_TRAIT(user, TRAIT_PILOT))
		to_chat(user, "<span class='warning'>The Vertibird rejects your authorization codes!</span>")
		playsound(src, 'sound/effects/alert.ogg', 50, 1)
		return
	else
		GLOB.vertibird:beginFly()
