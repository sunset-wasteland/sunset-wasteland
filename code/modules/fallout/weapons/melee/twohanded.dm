// In this document: Axes, Spears, Heavy clubs, Sledgehammers, Advanced twohanded weapons

/obj/item/twohanded // Two handed template. Slower melee speed than onehanders.
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee2h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee2h_righthand.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/backslot_weapon.dmi'
	attack_speed = CLICK_CD_MELEE * 1.1
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 30)
	var/icon_prefix = null
	var/wielded = FALSE

/obj/item/twohanded/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)

/obj/item/twohanded/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE

/obj/item/twohanded/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE

/obj/item/twohanded/update_icon_state()
	icon_state = "[icon_prefix]"



//////////
// AXES //
//////////			-bonus damage to all doors, windows

// Legion Axe		Keywords: Damage 30/60 do not change these numbers
/obj/item/twohanded/legionaxe
	name = "war-honed axe"
	desc = "Heavy fireman axe from the old world, restored to working order by Legion craftsmen. Excellent for smashing doors or heads."
	icon_state = "legionaxe"
	icon_prefix = "legionaxe"
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file
	force = 30
	throwforce = 15
	wound_bonus = 10
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	resistance_flags = FIRE_PROOF
	attack_verb = list("axed", "chopped", "cleaved", "torn", "hacked")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/twohanded/legionaxe/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 80, 0 , hitsound) //axes are not known for being precision butchering tools
	AddComponent(/datum/component/two_handed, force_unwielded=30, force_wielded=60, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/legionaxe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] axes [user.p_them()]self from head to toe! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

