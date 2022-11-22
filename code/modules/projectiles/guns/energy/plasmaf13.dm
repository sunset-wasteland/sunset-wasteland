
//////////////////
//PLASMA WEAPONS//
//////////////////

//Plasma pistol
/obj/item/gun/energy/laser/plasma/pistol
	name ="plasma pistol"
	slowdown = 0.1
	armour_penetration = 0.02
	item_state = "plasma-pistol"
	icon_state = "plasma-pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires a bolt of superhot ionized gas."
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'

//BoS knight craftable plasma pistol
/obj/item/gun/energy/laser/plasma/pistol/light
	name = "lightweight plasma pistol"
	slowdown = 0.1
	icon_state = "light-plasma-pistol"
	desc = "A lightweight modification of the common REPCONN-built plasma pistol. Fires heavy low penetration plasma clots at a slower rate than the regular design due to reduced cooling."
	fire_delay = 5

/obj/item/gun/energy/laser/plasma/pistol/worn
	name ="shoddy plasma pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires a bolt of superhot ionized gas. This one's internal parts have loose seals and corroded electronics."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/worn)
	fire_delay = 4.5

/obj/item/gun/energy/laser/plasma/pistol/remnant
	name ="corroded plasma pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires a bolt of superhot ionized gas. This one's internal parts have loose seals and corroded electronics. Despite the aforementioned issues, it appears someone has maintained this relic for quite some time."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/worn)
	fire_delay = 8

/obj/item/gun/energy/laser/plasma/pistol/remnant/is
	name ="custom plasma pistol"
	desc = "An eagle is stamped to the underside of the grip. Where'd this come from?"

/obj/item/gun/energy/laser/plasma/pistol/worn/gutsy
	name ="\improper integrated plasma pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires a bolt of superhot ionized gas."
	selfcharge = EGUN_SELFCHARGE_BORG

//Glock 86 Plasma pistol
/obj/item/gun/energy/laser/plasma/glock
	name = "glock 86"
	desc = "Glock 86 Plasma Pistol. Designed by the Gaston Glock artificial intelligence. Shoots a small bolt of superheated plasma. Powered by a small energy cell."
	item_state = "plasma-pistol"
	icon_state = "glock86"
	slowdown = 0.1
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock)
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'
	cell_type = /obj/item/stock_parts/cell/ammo/ec

//Glock 86 A Plasma pistol
/obj/item/gun/energy/laser/plasma/glock/extended
	name ="glock 86a"
	item_state = "plasma-pistol"
	icon_state = "glock86a"
	desc = "This Glock 86 plasma pistol has had its magnetic housing chamber realigned to reduce the drain on its energy cell. Its efficiency has doubled, allowing it to fire more shots before the battery is expended."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock/extended)
	cell_type = /obj/item/stock_parts/cell/ammo/ec


//Plasma Rifle
/obj/item/gun/energy/laser/plasma
	name ="plasma rifle"
	item_state = "plasma"
	icon_state = "plasma"
	armour_penetration = 0.1
	slowdown = 0.75 //this is one of the worst slowdowns in the game
	fire_delay = 5.2
	desc = "A miniaturized plasma caster that fires bolts of magnetically accelerated toroidal plasma towards an unlucky target."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'


//Plasma carbine
/obj/item/gun/energy/laser/plasma/carbine
	name ="plasma carbine"
	item_state = "plasma"
	icon_state = "plasmacarbine"
	desc = "A burst-fire energy weapon that fires a steady stream of toroidal plasma towards an unlucky target."
	ammo_type = list(/obj/item/ammo_casing/energy/plasmacarbine)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	burst_size = 2
	burst_shot_delay = 1.5
	actions_types = list(/datum/action/item_action/toggle_firemode)
	can_scope = TRUE
	scope_state = "plasma_scope"
	scope_x_offset = 13
	scope_y_offset = 16
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'

/obj/item/gun/energy/laser/plasma/carbine/enable_burst()
	. = ..()
	spread = 15

