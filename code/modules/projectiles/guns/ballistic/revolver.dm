// In this document: Revolvers, Needlers, Weird revolvers
// See gun.dm for keywords and the system used for gun balance

/obj/item/gun/ballistic/revolver
	slowdown = 0.1
	name = "revolver template" 
	desc = "should not exist."
	icon_state = "revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder
	fire_delay = 4.5
	spread = 1
	force = 12 // Pistol whip
	casing_ejector = FALSE
	spawnwithmagazine = TRUE
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	var/select = 0
	equipsound = 'sound/f13weapons/equipsounds/pistolequip.ogg'

/obj/item/gun/ballistic/revolver/Initialize()
	. = ..()
	if(!istype(magazine, /obj/item/ammo_box/magazine/internal/cylinder))
		verbs += /obj/item/gun/ballistic/revolver/verb/spin

/obj/item/gun/ballistic/revolver/chamber_round(spin = 1)
	if(spin)
		chambered = magazine.get_round(1)
	else
		chambered = magazine.stored_ammo[1]

/obj/item/gun/ballistic/revolver/shoot_with_empty_chamber(mob/living/user as mob|obj)
	..()
	chamber_round(1)

/obj/item/gun/ballistic/revolver/attack_self(mob/living/user)
	var/num_unloaded = 0
	chambered = null
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		if(CB)
			CB.forceMove(drop_location())
			CB.bounce_away(FALSE, NONE)
			num_unloaded++
	if (num_unloaded)
		to_chat(user, "<span class='notice'>You unload [num_unloaded] shell\s from [src].</span>")
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/gun/ballistic/revolver/verb/spin()
	set name = "Spin Chamber"
	set category = "Object"
	set desc = "Click to spin your revolver's chamber."

	var/mob/M = usr

	if(M.stat || !in_range(M,src))
		return

	if(do_spin())
		usr.visible_message("[usr] spins [src]'s chamber.", "<span class='notice'>You spin [src]'s chamber.</span>")
	else
		verbs -= /obj/item/gun/ballistic/revolver/verb/spin

/obj/item/gun/ballistic/revolver/proc/do_spin()
	var/obj/item/ammo_box/magazine/internal/cylinder/C = magazine
	. = istype(C)
	if(.)
		C.spin()
		chamber_round(0)

/obj/item/gun/ballistic/revolver/can_shoot()
	return get_ammo(0,0)

/obj/item/gun/ballistic/revolver/get_ammo(countchambered = 0, countempties = 1)
	var/boolets = 0 //mature var names for mature people
	if (chambered && countchambered)
		boolets++
	if (magazine)
		boolets += magazine.ammo_count(countempties)
	return boolets

/obj/item/gun/ballistic/revolver/examine(mob/user)
	. = ..()
	. += "[get_ammo(0,0)] of those are live rounds."

/obj/item/gun/ballistic/revolver/detective/Initialize()
	. = ..()
	safe_calibers = magazine.caliber

/obj/item/gun/ballistic/revolver/detective/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if("38" in magazine.caliber)
		to_chat(user, "<span class='notice'>You begin to reinforce the barrel of [src]...</span>")
		if(magazine.ammo_count())
			afterattack(user, user)	//you know the drill
			user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
			return TRUE
		if(I.use_tool(src, user, 30))
			if(magazine.ammo_count())
				to_chat(user, "<span class='warning'>You can't modify it!</span>")
				return TRUE
			magazine.caliber = "357"
			desc = "The barrel and chamber assembly seems to have been modified."
			to_chat(user, "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .357 rounds.</span>")
	else
		to_chat(user, "<span class='notice'>You begin to revert the modifications to [src]...</span>")
		if(magazine.ammo_count())
			afterattack(user, user)	//and again
			user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
			return TRUE
		if(I.use_tool(src, user, 30))
			if(magazine.ammo_count())
				to_chat(user, "<span class='warning'>You can't modify it!</span>")
				return
			magazine.caliber = "38"
			desc = initial(desc)
			to_chat(user, "<span class='notice'>You remove the modifications on [src]. Now it will fire .38 rounds.</span>")
	return TRUE



///////////////////
// .38 REVOLVERS //
///////////////////

// .38 Detective					Keywords: .38, Double action, 6 rounds cylinder, Short barrel, Bootgun
/obj/item/gun/ballistic/revolver/detective
	name = ".38 revolver"
	desc = "An easily concealable, poorly-made .38 revolver. The manufacturer is unknown"
	icon_state = "detective"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38
	force = 10
	spread = 4
	obj_flags = UNIQUE_RENAME
	var/list/safe_calibers

