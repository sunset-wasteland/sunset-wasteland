/obj/item/stack/sheet/animalhide/chitin
	name = "insect chitin"
	desc = "Thick insect chitin, tough but light."
	singular_name = "piece of insect chitin"
	icon_state = "sheet-chitin"
	grind_results = list(/datum/reagent/sodium = 3, /datum/reagent/chlorine = 3)
	merge_type = /obj/item/stack/sheet/animalhide/chitin

// CUTTING LEATHER INTO STRIPS (for further crafting)
/obj/item/stack/sheet/leather/attackby(obj/item/W, mob/user, params)
	if(W.get_sharpness())
		playsound(loc, 'sound/weapons/slice.ogg', 50, 1, -1)
		user.visible_message("[user] starts shredding the [src] into strips.", "<span class='notice'>You start shredding the [src] into strips</span>", "<span class='italics'>You hear the sound of leather being ripped.</span>")
		if(do_after(user, 50, target = src))
			to_chat(user, "<span class='notice'>You cut strips from this [src.singular_name].</span>")
			new /obj/item/stack/sheet/leatherstrips(user.drop_location(), 1)
			use(1)
	else
		return ..()

/obj/item/stack/sheet/leatherstrips
	name = "leather strips"
	desc = "long leather strips that can be used for crafting various things."
	singular_name = "strip of leather"
	icon_state = "leather-strip"
	item_state = "sheet-leather"
	merge_type = /obj/item/stack/sheet/leatherstrips

GLOBAL_LIST_INIT(leatherstrips_recipes, list ( \
	new/datum/stack_recipe("slave labor outfit", /obj/item/clothing/suit/armor/f13/slavelabor, 2, time = 50),  \
	new/datum/stack_recipe("jabroni outfit", /obj/item/clothing/under/jabroni, 4, time = 80), \
	new/datum/stack_recipe("muzzle", /obj/item/clothing/mask/muzzle, 2, time = 40),  \
	new/datum/stack_recipe("pet collar", /obj/item/clothing/neck/petcollar, 2, time = 40) \
))

/obj/item/stack/sheet/leatherstrips/get_main_recipes()
	. = ..()
	. += GLOB.leatherstrips_recipes
