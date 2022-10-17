//This was coded by Fulminating Gold for Crashpoint3.
//I do not want my code to be associated with ERP, and no
//server allowing it has my permission to use this code

// An exception, after speaking with him, has been made for Sunset Wasteland. The F13 server.
// He has not extended this to anyone else. Speak to him instead of just nabbing it if you've any respect.
// - Carl

/obj/item/gunpart
	name = "gunpart"
	desc = "A part for constructing a gun."
	icon = 'icons/obj/guns/modifiableguns.dmi'
	icon_state = "unknown"
	w_class = WEIGHT_CLASS_SMALL
	//all variable are percent increase unless stated otherwise
	var/accuracymodifier = 0//percent decrease (accuracy increase)
	var/damagemodifier = 0
	var/firedelaymodifier = 0//percent decrease (fire rate increase)
	var/penetrationmodifier = 0
	var/burstmodifier = 0
	var/parttype = "unknown"
	var/partlocation = "unknown" //north south east west internal internal2
	var/attachx = 0
	var/attachy = 0
	var/size = 0

//Barrels

/obj/item/gunpart/barrel_extension_50mm
	name = "50mm Barrel Extension Kit"
	desc = "A kit for extending a gun barrel by 50mm."
	icon_state = "Barrel50mm"
	w_class = WEIGHT_CLASS_NORMAL
	damagemodifier = -0.1
	accuracymodifier = 0.2
	firedelaymodifier = 0.2
	penetrationmodifier = 0.4
	burstmodifier = 0
	parttype = "barrel"
	partlocation = "east"
	attachx = 13
	attachy = 17
	size = 1

/obj/item/gunpart/barrel_extension_80mm
	name = "80mm Barrel Extension Kit"
	desc = "A kit for extending a gun barrel by 80mm."
	icon_state = "Barrel80mm"
	w_class = WEIGHT_CLASS_NORMAL
	damagemodifier = -0.15
	accuracymodifier = 0.35
	firedelaymodifier = 0.3
	penetrationmodifier = 0.7
	burstmodifier = 0
	parttype = "barrel"
	partlocation = "east"
	attachx = 13
	attachy = 17
	size = 2

//Receivers

/obj/item/gunpart/BHS_Receiver
	name = "Basic High Speed Receiver Kit"
	desc = "A basic high speed receiver kit."
	icon_state = "BHS-Receiver"
	w_class = WEIGHT_CLASS_NORMAL
	damagemodifier = 0
	accuracymodifier = 0
	firedelaymodifier = 0.1
	penetrationmodifier = 0
	burstmodifier = 0
	parttype = "receiver"
	partlocation = "internal"

/obj/item/gunpart/BHP_Receiver
	name = "Basic High Power Receiver Kit"
	desc = "A basic high power receiver kit."
	icon_state = "BHP-Receiver"
	w_class = WEIGHT_CLASS_NORMAL
	damagemodifier = 0.4
	accuracymodifier = -0.5
	firedelaymodifier = -0.6
	penetrationmodifier = 0.3
	burstmodifier = 0
	parttype = "receiver"
	partlocation = "internal"
	size = 0.5

/obj/item/gunpart/MGHS_Receiver
	name = "Military Grade High Speed Receiver Kit"
	desc = "A military grade high power receiver kit."
	icon_state = "MGHS-Receiver"
	w_class = WEIGHT_CLASS_NORMAL
	damagemodifier = 0.1
	accuracymodifier = 0.1
	firedelaymodifier = 0.2
	penetrationmodifier = 0.1
	burstmodifier = 0
	parttype = "receiver"
	partlocation = "internal"

/obj/item/gunpart/MGHP_Receiver
	name = "Military Grade High Power Receiver Kit"
	desc = "A military grade high power receiver kit."
	icon_state = "MGHP-Receiver"
	w_class = WEIGHT_CLASS_NORMAL
	damagemodifier = 0.6
	accuracymodifier = -0.4
	firedelaymodifier = -0.5
	penetrationmodifier = 0.4
	burstmodifier = 0
	parttype = "receiver"
	partlocation = "internal"
	size = 0.5

//Stocks
/obj/item/gunpart/stock
	name = "Stock Kit"
	desc = "A kit for adding a stock to a gun."
	icon_state = "Stock"
	damagemodifier = 0
	accuracymodifier = 0.3
	firedelaymodifier = 0.10
	penetrationmodifier = 0
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "stock"
	partlocation = "west"
	attachx = 23
	attachy = 17
	size = 1

//Misc

/obj/item/gunpart/scope
	name = "Scope Kit"
	desc = "A kit for adding a scope to a gun."
	icon_state = "Scope"
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "scope"
	partlocation = "north"
	accuracymodifier = 0.1
	attachx = 16
	attachy = 15

/** Not Functional
/obj/item/gunpart/flashlight
	name = "Flashlight Kit"
	desc = "A kit for adding a flashlight to a gun."
	icon_state = "Flashlight"
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "flashlight"
	partlocation = "south"
	attachx = 16
	attachy = 15
**/

/obj/item/gunpart/burstcam
	name = "Burst Cam"
	desc = "A kit for adding a burst cam to a gun."
	icon_state = "BurstCam"
	burstmodifier = 1
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "burstcam"
	partlocation = "internal2"
	attachx = 0
	attachy = 0

/obj/item/gunpart/twoburstcam
	name = "Two Round Burst Cam"
	desc = "A kit for adding a burst cam to a gun."
	icon_state = "BurstCam"
	burstmodifier = 2
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "burstcam"
	partlocation = "internal2"
	attachx = 0
	attachy = 0

/obj/item/gunpart/threeburstcam
	name = "Three Round Burst Cam"
	desc = "A kit for adding a burst cam to a gun."
	icon_state = "BurstCam"
	burstmodifier = 3
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "burstcam"
	partlocation = "internal2"
	attachx = 0
	attachy = 0
