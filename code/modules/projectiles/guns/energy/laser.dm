/obj/item/gun/energy/laser/practice
	name = "practice laser gun"
	icon_state = "laser-p"
	desc = "A modified version of the basic laser gun, this one fires less concentrated energy bolts designed for target practice."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/practice)
	clumsy_check = 0
	item_flags = NONE

/obj/item/gun/energy/laser/practice/hyperburst
	name = "toy hyper-burst launcher"
	desc = "A toy laser with a unique beam shaping lens that projects harmless bolts capable of going through objects. Compatible with existing laser tag systems."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/magtag)
	icon_state = "toyburst"
	obj_flags = NONE
	fire_delay = 40
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	selfcharge = EGUN_SELFCHARGE
	charge_delay = 2
	recoil = 2
	cell_type = /obj/item/stock_parts/cell/toymagburst

/obj/item/gun/energy/laser/retro
	name ="retro laser gun"
	icon_state = "retro"
	desc = "An older model of the basic lasergun, no longer used by Nanotrasen's private security or military forces. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	ammo_x_offset = 3

/obj/item/gun/energy/laser/captain
	name = "antique laser gun"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "This is an antique laser gun. All craftsmanship is of the highest quality. It is decorated with assistant leather and chrome. The object menaces with spikes of energy. On the item is an image of Space Station 13. The station is exploding."
	force = 10
	ammo_x_offset = 3
	selfcharge = EGUN_SELFCHARGE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/gun/energy/laser/cyborg
	name = "integrated AER9"
	can_charge = FALSE
	desc = "An energy-based laser gun that draws power from the robot's internal energy cell directly. So this is what freedom looks like?"
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan)
	icon_state = "laser"
	item_state = "laser-rifle9"
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3

/obj/item/gun/energy/laser/cyborg/emp_act()
	return

/obj/item/gun/energy/laser/cyborg/mean
	use_cyborg_cell = TRUE
	selfcharge = EGUN_NO_SELFCHARGE

/obj/item/gun/energy/laser/scatter
	name = "scatter laser gun"
	desc = "A laser gun equipped with a refraction kit that spreads bolts."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)

//Laser Cannon
/obj/item/gun/energy/lasercannon
	name = "accelerator laser cannon"
	desc = "An advanced laser cannon that does more damage the farther away the target is."
	icon_state = "lasercannon"
	item_state = "laser"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/laser/accelerator)
	pin = null
	ammo_x_offset = 3

/obj/item/ammo_casing/energy/laser/accelerator
	projectile_type = /obj/item/projectile/beam/laser/accelerator
	select_name = "accelerator"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/projectile/beam/laser/accelerator
	name = "accelerator laser"
	icon_state = "scatterlaser"
	range = 255
	damage = 6

/obj/item/projectile/beam/laser/accelerator/Range()
	..()
	damage += 7
	transform *= 1 + ((damage/7) * 0.2)//20% larger per tile

/obj/item/gun/energy/xray
	name = "\improper X-ray laser gun"
	desc = "A high-power laser gun capable of expelling concentrated X-ray blasts that pass through multiple soft targets and heavier materials."
	icon_state = "xray"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/xray)
	pin = null
	ammo_x_offset = 3

////////Laser Tag////////////////////

/obj/item/gun/energy/laser/bluetag
	name = "laser tag gun"
	icon_state = "bluetag"
	desc = "A retro laser gun modified to fire harmless blue beams of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/blue
	ammo_x_offset = 2
	selfcharge = EGUN_SELFCHARGE

/obj/item/gun/energy/laser/bluetag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag/hitscan)

/obj/item/gun/energy/laser/redtag
	name = "laser tag gun"
	icon_state = "redtag"
	desc = "A retro laser gun modified to fire harmless beams red of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/red
	ammo_x_offset = 2
	selfcharge = EGUN_SELFCHARGE

/obj/item/gun/energy/laser/redtag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag/hitscan)



//Fallout