///////////////////
// .45 ACP REVOLVERS //
///////////////////


//S&W 45						Keywords: .45, Single action, 7 rounds cylinder, Long barrel
/obj/item/gun/ballistic/revolver/revolver45
	name = ".45 Auto revolver"
	desc = "A customized S&W Model 625 revolver chambered for .45 ACP."
	item_state = "45revolver"
	icon_state = "45revolver"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev45
	fire_delay = 4.5
	spread = 1
	fire_sound = 'sound/f13weapons/45revolver.ogg'
	extra_damage = 5



////////////////////
// .357 REVOLVERS //
////////////////////

//357 Magnum					Keywords: .357, Single action, 6 rounds cylinder, long barrel
/obj/item/gun/ballistic/revolver/colt357
	name = "\improper .357 magnum revolver"
	desc = "A Colt Single Action Army revolver, chambered in .357 Magnum. The Gunslinger's prime choice."
	icon_state = "357colt"
	item_state = "357colt"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev357
	fire_delay = 4.5
	spread = 0
	fire_sound = 'sound/f13weapons/357magnum.ogg'
	extra_damage = 5

/obj/item/gun/ballistic/revolver/colt357/mateba //this is a skin that rigbe wanted
	name = "\improper Unica 6 auto-revolver"
	desc = "A pre-war high-power autorevolver commonly used by people who think they look cool."
	icon_state = "mateba"
	item_state = "mateba"
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'

//Lucky							Keywords: UNIQUE, .357, Double action, 6 rounds cylinder, Block chance, Fire delay -1
/obj/item/gun/ballistic/revolver/colt357/lucky
	name = "Lucky"
	desc = "An uniquely customized Colt SAA revolver. Holding it just makes you feel lucky. "
	icon_state = "lucky"
	item_state = "lucky"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 3
	block_chance = 35
	extra_penetration = 0.05

//Police revolver					Keywords: .357, Double action, 6 rounds cylinder, Pocket Pistol
/obj/item/gun/ballistic/revolver/police
	name = "police revolver"
	desc = "An unmarked snub-nosed double-action pre-war revolver meant for police use, phased out long ago in favor of semi-automatic pistols."
	icon_state = "police"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev357
	w_class = WEIGHT_CLASS_SMALL
	spread = 2
	fire_sound = 'sound/f13weapons/policepistol.ogg'
	extra_damage = -5



///////////////////
// .44 REVOLVERS //
///////////////////

//.44 Magnum revolver		 	Keywords: .44, Double action, 6 rounds cylinder
/obj/item/gun/ballistic/revolver/m29
	name = ".44 magnum revolver"
	desc = "A robust S&W Model 29 revolver, uniquely powerful and reliable. Do you feel lucky, punk?"
	item_state = "model29"
	icon_state = "m29"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44
	recoil = 0.1
	can_scope = FALSE
	scope_state = "revolver_scope"
	scope_x_offset = 6
	scope_y_offset = 24
	fire_sound = 'sound/f13weapons/44mag.ogg'
	extra_damage = 5

/obj/item/gun/ballistic/revolver/m29/alt
	name = "modern .44 magnum revolver"
	desc = "A custom, modernized S&W Model 29 revolver with a chrome finish and a polymer grip."
	item_state = "44magnum"
	icon_state = "mysterious_m29"
	can_scope = FALSE
	extra_damage = 5
	extra_speed = 80

//Chiappa Rhino                  Keywords: Enclave, .44, Double action, 6 rounds cylinder
/obj/item/gun/ballistic/revolver/m29/rhino_america
	name = "Rhino America"
	desc = "A revolver machined from a solid aluminium block. This one is coated in gold paint with its grip painted to look like the flag of the United States of America. This model has been specifically made to fire .44 magnum cartridges."
	item_state = "rhino_america"
	icon_state = "rhino_america"
	can_scope = FALSE
	extra_damage = 23 //for a combined total of 55 damage, as good as the 14mm pistol and plasma pistol.
	fire_delay = 3.5 //it should still fire slow but not too slow

