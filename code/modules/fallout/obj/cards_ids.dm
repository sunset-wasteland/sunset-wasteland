////////Dogtag types/////////
//All one subtype for making item path pretty/easily telling what ID cards are dogtags, for gravemarkers

/obj/item/card/id/dogtag
	name = "holo dogtag"
	desc = "An advanced holographic dogtag, that shows the duty of a BoS member."
	icon_state = "holodogtag"
	assignment = "ID tags"
	uses_overlays = FALSE

/obj/item/card/id/dogtag/enclave
	desc = "An advanced holographic dogtag, that shows the duty of a BoS member. This one seems a bit off somewhow..."

/obj/item/card/id/dogtag/enclave/recruit
	access = list(ACCESS_ENCLAVE)

/obj/item/card/id/dogtag/enclave/recruit/attack_self(mob/user)
	if(isliving(user))
		var/mob/living/living_user = user
		if(alert(user, "Action", "Agent ID", "Show", "Forge") == "Forge")
			registered_name = living_user.real_name
			assignment = "Enclave Recruit"
			update_label()
			to_chat(user, "<span class='notice'>You successfully update your holotag.</span>")
			return
	..()

/obj/item/card/id/selfassign/attack_self(mob/user)
	if(isliving(user))
		var/mob/living/living_user = user
		if(alert(user, "Action", "Agent ID", "Show", "Forge") == "Forge")
			registered_name = living_user.real_name
			assignment = living_user.job
			update_label()
			to_chat(user, "<span class='notice'>You successfully forge the ID card.</span>")
			return
	..()

/obj/item/card/id/selfassign
	icon_state = "silver"
	item_state = "silver_id"
	desc = "A rewritable card that allows you to put your name and assignment on it."

/obj/item/card/id/dogtag/vigilante
	name = "vigilante's badge"
	desc = "An old silver badge."
	assignment = "Vigilante"
	icon_state = "deputy"
	item_state = "badge-deputy"


/obj/item/card/id/dogtag/deputy
	name = "deputy's badge"
	desc = "A silver badge which shows honour and dedication."
	assignment = "Deputy"
	icon_state = "deputy"
	item_state = "badge-deputy"
	access = list(ACCESS_BAR, ACCESS_GATEWAY)

/obj/item/card/id/dogtag/deputy/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/dogtag/sheriff))
		var/newname = stripped_input(user, "Who do you want to designate as your deputy?", , "", MAX_NAME_LEN)
		if(newname)
			to_chat(user, "You scribble the [registered_name] for the name on the badge.")
			registered_name = newname
			update_label()
	return ..()

/obj/item/card/id/dogtag/sheriff
	name = "sheriff's badge"
	desc = "A golden Sheriff's badge."
	assignment = "badge"
	icon_state = "sheriff"
	item_state = "badge-sheriff"

/obj/item/card/id/dogtag/town
	name = "citizenship permit"
	desc = "A permit identifying the holder as a citizen of a nearby town."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "citizenship permit"
	access = list(ACCESS_BAR)

/obj/item/card/id/dogtag/vaultiecard
	name = "Vault Citizenship"
	desc = "Proof of citizenship to a vault."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "citizenship permit"
	access = list(ACCESS_BAR)

/obj/item/card/id/dogtag/MDfakepermit
	name = "faded medical license"
	desc = "a revoked medical license. This is why we do not remove people's skeletons "
	access = list()

/obj/item/card/id/dogtag/town/ncr
	name = "NCR citizenship permit"
	desc = "A permit identifying the holder as a citizen of New Californian Republic."
	assignment = "NCR Citizen"
	access = list()

/obj/item/card/id/dogtag/town/legion
	name = "Legion citizenship permit"
	desc = "A permit identifying the holder as a citizen of Caesar's Legion."
	assignment = "Legion Citizen"
	access = list()

/obj/item/card/id/dogtag/town/enclave
	name = "American citizenship permit"
	desc = "A permit identifying the holder as a citizen of United States of America."
	assignment = "American Citizen"
	access = list()

