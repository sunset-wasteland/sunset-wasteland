/obj/item/projectile/bullet/shrapnel/plasma // plasma grenades
	name = "plasma split"
	embedding = list(embed_chance=0, ignore_throwspeed_threshold=FALSE, fall_chance=0, embed_chance_turf_mod=0, payload = /obj/item/shrapnel)
	custom_materials = list(/datum/material/iron=50)
	damage = 35
	armour_penetration = 0.8
	damage_type = BURN
	range = 30
	dismemberment = 0
	ricochets_max = 0
	ricochet_chance = 0
	ricochet_incidence_leeway = 0
	sharpness = SHARP_EDGED
	wound_bonus = 60
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "plasma1"

/obj/item/shrapnel/bullet/a556/microshrapnel
	name = "\improper 5.56mm microshrapnel bullet"

/obj/item/shrapnel/bullet/a762/microshrapnel
	name = "\improper 7.62mm microshrapnel bullet"

// HE Rockets / GRENADES - Identical to stingball for embedding. Mostly.
/obj/item/projectile/bullet/shrapnel_launcher
	name = "shrapnel cloud"
	damage = 12
	range = 6//Had this at 12, but it was a bit too much. Adjust as needed.
	wound_bonus = 50
	dismemberment = 15//This is a HORRIBLE idea, but by god it'll be funny. - Carl
	icon = 'icons/obj/shards.dmi'
	icon_state = "tiny"
	armour_penetration = 1//Identical with this. :)
	ricochets_max = 0
	ricochet_chance = 0
	ricochet_incidence_leeway = 0
	embedding = list(embed_chance=100, ignore_throwspeed_threshold=TRUE, fall_chance=0, embed_chance_turf_mod=-100, projectile_payload = /obj/item/shrapnel/launcher)
	sharpness = SHARP_EDGED

/obj/item/projectile/bullet/shrapnel_launcher/mortar
	damage = 6//Half damage for double range.
	range = 12//Read above.

/obj/item/shrapnel/launcher
	name = "shrapnel chunk"
	embedding = list(embed_chance=100, fall_chance=0, jostle_chance=7, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.7, pain_mult=3, jostle_pain_mult=3)
	armour_penetration = 1//As above.
	icon_state = "tiny"