/obj/item/gun/energy/laser
	name = "energy weapon template"
	desc = "Should not exists. Bugreport."
	icon_state = "laser"
	item_state = "laser"
	slowdown = 0.3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	custom_materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = 1
	var/select = 1

/obj/item/gun/energy/laser/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
		if(istype(AM, cell_type))
			var/obj/item/stock_parts/cell/ammo/oldcell = cell
			if(user.transferItemToLoc(AM, src))
				cell = AM
				if(oldcell)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the cell.</span>")
					oldcell.dropped()
					oldcell.forceMove(get_turf(src.loc))
					oldcell.update_icon()
				//else
				//	to_chat(user, "<span class='notice'>You insert the cell into \the [src].</span>")

				//playsound(src, 'sound/weapons/autoguninsert.ogg', 60, TRUE)
				//chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/energy/laser/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		disable_burst()
		to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	else
		enable_burst()
		to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")

/obj/item/gun/energy/laser/proc/enable_burst()
	burst_size = initial(burst_size)

/obj/item/gun/energy/laser/proc/disable_burst()
	burst_size = 1



/////////////////
//LASER PISTOLS//
/////////////////


//Wattz 1000 Laser pistol
/obj/item/gun/energy/laser/wattz
	name = "Wattz 1000 laser pistol"
	desc = "A Wattz 1000 Laser Pistol. Civilian model, so the wattage is lower than military or police versions. Uses small energy cells."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz1000"
	item_state = "laser-pistol"
	fire_delay = 0
	slowdown = 0.2
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT //Can dual wield, which makes up for the meh damage. Especially so with the Magneto.
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//Watss 1000 Magneto-laser pistol
/obj/item/gun/energy/laser/wattz/magneto
	name = "Wattz 1000 magneto-laser pistol"
	desc = "This Wattz 1000 laser pistol has been upgraded with a magnetic field targeting system that tightens the laser emission, giving this pistol extra penetrating power."
	icon_state = "magnetowattz"
	fire_delay = 0
	item_state = "laser-pistol"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz/magneto/hitscan)

/obj/item/gun/energy/laser/wattz/recharger
	name = "Recharger Pistol"
	desc = "A recharger pistol manufactured by the Followers of the Apocalpyse. As the name implied, it charges its capacitor banks over time using radioactive decay."
	can_remove = 0
	can_charge = 0
	selfcharge = 1
	icon_state = "rechargerpistol"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/recharger/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/breeder
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/wattz/recharger/Walker
	name = "Walker's Recharger Pistol"
	desc = "A recharger pistol procured and modified by the scribes under Walker. It charges its capacitor banks over time using radioactive decay. Only a few of these weapons exist."
	can_remove = 0
	can_charge = 0
	selfcharge = 1
	icon_state = "wattz1000"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/recharger/hitscan/walker)
	cell_type = /obj/item/stock_parts/cell/ammo/breeder
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//AEP 7 Laser pistol
/obj/item/gun/energy/laser/pistol
	name = "\improper AEP7 laser pistol"
	desc = "A basic energy-based laser gun that fires concentrated beams of light."
	slowdown = 0.2
	icon_state = "AEP7"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 0
	can_scope = FALSE
	scope_state = "AEP7_scope"
	scope_x_offset = 7
	scope_y_offset = 22
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/pistol/cyborg
	name = "\improper assaultron AEP7 laser eye"
	desc = "A basic energy-based laser projector that fires concentrated beams of light from your eye! It draws power from your cell so try not to go crazy."
	can_scope = FALSE
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3

/obj/item/gun/energy/laser/pistol/cyborg/gutsy
	name = "\improper integrated laser pistol"
	desc = "An integrated laser pistol that draws power directly from your cell."

//Compliance Regulator

