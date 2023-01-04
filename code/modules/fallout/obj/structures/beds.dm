/*
 * Wooden beds and old beds - Use wood for low tech like Oasis and Legion. Old for ruins.
 */

/obj/structure/bed/wooden
	name = "wooden bed"
	desc = "Wooden frame with a mattress"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	icon_state = "bed_wood"
	max_integrity = 80

/obj/structure/bed/old
	name = "ancient bed"
	desc = "Filthy beyond belief."
	icon_state = "bed_dirty"
	max_integrity = 50

/obj/structure/bed/club
	name = "bed"
	desc = "A vibrant pink and purple mattress cast in a thick metal frame."
	icon_state = "bed_club"
	max_integrity = 150

// Obsolete
/obj/structure/bed/oldalt
	name = "ancient bed"
	desc = "Filthy beyond belief."
	icon_state = "bed_dirty"
	max_integrity = 50

/obj/structure/bed/mattress
	name = "mattress"
	desc = "This is used to lie in, sleep in or strap on."
	icon_state = "mattress0"
	buildstacktype = /obj/item/stack/sheet/cloth
	buildstackamount = 3
//	decontool = /obj/item/wirecutters

/obj/structure/bed/mattress/pregame/New()
	..()
	icon_state = "mattress[rand(0,5)]"
