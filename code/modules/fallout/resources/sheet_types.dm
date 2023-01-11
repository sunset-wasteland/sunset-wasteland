
GLOBAL_LIST_INIT(hay_recipes, list ( \
	new/datum/stack_recipe("rice hat", /obj/item/clothing/head/rice_hat, 4, time = 5, one_per_turf = FALSE, on_floor = FALSE), \
	new/datum/stack_recipe("wicker basket", /obj/structure/closet/crate/wicker, 15, time = 20, one_per_turf = TRUE, on_floor = TRUE), \
))


/obj/item/stack/sheet/hay
	name = "hay"
	desc = "A bundle of hay. Useful for weaving. Hail the Wickerman." //Brahmin can't currently eat this.
	singular_name = "hay stalk"
	icon_state = "sheet-hay"
	item_state = "sheet-hay"
	force = 1
	throwforce = 1
	throw_speed = 1
	throw_range = 2
	max_amount = 50 //reduced from 500, made stacks sprites irrelevant due to scaling.
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
	resistance_flags = FLAMMABLE
	attack_verb = list("tickled", "poked", "whipped")
	hitsound = 'sound/weapons/grenadelaunch.ogg'
	merge_type = /obj/item/stack/sheet/hay

/obj/item/stack/sheet/hay/get_main_recipes()
	return GLOB.hay_recipes

/obj/item/stack/sheet/hay/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins shoving hay up [user.p_their()] arse! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	addtimer(CALLBACK(user, /mob/proc/gib), 30)
	return BRUTELOSS

/obj/item/stack/sheet/hay/fifty
	amount = 50

/obj/item/stack/sheet/hay/twenty
	amount = 20

/obj/item/stack/sheet/hay/ten
	amount = 10

/obj/item/stack/sheet/hay/five
	amount = 5

/*
prewar alloys
*/
GLOBAL_LIST_INIT(prewar_recipes, list ( \
	new/datum/stack_recipe("modern chair", /obj/structure/chair/comfy/modern, 2, time = 5, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("gun locker", /obj/structure/guncase, 4, time = 10, one_per_turf = TRUE, on_floor = TRUE), \

))

/obj/item/stack/sheet/prewar
	name = "pre-war alloys"
	singular_name = "pre war alloy"
	desc = "This sheet was manufactured by using advanced smelting techniques before the war."
	icon_state = "sheet-prewar"
	item_state = "sheet-metal"
	custom_materials = list()
	throwforce = 10
	flags_1 = CONDUCT_1
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 80)
	resistance_flags = FIRE_PROOF
	merge_type = /obj/item/stack/sheet/prewar
	grind_results = list(/datum/reagent/iron = 20, /datum/reagent/toxin/plasma = 20)

/obj/item/stack/sheet/prewar/get_main_recipes()
	. = ..()
	. += GLOB.prewar_recipes

/obj/item/stack/sheet/prewar/five
	amount = 5

/obj/item/stack/sheet/prewar/twenty
	amount = 20

/obj/item/stack/sheet/prewar/fifty
	amount = 50