/obj/item/gun/energy/laser/complianceregulator
	name = "AEP5-CR Disabling Beam Pistol"
	desc = "A laser pistol that has been modified for less-than-lethal work."
	slowdown = 0.2
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "AEP5CR"
	item_state = "AEP5CR"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/stun)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 0
	can_scope = FALSE
	scope_state = "AEP7_scope"
	scope_x_offset = 7
	scope_y_offset = 22
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//Solar Scorcher
/obj/item/gun/energy/laser/solar
	name = "\improper Solar Scorcher"
	slowdown = 0.2
	desc = "This modified AEP7 laser pistol takes its power from the sun, recharging slowly using stored solar energy. However, it cannot be recharged manually as a result."
	icon_state = "solarscorcher"
	item_state = "solarscorcher"
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/solar/hitscan) //27 dmg, .15 AP
	cell_type = /obj/item/stock_parts/cell/ammo/ec //16 shots, self-charges
	can_charge = 0
	selfcharge = 1 //selfcharging adds 100 a shot
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//autolaser, recycled from SS13

/obj/item/gun/energy/laser/auto
	name = "compact autolaser"
	desc = "A beefed-up laser pistol manufactured by West Tek, reinforced to allow it to withstand the thermal load of sustained fire."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	icon_state = "protolaser"
	item_state = "laser"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT //dual wielding
	slowdown = 0.3
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	ammo_type =  list(/obj/item/ammo_casing/energy/laser/autolaser) //7dmg, 0 AP, but essentially fires a pinpoint beam
	automatic = 1
	autofire_shot_delay = 0.75 //pew pew pew
	spread = 2
	can_scope = FALSE

// OASIS autolaser
/obj/item/gun/energy/laser/auto/oasis
	name = "autoshock tesla pistol"
	desc = "This pistol has been unwisely modified by the OPD to fire bolts of electricty. And they beheld Satan as he fell from heaven like lightning."
	ammo_type =  list(/obj/item/ammo_casing/energy/laser/autolaser/shock) //8dmg + 10 Stamina, flagged as "energy" so very few armors can reduce it below 5-6 dmg, has a very high bare wound bonus, so anyone with no armor on will be crippled
	slowdown = 0.35
	weapon_weight = WEAPON_MEDIUM //DO NOT DUAL WIELD

//Ultracite Laser pistol
/obj/item/gun/energy/laser/ultra_pistol
	name = "\improper Ultracite laser pistol"
	desc = "An ultracite enhanced energy-based laser gun that fires concentrated beams of light."
	slowdown = 0.2
	icon_state = "ultra_pistol"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	fire_delay = 2
	scope_x_offset = 7
	scope_y_offset = 22
	ammo_type = list(/obj/item/ammo_casing/energy/laser/ultra_pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'



////////////////
//LASER RIFLES//
////////////////


//Wattz 2000 Laser rifle
/obj/item/gun/energy/laser/wattz2k
	name = "wattz 2000"
	desc = "Wattz 2000 Laser Rifle. Uses micro fusion cells for more powerful lasers, and an extended barrel for additional range."
	slowdown = 0.3
	icon = 'icons/fallout/objects/guns/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz2k"
	item_state = "sniper_rifle"
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/wattz2k/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'

//Wattz 2000 Extended
/obj/item/gun/energy/laser/wattz2k/extended
	name = "wattz 2000e"
	desc = "This Wattz 2000 laser rifle has had its recharging system upgraded and a special recycling chip installed that reduces the drain on the micro fusion cell by 50%."
	icon_state = "wattz2k_ext"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	item_state = "sniper_rifle"
	ammo_type = list(/obj/item/ammo_casing/energy/wattz2k/extended/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'



//AER9 Laser rifle
/obj/item/gun/energy/laser/aer9
	name = "\improper AER9 laser rifle"
	desc = "A sturdy pre-war laser rifle. Emits beams of concentrated light to kill targets. Fast firing, but not very powerful."
	icon_state = "laser"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'

/obj/item/gun/energy/laser/aer9/focused
	name = "\improper Hot-wired AER9 laser rifle"
	desc = "A sturdy pre-war laser rifle. Emits beams of concentrated light to kill targets. This one has been jury-rigged against common sense to dump more power into its shots."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan/focused)
	fire_delay = 5

//Ultracite Laser rifle
/obj/item/gun/energy/laser/ultra_rifle
	name = "\improper Ultracite laser rifle"
	desc = "A sturdy and advanced military grade pre-war service laser rifle, now enhanced with ultracite"
	icon_state = "ultra_rifle"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun)
	cell_type = /obj/item/stock_parts/cell/ammo/ultracite
	fire_delay = 3
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'