//Peacekeeper					 Keywords: OASIS, .44, Double action, 6 rounds cylinder, Extra Firemode
/obj/item/gun/ballistic/revolver/m29/peacekeeper
	name = "Peacekeeper"
	desc = "When you don't just need excessive force, but crave it. This .44 has a special hammer mechanism, allowing for measured powerful shots, or fanning for a flurry of inaccurate shots."
	item_state = "m29peace"
	icon_state = "mysterious_m29"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	automatic = 1
	autofire_shot_delay = 1
	actions_types = list(/datum/action/item_action/toggle_firemode)
	can_scope = FALSE

//.44 Snubnose						Keywords: .44, Double action, 6 rounds cylinder, Short barrel
/obj/item/gun/ballistic/revolver/m29/snub
	name = "short .44 magnum revolver"
	desc = "A snubnose variant of the commonplace S&W Model 29 revolver. Sunshine in your pocket."
	icon_state = "m29_snub"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	w_class = WEIGHT_CLASS_SMALL
	spread = 3
	extra_damage = 0


//.44 single action		 			Keywords: .44, Single action, 6 rounds cylinder, Long barrel
/obj/item/gun/ballistic/revolver/revolver44
	name = "\improper .44 magnum single-action revolver"
	desc = "I hadn't noticed, but there on his hip, was a moderately sized iron..."
	item_state = "44colt"
	icon_state = "44colt"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44
	fire_delay = 4.5
	spread = 0
	fire_sound = 'sound/f13weapons/44revolver.ogg'


//Desert Ranger revolver			Keywords: .44, Single action, 6 rounds cylinder,
/obj/item/gun/ballistic/revolver/revolver44/desert_ranger
	name = "desert ranger revolver"
	desc = "I hadn't noticed, but there on his hip, was a really spiffy looking iron..."
	fire_delay = 4

//Sheriff's revolver			Keywords: .44, Single action, 6 rounds cylinder, 5 less damage than sequoia, 20% more pen
/obj/item/gun/ballistic/revolver/revolver44/sheriff
	name = "Biggest Iron"
	desc = "There was forty feet between them, when they stopped to make their play..."
	force = 25
	casing_ejector = TRUE//WHAT THE FUCK IS THIS GUN? FASTEST HAND IN THE WEST BETWEEN SHOTS, THAT'S WHAT.
	can_scope = TRUE
	scope_state = "revolver_scope"
	scope_x_offset = 6
	scope_y_offset = 24
	fire_sound = 'sound/f13weapons/sequoia.ogg'


//////////////////////
// .45-70 REVOLVERS //
//////////////////////

//Sequioa					Keywords: NCR, .45-70, 6 rounds cylinder, Double action, Heavy
/obj/item/gun/ballistic/revolver/sequoia
	name = "ranger sequoia"
	desc = "This customized Magnum BFR revolver is a trademark weapon of the New California Republic Rangers. It features a dark finish with intricate engravings etched all around the weapon. Engraved along the barrel are the words 'For Honorable Service,' and 'Against All Tyrants.' The hand grip bears the symbol of the NCR Rangers, a bear, and a brass plate attached to the bottom that reads '20 Years.' "
	icon_state = "sequoia"
	item_state = "sequoia"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	weapon_weight = WEAPON_MEDIUM
	recoil = 0.2
	fire_delay = 1
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'sound/f13weapons/sequoia.ogg'

/obj/item/gun/ballistic/revolver/sequoia/bayonet
	name = "bladed ranger sequoia"
	desc = "This heavy revolver is a trademark weapon of the New California Republic Rangers. This one has a blade attached to the handle for a painful pistolwhip."
	icon_state = "sequoia_b"
	item_state = "sequoia"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	force = 25
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'sound/f13weapons/sequoia.ogg'

//Hunting revolver				Keywords: .45-70, Double action, 5 rounds cylinder, Heavy
/obj/item/gun/ballistic/revolver/hunting
	name = "hunting revolver"
	desc = "An incredibly heavy, unwieldy Magnum BFR revolver chambered for the equally large .45-70 Government round."
	icon_state = "hunting_revolver"
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	recoil = 0.1
	can_scope = TRUE
	scope_state = "revolver_scope"
	fire_delay = 5.5
	scope_x_offset = 9
	scope_y_offset = 20
	fire_sound = 'sound/f13weapons/sequoia.ogg'
	extra_damage = -2
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'

/obj/item/gun/ballistic/revolver/hunting/klatue
	name = "degraded hunting revolver"
	desc = "A scoped double action revolver chambered in 45-70. This one is very worn."

