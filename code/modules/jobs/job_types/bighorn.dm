/*
Town access doors
Sheriff/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
General access: 25 ACCESS_BAR
Clinic surgery/storage: 68 ACCESS_CLONING
Shopkeeper: 34 ACCESS_CARGO_BOT
Barkeep : 28 ACCESS_KITCHEN - you jebronis made default bar for no reason bruh
Banker : 48 ACCESS_MINING
Mayor : 4 ACCESS_FORENSICS_LOCKERS
here's a tip, go search DEFINES/access.dm
*/

/datum/job/bighorn
	exp_type = EXP_TYPE_BIGHORN
	faction = FACTION_BIGHORN

/*
Mayor
*/
/datum/job/bighorn/f13mayor
	title = "Mayor"
	flag = F13MAYOR
	department_flag = DEP_BIGHORN
	total_positions = 1
	spawn_positions = 1
	supervisors = "Yourself"
	description = "You are the benevolent tyrant of Bighorn, chosen by the people to represent and lead them. Pass laws to protect your citizens, distribute town funds and make deals with the powers present within the Region to better the people, and yourself, of course."
	selection_color = "#d7b088"
	exp_requirements = 1500
	outfit = /datum/outfit/job/bighorn/f13mayor
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_FORENSICS_LOCKERS)

/datum/outfit/job/bighorn/f13mayor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/bighorn/f13mayor
	name = "Mayor"
	jobtype = 	/datum/job/bighorn/f13mayor
	ears =		/obj/item/radio/headset/headset_sheriff
	id =		/obj/item/card/id/silver/mayor
	backpack = 	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	l_pocket = 	/obj/item/storage/bag/money/small/settler
	r_pocket = 	/obj/item/flashlight/flare
	belt = 		/obj/item/gun/ballistic/revolver/colt357
	shoes = 	/obj/item/clothing/shoes/laceup
	uniform = 	/obj/item/clothing/under/suit/checkered
	suit = 		/obj/item/clothing/suit/armor/f13/kit
	head = 		/obj/item/clothing/head/fedora
	backpack_contents = list(
		/obj/item/clothing/head/f13/town/big = 1, \
		/obj/item/storage/box/citizenship_permits = 1, \
		/obj/item/ammo_box/a357=2, \
		/obj/item/pen/fountain/captain = 1,
		/obj/item/storage/bag/money/small/mayor = 1,)//Cash for payouts. Incredible amount, seeing as next to the Banker, he's the closest thing to a treasury keeper.
/*--------------------------------------------------------------*/
/datum/job/bighorn/f13sheriff
	title = "Sheriff"
	flag = F13SHERIFF
	department_flag = DEP_BIGHORN
	total_positions = 1
	spawn_positions = 1
	supervisors = "the mayor"
	description = "As the chief law enforcer of the Town, your job is to keep the peace, settle local disputes, and keep your townsfolk safe and alive. Unfortunately, with the NCR and Legion closing in on the region, the Town is caught between a rock and a hard place, as with the war brings with it unsavory elements like the Khans and Outlaws. Sometimes the people you handle inside the town will be alive in cuffs, or dead on the street. Other times, they'll escape the limits of the town, to which you can put a bounty on their head for their capture, or have your deputies capture them. However, you must remember these three critical things: never leave the town undefended, keep the townsfolk alive and safe, and most importantly - keep your hand on your gun and don't you trust anyone."
	selection_color = "#d7b088"
	exp_requirements = 1500
	outfit = /datum/outfit/job/bighorn/f13sheriff
	access = list(ACCESS_BAR, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY)

