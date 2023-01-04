/obj/structure/closet/anchored //For mappers to easily placed anchored closets
	anchored = TRUE
	storage_capacity = 32

//Fallout closets
/obj/structure/closet/locker
	name = "locker"
	desc = "It's a basic storage unit."
	icon = 'icons/fallout/objects/furniture/closet.dmi'
	icon_state = "gray"

/obj/structure/closet/locker/oldstyle  //modded Eris sprite
	icon_state = "oldstyle"

/obj/structure/closet/locker/medcabinet
	name = "medicine cabinet"
	desc = "For pills and such."
	icon_state = "medcab"
	wall_mounted = 1
	storage_capacity = 16
	mob_storage_capacity = 0
	max_mob_size = MOB_SIZE_TINY

/obj/structure/closet/locker/fridge
	name = "fridge"
	desc = "Old fridge without power."
	icon_state = "fridger"