/obj/item/twohanded/legionaxe/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure/window)) //destroys windows and grilles in one hit (or more if it has a ton of health like plasmaglass)
		var/obj/structure/window/W = A
		W.take_damage(250, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/grille))
		var/obj/structure/grille/G = A
		G.take_damage(60, BRUTE, "melee", 0)
	else if(istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		D.take_damage(40, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/M = A
		M.take_damage(40, BRUTE, "melee", 0)

// Fire Axe			Keywords: Damage 25/46
/obj/item/twohanded/fireaxe
	name = "fire axe"
	desc = "Heavy fireman axe from the old world, with its distinctive red colour and excellent quality steel. Excellent for smashing doors."
	icon_state = "fireaxe"
	icon_prefix = "fireaxe"
	force = 26
	throwforce = 15
	wound_bonus = 10
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	resistance_flags = FIRE_PROOF
	attack_verb = list("axed", "chopped", "cleaved", "torn", "hacked")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/twohanded/fireaxe/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 80, 0 , hitsound) //axes are not known for being precision butchering tools
	AddComponent(/datum/component/two_handed, force_unwielded=26, force_wielded=46, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/fireaxe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] axes [user.p_them()]self from head to toe! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

/obj/item/twohanded/fireaxe/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure/window)) //destroys windows and grilles in one hit (or more if it has a ton of health like plasmaglass)
		var/obj/structure/window/W = A
		W.take_damage(200, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/grille))
		var/obj/structure/grille/G = A
		G.take_damage(40, BRUTE, "melee", 0)
	else if(istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		D.take_damage(20, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/M = A
		M.take_damage(20, BRUTE, "melee", 0)


// Bone Axe			Keywords: Damage 25/40, Bonus vs door, window
/obj/item/twohanded/fireaxe/boneaxe
	name = "bone axe"
	desc = "A large, vicious axe crafted out of several sharpened bone plates and crudely tied together. Made of monsters, by killing monsters, for killing monsters."
	icon_state = "boneaxe"
	icon_prefix = "boneaxe"
	resistance_flags = null

/obj/item/twohanded/fireaxe/boneaxe/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=25, force_wielded=40, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/fireaxe/boneaxe/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure/window)) //destroys windows and grilles in one hit (or more if it has a ton of health like plasmaglass)
		var/obj/structure/window/W = A
		W.take_damage(100, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/grille))
		var/obj/structure/grille/G = A
		G.take_damage(20, BRUTE, "melee", 0)
	else if(istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		D.take_damage(10, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/M = A
		M.take_damage(10, BRUTE, "melee", 0)

// Bumper Sword		Keywords: Damage 25/45, Bonus vs window, door
/obj/item/twohanded/fireaxe/bmprsword
	name = "bumper sword"
	desc = "It was too big to be called a sword. Massive, thick, heavy, and far too rough. Indeed, it was more like a heap of raw iron."
	icon_prefix = "bumper"
	icon_state = "bumper"
	wound_bonus = null
	sharpness = SHARP_NONE
	resistance_flags = null
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file

/obj/item/twohanded/fireaxe/bmprsword/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure/window))
		var/obj/structure/window/W = A
		W.take_damage(200, BRUTE, "melee", 0)
	else if(istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		D.take_damage(15, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/M = A
		M.take_damage(15, BRUTE, "melee", 0)


////////////
// SPEARS //
////////////		- Reach

// Metal Spear		Keywords: Damage 10/30, Reach
/obj/item/twohanded/spear
	name = "spear"
	desc = "A simple spear with a metal head and wooden shaft."
	icon_state = "spear-metal"
	icon_prefix = "spear-metal"
	force = 10
	throwforce = 30
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file
	throw_speed = 4
	embedding = list("embed_chance" = 0)
	max_reach = 2
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("attacked", "impaled", "jabbed", "torn", "gored")
	sharpness = SHARP_POINTY
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	wound_bonus = -15
	bare_wound_bonus = 15
	var/obj/item/grenade/explosive = null
	var/war_cry = "AAAAARGH!!!"

/obj/item/twohanded/spear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 70) //decent in a pinch, but pretty bad.
	AddElement(/datum/element/sword_point)
	AddComponent(/datum/component/two_handed, force_unwielded=10, force_wielded=30, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/spear/rightclick_attack_self(mob/user)
	if(explosive)
		explosive.attack_self(user)
		return
	. = ..()

/obj/item/twohanded/spear/update_overlays()
	. = ..()
	if(explosive)
		. += "spearbomb_overlay"

/obj/item/twohanded/spear/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins to sword-swallow \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	if(explosive) //Citadel Edit removes qdel and explosive.forcemove(AM)
		user.say("[war_cry]", forced="spear warcry")
		explosive.prime()
		user.gib()
		return BRUTELOSS
	return BRUTELOSS

/obj/item/twohanded/spear/examine(mob/user)
	. = ..()
	if(explosive)
		. += "<span class='notice'>Alt-click to set your war cry.</span>"
		. += "<span class='notice'>Right-click in combat mode to activate the attached explosive.</span>"

/obj/item/twohanded/spear/afterattack(atom/movable/AM, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(isopenturf(AM)) //So you can actually melee with it
		return
	if(explosive && wielded) //Citadel edit removes qdel and explosive.forcemove(AM)
		user.say("[war_cry]", forced="spear warcry")
		explosive.prime()

/obj/item/twohanded/spear/grenade_prime_react(obj/item/grenade/nade) //Citadel edit, removes throw_impact because memes
	nade.forceMove(get_turf(src))
	qdel(src)

/obj/item/twohanded/spear/AltClick(mob/user)
	. = ..()
	if(user.canUseTopic(src, BE_CLOSE))
		..()
		if(!explosive)
			return
		if(istype(user) && loc == user)
			var/input = stripped_input(user,"What do you want your war cry to be? You will shout it when you hit someone in melee.", ,"", 50)
			if(input)
				src.war_cry = input
		return TRUE

/obj/item/twohanded/spear/CheckParts(list/parts_list)
	var/obj/item/twohanded/spear/S = locate() in parts_list
	if(S)
		if(S.explosive)
			S.explosive.forceMove(get_turf(src))
			S.explosive = null
		parts_list -= S
		qdel(S)
	..()
	var/obj/item/grenade/G = locate() in contents
	if(G)
		explosive = G
		name = "explosive lance"
		embedding = list(embed_chance = 0, pain_mult = 1)//elances should not be embeddable
		updateEmbedding()
		desc = "A makeshift spear with \a [G] attached to it."
	update_icon()


// Lance		Keywords: LEGION, Damage 25/40, Reach
/obj/item/twohanded/spear/lance
	name = "legion lance"
	desc = "A long spear made in the Legions war foundries. Useful for fighting tribals and hunting when ammunition is scarce."
	icon_state = "spear-lance"
	icon_prefix = "spear-lance"

/obj/item/twohanded/spear/lance/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=25, force_wielded=40, icon_wielded="[icon_prefix]2")


// Scrap spear		Keywords: Damage 17/28, Reach, Throw bonus
/obj/item/twohanded/spear/scrapspear
	name = "scrap spear"
	desc = "Made from two rods, a glass shard and some duct tape. For the modern tribal or the truly desperate. Surprisingly effective when thrown."
	icon_state = "spear-scrap"
	icon_prefix = "spear-scrap"
	throwforce = 28
	embedding = list("pain_mult" = 2, "embed_chance" = 35, "fall_chance" = 20)

/obj/item/twohanded/spear/scrapspear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=17, force_wielded=28, icon_wielded="[icon_prefix]2")


// Bone Spear		Keywords: TRIBAL, Damage 18/30, Armor-piercing +0.2, Reach
/obj/item/twohanded/spear/bonespear
	name = "bone spear"
	desc = "A haphazardly-constructed yet still deadly weapon. The pinnacle of modern technology."
	icon_state = "spear-bone"
	icon_prefix = "spear-bone"
	force = 15
	throwforce = 25
	throw_speed = 4
	armour_penetration = 0.07
	max_reach = 2
	embedding = list("embedded_impact_pain_multiplier" = 3)
	custom_materials = null
	attack_verb = list("attacked", "poked", "jabbed", "torn", "gored")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/twohanded/spear/bonespear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=18, force_wielded=30, icon_wielded="[icon_prefix]2")