/datum/outfit/job/bighorn/f13sheriff
	name = "Sheriff"
	jobtype = /datum/job/bighorn/f13sheriff
	id = /obj/item/card/id/dogtag/sheriff
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

	ears = 			/obj/item/radio/headset/headset_sheriff
	uniform =  		/obj/item/clothing/under/f13/sheriff
	neck =			/obj/item/storage/belt/holster/sheriff
	shoes = 		/obj/item/clothing/shoes/f13/cowboy
	r_hand = 		/obj/item/clothing/suit/armor/f13/power_armor/town
	l_hand = 		/obj/item/clothing/head/helmet/f13/power_armor/town
	glasses =		/obj/item/clothing/glasses/sunglasses
	l_pocket =		/obj/item/storage/bag/money/small/bighorn

	backpack_contents = list(
		/obj/item/storage/box/deputy_badges=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/melee/classic_baton=1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/book/granter/crafting_recipe/ODF = 1)
	r_pocket = /obj/item/flashlight/flare

/datum/outfit/job/bighorn/f13sheriff/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/*--------------------------------------------------------------*/
/datum/job/bighorn/f13deputy
	title = "Deputy"
	flag = F13DEPUTY
	department_flag = DEP_BIGHORN
	total_positions = 4
	spawn_positions = 4
	supervisors = "the sheriff and the mayor"
	description = "Working alongside the Sheriff you've known them for a while, having worked with them under the previous Sheriff - you bagged many a bandit and raider together on the road. These days you patrol the areas outside of town, tracking down bounties on the run and keeping the settlers safe from harm."
	selection_color = "#dcba97"
	exp_requirements = 620
	outfit = /datum/outfit/job/bighorn/f13deputy
	access = list(ACCESS_BAR, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY)

/datum/outfit/job/bighorn/f13deputy
	name = "Deputy"
	jobtype = /datum/job/bighorn/f13deputy
	ears = 			/obj/item/radio/headset/headset_sheriff
	id =            /obj/item/card/id/dogtag/deputy
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/gun/ballistic/rifle/repeater/trail
	suit = 			/obj/item/clothing/suit/armor/vest/oasis
	head =	/obj/item/clothing/head/f13/town/deputy
	belt = /obj/item/gun/ballistic/revolver/colt357
	shoes = 		/obj/item/clothing/shoes/f13/explorer
	uniform = /obj/item/clothing/under/f13/cowboyb
	backpack_contents = list(
		/obj/item/ammo_box/a357=2, \
		/obj/item/ammo_box/tube/m44=2, \
		/obj/item/restraints/handcuffs=1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/book/granter/crafting_recipe/ODF = 1)

/datum/outfit/job/bighorn/f13deputy/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
/*--------------------------------------------------------------*/
/datum/job/bighorn/f13banker
	title = "Banker"
	flag = F13BANKER
	department_flag = DEP_BIGHORN
	total_positions = 1
	spawn_positions = 1
	supervisors = "the mayor"
	description = "No matter where society lurks, profit and fortune are there to be made! It is up to you to distribute caps and earn interest while safekeeping items of value for the wastelands denizens! Ensure you make a profit and make your money back no matter the cost. You are to work alongside the Town, and should not be attempting to harm the residents of Bighorn."
	selection_color = "#dcba97"
	exp_requirements = 1500
	enforces = "You are in a Job meant for encouraging roleplay with others, do not abandon your post or hoard money unless absolutely necessary. Do not use the caps provided for yourself."
	outfit = /datum/outfit/job/bighorn/f13banker
	access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS, ACCESS_MINING)
	minimal_access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS, ACCESS_MINING)
	loadout_options = list(
	/datum/outfit/loadout/classy,
	/datum/outfit/loadout/loanshark,
	/datum/outfit/loadout/investor,
	)

/datum/outfit/job/bighorn/f13banker
	name = "Banker"
	jobtype = /datum/job/bighorn/f13banker
	uniform = /obj/item/clothing/under/lawyer/blacksuit
	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_town
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/banker)

/datum/outfit/loadout/classy
	name = "Classy"
	head = /obj/item/clothing/head/collectable/tophat
	glasses = /obj/item/clothing/glasses/monocle
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	suit = /obj/item/clothing/suit/f13/banker
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
	/obj/item/cane=1,
	/obj/item/storage/fancy/cigarettes/cigpack_bigboss=1,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey=1,
	/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass=1
	)

