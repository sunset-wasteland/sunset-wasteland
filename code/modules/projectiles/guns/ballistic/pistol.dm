//IN THIS DOCUMENT: Pistol template, Light pistols, Heavy pistols
// See gun.dm for keywords and the system used for gun balance



///////////////////
//PISTOL TEMPLATE//
///////////////////


/obj/item/gun/ballistic/automatic/pistol
	slowdown = 0
	name = "pistol template"
	desc = "should not be here. Bugreport."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	item_state = "gun"
	w_class = WEIGHT_CLASS_NORMAL //How much space it takes in a bag
	weapon_weight = WEAPON_MEDIUM //can only dual wield small pistols
	slot_flags = ITEM_SLOT_BELT
	force = 12 //Pistol whip
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	spread = 2
	burst_size = 1
	fire_delay = 0
	select = FALSE
	automatic_burst_overlay = FALSE
	can_automatic = FALSE
	semi_auto = TRUE
	can_suppress = TRUE
	equipsound = 'sound/f13weapons/equipsounds/pistolequip.ogg'

/obj/item/gun/ballistic/automatic/pistol/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)



/////////////////
//LIGHT PISTOLS//
/////////////////


//.22 Sport								Keywords: .22, Semi-auto, 16 round magazine, Suppressed
/obj/item/gun/ballistic/automatic/pistol/pistol22
	name = ".22 pistol"
	desc = "The silenced .22 pistol is a sporting handgun with an integrated silencer."
	icon_state = "silenced22"
	mag_type = /obj/item/ammo_box/magazine/m22
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_TINY
	can_attachments = TRUE
	can_suppress = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	fire_sound = 'sound/f13weapons/22pistol.ogg'
	extra_damage = 3


//N99  10mm								Keywords: 10mm, Semi-auto, 12/24 round magazine
/obj/item/gun/ballistic/automatic/pistol/n99
	name = "10mm pistol"
	desc = "A pre-war large-framed, gas-operated advanced 10mm pistol."
	icon_state = "n99"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	fire_delay = 1
	recoil = 0.05
	can_attachments = TRUE
	can_automatic = TRUE
	suppressor_state = "n99_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 15
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'
	//Extra Modifiable Gun Vars
	modifiablegun = TRUE
	//Sprite Attachment Points
	xattachlist = list("east" = 28, "west" =  9, "south" = 21, "north" = 14) //x coordinate for attachment point
	yattachlist = list("east" = 18, "west" = 17, "south" = 17, "north" = 21) //y coordinate for attachment point
	//Attachment Points
	attachableparts = list("internal" = new /obj/item/gunpart/BHS_Receiver, "internal2" = null, "east" = null, "west" = null, "south" = null, "north" = null)
	//Blacklisted Parts
	blacklistedparts = list("stock")
	extra_damage = 3

//the Executive							Keywords: UNIQUE, 10mm, Automatic, 12/24 round magazine. Special modifiers: damage +4
/obj/item/gun/ballistic/automatic/pistol/n99/executive
	name = "the Executive"
	desc = "A modified N99 pistol with an accurate two-round-burst and a blue Vault-Tec finish, a status symbol for some Overseers."
	icon_state = "executive"
	burst_size = 2
	semi_auto = FALSE
	can_automatic = FALSE

//Crusader pistol
/obj/item/gun/ballistic/automatic/pistol/n99/crusader
	name = "\improper Crusader pistol"
	desc = "A large-framed N99 pistol emblazoned with the colors and insignia of the Brotherhood of Steel. It feels heavy in your hand."
	force = 18
	icon_state = "crusader"
	item_state = "crusader"
	can_attachments = FALSE
	can_automatic = FALSE


//Type 17								Keywords: 10mm, Semi-auto, 12/24 round magazine. Special modifiers: damage +1, spread +1
/obj/item/gun/ballistic/automatic/pistol/type17
	name = "Type 17"
	desc = "Chinese military sidearm at the time of the Great War. The ones around are old and worn, but somewhat popular due to the long barrel and rechambered in 10mm after the original ammo ran dry decades ago."
	icon_state = "chinapistol"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	fire_delay = 1
	recoil = 0.1
	spread = 3
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'

//Browning Hi-power						Keywords: 9mm, Semi-auto
/obj/item/gun/ballistic/automatic/pistol/ninemil
	name = "Browning Hi-power"
	desc = "A mass produced pre-war Browning Hi-power 9mm pistol."
	icon_state = "ninemil"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_SMALL
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 19
	fire_sound = 'sound/f13weapons/ninemil.ogg'
	//Extra Modifiable Gun Vars
	modifiablegun = TRUE
	//Sprite Attachment Points
	xattachlist = list("east" = 31, "west" =  4, "south" = 21, "north" = 16) //x coordinate for attachment point
	yattachlist = list("east" = 21, "west" = 17, "south" = 17, "north" = 22) //y coordinate for attachment point
	//Attachment Points
	attachableparts = list("internal" = new /obj/item/gunpart/BHS_Receiver, "internal2" = null, "east" = null, "west" = null, "south" = null, "north" = null)
	//Blacklisted Parts
	blacklistedparts = list("stock")