// Deathclaw Spear		Keywords: TRIBAL, Damage 20/45, Armor-piercing +0.09, Reach
/obj/item/twohanded/spear/bonespear/deathclaw
	name = "deathclaw spear"
	desc = "A finely crafted spear with a shaft wrapped in deathclaw leather. It is tipped with a claw from a beast that must have been terrifying in size."
	icon_state = "spear-claw"
	icon_prefix = "spear-claw"
	force = 20
	armour_penetration = 0.09//From 0.15
	sharpness = SHARP_EDGED

/obj/item/twohanded/spear/bonespear/deathclaw/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 20, force_wielded = 45, icon_wielded="[icon_prefix]2")



/////////////////
// HEAVY CLUBS //
/////////////////		- Bonus damage to stamina, low damage

// Baseball Bat			Keywords: Damage 20/30
/obj/item/twohanded/baseball
	name = "baseball bat"
	desc = "There ain't a skull in the league that can withstand a swatter."
	icon_state = "baseball"
	icon_prefix = "baseball"
	force = 24
	throwforce = 12
	attack_verb = list("beat", "smacked", "clubbed", "clobbered")
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = SHARP_NONE

/obj/item/twohanded/baseball/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 24, force_wielded = 30, icon_wielded="[icon_prefix]2")

// Spiked Baseball Bat		Keywords: Damage 24/33, Damage bonus Stamina, Sharp
/obj/item/twohanded/baseball/spiked
	name = "spiked baseball bat"
	desc = "There ain't a skull in the league that can withstand a swatter, especially with large nails drilled through the top of it."
	icon_state = "baseballspike"
	icon_prefix = "baseballspike"
	force = 26
	throwforce = 15
	wound_bonus = 5
	sharpness = SHARP_POINTY

/obj/item/twohanded/baseball/spiked/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 26, force_wielded = 33, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/baseball/spiked/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(15, STAMINA, "chest", M.run_armor_check("chest", "melee"))

// Louisville Slugger		Keywords: Damage 25/32, Damage bonus Stamina
/obj/item/twohanded/baseball/louisville
	name = "Louisville slugger"
	desc = "Purification in progress."
	icon_state = "louisville"
	icon_prefix = "louisville"
	attack_verb = list("thwacked", "bashed", "louisville slugged", "hit", "bludgeoned", "whacked", "bonked")

/obj/item/twohanded/baseball/louisville/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 25, force_wielded = 34, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/baseball/louisville/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(25, STAMINA, null, 0)

// Golf Club		Keywords: Damage 22/32, Damage bonus Stamina
/obj/item/twohanded/baseball/golfclub
	name = "golf club"
	desc = "What's with all the Eyelander reskins?"
	icon_state = "golfclub"
	icon_prefix = "golfclub"
	attack_verb = list("smashed", "bashed", "fored", "hit", "bludgeoned", "whacked")

/obj/item/twohanded/baseball/golfclub/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 22, force_wielded = 32, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/baseball/golfclub/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(20, STAMINA, "chest", M.run_armor_check("chest", "melee"))