//Tribeam Laser rifle
/obj/item/gun/energy/laser/scatter
	name = "tribeam laser rifle"
	desc = "A modified AER9 equipped with a refraction kit that divides the laser shot into three separate beams. While powerful, it has a reputation for friendly fire."
	icon_state = "tribeam"
	item_state = "laser-rifle9"
	fire_delay = 3
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter/tribeam/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/tribeamequip.ogg'


//AER12 Laser rifle
/obj/item/gun/energy/laser/aer12
	name = "\improper AER12 laser rifle"
	desc = "A cutting-edge, pre-war laser rifle. Its focusing crystal array is housed in gold alloy, making it difficult to maintain."
	icon_state = "aer12"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/aer12/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1.5
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/tribeamequip.ogg'

//AER14 Laser rifle
/obj/item/gun/energy/laser/aer14
	name = "\improper AER14 laser rifle"
	desc = "A bleeding-edge, pre-war laser rifle. Extremely powerful, but eats MFCs like nothing else."
	icon_state = "aer14"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/aer14/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1.5
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'

//Fluff AER14
/obj/item/gun/energy/laser/aer14/refurb
	name = "\improper Refurbished AER14 laser rifle"
	desc = "A bleeding-edge, pre-war laser rifle. Or, at least, it was at one point. \
	This one appears to have a cracked and dirty focusing lense, requiring reconfiguration in a workshop. \
	Additionally, it appears as if it's using a makeshift array, significantly reducing the power of each bolt, but increasing the number of available discharges."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan)

//LAER Energy rifle
/obj/item/gun/energy/laser/laer
	name = "\improper LAER"
	desc = "The Laser Assister Energy Rifle is a powerful pre-war weapon developed just before the turn of the Great War. Due to its incredible rarity and unprecedented firepower, the weapon is coveted and nearly solely possesed by the Brotherhood of Steel; typically held by an Elder as a status symbol."
	icon_state = "laer"
	item_state = "laer"
	fire_delay = 3
	burst_size = 1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/laer/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/laerequip.ogg'


//Fallout 4 laser tommy gun.
/obj/item/gun/energy/laser/rcw
	name = "laser RCW"
	desc = "A rapid-fire laser rifle modeled after the familiar \"Thompson\" SMG. It features high-accuracy burst fire that will whittle down targets in a matter of seconds."
	icon_state = "lasercw"
	item_state = "rcw"
	fire_delay = 3
	burst_size = 1
	automatic = 1
	autofire_shot_delay = 2
	spread = 14
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rcw/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	equipsound = 'sound/f13weapons/equipsounds/RCWequip.ogg'

/obj/item/gun/energy/laser/rcw/burst_select()
	var/mob/living/carbon/human/user = usr
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
//	for(var/X in actions)
//		var/datum/action/A = X

/obj/item/gun/energy/laser/rcw/afterattack()
	. = ..()
//	empty_alarm()
	return


//Alien Blaster
/obj/item/gun/energy/laser/plasma/pistol/alien
	name = "alien blaster"
	slowdown = 0.2
	item_state = "alienblaster"
	icon_state = "alienblaster"
	desc = "This weapon is unlike any other you've ever seen before, and appears to be made out of metals not usually found on Earth. It certainly packs a punch, though."
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	can_charge = FALSE
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/alien)
	cell_type = /obj/item/stock_parts/cell/ammo/alien //unchargeable, but removable


//Gamma gun
/obj/item/gun/energy/gammagun
	name = "Gamma gun"
	desc = "An advanced radiation weapon commonly utilized by people who have passionate hatred for their fellow man. Fires slow velocity, low damage radiation beams."
	icon_state = "ultra_pistol"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/gammagun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	ammo_x_offset = 3


//Gatling Laser