//Maria									Keywords: UNIQUE, 9mm, Semi-auto, 10 round magazine. Special modifiers: fire delay -1, damage +10, penetration +0.2
/obj/item/gun/ballistic/automatic/pistol/ninemil/maria
	name = "Maria"
	desc = "An ornately-decorated pre-war Browning Hi-power 9mm pistol with pearl grips and a polished nickel finish. The firing mechanism has been upgraded, so for anyone on the receiving end, it must seem like an eighteen-karat run of bad luck."
	icon_state = "maria"
	fire_delay = 2
	extra_damage = 8
	extra_penetration = 0.05


//Sig Sauer P220						Keywords: 9mm, Semi-auto, 10 round magazine
/obj/item/gun/ballistic/automatic/pistol/sig
	name = "Sig P220"
	desc = "The P220 Sig Sauer. A Swiss designed pistol that is compact and has an average rate of fire for a pistol."
	icon_state = "sig"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	mag_type = /obj/item/ammo_box/magazine/m9mm
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/9mm.ogg'


//Beretta M9FS							Keywords: 9mm, Semi-auto. Special modifiers: spread -1
/obj/item/gun/ballistic/automatic/pistol/beretta
	name = "Beretta M9FS"
	desc = "One of the more common 9mm pistols, the Beretta is popular due to its reliability, 15 round magazine and good looks."
	icon_state = "beretta"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	weapon_weight = WEAPON_LIGHT
	spread = 1
	can_attachments = TRUE
	can_suppress = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/9mm.ogg'

//Beretta M93R							Keywords: 9mm, Automatic, 15 round magazine
/obj/item/gun/ballistic/automatic/pistol/beretta/automatic
	name = "Beretta M93R"
	desc = "A rare select fire variant of the M93R."
	icon_state = "m93r"
	fire_delay = 2
	burst_size = 2
	burst_shot_delay = 2.5
	spread = 9
	recoil = 0.2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	automatic_burst_overlay = TRUE
	can_attachments = FALSE
	semi_auto = FALSE

/obj/item/gun/ballistic/automatic/pistol/beretta/automatic/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 2
			spread = 9
			recoil = 0.1
			weapon_weight = WEAPON_HEAVY
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 1
			recoil = 0
			weapon_weight = WEAPON_MEDIUM
			to_chat(user, "<span class='notice'>You switch to semi-auto.</span>")
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
	return


//M1911									Keywords: .45 ACP, Semi-auto, 8 round magazine. Special modifiers: damage +1
/obj/item/gun/ballistic/automatic/pistol/m1911
	name = "M1911"
	desc = "A classic .45 handgun with a small magazine capacity."
	icon_state = "m1911"
	item_state = "pistolchrome"
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 2
	slowdown = 0.05
	mag_type = /obj/item/ammo_box/magazine/m45
	recoil = 0.15
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 21
	fire_sound = 'sound/f13weapons/45revolver.ogg'
	//Extra Modifiable Gun Vars
	modifiablegun = TRUE
	//Sprite Attachment Points
	xattachlist = list("east" = 29, "west" =  9, "south" = 21, "north" = 12) //x coordinate for attachment point
	yattachlist = list("east" = 22, "west" = 17, "south" = 17, "north" = 24) //y coordinate for attachment point
	//Attachment Points
	attachableparts = list("internal" = new /obj/item/gunpart/BHS_Receiver, "internal2" = null, "east" = null, "west" = null, "south" = null, "north" = null)
	//Blacklisted Parts
	blacklistedparts = list("stock")

//M1911	Custom							Keywords: .45 ACP, Semi-auto, 8 round magazine. Special modifiers: damage +1
/obj/item/gun/ballistic/automatic/pistol/m1911/custom
	name = "M1911 Custom"
	desc = "A well-maintained stainless-steel frame 1911, with genuine wooden grips."
	icon_state = "m1911_custom"
	recoil = 0.05
	fire_delay = 1


//Mk. 23								Keywords: .45 ACP, Semi-auto, Long barrel (lasersight), 12 round magazine, Flashlight
/obj/item/gun/ballistic/automatic/pistol/mk23
	name = "Mk. 23"
	desc = "A very tactical pistol chambered in .45 ACP with a built in laser sight and attachment point for a seclite."
	icon_state = "mk23"
	mag_type = /obj/item/ammo_box/magazine/m45exp
	fire_delay = 2
	slowdown = 0.07
	spread = 1
	can_flashlight = TRUE
	gunlight_state = "flight"
	flight_x_offset = 16
	flight_y_offset = 13
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 28
	suppressor_y_offset = 20
	fire_sound = 'sound/f13weapons/45revolver.ogg'



/////////////////
//HEAVY PISTOLS//
/////////////////