/datum/outfit/loadout/loanshark
	name = "Loanshark"
	glasses = /obj/item/clothing/glasses/orange
	mask = /obj/item/clothing/mask/cigarette/cigar
	suit = /obj/item/clothing/suit/f13/vest
	uniform = /obj/item/clothing/under/f13/sleazeball
	shoes = /obj/item/clothing/shoes/sandal
	backpack_contents = list(
	/obj/item/reagent_containers/food/drinks/bottle/whiskey=1,
	/obj/item/storage/box/matches=1,
	/obj/item/gun/ballistic/automatic/smg/mini_uzi=1
	)

/datum/outfit/loadout/investor
	name = "Investor"
	glasses = /obj/item/clothing/glasses/sunglasses
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	uniform = /obj/item/clothing/under/f13/bennys
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357=1,
		/obj/item/storage/fancy/cigarettes/cigpack_bigboss=1,
		/obj/item/storage/box/matches=1
		)
/*--------------------------------------------------------------*/
/datum/job/bighorn/f13barkeep
	title = "Barkeep"
	flag = F13BARKEEP
	department_flag = DEP_BIGHORN
	total_positions = 2
	spawn_positions = 2
	supervisors = "the free market and Bighorn laws"
	description = "As a proprietor of the Blue Oyster, you are responsible for ensuring both citizens and travellers in Bighorn can get some food, drink and rest. This town is usually run by the Great Khans, and the farm within their compound could provide fresh supplies for your business, so try negotiating with them if they are present."
	enforces = "While you have dominion over your private business, your premium status as a citizen may be revoked if you are considered a danger to the populace or anger those in control of the town."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/bighorn/f13barkeep

	loadout_options = list(
	/datum/outfit/loadout/rugged,
	/datum/outfit/loadout/frontier,
	/datum/outfit/loadout/richmantender,
	/datum/outfit/loadout/diner)

	access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bighorn,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bighorn,
		),
	)


/datum/outfit/job/bighorn/f13barkeep
	name = "Barkeep"
	jobtype = /datum/job/bighorn/f13barkeep

	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = /obj/item/gun/ballistic/revolver/caravan_shotgun
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/ammo_box/shotgun/bean = 2,
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/stack/f13Cash/caps/onezerozero = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1,
		)

/datum/outfit/loadout/rugged
	name = "Rugged"
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	uniform = /obj/item/clothing/under/f13/cowboyb
	suit = /obj/item/clothing/suit/f13/cowboybvest
	gloves = /obj/item/clothing/gloves/color/brown
	shoes = /obj/item/clothing/shoes/f13/brownie

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy

/datum/outfit/loadout/richmantender
	name = "Fancy"
	head = /obj/item/clothing/head/fedora
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/f13/fancy
	neck = /obj/item/clothing/neck/tie/black

/datum/outfit/loadout/diner
	name = "Diner"
	glasses = /obj/item/clothing/glasses/orange
	uniform = /obj/item/clothing/under/f13/brahminf
	neck = /obj/item/clothing/neck/apron/chef
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/f13/military/ncr

/*-----------------------------------------------------*/
/datum/job/bighorn/f13shopkeeper
	title = "Shopkeeper"
	flag = F13SHOPKEEPER
	department_flag = DEP_BIGHORN
	total_positions = 2
	spawn_positions = 2
	supervisors = "the free market and Bighorn laws"
	description = "You are a Crimson Caravan affiliate based in Bighorn - a settlement typically run by the Great Khans. Your store allows you to sell all kinds of merchandise, from dandy boy apples to laser rifles. Ensure you make a profit and retain enough capital for your day-to-day operations."
	enforces = "While you have dominion over your private business, your premium status as a citizen may be revoked if you are considered a danger to the populace or anger those in control of the town."
	selection_color = "#dcba97"
	exp_requirements = 300

	outfit = /datum/outfit/job/bighorn/f13shopkeeper
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bighorn,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bighorn,
		),
	)