///////////////////
// SLEDGEHAMMERS //
///////////////////			-Bonus damage to all structures, such as barricades

// Template hammer, can't be used for crafting/smithing and lacks the demolishing bonus so avoid using it
/obj/item/twohanded/sledgehammer
	name = "sledgehammer"
	desc = "A heavy sledgehammer that lost most of its use besides caving in heads and barricades."
	attack_speed = CLICK_CD_MELEE * 1.2
	force = 25
	throwforce = 20 // Huge hammers aren't that great for throwing
	sharpness = SHARP_NONE
	attack_verb = list("bashed", "pounded", "bludgeoned", "pummeled", "thrashed")


// Sledgehammer			Keywords: Damage 25/45, Blacksmithing
/obj/item/twohanded/sledgehammer/simple
	icon_state = "hammer-sledge"
	icon_prefix = "hammer-sledge"
	var/qualitymod = 0

/obj/item/twohanded/sledgehammer/simple/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 25, force_wielded = 45, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/sledgehammer/simple/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure))
		var/obj/structure/W = A
		W.take_damage(20, BRUTE, "melee", 0)

/////////////////////////////////
// ADVANCED TWO HANDED WEAPONS //
/////////////////////////////////

// Thermic Lance		Keywords: Damage 5/60, AP 0.1 Special Damage Type - Burn, bonus damage metal door
/obj/item/twohanded/thermic_lance
	name = "thermic lance"
	desc = "A versatile power-welding tool. Useful for cutting apart metal things like airlocks, bars, and probably limbs."
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	icon_state = "thermiclance"
	icon_prefix = "thermiclance"
	lefthand_file = 'icons/fallout/onmob/weapons/64x64_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/64x64_righthand.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	damtype = "fire"
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file
	force = 5
	armour_penetration = 0.1
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	attack_verb = list("burned", "welded", "cauterized", "melted", "charred")
	hitsound = 'sound/items/welder2.ogg'

/obj/item/twohanded/thermic_lance/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=5, force_wielded=60, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/thermic_lance/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/M = A
		M.take_damage(40, BRUTE, "melee", 0)
		playsound(loc, hitsound, 70, TRUE)
	else if(istype(A, /obj/structure/simple_door/metal))
		var/obj/structure/simple_door/metal/G = A
		G.take_damage(30, BRUTE, "melee", 0)
		playsound(loc, hitsound, 70, TRUE)
	else if(istype(A, /obj/machinery/door/unpowered))
		var/obj/machinery/door/unpowered/U = A
		U.take_damage(20, BRUTE, "melee", 0)
		playsound(loc, hitsound, 70, TRUE)
	else if(istype(A, /obj/structure))
		playsound(loc, hitsound, 70, TRUE)
	else if(istype(A, /obj/machinery))
		playsound(loc, hitsound, 70, TRUE)
	else if(istype(A, /turf/closed))
		playsound(loc, hitsound, 70, TRUE)

// Proton axe			Keywords: Damage 20/41, AP 0.7
/obj/item/melee/transforming/energy/axe/protonaxe
	name = "proton axe"
	desc = "The experimental proton axe resembles a futuristic war-axe with a glowing blue blade of electrical energy at its head."
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee2h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee2h_righthand.dmi'
	icon_state = "protonaxe"
	icon_state_on = "protonaxe_on"
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = null
	force = 20
	force_on = 41
	armour_penetration = 0.7
	throwforce = 15
	throwforce_on = 50

/obj/item/melee/transforming/energy/axe/protonaxe/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)
	AddElement(/datum/element/update_icon_updates_onmob)

// Inquisitorial axe			Keywords: Damage 6/32, AP 0.9, SPEAR REACH, BACK SLOT ENABLED
/obj/item/twohanded/inquis_spear
	name = "Inquisitorial polearm"
	desc = "An odd looking spear of sorts, tipped with what appears to be a plasma chamber. In theory, this should splash the target with plasma on each hit. Does it work, however?"
	icon = 'icons/fallout/objects/melee/twohanded.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee2h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee2h_righthand.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/backslot_weapon.dmi'
	item_state = "plasma"
	icon_state = "plasma"
	damtype = BURN
	sharpness = SHARP_POINTY
	slot_flags = ITEM_SLOT_BACK
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file
	force = 32
	armour_penetration = 0.9
	max_reach = 2
	throwforce = 1//WHY WOULD YOU THROW THIS?
	throw_speed = 1
	throw_range = 1
	var/equipsound = 'sound/f13weapons/equipsounds/declonequip.ogg'
	attack_verb = list("seared","jabbed","punctured")
	hitsound = 'sound/f13weapons/sear.ogg'

