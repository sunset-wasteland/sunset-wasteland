//Holodisks stuff
//Here we get the basic mechanics as coded by WB! Praise him and other Unknown coder for this.

/obj/item/weapon/holodisk
	name = "holodisk"
	desc = "A durable laser-readable storage device produced by Wattz Electronics, based on the tape holography technology, storing their information safely for extended periods of time."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "holodisk"
	item_state = "holodisk"
	throwforce = 0
	hitsound = null
	w_class = 1.0
	throw_speed = 3
	throw_range = 7
	attack_verb = list("Played holodisk")
	var/busy = 0
	var/soundLength = 50
	var/soundFile = 'sound/f13music/mysterious_stranger.ogg'

/obj/item/weapon/holodisk/New()
		src.name = "holodisk #[rand(1,999)]"
		return ..()

/obj/item/weapon/holodisk/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	src.playAudio(user)
	return ..()

/obj/item/weapon/holodisk/attack_self(mob/user as mob)
	src.playAudio(user)
	return

/obj/item/weapon/holodisk/proc/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			src.icon_state = initial(src.icon_state)
			src.busy = 0
	return

//Here we get any holodisks we want, using the basic mechanics.
/*  disabling holodisks until the sound files are replaced with much more reasonably-sized files.

/obj/item/weapon/holodisk/holodiskabducted
	soundFile =  'sound/f13items/holodisk_abducted.ogg'
	soundLength = 430

//One special holodisk can gib the listener or cripple someone else.

/obj/item/weapon/holodisk/holodiskcursed
	soundFile =  'sound/f13items/holodisk_cursed.ogg'
	soundLength = 230
	throwforce = 50 //It's funny counting you can't give objects hand to hand on TG, but have to throw or drop them instead.

/obj/item/weapon/holodisk/holodiskcursed/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			if(user) user.gib()
			src.icon_state = initial(src.icon_state)
			src.busy = 0
	return
/obj/item/weapon/holodisk/powerarmor
	desc = "A durable laser-readable storage device produced by Wattz Electronics, based on the tape holography technology, storing their information safely for extended periods of time.<br>This one is labeled, 'Power Armor For Dummies.'"
	soundFile =  'sound/f13items/holodisk_pa.ogg'
	soundLength = 30

/obj/item/weapon/holodisk/music1
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording one'"
	soundFile =  'sound/f13music/new_vegas_show_1.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music2
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording two'"
	soundFile =  'sound/f13music/new_vegas_show_2.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music3
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording three'"
	soundFile =  'sound/f13music/new_vegas_show_3.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music4
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording four'"
	soundFile =  'sound/f13music/new_vegas_show_4.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music5
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording five'"
	soundFile =  'sound/f13music/new_vegas_show_5.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/music6
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording six'"
	soundFile =  'sound/f13music/new_vegas_show_6.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/musicspecial1
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording special1'"
	soundFile =  'sound/f13music/new_vegas_show_bonus_1.ogg'
	soundLength = 186

/obj/item/weapon/holodisk/musicspecial2
	desc = "A durable laser-readable storage device. This one is labeled 'NV Recording special2 personal favourite'"
	soundFile =  'sound/f13music/new_vegas_show_bonus_2.ogg'
	soundLength = 246

/obj/item/weapon/holodisk/questfinished
	desc = "A durable laser-readable storage device. This one is labeled 'A curious sound'"
	soundFile =  'sound/f13music/quest.ogg'
	soundLength = 12

/obj/item/weapon/holodisk/clown
	desc = "A durable laser-readable storage device. This one is labeled 'Chick chicka boom'"
	soundFile =  'sound/ambience/clown.ogg'
	soundLength = 61
*/
/*
/obj/item/weapon/holodisk/powerarmor/playAudio(mob/user)
	if(!src.busy)
		src.busy = 1
		playsound(get_turf(src),src.soundFile,50)
		src.add_fingerprint(user)
		src.icon_state = "[initial(src.icon_state)]anim"
		spawn(src.soundLength)
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				var/datum/martial_art/patraining/F = new/datum/martial_art/patraining(null)
				F.teach(H)
				H << "<span class='boldannounce'>You have received the specialized training needed to move in any form of Power Armor.</span>"
			src.icon_state = initial(src.icon_state)
			src.busy = 0
			visible_message("<span class='warning'>[src] self-destructs!</span>")
			qdel(src)
	return
*/
//////////////////////////
//////////Flags//////////
/////////////////////////

