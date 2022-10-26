// This was coded by Fulminating Gold for Crashpoint3.
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

/obj/item/gunpart/barrel_extension_50mm//TIER 1 MODS
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

/obj/item/gunpart/barrel_extension_80mm//TIER 2 MODS
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

/obj/item/gunpart/BHS_Receiver//TIER 1 MODS
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

/obj/item/gunpart/BHP_Receiver//TIER 1 MODS
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

/obj/item/gunpart/MGHS_Receiver//TIER 3 MODS
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

/obj/item/gunpart/MGHP_Receiver//TIER 3 MODS
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
/obj/item/gunpart/stock//TIER 2 MODS
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

/** Not Functional
/obj/item/gunpart/scope//TIER 3 MODS
	name = "Scope Kit"
	desc = "A kit for adding a scope to a gun."
	icon_state = "Scope"
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "scope"
	partlocation = "north"
	accuracymodifier = 0.1
	attachx = 16
	attachy = 15

/obj/item/gunpart/flashlight
	name = "Flashlight Kit"
	desc = "A kit for adding a flashlight to a gun."
	icon_state = "Flashlight"
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "flashlight"
	partlocation = "south"
	attachx = 16
	attachy = 15

/obj/item/gunpart/burstcam//TIER 1 MODS
	name = "Burst Cam"
	desc = "A kit for adding a burst cam to a gun."
	icon_state = "BurstCam"
	burstmodifier = 1
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "burstcam"
	partlocation = "internal2"
	attachx = 0
	attachy = 0

/obj/item/gunpart/twoburstcam//TIER 2 MODS
	name = "Two Round Burst Cam"
	desc = "A kit for adding a burst cam to a gun."
	icon_state = "BurstCam"
	burstmodifier = 2
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "burstcam"
	partlocation = "internal2"
	attachx = 0
	attachy = 0

/obj/item/gunpart/threeburstcam//TIER 3 MODS
	name = "Three Round Burst Cam"
	desc = "A kit for adding a burst cam to a gun."
	icon_state = "BurstCam"
	burstmodifier = 3
	w_class = WEIGHT_CLASS_NORMAL
	parttype = "burstcam"
	partlocation = "internal2"
	attachx = 0
	attachy = 0
**/

/////////
// Loot Tables
/////////
/obj/effect/spawner/lootdrop/f13/gunparts
	name = "gun parts or something"
	desc = "scream at Carl if you see this."
	icon = 'icons/obj/guns/modifiableguns.dmi'
	icon_state = "Scope"

/obj/effect/spawner/lootdrop/f13/gunparts/tier1 //TIER 1 MOD LIST
	name = "tier 1 gunparts"
	icon_state = "BurstCam"
	lootcount = 1
	var/loot1 = list(
				/obj/item/gunpart/barrel_extension_50mm
				)
	var/loot2 = list(
				/obj/item/gunpart/BHS_Receiver
				)
	var/loot3 = list(
				/obj/item/gunpart/BHP_Receiver
				)

/obj/effect/spawner/lootdrop/f13/gunparts/tier1/Initialize(mapload) //on mapload, pick what shit to spawn
	loot = pick(loot1, loot2, loot3)
	. = ..()


/obj/effect/spawner/lootdrop/f13/gunparts/tier2 //TIER 2 MOD LIST
	name = "tier 2 gunparts"
	icon_state = "BHS-Receiver"
	lootcount = 1
	var/loot1 = list(
				/obj/item/gunpart/barrel_extension_80mm
				)
	var/loot2 = list(
				/obj/item/gunpart/stock
				)

/obj/effect/spawner/lootdrop/f13/gunparts/tier2/Initialize(mapload) //on mapload, pick what shit to spawn
	loot = pick(loot1, loot2)
	. = ..()


/obj/effect/spawner/lootdrop/f13/gunparts/tier3 //TIER 3 MOD LIST
	name = "tier 3 gunparts"
	icon_state = "MGHP-Receiver"
	lootcount = 1
	var/loot1 = list(
				/obj/item/gunpart/MGHS_Receiver
				)
	var/loot2 = list(
				/obj/item/gunpart/MGHP_Receiver
				)

/obj/effect/spawner/lootdrop/f13/gunparts/tier3/Initialize(mapload) //on mapload, pick what shit to spawn
	loot = pick(loot1, loot2)
	. = ..()
