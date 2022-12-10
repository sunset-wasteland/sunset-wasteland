/obj/machinery/rnd/server
	name = "\improper R&D Server"
	desc = "A computer system running a deep neural network that processes arbitrary information to produce data useable in the development of new technologies. In layman's terms, it makes research points."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "server"
	var/research_id = "SCIENCE" // this is all over the place, todo: centralize/componentize
	var/datum/techweb/stored_research
	//Code for point mining here.
	var/working = TRUE			//temperature should break it.
	var/server_id = 0
	var/base_mining_income = 7

	var/heat_gen = 1
	var/heating_power = 40000
	var/delay = 5
	var/temp_tolerance_low = 0
	var/temp_tolerance_high = T20C
	var/temp_penalty_coefficient = 0.5	//1 = -1 points per degree above high tolerance. 0.5 = -0.5 points per degree above high tolerance.
	req_access = list(ACCESS_RD) //ONLY THE R&D CAN CHANGE SERVER SETTINGS.

/obj/machinery/rnd/server/proc/create_custom_techweb() // admin call only ATM, heavy wip
	// todo: maybe move this to SSresearch
	if(SSresearch.technets[research_id])
		stored_research = SSresearch.technets[research_id] // no overwriting existing servers
		return
	stored_research = new /datum/techweb/custom(research_id)
	SSresearch.technets[research_id] = stored_research

/obj/machinery/rnd/server/proc/init_server() // separate from initialize for admin purposes
	LAZYADD(SSresearch.servernets[research_id], src)
	// might do more in the future

/obj/machinery/rnd/server/proc/disconnect_server() // above, but with destroy
	LAZYREMOVE(SSresearch.servernets[research_id], src)
	// todo: maybe delete (custom?) techwebs if we remove the last server one has? :thinking:

/obj/machinery/rnd/server/Initialize()
	. = ..()
	SSresearch.servers |= src // global rnd server list
	init_server()
	update_techweb()

/obj/machinery/rnd/server/proc/update_techweb(new_research_id = null)
	if(istext(new_research_id))
		research_id = new_research_id
	stored_research = SSresearch.get_techweb_by_id(research_id)

/obj/machinery/rnd/server/Destroy()
	SSresearch.servers -= src
	disconnect_server()
	return ..()

/obj/machinery/rnd/server/RefreshParts()
	var/tot_rating = 0
	for(var/obj/item/stock_parts/SP in src)
		tot_rating += SP.rating
	heat_gen = initial(src.heat_gen) / max(1, tot_rating)

/obj/machinery/rnd/server/proc/refresh_working()
	if(stat & EMPED)
		working = FALSE
	else
		working = TRUE

/obj/machinery/rnd/server/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	stat |= EMPED
	addtimer(CALLBACK(src, .proc/unemp), severity*9)
	refresh_working()

/obj/machinery/rnd/server/proc/unemp()
	stat &= ~EMPED
	refresh_working()

/obj/machinery/rnd/server/proc/mine()
	. = base_mining_income
	var/penalty = max((get_env_temp() - temp_tolerance_high), 0) * temp_penalty_coefficient
	. = max(. - penalty, 0)
	produce_heat(. / base_mining_income)

/obj/machinery/rnd/server/proc/get_env_temp()
	var/datum/gas_mixture/environment = loc.return_air()
	return environment.return_temperature()

/obj/machinery/rnd/server/proc/produce_heat(perc)
	if(!(stat & (NOPOWER|BROKEN))) //Blatently stolen from space heater.
		var/turf/L = loc
		if(istype(L))
			var/datum/gas_mixture/env = L.return_air()
			env.adjust_heat(heating_power * perc * heat_gen)
			air_update_turf()

/proc/fix_noid_research_servers()
	var/list/no_id_servers = list()
	var/list/server_ids = list()
	for(var/obj/machinery/rnd/server/S in GLOB.machines)
		switch(S.server_id)
			if(-1)
				continue
			if(0)
				no_id_servers += S
			else
				server_ids += S.server_id

	for(var/obj/machinery/rnd/server/S in no_id_servers)
		var/num = 1
		while(!S.server_id)
			if(num in server_ids)
				num++
			else
				S.server_id = num
				server_ids += num
		no_id_servers -= S


/obj/machinery/computer/rdservercontrol
	name = "R&D Server Controller"
	desc = "Used to manage access to research and manufacturing databases."
	icon_screen = "rdcomp"
	icon_keyboard = "rd_key"
	var/screen = 0
	var/obj/machinery/rnd/server/temp_server
	var/list/servers = list()
	var/list/consoles = list()
	var/badmin = 0
	circuit = /obj/item/circuitboard/computer/rdservercontrol

/obj/machinery/computer/rdservercontrol/Topic(href, href_list)
	if(..())
		return

	add_fingerprint(usr)
	usr.set_machine(src)
	if(!src.allowed(usr) && !(obj_flags & EMAGGED))
		to_chat(usr, "<span class='danger'>You do not have the required access level.</span>")
		return

	if(href_list["main"])
		screen = 0

	updateUsrDialog()
	return

/obj/machinery/computer/rdservercontrol/ui_interact(mob/user)
	. = ..()
	var/dat = ""

	switch(screen)
		if(0) //Main Menu
			dat += "Connected Servers:<BR><BR>"

			for(var/obj/machinery/rnd/server/S in GLOB.machines)
				dat += "[S.name]<BR>"

		//Mining status here

	user << browse("<TITLE>R&D Server Control</TITLE><HR>[dat]", "window=server_control;size=575x400")
	onclose(user, "server_control")
	return

/obj/machinery/computer/rdservercontrol/attackby(obj/item/D, mob/user, params)
	. = ..()
	src.updateUsrDialog()

/obj/machinery/computer/rdservercontrol/emag_act(mob/user)
	. = ..()
	if(obj_flags & EMAGGED)
		return
	playsound(src, "sparks", 75, 1)
	obj_flags |= EMAGGED
	to_chat(user, "<span class='notice'>You disable the security protocols.</span>")
	return TRUE


/obj/machinery/rnd/server/bos
	research_id = "BOS"

/obj/machinery/rnd/server/vault
	research_id = "VAULT"

/obj/machinery/rnd/server/followers
	research_id = "FOLLOWERS"

/obj/machinery/rnd/server/enclave
	research_id = "ENCLAVE"
	base_mining_income = 17

/* so we can link lathes and such to this server's techweb */
/obj/machinery/rnd/server/multitool_act(mob/living/user, obj/item/I)
	if(istype(I, /obj/item/multitool))
		var/obj/item/multitool/M = I
		M.buffer = src
		to_chat(user, "<span class='notice'>You store server information in [I]'s buffer.</span>")
		return TRUE