/obj/item/flag
	name = "empty flag"
	desc = "You could put some leather on this to make a flag."
	density = 1
	anchored = 1
	w_class = 4

	layer = 4.1
	icon = 'icons/obj/flags.dmi'
	icon_state = "emptyflag"
	item_state = "emptyflag"
	var/faction = null
	var/removing

/obj/item/flag/Initialize()
	. = ..()
	AddComponent(/datum/component/largetransparency, y_size = 1)

/obj/item/flag/ncr
	name = "NCR flag"
	desc = "A flag with a two headed bear, the symbol of the New California Republic."
	icon_state = "ncrflag"
	item_state = "ncrflag"
	faction = "NCR"

/obj/item/flag/bos
	name = "Brotherhood of Steel flag"
	desc = "A red and black flag with a sword surrounded in gears and wings, in a dazzling gold."
	icon_state = "bosflag"
	item_state = "bosflag"
	faction = FACTION_BROTHERHOOD

/obj/item/flag/legion
	name = "Legion flag"
	desc = "A flag with a golden bull, the symbol of Caesar's Legion."
	icon_state = "legionflag"
	item_state = "legionflag"
	faction = FACTION_LEGION

/obj/item/flag/followers
	name = "Followers of the Apocalypse flag"
	desc = "A white flag with the black Follower's of the Apocalpyse cross on it."
	icon_state = "followersflag"
	item_state = "followersflag"
	faction = FACTION_FOLLOWERS

/obj/item/flag/locust
	name = "Locust flag"
	desc = "A flag with a skull, the symbol of Locusts."
	icon_state = "locustflag"
	item_state = "locustflag"
	faction = "Locust"

/obj/item/flag/yuma
	name = "Yuma banner"
	desc = "A banner depicting three rivers meeting at its center, overlaid with an ear of corn."
	icon_state = "cornflag"
	item_state = "cornflag"
	faction = "Oasis"

/obj/item/flag/vtcc
	name = "Vault-Tec Cityscape Coalition flag"
	desc = "A flag reminiscent of that from old America. The symbol of Vault-Tec appropriated in place of the old stars sharing their colour, with 4 stripes in 2 colours."
	icon_state = "vtccflag"
	item_state = "vtccflag"
	faction = "VTCC"

/obj/item/flag/vtcc/highvhills
	name = "High Valley Hills flag"
	desc = "A flag with two white stripes, blue border and a red centre with a white Vault-Tec logo, turned on its side and stretched out."

/obj/item/flag/khan
	name = "Great Khans flag"
	desc = "A flag worn and weathered from a long cherished history. A decorated smiling skull smiles mockingly upon those who challenge it."
	icon_state = "khanflag"
	item_state = "khanflag"
	faction = "Great Khans"

/obj/item/flag/enclave
	name = "Enclave flag"
	desc = "A flag worn and weathered from the Casper's Snow."
	icon_state = "enclaveflag"
	item_state = "enclaveflag"
	faction = FACTION_ENCLAVE