//Desert Eagle							Keywords: .44 Magnum, Semi-auto, Long barrel, 8 round magazine, Heavy. Special modifiers: bullet speed +300, damage +1
/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "Desert Eagle"
	desc = "A robust .44 magnum semi-automatic handgun."
	icon_state = "deagle"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/m44
	fire_delay = 3
	force = 15
	extra_speed = 300
	recoil = 3.5 //Debilitating
	spread = 6
	extra_damage = 12
	extra_penetration = 0.12
	can_suppress = FALSE
	automatic_burst_overlay = FALSE
	fire_sound = 'sound/f13weapons/44mag.ogg'
	//Extra Modifiable Gun Vars
	modifiablegun = TRUE
	//Sprite Attachment Points
	xattachlist = list("east" = 31, "west" =  9, "south" = 21, "north" = 15) //x coordinate for attachment point
	yattachlist = list("east" = 22, "west" = 17, "south" = 17, "north" = 23) //y coordinate for attachment point
	//Attachment Points
	attachableparts = list("internal" = new /obj/item/gunpart/BHS_Receiver, "internal2" = null, "east" = null, "west" = null, "south" = null, "north" = null)
	//Blacklisted Parts
	blacklistedparts = list("stock")

//El Capitan			Keywords: 14mm, Semi-auto, 7 round magazine, Heavy. Special modifiers: damage -2
/obj/item/gun/ballistic/automatic/pistol/deagle/elcapitan
	name = "El Capitan"
	desc = "The Captain loves his gun, despite some silly gunsmith adding some gas venting to the barrel after his second visit to the surgeon for recoil-related wrist injuries."
	icon_state = "elcapitan"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/m14mm
	fire_delay = 0
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'

//Automag			Keywords: .44 Magnum, Semi-auto, Long barrel, 7 rounds, Heavy. Special modifiers: bullet speed +300
/obj/item/gun/ballistic/automatic/pistol/automag
	name = "Automag"
	desc = "A long-barreled .44 magnum semi-automatic handgun."
	icon_state = "automag"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/automag
	fire_delay = 4
	extra_speed = 300
	recoil = 0.2
	can_suppress = FALSE
	automatic_burst_overlay = FALSE
	fire_sound = 'sound/f13weapons/44mag.ogg'
	extra_damage = 5


//14mm Pistol		Keywords: 14mm, Semi-auto, 7 rounds, Heavy
/obj/item/gun/ballistic/automatic/pistol/pistol14
	name = "14mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun, powerful but a little inaccurate"
	icon_state = "pistol14"
	mag_type = /obj/item/ammo_box/magazine/m14mm
	force = 15
	fire_delay = 5
	extra_damage = 11
	recoil = 2.2
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'

//14mm compact		Keywords: 14mm, Semi-auto, Short barrel, 7 rounds, Heavy
/obj/item/gun/ballistic/automatic/pistol/pistol14/compact
	name = "compact 14mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun, this one is a compact model for concealed carry."
	icon_state = "pistol14_compact"
	w_class = WEIGHT_CLASS_SMALL
	spread = 5

//Little Devil							Keywords: UNIQUE, 14mm, Semi-auto, Short barrel, 7 Rounds, Heavy.
/obj/item/gun/ballistic/automatic/pistol/pistol14/lildevil
	name= "Little Devil 14mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun, this one is a finely tuned custom firearm from the Gunrunners."
	icon_state = "lildev"
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 4
	extra_damage = 0
	extra_penetration = 0.35

/obj/item/gun/ballistic/automatic/pistol/pistol14/custom
	name= "Custom 14mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun, this one is a finely tuned custom firearm. How'd this get into service?"
	icon_state = "lildev"
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 4

//Mortifer						Keywords: UNIQUE, 14mm, Semi-auto, 7 rounds, Heavy.
/obj/item/gun/ballistic/automatic/pistol/pistol14/orator
	name = "Mortifer"
	desc = "A long-barreled SIG P-127 custom-built by an experienced Legion technician, used for executions. The black leather-wrapped handle has a golden laurel wreath on each side."
	icon_state = "mortifer"
	mag_type = /obj/item/ammo_box/magazine/m14mm
	fire_delay = 15
	icon_state = "nexus"
	recoil = 5.5
	extra_damage = 20
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'

//Bible Dog M1911					Keywords: UNIQUE, .45, Semi-auto, 7 rounds, Heavy.
/obj/item/gun/ballistic/automatic/pistol/m1911/bibledog
	name = "New Canaanite .45 Auto pistol"
	desc = "A well-maintained stainless-steel frame 1911 given to New Canaanites for their rite of passage"
	recoil = 0.04

/////////////////////////////////
// TEMPORARY REMOVE AFTER BETA //
/////////////////////////////////obsolete

/obj/item/gun/ballistic/automatic/pistol/pistoltesting
	name = "pistol"
	extra_damage = 18
	mag_type = /obj/item/ammo_box/magazine/testbullet