/obj/item/twohanded/inquis_spear/proc/play_inquis_equip_sound(src, volume=50)
	if(src && equipsound && volume)
		var/played_sound = equipsound

		if(islist(equipsound))
			played_sound = pick(equipsound)

		playsound(src, played_sound, volume, 1)

/obj/item/twohanded/inquis_spear/pickup(mob/living/user)
	. = ..()
	play_inquis_equip_sound(src)

/obj/item/twohanded/inquis_spear/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=6, force_wielded=32, icon_wielded="[item_state]2")
	AddElement(/datum/element/update_icon_updates_onmob)
	AddElement(/datum/element/sword_point)

// Super Sledge			Keywords: Damage 25/60
/obj/item/twohanded/sledgehammer/supersledge
	name = "super sledge"
	desc = "A heavy sledgehammer manufacted from ultra-dense materials, developed by the Brotherhood of Steel. It looks like it could crush someone's skull with ease."
	icon_state = "hammer-super"
	icon_prefix = "hammer-super"
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file
	force = 25

/obj/item/twohanded/sledgehammer/supersledge/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 25, force_wielded = 60, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/sledgehammer/supersledge/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure))
		var/obj/structure/W = A
		W.take_damage(25, BRUTE, "melee", 0)
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /obj/machinery))
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /turf/closed))
		playsound(loc, hitsound, 80, TRUE)

// Rocket-assisted Sledgehammer			Keywords: Damage 20/52, Mining  Issues left: mining only when dual wielded, sound to play always on hit
/obj/item/twohanded/sledgehammer/rockethammer
	name = "rocket-assisted sledgehammer"
	desc = "This pre-War model was originally used by construction crews for demolition. Fitted with a rocket booster at the head, \
	the sledgehammer would behave like a normal tool until it reached a certain acceleration point, when the booster would activate  \
	and deliver a tremendously powerful impact, easily crushing concrete."
	icon_state = "hammer-rocket"
	icon_prefix = "hammer-rocket"
	force = 20
	tool_behaviour = TOOL_MINING
	toolspeed = 0.5
	hitsound = "sound/f13effects/explosion_distant_2.ogg"
	usesound = "sound/f13effects/explosion_distant_2.ogg"
	var/digrange = 1
	var/attacksound = "sound/f13effects/explosion_distant_2.ogg"
	var/sound = "sound/f13effects/explosion_distant_2.ogg"

/obj/item/twohanded/sledgehammer/rockethammer/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 20, force_wielded = 52, icon_wielded="[icon_prefix]2")
	AddComponent(/datum/component/knockback, 1, FALSE, TRUE)

/obj/item/twohanded/sledgehammer/rockethammer/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure))
		var/obj/structure/W = A
		W.take_damage(10, BRUTE, "melee", 0)
		playsound(loc, hitsound, 50, TRUE)
	else if(istype(A, /obj/machinery))
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /turf/closed))
		playsound(loc, hitsound, 80, TRUE)

// The Court Martial	Keywords: UNIQUE, Damage 20/52, Inferior mining
/obj/item/twohanded/sledgehammer/rockethammer/courtmartial
	name = "the court martial"
	desc = "The Captain found use for this during a discussion with a would-be deserter. He grew so fond of it he had the engineers refit the hammer head \
	to focus its energy on impact, at the cost of utility as a mining tool. <br>The men call it the Court Martial, and if you think it's a joke you better think again \
	before your skull assumes a consistency reminiscent of a smashed egg."
	icon_state = "hammer-courtmartial"
	icon_prefix = "hammer-courtmartial"
	toolspeed = 0.8

/obj/item/twohanded/sledgehammer/rockethammer/courtmartial/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure))
		var/obj/structure/W = A
		W.take_damage(10, BRUTE, "melee", 0)
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /obj/machinery))
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /turf/closed))
		playsound(loc, hitsound, 80, TRUE)

// Atom's Judgement			Keywords: UNIQUE, Damage 25/55, Damage bonus Rad
/obj/item/twohanded/sledgehammer/atomsjudgement
	name = "atom's judgement"
	desc = "A heavy hammer with a head that consists of leaking fusion cores. Might be unhealthy."
	icon_state = "hammer-atom"
	icon_prefix = "hammer-atom"
	force = 25