/////////////////////
// WEIRD REVOLVERS //
/////////////////////


//Colt Army						Keywords: .45 long colt (bouncing), Single action, 6 rounds cylinder.
/obj/item/gun/ballistic/revolver/revolver45/gunslinger
	name = "\improper .45 long colt revolver"
	desc = "A Colt Single Action Army, chambered in the archaic .45 long colt cartridge."
	item_state = "coltwalker"
	icon_state = "peacemaker"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev45/gunslinger
	fire_delay = 4.5
	fire_sound = 'sound/f13weapons/45revolver.ogg'
	spread = 0 //Your reward for the slower fire rate is less spread anddd


//.223 Pistol					Keywords: .223, Double action, 5 rounds internal, Short barrel
/obj/item/gun/ballistic/revolver/thatgun
	name = ".223 pistol"
	desc = "The LAPD 2019 police revolver, a pre-war mechanical wonder. Chambered in .223, and electronically assisted for easy reload. They don't advertise for killers in the newspaper."
	icon_state = "thatgun"
	icon = 'icons/obj/guns/gunfruits2022/pistols.dmi'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/thatgun
	weapon_weight = WEAPON_MEDIUM
	spread = 4
	recoil = 0.5
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	extra_damage = 9
	extra_penetration = 0.08



/////////////
// NEEDLER //
/////////////

//Needler						Keywords: Needler, Double action, 10 rounds internal
/obj/item/gun/ballistic/revolver/needler
	name = "Needler pistol"
	desc = "You suspect this Bringham needler pistol was once used in scientific field studies. It uses small hard-plastic hypodermic darts as ammo. "
	icon_state = "needler"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/revneedler
	fire_sound = 'sound/weapons/gunshot_silenced.ogg'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/gun/ballistic/revolver/needler/ultra
	name = "Ultracite needler"
	desc = "An ultracite enhanced needler pistol." //Sounds like lame bethesda stuff to me
	icon_state = "ultraneedler"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/revneedler
	fire_sound = 'sound/weapons/gunshot_silenced.ogg'
	w_class = WEIGHT_CLASS_SMALL


// LEGACY STUFF

// A gun to play Russian Roulette!
// You can spin the chamber to randomize the position of the bullet.

/obj/item/gun/ballistic/revolver/russian
	name = "deer hunting revolver"
	desc = "A revolver for drinking games. Uses .357 ammo, and has a mechanism requiring you to spin the chamber before each trigger pull."
	icon_state = "russianrevolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rus357
	var/spun = FALSE

/obj/item/gun/ballistic/revolver/russian/do_spin()
	. = ..()
	spun = TRUE

/obj/item/gun/ballistic/revolver/russian/Initialize()
	. = ..()
	do_spin()
	spun = TRUE
	update_icon()

/obj/item/gun/ballistic/revolver/russian/attackby(obj/item/A, mob/user, params)
	..()
	if(get_ammo() > 0)
		spin()
		spun = TRUE
	update_icon()
	A.update_icon()
	return

/obj/item/gun/ballistic/revolver/russian/attack_self(mob/user)
	if(!spun)
		spin()
		spun = TRUE
		return
	..()

/obj/item/gun/ballistic/revolver/russian/afterattack(atom/target, mob/living/user, flag, params)
	. = ..(null, user, flag, params)

	if(flag)
		if(!(target in user.contents) && ismob(target))
			if(user.a_intent == INTENT_HARM) // Flogging action
				return

	if(isliving(user))
		if(!can_trigger_gun(user))
			return
	if(target != user)
		if(ismob(target))
			to_chat(user, "<span class='warning'>A mechanism prevents you from shooting anyone but yourself!</span>")
		return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!spun)
			to_chat(user, "<span class='warning'>You need to spin \the [src]'s chamber first!</span>")
			return

		spun = FALSE

		if(chambered)
			var/obj/item/ammo_casing/AC = chambered
			if(AC.fire_casing(user, user))
				playsound(user, fire_sound, 50, 1)
				var/zone = check_zone(user.zone_selected)
				var/obj/item/bodypart/affecting = H.get_bodypart(zone)
				if(zone == BODY_ZONE_HEAD || zone == BODY_ZONE_PRECISE_EYES || zone == BODY_ZONE_PRECISE_MOUTH)
					shoot_self(user, affecting)
				else
					user.visible_message("<span class='danger'>[user.name] cowardly fires [src] at [user.p_their()] [affecting.name]!</span>", "<span class='userdanger'>You cowardly fire [src] at your [affecting.name]!</span>", "<span class='italics'>You hear a gunshot!</span>")
				chambered = null
				return

		user.visible_message("<span class='danger'>*click*</span>")
		playsound(src, "gun_dry_fire", 30, 1)

