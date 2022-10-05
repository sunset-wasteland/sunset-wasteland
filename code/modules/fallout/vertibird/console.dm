/obj/machinery/computer/vertibird_console
	name = "Vertibird control"
	desc = "Used to control the autopilot on linked vertibirds."
	icon = 'icons/fallout/machines/terminals.dmi'
	icon_state = "enclave"
	icon_screen = "enclave_on"
	connectable = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/obj/item/radio/radio
	var/radio_key = /obj/item/encryptionkey/headset_enclave
	var/channel = RADIO_CHANNEL_ENCLAVE

/obj/machinery/computer/vertibird_console/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	radio = new(src)
	GLOB.vertibird_console += src

/obj/machinery/computer/vertibird_console/Destroy()
	GLOB.vertibird_console -= src
	. = ..()

/obj/machinery/computer/vertibird_console/attack_hand(mob/user)
	if(!HAS_TRAIT(user, TRAIT_PILOT))
		to_chat(user, "<span class='warning'>The Vertibird rejects your authorization codes!</span>")
		playsound(src, 'sound/effects/alert.ogg', 50, 1)
		return
	else
		GLOB.vertibird:beginFly()

/obj/machinery/computer/camera_advanced/verti
	name = "vertibird camera console"
	desc = "Used to access the various cameras on the outside of the aircraft."
	networks = list("vertibird")

//AAAAAAAAAAAAAAAAAAAAA
/obj/machinery/computer/camera_advanced/verti/can_use(mob/living/user)
	return TRUE

//Vertibird
/obj/vertibird/Moved(oldLoc, dir)
	. = ..()
	update_camera_location(oldLoc)

/obj/vertibird/forceMove(atom/destination)
	. = ..()
	//Only bother updating the camera if we actually managed to move
	if(.)
		update_camera_location(destination)

/obj/vertibird/proc/do_camera_update(oldLoc)
	if(!QDELETED(VertiCamera) && oldLoc != get_turf(src))
		GLOB.cameranet.updatePortableCamera(VertiCamera)
	updating = FALSE

#define VERTIBIRD_CAMERA_BUFFER 10
/obj/vertibird/proc/update_camera_location(oldLoc)
	oldLoc = get_turf(oldLoc)
	if(!QDELETED(VertiCamera) && !updating && oldLoc != get_turf(src))
		updating = TRUE
		addtimer(CALLBACK(src, .proc/do_camera_update, oldLoc), VERTIBIRD_CAMERA_BUFFER)
#undef VERTIBIRD_CAMERA_BUFFER
