
/datum/supply_pack/goody
	access = NONE
	group = "Goodies"
	goody = PACK_GOODY_PRIVATE

//fallout changes

/datum/supply_pack/goody/realstimpaks
	name = "Stimpak box"
	desc = "Contains one full box of stimpaks, ready to be consumed.."
	cost = 9500
	contains = list(/obj/item/storage/box/medicine/stimpaks/stimpaks5)

/datum/supply_pack/goody/stimpaks
	name = "Imitation Stimpak box"
	desc = "Contains one full box of homemade stimpaks, ready to be consumed.."
	cost = 5500
	contains = list(/obj/item/storage/box/medicine/stimpaks/imitation_stimpaks5)

/datum/supply_pack/goody/musket
	name = "Laser musket"
	desc = "Contains one laser musket, homemade, if you are to lazy to make one."
	cost = 3000
	contains = list(/obj/item/gun/ballistic/rifle/hobo/lasmusket,
					/obj/item/ammo_box/lasmusket)

/datum/supply_pack/goody/sharpenerf13
	name = "Weapon Sharpener" //Possibly the most broken item in the entirety of cargo.
	desc = "Contains one whetstone that allows the weapon to be sharpened, no matter the quality of weapon."
	cost = 250000
	contains = list(/obj/item/sharpener/bos)

/datum/supply_pack/goody/bosbooksf13
	name = "Chain and Codex"
	desc = "Contains one Chain that Binds and one Codex book."
	cost = 50
	contains = list(/obj/item/book/manual/bos/chain,
					/obj/item/book/manual/bos/codex)

//fallout changes ends here

/datum/supply_pack/goody/combatknives_single
	name = "Combat Knife Single-Pack"
	desc = "Contains one sharpened combat knive. Guaranteed to fit snugly inside any Brotherhood-standard boot."
	cost = 800
	contains = list(/obj/item/melee/onehanded/knife/hunting)

/datum/supply_pack/goody/sologamermitts
	name = "Insulated Gloves Single-Pack"
	desc = "The backbone of modern society. Barely ever ordered for actual engineering."
	cost = 800
	contains = list(/obj/item/clothing/gloves/color/yellow)

/datum/supply_pack/goody/firstaidbruises_single
	name = "Bruise Treatment Kit Single-Pack"
	desc = "A single brute first-aid kit, perfect for recovering from being crushed in an airlock. Did you know people get crushed in airlocks all the time? Interesting..."
	cost = 330
	contains = list(/obj/item/storage/firstaid/brute)

/datum/supply_pack/goody/firstaidburns_single
	name = "Burn Treatment Kit Single-Pack"
	desc = "A single burn first-aid kit. The advertisement displays a winking atmospheric technician giving a thumbs up, saying \"Mistakes happen!\""
	cost = 330
	contains = list(/obj/item/storage/firstaid/fire)

/datum/supply_pack/goody/firstaid_single
	name = "First Aid Kit Single-Pack"
	desc = "A single first-aid kit, fit for healing most types of bodily harm."
	cost = 250
	contains = list(/obj/item/storage/firstaid/regular)

/datum/supply_pack/goody/firstaidoxygen_single
	name = "Oxygen Deprivation Kit Single-Pack"
	desc = "A single oxygen deprivation first-aid kit, marketed heavily to those with crippling fears of asphyxiation."
	cost = 330
	contains = list(/obj/item/storage/firstaid/o2)

/datum/supply_pack/goody/firstaidtoxins_single
	name = "Toxin Treatment Kit Single-Pack"
	desc = "A single first aid kit focused on healing damage dealt by heavy toxins."
	cost = 330
	contains = list(/obj/item/storage/firstaid/toxin)

/datum/supply_pack/goody/toolbox // mostly just to water down coupon probability
	name = "Mechanical Toolbox"
	desc = "A fully stocked mechanical toolbox, for when you're too lazy to just print them out."
	cost = 300
	contains = list(/obj/item/storage/toolbox/mechanical)

/datum/supply_pack/goody/electrical_toolbox
	name = "Electrical Toolbox"
	desc = "A fully stocked electrical toolbox, for when you're too lazy to just print them out."
	cost = 300
	contains = list(/obj/item/storage/toolbox/electrical)

/datum/supply_pack/goody/valentine
	name = "Valentine Card"
	desc = "Make an impression on that special someone! Comes with one valentine card and a free candy heart!"
	cost = 150
	contains = list(/obj/item/valentine, /obj/item/reagent_containers/food/snacks/candyheart)

/datum/supply_pack/goody/beeplush
	name = "Bee Plushie"
	desc = "The most important thing you could possibly spend your hard-earned money on."
	cost = 1500
	contains = list(/obj/item/toy/plush/beeplushie)

/datum/supply_pack/goody/beach_ball
	name = "Beach Ball"
	desc = "The simple beach ball is one of Nanotrasen's most popular products. 'Why do we make beach balls? Because we can! (TM)' - The brotherhood"
	cost = 200
	contains = list(/obj/item/toy/beach_ball)

/datum/supply_pack/goody/medipen_twopak
	name = "Medipen Two-Pak"
	desc = "Contains one standard epinephrine medipen and one standard emergency first-aid kit medipen. For when you want to prepare for the worst."
	cost = 500
	contains = list(/obj/item/reagent_containers/hypospray/medipen, /obj/item/reagent_containers/hypospray/medipen/ekit)