/datum/outfit/job/bighorn/f13shopkeeper
	name = "Shopkeeper"
	jobtype = /datum/job/bighorn/f13shopkeeper

	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/roving
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	gloves = /obj/item/clothing/gloves/fingerless
	l_pocket = /obj/item/storage/bag/money/small/bighorn
	r_pocket = /obj/item/flashlight/glowstick
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/storage/box/shopkeeper = 1)

/datum/outfit/job/bighorn/f13shopkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policepistol)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/policerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/steelbib/heavy)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/armyhelmetheavy)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/a180)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/varmintrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/thatgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/uzi)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg10mm)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/frag_shrapnel)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/shrapnelmine)

/datum/outfit/job/bighorn/f13shopkeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/*--------------------------------------------------------------*/
/datum/job/bighorn/f13settler
	title = "Citizen"
	flag = F13SETTLER
	department_flag = DEP_BIGHORN
	total_positions = -1
	spawn_positions = -1
	supervisors = "Bighorn laws"
	description = "You are a citizen living in Bighorn - a settlement typically run by the Great Khans. Take good care of your town, and consider picking up a trade to support the settlement - farming, hunting, or something more particular. One of the local businesses or the Khans themselves may have work if you require funds."
	enforces = "Your premium status as a citizen may be revoked if you are considered a danger to the populace or anger those in control of the town."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/bighorn/f13settler

	loadout_options = list(
		/datum/outfit/loadout/provisioner,
		/datum/outfit/loadout/groundskeeper,
		/datum/outfit/loadout/farmer,
		/datum/outfit/loadout/artisan,
		/datum/outfit/loadout/outdoorsman,
		/datum/outfit/loadout/militia,
		/datum/outfit/loadout/singer,
	)
	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/bighorn,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/bighorn,
		),
	)

//Wasteland Preacher
/datum/job/bighorn/f13preacher
	title = "Preacher"
	flag = F13PREACHER
	faction = FACTION_WASTELAND
	total_positions = 1
	spawn_positions = 1
	supervisors = "your faith and Bighorn laws"
	description = "You are a preacher based in Bighorn - a settlement typically run by the Great Khans. As a bastion of faith, spread the good word and bring hope to the needy. The divine may not protect from the harsh realities of the wasteland, but surely offers some solace."
	enforces = "Your premium status as a citizen may be revoked if you are considered a danger to the populace or anger those in control of the town."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/bighorn/f13preacher

	loadout_options = list(
	/datum/outfit/loadout/crusader, 	//This is kinda a given. You bet.
	/datum/outfit/loadout/samaritan, 	//Water and food to share with the wastes.
	/datum/outfit/loadout/cleanser		//Just some bombs.
	)

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/wasteland/f13wastelander,
		),
	)



/datum/outfit/loadout/crusader
	name = "Crusader"
	backpack_contents = list(
		/obj/item/clothing/suit/armor/knight = 1,
		/obj/item/clothing/head/helmet/knight/red = 1,
		/obj/item/melee/onehanded/machete = 1,
	)

/datum/outfit/loadout/samaritan
	name = "Samaritan"
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/store/bread/plain = 5,
		/obj/item/reagent_containers/food/snacks/fishmeat/salmon = 2,
		/obj/item/reagent_containers/glass/beaker/waterbottle = 2,
		/obj/item/nullrod = 1,
	)	//Matthew 14:17 RSVCE and KJV - Kitsunemitsu

/datum/outfit/loadout/cleanser
	name = "Cleanser"
	backpack_contents = list(
		/obj/item/grenade/homemade/coffeepotbomb = 2,	//This is funny. I swear guys.
		/obj/item/gun/ballistic/revolver/m29 = 1,		//Moved here for more *variety*
		/obj/item/ammo_box/m44 = 2
	)