/obj/item/twohanded/sledgehammer/atomsjudgement/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 25, force_wielded = 55, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/sledgehammer/atomsjudgement/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_effect(300, EFFECT_IRRADIATE, 0)


// War Mace			Keywords: TRIBAL, Damage 25/45, AP 0.2
/obj/item/twohanded/sledgehammer/warmace
	name = "war mace"
	desc = "A heavy wooden club with a turquoise head."
	icon_state = "hammer-war"
	icon_prefix = "hammer-war"
	force = 25
	throwforce = 20
	block_parry_data = /datum/block_parry_data/smith_generic //data is in finished items file
	armour_penetration = 0.2
	attack_verb = list("bashed", "pounded", "bludgeoned", "pummeled", "thrashed")

/obj/item/twohanded/sledgehammer/warmace/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 25, force_wielded = 45, icon_wielded="[icon_prefix]2")


// Shaman staff				Keywords: Damage 15/30, Big stamina damage buff
/obj/item/twohanded/sledgehammer/shamanstaff
	name = "shaman staff"
	desc = "An intricate staff, carried for centuries by the shaman class of the Wayfayer Tribe."
	icon_state = "staff-shaman"
	icon_prefix = "staff-shaman"
	force = 15
	attack_verb = list("bashed", "pounded", "bludgeoned", "pummeled", "thrashed")

/obj/item/twohanded/sledgehammer/shamanstaff/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 15, force_wielded = 30, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/sledgehammer/shamanstaff/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(25, STAMINA, "chest", M.run_armor_check("chest", "melee"))

// Staff of Mars			Keywords: Damage 10/10, Damage bonus Burn + Stamina
/obj/item/twohanded/sledgehammer/marsstaff
	name = "Staff of Mars"
	desc = "A staff crafted by the guidance of Mars."
	icon_state = "staff-mars"
	icon_prefix = "staff-mars"
	hitsound = "swing_hit"
	attack_verb = list("bashed", "pounded", "bludgeoned", "pummeled", "enlightened")

/obj/item/twohanded/sledgehammer/marsstaff/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 5, force_wielded = 10, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/sledgehammer/marsstaff/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(2, BURN, 0)
	M.apply_damage(25, STAMINA, "chest", M.run_armor_check("chest", "melee"))

/obj/item/twohanded/sledgehammer/marsstaff/pickup(mob/living/user, slot)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/U = user
		if(U.job in list("Priestess of Mars"))
		else
			to_chat(user, "<span class='userdanger'>You invoke the wrath of Mars!</span>")
			user.emote("scream")
			user.apply_damage(30, BURN, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
			user.dropItemToGround(src, TRUE)
			user.Knockdown(50)
		return

// Chainsaw			Keywords: Damage 25/55, big bonus vs wooden barricades
/obj/item/twohanded/chainsaw
	name = "chainsaw"
	desc = "A versatile power tool. Useful for limbing trees and delimbing humans."
	icon_state = "chainsaw"
	icon_prefix = "chainsaw"
	force = 8
	wound_bonus = 15
	bare_wound_bonus = 15
	sharpness = SHARP_EDGED
	resistance_flags = FIRE_PROOF
	attack_verb = list("sawed", "shredded", "mauled")
	throw_speed = 2
	throw_range = 2
	throwforce = 5
	toolspeed = 0.5
	tool_behaviour = TOOL_SAW
	hitsound = 'sound/weapons/chainsawhit.ogg'

/obj/item/twohanded/chainsaw/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 30, 100, 0, 'sound/weapons/chainsawhit.ogg', TRUE)
	AddComponent(/datum/component/two_handed, force_unwielded = 8, force_wielded = 55, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/chainsaw/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure/barricade/wooden)) //destroys windows and grilles in one hit (or more if it has a ton of health like plasmaglass)
		var/obj/structure/barricade/wooden/K = A
		K.take_damage(40, BRUTE, "melee", 0)
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /obj/structure))
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /obj/machinery))
		playsound(loc, hitsound, 80, TRUE)
	else if(istype(A, /turf/closed))
		playsound(loc, hitsound, 80, TRUE)


