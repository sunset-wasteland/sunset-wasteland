/datum/job/wasteland/f13wastelander/New()
	var/list/loadout_extra = list(
		/datum/outfit/loadout/paramilitary
	)
	LAZYADD(loadout_options, loadout_extra)

/datum/outfit/loadout/paramilitary
	name = "Gun Nut"
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	backpack_contents = list(
			/obj/item/gun/ballistic/automatic/smg/greasegun=1,
			/obj/item/ammo_box/magazine/greasegun=2
		)