/obj/item/card/id/dogtag/town/mafia
	name = "citizenship permit"
	desc = "A permit identifying the holder as a citizen of a nearby town."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "Settler"
	obj_flags = UNIQUE_RENAME
	access = list(ACCESS_BAR)

/obj/item/card/id/dogtag/town/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/silver/mayor))
		var/newname = stripped_input(user, "Who do you want to grant citizenship to?", , "", MAX_NAME_LEN)
		if(newname)
			to_chat(user, "You scribble the [registered_name] for the name on the permit.")
			registered_name = newname
			update_label()
	return ..()

/obj/item/card/id/dogtag/ncrambassador
	name = "ambassador's permit"
	desc = "An silver encrusted ambassador's permit in a plastic holder."
	icon_state = "silver"
	item_state = "silver"
	assignment = "ambassador's permit"

/obj/item/card/id/dogtag/ncradmin
	name = "Administrators ID"
	desc = "An silver encrusted admins ID in a plastic holder."
	icon_state = "silver"
	item_state = "silver"

/obj/item/card/id/dogtag/ncrtrooper
	name = "trooper's tags"
	desc = "A dog tag proving enlistment."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrmp
	name = "military police tags"
	desc = "A dog tag that associates one with the NCROSI."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrht
	name = "heavy trooper's tags"
	desc = "A dog tag proving the elite status of the heavy trooper."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrsergeant
	name = "sergeant's tags"
	desc = "A chevron decorated dog tag showing NCO-ship."
	icon_state = "ncrdogtagsergeant"

/obj/item/card/id/dogtag/ncrrep
	name = "representative's tags"
	desc = "A special dog tag belonging to the NCR representative."
	icon_state = "ncrdogtagofficer"

/obj/item/card/id/dogtag/ncrlieutenant
	name = "lieutenant's tags"
	desc = "A silver bar dog tag that denotes a member of the NCR military with a lieutenant commission."
	icon_state = "ncrdogtagofficer"

/obj/item/card/id/dogtag/ncrcaptain
	name = "captain's tags"
	desc = "A dog tag that demands respect from all those subordinate to it. This one belongs to an NCR captain."
	icon_state = "ncrdogtagcaptain"

/obj/item/card/id/dogtag/ncrranger
	name = "ranger badge"
	desc = "A badge formed out of a Legion denarius that invokes fear in those who see it, belonging to someone with a big iron on their hip."
	icon_state = "ranger"

/obj/item/card/id/dogtag/ncrvetranger
	name = "veteran ranger badge"
	desc = "A badge formed out of a Legion aureus that is worn by the most feared men and women of the Republic."
	icon_state = "vetranger"

/obj/item/card/id/dogtag/ncrcolonel
	name = "colonel's tags"
	desc = "A dog tag that demands respect from all those subordinate to it. This one belongs to an NCR colonel."
	icon_state = "ncrdogtagcaptain"

/obj/item/card/id/dogtag/legforgemaster
	name = "forgemasters' medallion"
	desc = "A silver disc stamped with the Legion's Bull insignia. Belongs to the Forgemaster."
	icon_state = "legionmedallionrecruit"
	assignment = "forgmaster medallion"

/obj/item/card/id/dogtag/legslavemaster
	name = "slavemaster medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to the dreaded Slavemaster."
	icon_state = "legionmedallionprime"
	assignment = "slavemaster medallion"

/obj/item/card/id/dogtag/legauxilia
	name = "auxilia medallion"
	desc = "A heavily marked silver disc stamped with the Legion's Bull insignia. Belongs to a respected auxilia of the Legion."
	icon_state = "legionmedallionveteran"
	item_state = "card-id_leg"
	assignment = "auxilia medallion"

/obj/item/card/id/dogtag/legrecruit
	name = "recruit medallion"
	desc = "A silver disc stamped with the Legion's Bull insignia. Belongs to a recruit."
	icon_state = "legionmedallionrecruit"
	item_state = "card-id_leg"
	assignment = "recruit medallion"

