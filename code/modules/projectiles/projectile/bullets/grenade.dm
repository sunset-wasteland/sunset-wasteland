// 40mm (Grenade Launcher

/obj/item/projectile/bullet/rocket/a40mm
	name ="40mm grenade"
	desc = "Oh no."
	icon_state= "bolter"
	damage = 35
	armour_penetration = 0.25
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets
	shrapnel_magnitude = 6

/obj/item/projectile/bullet/rocket/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, -1, 3, 3, 0, flame_range = 3)
	new /obj/effect/temp_visual/explosion(get_turf(target))
	return BULLET_ACT_HIT

//40mm tear gas

/obj/item/projectile/bullet/a40mmg
	name ="40mm baton round"
	icon_state = "bolter"
	damage_type = STAMINA
	damage = 80//If you get hit with this directly? Ouch...
	var/datum/effect_system/smoke_spread/bad/smoke

/obj/item/projectile/bullet/a40mmg/New()
	..()
	src.smoke = new /datum/effect_system/smoke_spread/teargas
	src.smoke.attach(src)

/obj/item/projectile/bullet/a40mmg/Destroy()
	qdel(smoke)
	return ..()

/obj/item/projectile/bullet/a40mmg/on_hit(atom/target, blocked = FALSE)
	playsound(src.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	smoke.set_up(4, src)
	smoke.start()