/obj/item/gun/ballistic/revolver/russian/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	add_fingerprint(user)
	playsound(src, "gun_dry_fire", 30, TRUE)
	user.visible_message("<span class='danger'>[user.name] tries to fire \the [src] at the same time, but only succeeds at looking like an idiot.</span>", "<span class='danger'>\The [src]'s anti-combat mechanism prevents you from firing it at the same time!</span>")

/obj/item/gun/ballistic/revolver/russian/proc/shoot_self(mob/living/carbon/human/user, affecting = BODY_ZONE_HEAD)
	user.apply_damage(300, BRUTE, affecting)
	user.visible_message("<span class='danger'>[user.name] fires [src] at [user.p_their()] head!</span>", "<span class='userdanger'>You fire [src] at your head!</span>", "<span class='italics'>You hear a gunshot!</span>")

/obj/item/gun/ballistic/revolver/russian/soul
	name = "cursed Russian revolver"
	desc = "To play with this revolver requires wagering your very soul."

/obj/item/gun/ballistic/revolver/russian/soul/shoot_self(mob/living/user)
	..()
	var/obj/item/soulstone/anybody/SS = new /obj/item/soulstone/anybody(get_turf(src))
	if(!SS.transfer_soul("FORCE", user)) //Something went wrong
		qdel(SS)
		return
	user.visible_message("<span class='danger'>[user.name]'s soul is captured by \the [src]!</span>", "<span class='userdanger'>You've lost the gamble! Your soul is forfeit!</span>")


//////////////////
// CODE ARCHIVE //
//////////////////