/obj/item/card/id/dogtag/legprime
	name = "prime medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to a prime."
	icon_state = "legionmedallionprime"
	item_state = "card-id_leg"
	assignment = "prime medallion"

/obj/item/card/id/dogtag/legimmune
	name = "immune medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Worn by legionnaires on camp duty."
	icon_state = "legionmedallionprime"
	item_state = "card-id_leg"
	assignment = "immune medallion"

/obj/item/card/id/dogtag/legveteran
	name = "veteran medallion"
	desc = "A heavily marked silver disc stamped with the Legion's Bull insignia. Belongs to a veteran, and reeks of iron."
	icon_state = "legionmedallionveteran"
	item_state = "card-id_leg"
	assignment = "veteran medallion"

/obj/item/card/id/dogtag/legcenturion
	name = "centurion medallion"
	desc = "A golden disc awarded to the most fierce men in the whole legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "centurion medallion"

/obj/item/card/id/dogtag/legvenator
	name = "venator medallion"
	desc = "A golden disc awarded to the elite hunters of the legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "venator medallion"

/obj/item/card/id/dogtag/legexplorer
	name = "explorer medallion"
	desc = "A golden disc awarded to the scouts of the legion."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "explorer medallion"

/obj/item/card/id/dogtag/legpriest
	name = "priestess medallion"
	desc = "A golden disc awarded to the trusted spiritual guide to the nearby Legion."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "priestess medallion"

/obj/item/card/id/dogtag/legorator
	name = "orator medallion"
	desc = "A golden disc awarded to the one who is a dedicated ambassador for Caesar's Legion."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "orator medallion"

//For PilotBland's frumentarii custom loadout
/obj/item/card/id/dogtag/legfrumentariiremus
	name = "Remus Amius' frumentarius medallion"
	desc = "A golden disc with a string threaded through the top, displaying official markings confirming a frumentarius' status."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "frumentarius medallion"

/obj/item/card/id/legionbrand
	name = "Legion's brand"
	desc = "A brand for identifying Caesar's Legion's slaves."
	icon_state = "legionbrand"
	item_state = "slave"
	assignment = "Slave brand"
	uses_overlays = FALSE

/obj/item/card/id/legionbrand/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

///OUTLAW TAGS////

/obj/item/card/id/rusted
	name = "rusted tags"
	desc = "Decrepit uncared for NCR dogtags, kept as a reminder to something."
	icon_state = "rustedncrtag"
	item_state = "rustedncrtag"
	uses_overlays = FALSE

/obj/item/card/id/rusted/rustedmedallion
	name = "rusted medallion"
	desc = "A battered and unkempt legion medallion, kept as a reminder to something."
	icon_state = "rustedmedallion"
	item_state = "rustedmedallion"
	uses_overlays = FALSE

/obj/item/card/id/rusted/fadedvaultid
	name = "faded id card"
	desc = "A and worn Vault-Tech issued ID card, broken beyond use, kept as a reminder to something."
	icon_state = "fadedvaultid"
	item_state = "fadedvaultid"
	uses_overlays = FALSE

/obj/item/card/id/rusted/brokenholodog
	name = "broken holotag"
	desc = "A BoS issue holotag, it isnt working now though, kept as a reminder to something."
	icon_state = "brokenholodog"
	item_state = "brokenholodog"
	uses_overlays = FALSE

/obj/item/card/id/rusted/brokenholodog/enclave
	name = "malfunctioning holotag"
	desc = "A would-be advanced holographic dogtag, if it was working. Kept as a reminder to something."

/obj/item/card/id/denid
	name = "Den Gang Membership Certificate"
	desc = "A certificate declaring your loyalty to the gang"
	assignment = "gang tattoo"

	access = list(ACCESS_DEN)


/obj/item/card/id/khantattoo
	name = "Great Khan tattoo"
	desc = "A tattoo of the symbol of the Great Khans."
	icon = 'icons/fallout/clothing/khans.dmi'
	icon_state = "khan_id"
	item_state = null
	assignment = "gang tattoo"
	uses_overlays = FALSE
	access = list(ACCESS_KHAN)