/datum/job/bighorn/f13preacher/after_spawn(mob/living/H, mob/M)
	. = ..()
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(GLOB.religion)
		B.deity_name = GLOB.deity
		B.name = GLOB.bible_name
		B.icon_state = GLOB.bible_icon_state
		B.item_state = GLOB.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [GLOB.deity]. Defer to the Chaplain.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = GLOB.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = DEFAULT_RELIGION
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = DEFAULT_DEITY
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("christianity") // DEFAULT_RELIGION
			B.name = pick("The Holy Bible","The Dead Sea Scrolls")
		if("buddhism")
			B.name = "The Sutras"
		if("clownism","honkmother","honk","honkism","comedy")
			B.name = pick("The Holy Joke Book", "Just a Prank", "Hymns to the Honkmother")
		if("chaos")
			B.name = "The Book of Lorgar"
		if("cthulhu")
			B.name = "The Necronomicon"
		if("hinduism")
			B.name = "The Vedas"
		if("homosexuality")
			B.name = pick("Guys Gone Wild","Coming Out of The Closet")
		if("imperium")
			B.name = "Uplifting Primer"
		if("islam")
			B.name = "Quran"
		if("judaism")
			B.name = "The Torah"
		if("lampism")
			B.name = "Fluorescent Incandescence"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes")
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition", "F.A.T.A.L. Rulebook")
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 100) // starts off dumb as fuck
		if("monkeyism","apism","gorillism","primatism")
			B.name = pick("Going Bananas", "Bananas Out For Harambe")
		if("mormonism")
			B.name = "The Book of Mormon"
		if("pastafarianism")
			B.name = "The Gospel of the Flying Spaghetti Monster"
		if("rastafarianism","rasta")
			B.name = "The Holy Piby"
		if("satanism")
			B.name = "The Unholy Bible"
		if("science")
			B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		if("servicianism", "partying")
			B.name = "The Tenets of Servicia"
			B.deity_name = pick("Servicia", "Space Bacchus", "Space Dionysus")
			B.desc = "Happy, Full, Clean. Live it and give it."
		if("subgenius")
			B.name = "Book of the SubGenius"
		if("toolboxia","greytide")
			B.name = pick("Toolbox Manifesto","iGlove Assistants")
		if("weeaboo","kawaii")
			B.name = pick("Fanfiction Compendium","Japanese for Dummies","The Manganomicon","Establishing Your O.T.P")
		else
			B.name = "The Holy Book of [new_religion]"

	GLOB.religion = new_religion
	GLOB.bible_name = B.name
	GLOB.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)


/datum/outfit/job/bighorn/f13preacher
	name = "Preacher"
	jobtype = /datum/job/bighorn/f13preacher

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset
	belt = null
	uniform = 		/obj/item/clothing/under/f13/chaplain
	gloves =		/obj/item/clothing/gloves/fingerless
	shoes = 		/obj/item/clothing/shoes/jackboots
	r_pocket = 		/obj/item/flashlight/flare

	backpack =		/obj/item/storage/backpack/cultpack
	satchel = 		/obj/item/storage/backpack/cultpack
	backpack_contents = list(
		/obj/item/camera/spooky = 1, \
		/obj/item/reagent_containers/food/drinks/flask=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/storage/fancy/candle_box, \
		/obj/item/storage/bag/money/small/settler)
//end preacher

/datum/outfit/job/bighorn/f13settler
	name = "Citizen"
	jobtype = /datum/job/bighorn/f13settler
	ears = /obj/item/radio/headset/headset_town
	belt = null
	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/jackboots
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/book/granter/trait/selection
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/job/bighorn/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)


