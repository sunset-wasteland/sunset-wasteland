//FALLOUT
/obj/item/radio/headset/headset_overseer
	name = "\proper the overseer's radio headset"
	desc = "This is used by the vault overseer.\nChannels are as follows: :v - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_overseer
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vault_hos
	name = "\proper the chief of security's radio headset"
	desc = "The headset of the man in charge of keeping order and protecting the vault.\nChannels are as follows: :v - vault, :c - command, :s - security."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_hos
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vault_hos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault
	name = "\proper vault radio headset"
	desc = "A vault-tec radio.\nChannels are as follows: :v - vault."
	keyslot = new /obj/item/encryptionkey/headset_vault
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vaultsec
	name = "security radio headset"
	desc = "This is used by your elite security force.\nTo access the security channel, use :s. To access the vault channel, use :v."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vaultsec/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault_hos/alt
	name = "\proper the head of security's bowman headset"
	desc = "The headset of the man in charge of keeping order and protecting the station. Protects ears from flashbangs.\nTo access the security channel, use :s. For command, use :c. For vault, use :v"
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_ncr
	name = "NCR radio headset"
	desc = "This is used by the New California Republic.\nTo access the NCR channel, use :w."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_ncr
	linked_faction = FACTION_NCR
	factionized = TRUE

/obj/item/radio/headset/headset_ranger
	name = "Ranger radio headset"
	desc = "This is used by the New California Republic.\nTo access the NCR channel, use :w. \nTo access the Ranger channel, use :r. Protects ears from flashbangs."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_ranger
	linked_faction = FACTION_NCR
	factionized = TRUE

/obj/item/radio/headset/headset_ranger/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))


/obj/item/radio/headset/headset_ncr_com
	name = "NCR Command radio headset"
	desc = "This is used by the New California Republic.\nTo access the NCR channel, use :w. \nTo access the Ranger channel, use :r. Protects ears from flashbangs."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_ranger
	linked_faction = FACTION_NCR
	factionized = TRUE
	command = TRUE

/obj/item/radio/headset/headset_ncr_com/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_legion
	name = "Legion radio headset"
	desc = "This is used by Caesar's Legion.\nTo access the Legion channel, use :l."
	icon_state = "sec_headset"
	item_state = "headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_legion
	linked_faction = FACTION_LEGION
	factionized = TRUE

/obj/item/radio/headset/headset_legion/cent
	desc = "This is used by the Centurion of Caesar's Legion.\nTo access the Legion channel, use :l. Protects ears from flashbangs."
	command = TRUE
	icon_state = "sec_headset_alt"
	item_state = "sec_headset_alt"

/obj/item/radio/headset/headset_legion/cent/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_bos
	name = "brotherhood radio headset"
	desc = "This is used by the brotherhood of steel.\nTo access the BOS channel, use :q. Protects ears from flashbangs."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_bos
	linked_faction = FACTION_BROTHERHOOD
	factionized = TRUE

/obj/item/radio/headset/headset_bos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_bos/command
	command = TRUE
	icon_state = "cent_headset_alt"

/obj/item/radio/headset/headset_enclave
	name = "enclave radio headset"
	desc = "This is used by the enclave.\nTo access the enclave channel, use :z. Protects ears from flashbangs."
	icon_state = "syndie_headset"
	keyslot = new /obj/item/encryptionkey/headset_enclave
	linked_faction = FACTION_ENCLAVE
	factionized = TRUE

/obj/item/radio/headset/headset_enclave/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_enclave/command
	linked_faction = FACTION_ENCLAVE
	factionized = TRUE
	command = TRUE

/obj/item/radio/headset/headset_khans
	name = "khan radio headset"
	desc = "This is used by the Khans.\nTo access the Khan channel, use :h."
	icon_state = "syndie_headset"
	item_state = "headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_khans

/obj/item/radio/headset/headset_town
	name = "town radio headset"
	desc = "This is used by the town.\nTo access the town channel, use :f."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_town

/obj/item/radio/headset/headset_sheriff
	name = "town radio headset"
	desc = "This is used by the Sheriff and their deputy force."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_town

/obj/item/radio/headset/headset_followers
	name = "followers radio headset"
	desc = "This is used by the followers.\nTo access the town channel, use :f. \nTo access the medical channel, use :m"
	icon_state = "med_headset"
	keyslot = new /obj/item/encryptionkey/headset_med
	keyslot2 = new /obj/item/encryptionkey/headset_town

/obj/item/radio/headset/headset_den
	name = "den radio headset"
	desc = "This is used by the den. \nTo access the den channel, use :j."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_den

/obj/item/radio/headset/headset_cent
	name = "\improper Vault-Tec headset"
	desc = "A headset used by the upper echelons of Vault-Tec.\nTo access the Vault-Tec channel, use :y."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_com
	keyslot2 = new /obj/item/encryptionkey/headset_cent

/obj/item/radio/headset/headset_cent/empty
	keyslot = null
	keyslot2 = null

/obj/item/radio/headset/headset_cent/commander
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/headset_cent/alt
	name = "\improper Vault-Tec bowman headset"
	desc = "A headset especially for emergency response personnel. Protects ears from flashbangs.\nTo access the Vault-Tec channel, use :y."
	icon_state = "cent_headset_alt"
	item_state = "cent_headset_alt"
	keyslot = null