/obj/item/card/id/khantattoo/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/obj/item/card/id/khanleadertattoo
	name = "Great Khan leader tattoo"
	desc = "A tattoo of the symbol of the Great Khans."
	icon = 'icons/fallout/clothing/khans.dmi'
	icon_state = "khan_id"
	item_state = null
	assignment = "gang tattoo"
	uses_overlays = FALSE
	access = list(ACCESS_KHAN, ACCESS_BAR, ACCESS_CLINIC, ACCESS_GATEWAY, ACCESS_MINT_VAULT, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS, ACCESS_CLONING)

/obj/item/card/id/khanleadertattoo/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/obj/item/card/id/khan_courttattoo
	name = "Great Khan Courtesan tramp stamp"
	desc = "A tattoo of the symbol of the Great Khans, placed just above the individual's rear."
	icon = 'icons/fallout/clothing/khans.dmi'
	icon_state = "khan_id"
	item_state = null
	assignment = "gang tattoo"
	uses_overlays = FALSE
	access = list(ACCESS_KHAN)

/obj/item/card/id/khan_courttattoo/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/obj/item/card/id/outcasttattoo
	name = "faded tribal tattoos"
	desc = "Tattoos marking the wearer as a tribal, worn and faded colors."
	icon_state = "skin"
	item_state = "skin"
	assignment = "gang tattoo"
	uses_overlays = FALSE

/obj/item/card/id/outcasttattoo/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/*
KEYS AND STUFF AAAAAAAAA
*/
/obj/item/card/id/raider_tags
	name = "frail rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel like they could fall apart."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_RAIDER)

/obj/item/card/id/boss_raider_tags
	name = "hardened rusted keychain"
	desc = "A set of keys, each marked with odd pins. They feel sturdy."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_RAIDER, ACCESS_RAIDER_BOSS)

/obj/item/card/id/tribetattoo
	name = "rusted keychain"
	desc = "A set of keys. This one smells of agave."
	icon_state = "keys"
	item_state = "keys"
	assignment = "old keys"
	uses_overlays = FALSE
	access = list(ACCESS_TRIBE)
/*
end of
*/

/obj/item/card/id/silver/mayor
	name = "Mayor's mayoral permit"
	desc = "A silver encrusted identification permit reserved for the Mayor of Bighorn."
	icon_state = "silver"
	item_state = "silver_id"
	assignment = "mayoral permit"
	uses_overlays = FALSE

/obj/item/card/id/dendoctor
	name = "doctor's name badge"
	desc = "A plastic-sealed name badge certifying the medical expertise of its holder."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "name badge"
	uses_overlays = FALSE

/obj/item/card/id/chief
	name = "crimson identification card"
	desc = "A red card which shows dedication and leadership to the Vaults safety and security."
	icon_state = "chief"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	uses_overlays = FALSE

/obj/item/card/id/sec
	name = "red identification card"
	desc = "A red card which shows dedication to the Security department."
	icon_state = "sec"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	uses_overlays = FALSE

//ENCLAVE ID

/obj/item/card/id/dogtag/enclave/officer
	name = "US officer dogtags"
	desc = "Worn by Enclave officers."
	icon_state = "enclaveofficer"
	item_state = "card-id_leg"
	assignment = "US dogtags"
	access = list(ACCESS_ENCLAVE, ACCESS_ENCLAVE_COMMAND)

/obj/item/card/id/dogtag/enclave/trooper
	name = "US dogtags"
	desc = "Worn by Enclave NCOs."
	icon_state = "enclavetrooper"
	item_state = "card-id_leg"
	assignment = "US dogtags"
	access = list(ACCESS_ENCLAVE)

/obj/item/card/id/dogtag/enclave/noncombatant
	name = "US identity card"
	desc = "Issued to Enclave Non-Combat Personnel with a photograph and fingerprints."
	icon_state = "enclavenoncombat"
	item_state = "card-id_leg"
	assignment = "US dogtags"
	access = list(ACCESS_ENCLAVE)