//Steel Saw		Keywords: Damage 10/27, 2x attackspeed, Wound Bonus, Tool saw-off, structure bonus damage
/obj/item/twohanded/steelsaw
	name = "steel saw"
	desc = "A long, heavy circular saw with reinforced blades, designed for cutting through I-beams."
	icon = 'icons/fallout/objects/melee/melee.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/melee2h_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/melee2h_righthand.dmi'
	icon_state = "steelsaw"
	item_state = "steelsaw"
	icon_prefix = "steelsaw"
	force = 4
	toolspeed = 0.5
	wound_bonus = 20
	bare_wound_bonus = 20
	hitsound = 'sound/weapons/chainsawhit.ogg'
	tool_behaviour = TOOL_SAW
	sharpness = SHARP_EDGED
	resistance_flags = FIRE_PROOF
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = null
	total_mass = TOTAL_MASS_NORMAL_ITEM //it swings faster
	var/structure_bonus_damage = 20
	var/on_icon_state = "steelsaw_on"
	var/off_icon_state = "steelsaw"
	var/on_item_state = "steelsaw_on"
	var/off_item_state = "steelsaw"
	var/weight_class_on = WEIGHT_CLASS_HUGE
	var/on = FALSE
	var/force_on = 27 //10 more dps than chainsaw, but less perhit
	var/force_off = 10
	var/on_sound = 'sound/weapons/chainsawhit.ogg'

/obj/item/twohanded/steelsaw/attack_self(mob/user)
	on = !on
	if(on)
		user.visible_message("<span class ='warning'>[user] pulls the cord, starting up the [src] with a roar and letting the blades spin up.</span>")
		icon_state = on_icon_state
		item_state = on_item_state
		w_class = weight_class_on
		force = force_on
		attack_speed = CLICK_CD_MELEE * 0.5
		attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
		playsound(loc, on_sound, 50, TRUE)
	else
		user.visible_message("<span class ='notice'>[user] presses the off button, stopping the noise and the carnage.</span>")
		icon_state = off_icon_state
		item_state = off_item_state
		w_class = WEIGHT_CLASS_BULKY
		force = force_off
		attack_verb = list("poked", "scraped")
		attack_speed = CLICK_CD_MELEE * 1.2
	add_fingerprint(user)

/obj/item/twohanded/steelsaw/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 30, 100, 0, 'sound/weapons/chainsawhit.ogg', TRUE)
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)
	update_icon()