//The ammo/gun is stored in a back slot item
/obj/item/minigunpack
	name = "backpack power source"
	desc = "The massive external power source for the laser gatling gun."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "holstered"
	item_state = "backpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/gun/energy/minigun/gun
	var/armed = 0 //whether the gun is attached, 0 is attached, 1 is the gun is wielded.
	var/overheat = 0
	var/overheat_max = 70
	var/heat_stage = 0
	var/heat_diffusion = 1.5 //How much heat is lost per tick

/obj/item/minigunpack/Initialize()
	. = ..()
	gun = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/minigunpack/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/minigunpack/process()
	overheat = max(0, overheat - heat_diffusion)

/obj/item/minigunpack/on_attack_hand(mob/living/carbon/user)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(SLOT_BACK) == src)
				armed = 1
				if(!user.put_in_hands(gun))
					armed = 0
					to_chat(user, "<span class='warning'>You need a free hand to hold the gun!</span>")
					return
				update_icon()
				user.update_inv_back()
		else
			to_chat(user, "<span class='warning'>You are already holding the gun!</span>")
	else
		..()

/obj/item/minigunpack/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/minigunpack/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Current heat level: [overheat] / [overheat_max]"

/obj/item/minigunpack/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/minigunpack/MouseDrop(atom/over_object)
	. = ..()
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /obj/screen/inventory/hand))
				var/obj/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)


/obj/item/minigunpack/update_icon_state()
	if(armed)
		icon_state = "notholstered"
	else
		icon_state = "holstered"

/obj/item/minigunpack/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = 0
	if(user)
		to_chat(user, "<span class='notice'>You attach the [gun.name] to the [name].</span>")
	else
		src.visible_message("<span class='warning'>The [gun.name] snaps back onto the [name]!</span>")
	update_icon()
	user.update_inv_back()

/obj/item/gun/energy/minigun
	name = "laser gatling gun"
	desc = "An advanced laser cannon with an incredible rate of fire. Requires a bulky backpack power source to use."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigun_spin"
	item_state = "minigun"
	flags_1 = CONDUCT_1
	slowdown = 1
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	burst_size = 1
	burst_shot_delay = 1
	automatic = 1
	autofire_shot_delay = 1.75
	spread = 8
	fire_delay = 1
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/laser.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/gatling/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	var/obj/item/minigunpack/ammo_pack

/obj/item/gun/energy/minigun/Initialize()
	if(istype(loc, /obj/item/minigunpack)) //We should spawn inside an ammo pack so let's use that one.
		ammo_pack = loc
	else
		return INITIALIZE_HINT_QDEL //No pack, no gun

	return ..()

/obj/item/gun/energy/minigun/attack_self(mob/living/user)
	return

/obj/item/gun/energy/minigun/dropped(mob/user)
	. = ..()
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/energy/minigun/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	if(ammo_pack)
		if(ammo_pack.overheat > ammo_pack.overheat_max * (1 / 3) && ammo_pack.heat_stage < 1)
			to_chat(user, "You feel warmth from the handle of the gun.")
			ammo_pack.heat_stage += 1
			..()

		if(ammo_pack.overheat > ammo_pack.overheat_max * (2 / 3) && ammo_pack.heat_stage < 2)
			to_chat(user, "The gun's heat sensor beeps rapidly as it reaches its limit!")
			ammo_pack.heat_stage += 1
			..()

		if(ammo_pack.overheat < ammo_pack.overheat_max)
			ammo_pack.overheat += burst_size
			..()

		if(ammo_pack.overheat < ammo_pack.overheat_max)
			ammo_pack.overheat += burst_size
			..()
		else
			to_chat(user, "The gun's heat sensor locked the trigger to prevent lens damage.")

/obj/item/gun/energy/minigun/afterattack(atom/target, mob/living/user, flag, params)
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, "You need the backpack power source to fire the gun!")
	. = ..()

/obj/item/gun/energy/minigun/dropped(mob/living/user)
	. = ..()
	ammo_pack.attach_gun(user)


//// BETA /// Obsolete
/obj/item/gun/energy/laser/lasertesting
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/lasertest)