/obj/item/gun/energy/laser/plasma/carbine/disable_burst()
	. = ..()
	spread = 0


//Multiplas rifle
/obj/item/gun/energy/laser/plasma/scatter
	name = "multiplas rifle"
	item_state = "multiplas"
	icon_state = "multiplas"
	fire_delay = 3
	desc = "A modified A3-20 plasma caster built by REPCONN equipped with a multicasting kit that creates multiple weaker clots."
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc


/obj/item/gun/energy/laser/plasma/spear
	name = "ergonomic plasmacaster"
	desc = "An ergonomic pre-war plasmacaster designed for precision mining work. This one appears to be built into a single thick staff, with a bulbous hilt and sharp saturnite alloy blades ringing the caster assembly- strongly resembling sort of spear."
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee2h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee2h_righthand.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/backslot_weapon.dmi'
	item_state = "plasma"
	icon_state = "plasma"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_LIGHT //you need to wield it to fire it
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/miner)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	sharpness = SHARP_EDGED
	max_reach = 2
	force = 20
	burst_size = 5
	burst_shot_delay = 0.5
	fire_delay = 10
	scope_y_offset = 16
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	var/twohands = FALSE

/obj/item/gun/energy/laser/plasma/spear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=20, force_wielded=40, icon_wielded="[item_state]2")
	AddElement(/datum/element/update_icon_updates_onmob)
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/allow_fire)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/deny_fire)

/obj/item/gun/energy/laser/plasma/spear/proc/allow_fire()
	twohands = TRUE
/obj/item/gun/energy/laser/plasma/spear/proc/deny_fire()
	twohands = FALSE

/obj/item/gun/energy/laser/plasma/spear/Destroy()
	..()
	UnregisterSignal(src, list(COMSIG_TWOHANDED_WIELD,
								COMSIG_TWOHANDED_UNWIELD))

/obj/item/gun/energy/laser/plasma/spear/can_shoot()
	. = ..()
	if(!twohands)
		return FALSE

// Inquisitorial axe			Keywords: Damage 6/32, AP 0.9, SPEAR REACH, BACK SLOT ENABLED
// Copy of plasma spear. Different for a few reasons.
// Absurdly powerful.
/obj/item/gun/energy/laser/plasma/inquis
	name = "Inquisitorial polearm"
	desc = "An odd looking spear of sorts, tipped with what appears to be a plasma chamber. \
	In theory, this should splash the target with plasma when triggered. Does it work, however?"
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee2h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee2h_righthand.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/backslot_weapon.dmi'
	item_state = "plasma"
	icon_state = "plasma"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_LIGHT //you need to wield it to fire it
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/repeater)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	sharpness = SHARP_EDGED
	attack_speed = CLICK_CD_MELEE * 1.2
	attack_verb = list("seared","jabbed","punctured")
	max_reach = 2
	force = 6
	fire_delay = 25//Long enough to make melee worthwhile.
	equipsound = 'sound/f13weapons/equipsounds/declonequip.ogg'
	hitsound = 'sound/f13weapons/sear.ogg'
	var/twohands = FALSE

/obj/item/gun/energy/laser/plasma/inquis/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=6, force_wielded=32, icon_wielded="[item_state]2")
	AddElement(/datum/element/update_icon_updates_onmob)
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/allow_fire)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/deny_fire)

/obj/item/gun/energy/laser/plasma/inquis/proc/allow_fire()
	twohands = TRUE
/obj/item/gun/energy/laser/plasma/inquis/proc/deny_fire()
	twohands = FALSE

/obj/item/gun/energy/laser/plasma/inquis/Destroy()
	..()
	UnregisterSignal(src, list(COMSIG_TWOHANDED_WIELD,
								COMSIG_TWOHANDED_UNWIELD))

/obj/item/gun/energy/laser/plasma/inquis/can_shoot()
	. = ..()
	if(!twohands)
		return FALSE