/*SLING CODE
/obj/item/gun/ballistic/revolver/doublebarrel/improvised/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/stack/cable_coil) && !sawn_off)
		if(A.use_tool(src, user, 0, 10, skill_gain_mult = EASY_USE_TOOL_MULT))
			slot_flags = ITEM_SLOT_BACK
			to_chat(user, "<span class='notice'>You tie the lengths of cable to the shotgun, making a sling.</span>")
			slung = TRUE
			update_icon()
		else
			to_chat(user, "<span class='warning'>You need at least ten lengths of cable if you want to make a sling!</span>")

/obj/item/gun/ballistic/revolver/doublebarrel/improvised/update_overlays()
	. = ..()
	if(slung)
		. += "[icon_state]sling"

/obj/item/gun/ballistic/revolver/doublebarrel/improvised/sawoff(mob/user)
	. = ..()
	if(. && slung) //sawing off the gun removes the sling
		new /obj/item/stack/cable_coil(get_turf(src), 10)
		slung = 0
		update_icon()

//BREAK ACTION CODE
/obj/item/gun/ballistic/revolver/doublebarrel/attack_self(mob/living/user)
	var/num_unloaded = 0
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		chambered = null
		CB.forceMove(drop_location())
		CB.update_icon()
		num_unloaded++
	if (num_unloaded)
		to_chat(user, "<span class='notice'>You break open \the [src] and unload [num_unloaded] shell\s.</span>")
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

//DODGE CODE
/obj/item/gun/ballistic/revolver/colt357/lucky/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(attack_type == PROJECTILE_ATTACK)
		if(prob(block_chance))
			owner.visible_message("<span class='danger'>[owner] seems to dodge [attack_text] entirely thanks to [src]!</span>")
			playsound(src, pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 75, 1)
			return 1
	return 0


// -------------- HoS Modular Weapon System -------------
// ---------- Code originally from VoreStation ----------
/obj/item/gun/ballistic/revolver/mws
	name = "MWS-01 'Big Iron'"
	desc = "Modular Weapons System"

	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "mws"

	fire_sound = 'sound/weapons/Taser.ogg'

	mag_type = /obj/item/ammo_box/magazine/mws_mag
	spawnwithmagazine = FALSE

	recoil = 0

	var/charge_sections = 6

/obj/item/gun/ballistic/revolver/mws/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to remove the magazine.</span>"

/obj/item/gun/ballistic/revolver/mws/shoot_with_empty_chamber(mob/living/user as mob|obj)
	process_chamber(user)
	if(!chambered || !chambered.BB)
		to_chat(user, "<span class='danger'>*click*</span>")
		playsound(src, "gun_dry_fire", 30, 1)


/obj/item/gun/ballistic/revolver/mws/process_chamber(mob/living/user)
	if(chambered && !chambered.BB) //if BB is null, i.e the shot has been fired...
		var/obj/item/ammo_casing/mws_batt/shot = chambered
		if(shot.cell.charge >= shot.e_cost)
			shot.chargeshot()
		else
			for(var/B in magazine.stored_ammo)
				var/obj/item/ammo_casing/mws_batt/other_batt = B
				if(istype(other_batt,shot) && other_batt.cell.charge >= other_batt.e_cost)
					switch_to(other_batt, user)
					break
	update_icon()

/obj/item/gun/ballistic/revolver/mws/proc/switch_to(obj/item/ammo_casing/mws_batt/new_batt, mob/living/user)
	if(ishuman(user))
		if(chambered && new_batt.type == chambered.type)
			to_chat(user,"<span class='warning'>[src] is now using the next [new_batt.type_name] power cell.</span>")
		else
			to_chat(user,"<span class='warning'>[src] is now firing [new_batt.type_name].</span>")

	chambered = new_batt
	update_icon()

/obj/item/gun/ballistic/revolver/mws/attack_self(mob/living/user)
	if(!chambered)
		return

	var/list/stored_ammo = magazine.stored_ammo

	if(stored_ammo.len == 1)
		return //silly you.

	//Find an ammotype that ISN'T the same, or exhaust the list and don't change.
	var/our_slot = stored_ammo.Find(chambered)

	for(var/index in 1 to stored_ammo.len)
		var/true_index = ((our_slot + index - 1) % stored_ammo.len) + 1 // Stupid ONE BASED lists!
		var/obj/item/ammo_casing/mws_batt/next_batt = stored_ammo[true_index]
		if(chambered != next_batt && !istype(next_batt, chambered.type) && next_batt.cell.charge >= next_batt.e_cost)
			switch_to(next_batt, user)
			break

/obj/item/gun/ballistic/revolver/mws/AltClick(mob/living/user)
	.=..()
	if(magazine)
		user.put_in_hands(magazine)
		magazine.update_icon()
		if(magazine.ammo_count())
			playsound(src, 'sound/weapons/gun_magazine_remove_full.ogg', 70, 1)
		else
			playsound(src, "gun_remove_empty_magazine", 70, 1)
		magazine = null
		to_chat(user, "<span class='notice'>You pull the magazine out of [src].</span>")
		if(chambered)
			chambered = null
		update_icon()

/obj/item/gun/ballistic/revolver/mws/update_overlays()
	.=..()
	if(!chambered)
		return

	var/obj/item/ammo_casing/mws_batt/batt = chambered
	var/batt_color = batt.type_color //Used many times

	//Mode bar
	var/image/mode_bar = image(icon, icon_state = "[initial(icon_state)]_type")
	mode_bar.color = batt_color
	. += mode_bar

	//Barrel color
	var/mutable_appearance/barrel_color = mutable_appearance(icon, "[initial(icon_state)]_barrel", color = batt_color)
	barrel_color.alpha = 150
	. += barrel_color

	//Charge bar
	var/ratio = can_shoot() ? CEILING(clamp(batt.cell.charge / batt.cell.maxcharge, 0, 1) * charge_sections, 1) : 0
	for(var/i = 0, i < ratio, i++)
		var/mutable_appearance/charge_bar = mutable_appearance(icon,  "[initial(icon_state)]_charge", color = batt_color)
		charge_bar.pixel_x = i
		. += charge_bar


//ACCIDENTALLY SHOOT YOURSELF IN THE FACE CODE
/obj/item/gun/ballistic/revolver/reverse/can_trigger_gun(mob/living/user)
	if((HAS_TRAIT(user, TRAIT_CLUMSY)) || (user.mind && HAS_TRAIT(user.mind, TRAIT_CLOWN_MENTALITY)))
		return ..()
	if(process_fire(user, user, FALSE, null, BODY_ZONE_HEAD))
		user.visible_message("<span class='warning'>[user] somehow manages to shoot [user.p_them()]self in the face!</span>", "<span class='userdanger'>You somehow shoot yourself in the face! How the hell?!</span>")
		user.emote("scream")
		user.drop_all_held_items()
		user.DefaultCombatKnockdown(80)
*/