/obj/item/flag/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/sheet/leather) && item_state == "emptyflag")
		visible_message("<span class='notice'>[user] begins to make a flag.</span>")
		if(do_after(user, 60, target = src))
			var/obj/item/stack/sheet/leather/H = I
			if(H.use(1))
				var/list/choices = list("NCR", "Legion", "Yuma", "BOS", "Followers", "Great Khans")
				var/flag = input("Please choose which faction flag you wish to create.") in choices
				switch(flag)
					if(FACTION_NCR)
						name = "NCR flag"
						desc = "A flag with a two headed bear, the symbol of the New California Republic."
						icon_state = "ncrflag"
						item_state = "ncrflag"
						faction = "NCR"
					if(FACTION_LEGION)
						name = "Legion flag"
						desc = "A flag with a golden bull, the symbol of Caesar's Legion."
						icon_state = "legionflag"
						item_state = "legionflag"
						faction = FACTION_LEGION
					if(FACTION_BIGHORN)
						name = "Yuma flag"
						desc = "A banner depicting three rivers meeting at its center, overlaid with an ear of corn."
						icon_state = "cornflag"
						item_state = "cornflag"
						faction = FACTION_BIGHORN
					if(FACTION_BROTHERHOOD)
						name = "BOS flag"
						desc = "A red and black flag with a sword surrounded in gears and wings, in a dazzling gold."
						icon_state = "bosflag"
						item_state = "bosflag"
						faction = FACTION_BROTHERHOOD
					if("Followers")
						name = "Followers of the Apocalypse flag"
						desc = "A white flag with the black Follower's of the Apocalpyse cross on it."
						icon_state = "followersflag"
						item_state = "followersflag"
						faction = FACTION_FOLLOWERS
					if("Great Khans")
						name = "Great Khans flag"
						desc = "A flag worn and weathered from a long cherished history. A decorated smiling skull smiles mockingly upon those who challenge it."
						icon_state = "khanflag"
						item_state = "khanflag"
						faction = "Great Khans"
					if(FACTION_ENCLAVE)
						name = "Enclave flag"
						desc = "A flag worn and weathered from the Casper's Snow."
						icon_state = "enclaveflag"
						item_state = "enclaveflag"
						faction = FACTION_ENCLAVE
				update_icon()
	else
		attack_hand(user)

/obj/item/flag/attack_hand(mob/user)
	if(!removing && item_state != "emptyflag")
		visible_message("<span class='notice'>[user] begins to remove a flag.</span>")
		removing = TRUE
		if(do_after(user, 30, target = src))
			new /obj/item/stack/sheet/leather(loc)
			name = "empty flag"
			icon_state = "emptyflag"
			item_state = "emptyflag"
			faction = null
			update_icon()
			removing = FALSE
	else
		anchored = 0
		..()

/obj/item/flag/dropped(mob/user)
	..()
	anchored = 1

/obj/item/flag/throw_at(atom/target, range, speed, mob/thrower, spin=1, diagonals_first)
	dropped(thrower)
////////Viper stuff////// subject to change, but this way was simple
/obj/item/viper_venom
	name = "Viper venom"
	desc = "A container of special Mojave viper venom, prepared by a skilled Viper shaman." //only used for viper spear recipe
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle7"
	throwforce = 2
	throw_speed = 2
	throw_range = 3
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("bashed")

/obj/item/warpaint_bowl
	name = "warpaint bowl"
	desc = "A small ceramic bowl, used for the mixing of warpaints by a skilled shaman."
	icon = 'icons/mob/tribe_warpaint.dmi'
	icon_state = "wp_bowl"
	/// List of choosable warpaint icon states.
	var/static/list/choices = list(
		"cazador", "claw", "facestripe",
		"armwrap", "legwrap", "lizard",
		"priestess", "stripe", "spider",
		"prongs", "tears", "thorns",
		"whitestripe")
	/// Currently selected warpaint.
	var/paint_type = null
	/// Currently selected warpaint color.
	var/paint_color = "FFFFFF"

/obj/item/warpaint_bowl/attack_self(mob/user)
	. = ..()
	var/chosen_paint = input(user, "Pick a warpaint style.", "Tribal warpaint", paint_type) as null|anything in choices
	if(!chosen_paint)
		return
	paint_type = chosen_paint

	var/chosen_color = input(user, "Pick a warpaint color.", "Tribal warpaint", paint_color) as null|color
	if(!chosen_color)
		return
	paint_color = chosen_color

/obj/item/warpaint_bowl/attack(mob/living/M, mob/living/user, attackchain_flags, damage_multiplier)
	if(!paint_type || !paint_color)
		to_chat(user, span_warning("You need to select a style first!"))
		return
	if(!user.Adjacent(M) || !ishuman(M))
		return ..()
	var/mob/living/carbon/human/H = M
	if((H.warpaint == paint_type) && (H.warpaint_color == paint_color))
		to_chat(user, span_warning("[H] is already painted with this style!"))
		return

	user.visible_message(span_notice("[user] starts painting [H] with [src]."), span_notice("You start painting [H] with [src]."))
	if(!do_mob(user, H, 10 SECONDS))
		return
	user.visible_message(span_notice("[user] applies warpaint onto [H]."), span_notice("You apply warpaint onto [H]."))

	H.warpaint = paint_type
	H.warpaint_color = paint_color
	H.update_body()
