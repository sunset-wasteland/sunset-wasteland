// This was coded by Fulminating Gold for Crashpoint3.
/obj/item/gun/ballistic
	var/modifiable = FALSE
	var/modifiablegun = FALSE
	var/obj/item/ammo_box/magazine/internal/mag = null
	//Base Stats
	var/base_size = null
	//Sprite Attachment Points
	var/list/xattachlist = list("east" = 26, "west" = 9, "south" = 21, "north" = 15) //x coordinate for attachment point
	var/list/yattachlist = list("east" = 20, "west" = 17, "south" = 16, "north" = 21) //y coordinate for attachment point
	//Attachment Points
	var/obj/item/gunpart/attachableparts[] = list("internal" = new /obj/item/gunpart/BHS_Receiver, "internal2" = null, "east" = null, "west" = null, "south" = null, "north" = null)
	//Blacklisted Parts
	//var/obj/item/gunpart/blacklistedparts[] = list("stock", "barrel", "receiver", "scope", "burstcam")
	var/obj/item/gunpart/blacklistedparts[] = list()

/obj/item/gun/ballistic/Initialize()
	. = ..()
	if(modifiable)
		if(w_class == WEIGHT_CLASS_SMALL && base_size == null)
			base_size = 0.5
		else if(w_class == WEIGHT_CLASS_NORMAL && base_size == null)
			base_size = 1
		else if(w_class == WEIGHT_CLASS_BULKY && base_size == null)
			base_size = 4

		updatestats()
		updatesprites()
		updatesize()

/obj/item/gun/ballistic/proc/updatestats()
	//base stats
	spread = initial(spread)
	fire_delay = initial(fire_delay)
	extra_damage = initial(extra_damage)
	extra_penetration = initial(extra_penetration)
	if(istype(src, /obj/item/gun/ballistic/automatic))
		var/obj/item/gun/ballistic/automatic/I = src
		I.set_burst_size = initial(I.set_burst_size)
	//scope
	if(modifiablegun)
		zoomable = FALSE
		azoom = null
		zoom_amt = 10
		zoom_out_amt = 13
		qdel(azoom)
	//"for loop" for changing stats
	for(var/i = 1; i <= attachableparts.len; i++)
		if(attachableparts[attachableparts[i]] != null)
			spread = spread * (1 - attachableparts[attachableparts[i]].accuracymodifier)
			fire_delay = fire_delay * (1 - attachableparts[attachableparts[i]].firedelaymodifier)
			extra_damage = extra_damage * (1 + attachableparts[attachableparts[i]].damagemodifier)
			if(istype(src, /obj/item/gun/ballistic/automatic))
				var/obj/item/gun/ballistic/automatic/I = src
				I.set_burst_size = I.set_burst_size + I.attachableparts[attachableparts[i]].burstmodifier //changes when refreshed
			if(attachableparts[attachableparts[i]].parttype == "scope") //works but doesnt add scope
				zoomable = TRUE
				build_zooming()

/obj/item/gun/ballistic/proc/updatesprites()
	overlays = null
	for(var/i = 1; i <= attachableparts.len; i++)
		if(attachableparts[attachableparts[i]] != null)
			var/image/I = image(attachableparts[attachableparts[i]].icon, src, "[attachableparts[attachableparts[i]].icon_state]-A")
			I.pixel_x = xattachlist[attachableparts[i]] - attachableparts[attachableparts[i]].attachx
			I.pixel_y = yattachlist[attachableparts[i]] - attachableparts[attachableparts[i]].attachy
			overlays += I

/obj/item/gun/ballistic/proc/updatesize()
	var/size = base_size
	for(var/i = 1; i <= attachableparts.len; i++)
		if(attachableparts[attachableparts[i]] != null)
			size += attachableparts[attachableparts[i]].size
	if(size < 1)
		w_class = WEIGHT_CLASS_SMALL
		weapon_weight = WEAPON_LIGHT
	else if(size <= 3)
		w_class = WEIGHT_CLASS_NORMAL
		weapon_weight = WEAPON_MEDIUM
	else
		w_class = WEIGHT_CLASS_BULKY
		weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/attackby(obj/item/I, mob/user, params)
	if(!modifiablegun)
		. = ..()
		return
	//adding parts
	if(istype(I, /obj/item/gunpart) && modifiable && do_after(user, 8, target = src))
		var/obj/item/gunpart/A = I
		for(var/i = 1; i <= attachableparts.len; i++)
			if(!istype(src, /obj/item/gun/ballistic/automatic) && A.parttype == "burstcam")
				return
			if(A.partlocation == "[attachableparts[i]]" && blacklistedparts.Find(A.parttype) <= 0)
				if(attachableparts[attachableparts[i]] != null)
					user.dropItemToGround(attachableparts[attachableparts[i]])
				attachableparts[attachableparts[i]] = A
				attachableparts[attachableparts[i]].forceMove(src)
				playsound(src, "gun_insert_full_magazine", 70, 1)
				updatestats()
				updatesprites()
				updatesize()
				return
	//open or close for modifications
	if(istype(I, /obj/item/screwdriver))
		if(modifiable && attachableparts[attachableparts[1]] != null && do_after(user, 20, target = src))
			playsound(src, "gun_insert_full_magazine", 70, 1)
			mag_type = initial(mag_type)
			if(istype(src, /obj/item/gun/ballistic/revolver) || istype(src, /obj/item/gun/ballistic/shotgun))
				magazine = mag
			modifiable = FALSE
			to_chat(user, "<span class='notice'>You screw the \the [src] closed for usage.</span>")
			updatestats()
		else if(!modifiable && do_after(user, 20, target = src))
			if(istype(src, /obj/item/gun/ballistic/revolver) || istype(src, /obj/item/gun/ballistic/shotgun))
				//magazine.empty_magazine()
				mag = magazine
				chambered = null
				while (get_ammo() > 0)
					var/obj/item/ammo_casing/CB
					CB = mag.get_round(0)
					if(CB)
						CB.forceMove(drop_location())
						CB.bounce_away(FALSE, NONE)
			else
				user.dropItemToGround(magazine)
				user.dropItemToGround(chambered)
			playsound(src, "gun_insert_full_magazine", 70, 1)
			mag_type = null
			magazine = null
			chambered = null
			modifiable = TRUE
			to_chat(user, "<span class='notice'>You screw the \the [src] open for modification. </span>")
			updatestats()
			zoomable = FALSE
		return
	//removing parts
	if(istype(I, /obj/item/crowbar) && modifiable && do_after(user, 15, target = src))
		to_chat(user, "<span class='notice'>You remove the parts from \the [src]. </span>")
		for(var/i = 1; i <= attachableparts.len; i++)
			if(attachableparts[attachableparts[i]] != null)
				user.dropItemToGround(attachableparts[attachableparts[i]])
				attachableparts[attachableparts[i]] = null
		updatestats()
		updatesprites()
		updatesize()
		return