/obj/item/twohanded/steelsaw/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure)) //hurts structures more (it can cut through i-beams, it can ostensibly cut through weaker shit)
		var/obj/structure/S = A
		S.take_damage(structure_bonus_damage, BRUTE, "melee", 0, armour_penetration = src.armour_penetration)
	else if(istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		D.take_damage(structure_bonus_damage, BRUTE, "melee", 0, armour_penetration = src.armour_penetration)


/obj/item/twohanded/steelsaw/suicide_act(mob/living/carbon/user)
	if(on)
		user.visible_message("<span class='suicide'>[user] begins to tear [user.p_their()] head off with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(src, 'sound/weapons/chainsawhit.ogg', 100, 1)
		var/obj/item/bodypart/head/myhead = user.get_bodypart(BODY_ZONE_HEAD)
		if(myhead)
			myhead.dismember()
	else
		user.visible_message("<span class='suicide'>[user] smashes [src] into [user.p_their()] neck, destroying [user.p_their()] esophagus! It looks like [user.p_theyre()] trying to commit suicide!</span>")
		playsound(src, 'sound/weapons/genhit1.ogg', 100, 1)
	return(BRUTELOSS)

//autoaxe		Keywords: Damage 10/29, 2x attackspeed, Wound Bonus, structure bonus damage, 0.3 AP
/obj/item/twohanded/steelsaw/autoaxe
	name = "auto axe"
	desc = "A reinforced and heavier steel saw, upgraded using the parts of a car engine. A little heavy and ungainly to use as a tool, however."
	icon_state = "autoaxe"
	item_state = "autoaxe"
	icon_prefix = "autoaxe"
	force_on = 29
	attack_speed = CLICK_CD_MELEE * 1.5
	armour_penetration = 0.3
	on_icon_state = "autoaxe_on"
	off_icon_state = "autoaxe"
	on_item_state = "autoaxe_on"
	off_item_state = "autoaxe"
	toolspeed = 2
	structure_bonus_damage = 40

/obj/item/twohanded/steelsaw/autoaxe/attack_self(mob/user)
	on = !on
	if(on)
		user.visible_message("<span class ='warning'>[user] turns the starting crank on the [src], starting it up with a guttral roar.</span>")
		icon_state = on_icon_state
		item_state = on_item_state
		w_class = weight_class_on
		force = force_on
		attack_speed = CLICK_CD_MELEE * 0.5
		attack_verb = list("sawed", "torn", "cut", "chopped", "diced")
		playsound(loc, on_sound, 50, TRUE)
	else
		user.visible_message("<span class ='notice'>[user] cuts the throttle on the [src], letting the blades slowly spin down.</span>")
		icon_state = off_icon_state
		item_state = off_item_state
		w_class = WEIGHT_CLASS_BULKY
		force = force_off
		attack_verb = list("poked", "scraped")
		attack_speed = CLICK_CD_MELEE * 1.5
	add_fingerprint(user)
/*
CODE ARCHIVE

CODE FOR POISON EFFECT
/obj/item/twohanded/spear/ultra/attack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(20, TOX, null, 0)

//GREY TIDE
/obj/item/twohanded/spear/grey_tide
	icon_state = "spearglass0"
	name = "\improper Grey Tide"
	desc = "Recovered from the aftermath of a revolt aboard Defense Outpost Theta Aegis, in which a seemingly endless tide of Assistants caused heavy casualities among Nanotrasen military forces."
	throwforce = 20
	throw_speed = 4
	attack_verb = list("gored")
	var/clonechance = 50
	var/clonedamage = 12
	var/clonespeed = 0
	var/clone_replication_chance = 30
	var/clone_lifespan = 100


/obj/item/twohanded/spear/grey_tide/afterattack(atom/movable/AM, mob/living/user, proximity)
	. = ..()
	if(!proximity)
		return
	user.faction |= "greytide([REF(user)])"
	if(isliving(AM))
		var/mob/living/L = AM
		if(istype (L, /mob/living/simple_animal/hostile/illusion))
			return
		if(!L.stat && prob(50))
			var/mob/living/simple_animal/hostile/illusion/M = new(user.loc)
			M.faction = user.faction.Copy()
			M.Copy_Parent(user, 100, user.health/2.5, 12, 30)
			M.GiveTarget(L)


/obj/item/twohanded/bonespear/venom //added for Viper raiders -Thes
	container_type = INJECTABLE
	name = "Viper spear"
	desc = "A bone spear which has been modified to envenomate targets without drawing as much blood. Wielding it with both hands allows for stronger blows, but renders the venom ineffective.<br>It has been designed to allow for easily refitting the tip with a typical spear blade after the venom is dry."
	force_unwielded = 11 //unwielded force decreased to reflect special spear point design and prevent excessive damage during envenomation


/obj/item/twohanded/bonespear/venom/attack(mob/living/L, mob/user)
	..()
	if(!istype(L))
		return

	if(!wielded) //sends empty message when venom is dry and defaults back to normal attack, and allows for injection attack if possible//
		if(!reagents.total_volume)
			to_chat(user, "<span class='warning'>[src]'s venom has been used up!</span>")
		else
			if(L.can_inject(user, 1))
				to_chat(user, "<span class='warning'>Your light strike successfully injects venom into [L]'s veins.</span>")
				. = 1

				add_logs(user, L, "stabbed", src) //left this here, but it may or may not work properly

				var/amount_per_transfer_from_this = 8
				var/fraction = min(amount_per_transfer_from_this/reagents.total_volume, 1)

				if(reagents.total_volume)
					if(L.reagents)
						reagents.reaction(L, INJECT, fraction)
						reagents.trans_to(L, amount_per_transfer_from_this)
			else
				..()

/obj/item/twohanded/bonespear/venom/Initialize()
	. = ..()
	create_reagents(72) //mix that causes quick incap without significant risk of death, at least with one attacker. 4-5 attacks on a single target typically causes histamine symptoms, fatigue, sleep, as well as minor suffocation, toxins, and possible liver damage
	reagents.add_reagent(/datum/reagent/venom,12)
	reagents.add_reagent(/datum/reagent/sodium_thiopental, 50)
	reagents.add_reagent(/datum/reagent/pancuronium, 10)
//end of Viper spear. Venom mix is interesting but a simpler poisoned weapon solution might be more generally useful, with injectable or open container weapons that have lower volume but can be easily refilled with small doses of venom or something
*/