/datum/outfit/loadout/provisioner
	name = "Provisioner"
	neck = /obj/item/clothing/neck/scarf/cptpatriot
	suit = /obj/item/clothing/suit/jacket/miljacket
	uniform = /obj/item/clothing/under/f13/merca
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(/obj/item/reagent_containers/food/drinks/flask = 1,
	/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
	/obj/item/ammo_box/magazine/m10mm_adv/simple = 1,
	)

/datum/outfit/loadout/groundskeeper
	name = "Groundskeeper"
	head = /obj/item/clothing/head/soft/grey
	belt = /obj/item/storage/belt
	suit = /obj/item/clothing/under/f13/mechanic
	gloves = /obj/item/clothing/gloves/color/yellow
	backpack_contents = list(/obj/item/storage/bag/trash = 1, /obj/item/reagent_containers/spray/cleaner = 1,
	/obj/item/gun/ballistic/revolver/hobo/piperifle = 1,
	/obj/item/ammo_box/a556/stripper = 2,
	)

/datum/outfit/loadout/farmer
	name = "Farmer"
	suit = /obj/item/clothing/suit/apron/overalls
	belt = /obj/item/storage/bag/plants
	gloves = /obj/item/clothing/gloves/botanic_leather
	shoes = /obj/item/clothing/shoes/workboots
	backpack_contents = list(
		/obj/item/cultivator=1,
		/obj/item/hatchet=1,
		/obj/item/shovel/spade=1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 1,
		)

/datum/outfit/loadout/artisan
	name = "Artisan"
	glasses = /obj/item/clothing/glasses/welding
	suit = /obj/item/clothing/under/f13/petrochico
	belt = /obj/item/storage/belt/utility
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	backpack_contents = list(/obj/item/twohanded/sledgehammer/simple = 1,
	/obj/item/stack/sheet/metal/twenty = 1,
	/obj/item/book/granter/crafting_recipe/ODF = 1,
	)

/datum/outfit/loadout/outdoorsman
	name = "Outdoorsman"
	head = /obj/item/clothing/head/f13/beaver
	suit = /obj/item/clothing/suit/f13/cowboybvest
	belt = /obj/item/storage/belt/bandolier
	uniform = /obj/item/clothing/under/f13/bartenderalt
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(/obj/item/fishingrod = 1,
	/obj/item/storage/fancy/cigarettes/cigars = 1,
	/obj/item/gun/ballistic/revolver/widowmaker = 1,
	/obj/item/ammo_box/shotgun/buck = 2,
	)

/datum/outfit/loadout/militia
	name = "Militia"
	head = /obj/item/clothing/head/helmet/armyhelmet
	suit = /obj/item/clothing/suit/armor/f13/metalarmor/steelbib
	uniform = /obj/item/clothing/under/f13/mercc
	r_hand = /obj/item/gun/ballistic/rifle/hunting
	gloves = /obj/item/clothing/gloves/f13/leather
	backpack_contents = list(/obj/item/ammo_box/a308 = 2,
	)

/datum/outfit/loadout/singer
	name = "Singer"
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1,
	/obj/item/gun/ballistic/revolver/police = 1,
	/obj/item/ammo_box/a357 = 2,
	)

/*--------------------------------------------------------------*/
/datum/job/bighorn/f13secretary
	title = "Secretary"
	flag = F13SECRETARY
	department_flag = DEP_BIGHORN
	total_positions = 1
	spawn_positions = 1
	supervisors = "the mayor"
	description = "Working alongside the Mayor, you've known them for a while. Your duties mainly consist of handling appointments and managing mundane tasks."
	selection_color = "#dcba97"
	exp_requirements = 60
	outfit = /datum/outfit/job/bighorn/f13secretary
	access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_FORENSICS_LOCKERS)

/datum/outfit/job/bighorn/f13secretary
	name = "Secretary"
	jobtype = /datum/job/bighorn/f13secretary
	ears = 			/obj/item/radio/headset/headset_town
	l_pocket = /obj/item/storage/bag/money/small/settler
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1)
/*--------------------------------------------------------------*/
