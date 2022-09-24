//DEFINITIONS FOR ASSET DATUMS START HERE.

/datum/asset/simple/tgui_common
	keep_local_name = TRUE
	assets = list(
		"tgui-common.bundle.js" = file("tgui/public/tgui-common.bundle.js"),
	)

/datum/asset/simple/tgui
	keep_local_name = TRUE
	assets = list(
		"tgui.bundle.js" = file("tgui/public/tgui.bundle.js"),
		"tgui.bundle.css" = file("tgui/public/tgui.bundle.css"),
	)

/datum/asset/simple/tgui_panel
	keep_local_name = TRUE
	assets = list(
		"tgui-panel.bundle.js" = file("tgui/public/tgui-panel.bundle.js"),
		"tgui-panel.bundle.css" = file("tgui/public/tgui-panel.bundle.css"),
	)

/datum/asset/simple/headers
	assets = list(
		"alarm_green.gif" = 'icons/program_icons/alarm_green.gif',
		"alarm_red.gif" = 'icons/program_icons/alarm_red.gif',
		"batt_5.gif" = 'icons/program_icons/batt_5.gif',
		"batt_20.gif" = 'icons/program_icons/batt_20.gif',
		"batt_40.gif" = 'icons/program_icons/batt_40.gif',
		"batt_60.gif" = 'icons/program_icons/batt_60.gif',
		"batt_80.gif" = 'icons/program_icons/batt_80.gif',
		"batt_100.gif" = 'icons/program_icons/batt_100.gif',
		"charging.gif" = 'icons/program_icons/charging.gif',
		"downloader_finished.gif" = 'icons/program_icons/downloader_finished.gif',
		"downloader_running.gif" = 'icons/program_icons/downloader_running.gif',
		"ntnrc_idle.gif" = 'icons/program_icons/ntnrc_idle.gif',
		"ntnrc_new.gif" = 'icons/program_icons/ntnrc_new.gif',
		"power_norm.gif" = 'icons/program_icons/power_norm.gif',
		"power_warn.gif" = 'icons/program_icons/power_warn.gif',
		"sig_high.gif" = 'icons/program_icons/sig_high.gif',
		"sig_low.gif" = 'icons/program_icons/sig_low.gif',
		"sig_lan.gif" = 'icons/program_icons/sig_lan.gif',
		"sig_none.gif" = 'icons/program_icons/sig_none.gif',
		"smmon_0.gif" = 'icons/program_icons/smmon_0.gif',
		"smmon_1.gif" = 'icons/program_icons/smmon_1.gif',
		"smmon_2.gif" = 'icons/program_icons/smmon_2.gif',
		"smmon_3.gif" = 'icons/program_icons/smmon_3.gif',
		"smmon_4.gif" = 'icons/program_icons/smmon_4.gif',
		"smmon_5.gif" = 'icons/program_icons/smmon_5.gif',
		"smmon_6.gif" = 'icons/program_icons/smmon_6.gif',
		"borg_mon.gif" = 'icons/program_icons/borg_mon.gif'
	)

/datum/asset/simple/radar_assets
	assets = list(
		"ntosradarbackground.png" = 'icons/ui_icons/tgui/ntosradar_background.png',
		"ntosradarpointer.png" = 'icons/ui_icons/tgui/ntosradar_pointer.png',
		"ntosradarpointerS.png" = 'icons/ui_icons/tgui/ntosradar_pointer_S.png'
	)

/datum/asset/spritesheet/simple/pda
	name = "pda"
	assets = list(
		"atmos" = 'icons/pda_icons/pda_atmos.png',
		"back" = 'icons/pda_icons/pda_back.png',
		"bell" = 'icons/pda_icons/pda_bell.png',
		"blank" = 'icons/pda_icons/pda_blank.png',
		"boom" = 'icons/pda_icons/pda_boom.png',
		"bucket" = 'icons/pda_icons/pda_bucket.png',
		"medbot" = 'icons/pda_icons/pda_medbot.png',
		"floorbot" = 'icons/pda_icons/pda_floorbot.png',
		"cleanbot" = 'icons/pda_icons/pda_cleanbot.png',
		"crate" = 'icons/pda_icons/pda_crate.png',
		"cuffs" = 'icons/pda_icons/pda_cuffs.png',
		"eject" = 'icons/pda_icons/pda_eject.png',
		"flashlight" = 'icons/pda_icons/pda_flashlight.png',
		"honk" = 'icons/pda_icons/pda_honk.png',
		"mail" = 'icons/pda_icons/pda_mail.png',
		"medical" = 'icons/pda_icons/pda_medical.png',
		"menu" = 'icons/pda_icons/pda_menu.png',
		"mule" = 'icons/pda_icons/pda_mule.png',
		"notes" = 'icons/pda_icons/pda_notes.png',
		"power" = 'icons/pda_icons/pda_power.png',
		"rdoor" = 'icons/pda_icons/pda_rdoor.png',
		"reagent" = 'icons/pda_icons/pda_reagent.png',
		"refresh" = 'icons/pda_icons/pda_refresh.png',
		"scanner" = 'icons/pda_icons/pda_scanner.png',
		"signaler" = 'icons/pda_icons/pda_signaler.png',
		// "skills" = 'icons/pda_icons/pda_skills.png',
		"status" = 'icons/pda_icons/pda_status.png',
		"dronephone" = 'icons/pda_icons/pda_dronephone.png',
		"emoji" = 'icons/pda_icons/pda_emoji.png'
	)

/datum/asset/spritesheet/simple/paper
	name = "paper"
	assets = list(
		"stamp-clown" = 'icons/stamp_icons/large_stamp-clown.png',
		"stamp-deny" = 'icons/stamp_icons/large_stamp-deny.png',
		"stamp-ok" = 'icons/stamp_icons/large_stamp-ok.png',
		"stamp-hop" = 'icons/stamp_icons/large_stamp-hop.png',
		"stamp-cmo" = 'icons/stamp_icons/large_stamp-cmo.png',
		"stamp-ce" = 'icons/stamp_icons/large_stamp-ce.png',
		"stamp-hos" = 'icons/stamp_icons/large_stamp-hos.png',
		"stamp-rd" = 'icons/stamp_icons/large_stamp-rd.png',
		"stamp-cap" = 'icons/stamp_icons/large_stamp-cap.png',
		"stamp-qm" = 'icons/stamp_icons/large_stamp-qm.png',
		"stamp-law" = 'icons/stamp_icons/large_stamp-law.png',
		"stamp-chap" = 'icons/stamp_icons/large_stamp-chap.png',
		"stamp-mime" = 'icons/stamp_icons/large_stamp-mime.png',
		"stamp-centcom" = 'icons/stamp_icons/large_stamp-centcom.png',
		"stamp-syndicate" = 'icons/stamp_icons/large_stamp-syndicate.png'
	)


/datum/asset/simple/irv
	assets = list(
		"jquery-ui.custom-core-widgit-mouse-sortable.min.js" = 'html/jquery/jquery-ui.custom-core-widgit-mouse-sortable.min.js',
	)

/datum/asset/group/irv
	children = list(
		/datum/asset/simple/jquery,
		/datum/asset/simple/irv
	)

/datum/asset/simple/jquery
	legacy = TRUE
	assets = list(
		"jquery.min.js" = 'html/jquery/jquery.min.js',
	)

/datum/asset/simple/namespaced/fontawesome
	assets = list(
		"fa-regular-400.eot"  = 'html/font-awesome/webfonts/fa-regular-400.eot',
		"fa-regular-400.woff" = 'html/font-awesome/webfonts/fa-regular-400.woff',
		"fa-solid-900.eot"    = 'html/font-awesome/webfonts/fa-solid-900.eot',
		"fa-solid-900.woff"   = 'html/font-awesome/webfonts/fa-solid-900.woff',
		"v4shim.css"          = 'html/font-awesome/css/v4-shims.min.css'
	)
	parents = list("font-awesome.css" = 'html/font-awesome/css/all.min.css')

/datum/asset/simple/namespaced/tgfont
	assets = list(
		"tgfont.eot" = file("tgui/packages/tgfont/dist/tgfont.eot"),
		"tgfont.woff2" = file("tgui/packages/tgfont/dist/tgfont.woff2"),
	)
	parents = list(
		"tgfont.css" = file("tgui/packages/tgfont/dist/tgfont.css"),
	)

/datum/asset/spritesheet/chat
	name = "chat"

/datum/asset/spritesheet/chat/register()
	InsertAll("emoji", 'icons/emoji.dmi')
	InsertAll("emoji", 'icons/emoji_32.dmi')

	// pre-loading all lanugage icons also helps to avoid meta
	InsertAll("language", 'icons/misc/language.dmi')
	// catch languages which are pulling icons from another file
	for(var/path in typesof(/datum/language))
		var/datum/language/L = path
		var/icon = initial(L.icon)
		if (icon != 'icons/misc/language.dmi')
			var/icon_state = initial(L.icon_state)
			Insert("language-[icon_state]", icon, icon_state=icon_state)
	..()

/datum/asset/simple/lobby
	assets = list(
		"playeroptions.css" = 'html/browser/playeroptions.css'
	)

/datum/asset/simple/namespaced/common
	assets = list("padlock.png" = 'icons/ui_icons/common/padlock.png')
	parents = list("common.css" = 'html/browser/common.css')

/datum/asset/simple/permissions
	assets = list(
		"search.js" = 'html/admin/search.js',
		"panels.css" = 'html/admin/panels.css'
	)

/datum/asset/group/permissions
	children = list(
		/datum/asset/simple/permissions,
		/datum/asset/simple/namespaced/common
	)

/datum/asset/simple/notes
	assets = list(
		"high_button.png" = 'icons/ui_icons/notes/high_button.png',
		"medium_button.png" = 'icons/ui_icons/notes/medium_button.png',
		"minor_button.png" = 'icons/ui_icons/notes/minor_button.png',
		"none_button.png" = 'icons/ui_icons/notes/none_button.png',
	)

/datum/asset/simple/arcade
	assets = list(
		"boss1.gif" = 'icons/ui_icons/arcade/boss1.gif',
		"boss2.gif" = 'icons/ui_icons/arcade/boss2.gif',
		"boss3.gif" = 'icons/ui_icons/arcade/boss3.gif',
		"boss4.gif" = 'icons/ui_icons/arcade/boss4.gif',
		"boss5.gif" = 'icons/ui_icons/arcade/boss5.gif',
		"boss6.gif" = 'icons/ui_icons/arcade/boss6.gif',
	)

/*
/datum/asset/spritesheet/simple/achievements
	name ="achievements"
	assets = list(
		"default" = 'icons/ui_icons/achievements/default.png',
		"basemisc" = 'icons/ui_icons/achievements/basemisc.png',
		"baseboss" = 'icons/ui_icons/achievements/baseboss.png',
		"baseskill" = 'icons/ui_icons/achievements/baseskill.png',
		"bbgum" = 'icons/ui_icons/achievements/boss/bbgum.png',
		"colossus" = 'icons/ui_icons/achievements/boss/colossus.png',
		"hierophant" = 'icons/ui_icons/achievements/boss/hierophant.png',
		"legion" = 'icons/ui_icons/achievements/boss/legion.png',
		"miner" = 'icons/ui_icons/achievements/boss/miner.png',
		"swarmer" = 'icons/ui_icons/achievements/boss/swarmer.png',
		"tendril" = 'icons/ui_icons/achievements/boss/tendril.png',
		"featofstrength" = 'icons/ui_icons/achievements/misc/featofstrength.png',
		"helbital" = 'icons/ui_icons/achievements/misc/helbital.png',
		"jackpot" = 'icons/ui_icons/achievements/misc/jackpot.png',
		"meteors" = 'icons/ui_icons/achievements/misc/meteors.png',
		"timewaste" = 'icons/ui_icons/achievements/misc/timewaste.png',
		"upgrade" = 'icons/ui_icons/achievements/misc/upgrade.png',
		"clownking" = 'icons/ui_icons/achievements/misc/clownking.png',
		"clownthanks" = 'icons/ui_icons/achievements/misc/clownthanks.png',
		"rule8" = 'icons/ui_icons/achievements/misc/rule8.png',
		"snail" = 'icons/ui_icons/achievements/misc/snail.png',
		"ascension" = 'icons/ui_icons/achievements/misc/ascension.png',
		"ashascend" = 'icons/ui_icons/achievements/misc/ashascend.png',
		"fleshascend" = 'icons/ui_icons/achievements/misc/fleshascend.png',
		"rustascend" = 'icons/ui_icons/achievements/misc/rustascend.png',
		"voidascend" = 'icons/ui_icons/achievements/misc/voidascend.png',
		"mining" = 'icons/ui_icons/achievements/skills/mining.png',
		"changeling" = 'icons/ui_icons/achievements/mafia/mafia.png',
		"chaplain" = 'icons/ui_icons/achievements/mafia/town.png',
		"clown" = 'icons/ui_icons/achievements/mafia/neutral.png',
		"basemafia" ='icons/ui_icons/achievements/basemafia.png',
		"frenching" = 'icons/ui_icons/achievements/misc/frenchingthebubble.png'
	)
*/

/datum/asset/spritesheet/simple/pills
	name = "pills"
	assets = list(
		"pill1" = 'icons/ui_icons/pills/pill1.png',
		"pill2" = 'icons/ui_icons/pills/pill2.png',
		"pill3" = 'icons/ui_icons/pills/pill3.png',
		"pill4" = 'icons/ui_icons/pills/pill4.png',
		"pill5" = 'icons/ui_icons/pills/pill5.png',
		"pill6" = 'icons/ui_icons/pills/pill6.png',
		"pill7" = 'icons/ui_icons/pills/pill7.png',
		"pill8" = 'icons/ui_icons/pills/pill8.png',
		"pill9" = 'icons/ui_icons/pills/pill9.png',
		"pill10" = 'icons/ui_icons/pills/pill10.png',
		"pill11" = 'icons/ui_icons/pills/pill11.png',
		"pill12" = 'icons/ui_icons/pills/pill12.png',
		"pill13" = 'icons/ui_icons/pills/pill13.png',
		"pill14" = 'icons/ui_icons/pills/pill14.png',
		"pill15" = 'icons/ui_icons/pills/pill15.png',
		"pill16" = 'icons/ui_icons/pills/pill16.png',
		"pill17" = 'icons/ui_icons/pills/pill17.png',
		"pill18" = 'icons/ui_icons/pills/pill18.png',
		"pill19" = 'icons/ui_icons/pills/pill19.png',
		"pill20" = 'icons/ui_icons/pills/pill20.png',
		"pill21" = 'icons/ui_icons/pills/pill21.png',
		"pill22" = 'icons/ui_icons/pills/pill22.png',
	)

//this exists purely to avoid meta by pre-loading all language icons.
/datum/asset/language/register()
	for(var/path in typesof(/datum/language))
		set waitfor = FALSE
		var/datum/language/L = new path ()
		L.get_icon()

/datum/asset/spritesheet/pipes
	name = "pipes"

/datum/asset/spritesheet/pipes/register()
	for (var/each in list('icons/obj/atmospherics/pipes/pipe_item.dmi', 'icons/obj/atmospherics/pipes/disposal.dmi', 'icons/obj/atmospherics/pipes/transit_tube.dmi', 'icons/obj/plumbing/fluid_ducts.dmi'))
		InsertAll("", each, GLOB.alldirs)
	..()

// Representative icons for each research design
/datum/asset/spritesheet/research_designs
	name = "design"

/datum/asset/spritesheet/research_designs/register()
	for (var/id in SSresearch.techweb_designs)
		var/datum/design/D = SSresearch.techweb_designs[id]
		var/asset_path = D.get_asset_path()
		if(sprites[asset_path])
			continue
		// construct the icon and slap it into the resource cache
		var/atom/item = initial(D.build_path)
		if (!ispath(item, /atom))
			// biogenerator outputs to beakers by default
			if (initial(D.build_type) & BIOGENERATOR)
				item = /obj/item/reagent_containers/glass/beaker/large
			else
				continue  // shouldn't happen, but just in case

		// circuit boards become their resulting machines or computers
		if (ispath(item, /obj/item/circuitboard))
			var/obj/item/circuitboard/C = item
			var/machine = initial(C.build_path)
			if (machine)
				item = machine
		var/icon_file = initial(item.icon)
		var/icon/I = icon(icon_file, initial(item.icon_state), SOUTH)

		// computers (and snowflakes) get their screen and keyboard sprites
		if (ispath(item, /obj/machinery/computer) || ispath(item, /obj/machinery/power/solar_control))
			var/obj/machinery/computer/C = item
			var/screen = initial(C.icon_screen)
			var/keyboard = initial(C.icon_keyboard)
			var/all_states = icon_states(icon_file)
			if (screen && (screen in all_states))
				I.Blend(icon(icon_file, screen, SOUTH), ICON_OVERLAY)
			if (keyboard && (keyboard in all_states))
				I.Blend(icon(icon_file, keyboard, SOUTH), ICON_OVERLAY)

		Insert(asset_path, I)
	return ..()

/datum/asset/spritesheet/vending
	name = "vending"

/proc/get_spritesheet_icon_key(icon, state, color)
	if(isnull(color) || uppertext(color) == "#FFFFFF" || uppertext(color) == "#FFFFFFFF")
		return "[icon]-[state]"
	return "[icon]-[state]-[color]"

/proc/get_spritesheet_icon_key_from_type(atom/item_type)
	var/icon_file = sanitize_filename(replacetext("[initial(item_type.icon)]", ".dmi", ""))
	var/icon_state = initial(item_type.icon_state)
	var/item_color = initial(item_type.color)
	return get_spritesheet_icon_key(icon_file, icon_state, item_color)

/datum/asset/spritesheet/vending/register()
	var/list/list/icon_file_states = list() // cache iconstates for speed
	var/icon_key
	for (var/atom/item as anything in GLOB.vending_products)
		icon_key = get_spritesheet_icon_key_from_type(item)
		if(sprites[icon_key])
			continue
		var/icon_file = initial(item.icon)
		var/icon_state = initial(item.icon_state)
		var/item_color = uppertext(initial(item.color))
		if(item_color == "#FFFFFF" || item_color == "#FFFFFFFF")
			item_color = null
		var/icon/I
		if(!icon_file_states[icon_file])
			icon_file_states[icon_file] = icon_states(icon_file)
		if(icon_state in icon_file_states[icon_file])
			I = icon(icon_file, icon_state, SOUTH)
			if (!isnull(item_color))
				I.Blend(item_color, ICON_MULTIPLY)
		else
			I = icon('icons/turf/floors.dmi', "", SOUTH)

		Insert(icon_key, I)
	return ..()

/datum/asset/simple/genetics
	assets = list(
		"dna_discovered.gif" = 'icons/ui_icons/dna/dna_discovered.gif',
		"dna_undiscovered.gif" = 'icons/ui_icons/dna/dna_undiscovered.gif',
		"dna_extra.gif" = 'icons/ui_icons/dna/dna_extra.gif'
	)

/datum/asset/simple/orbit
	assets = list(
		"ghost.png" = 'icons/ui_icons/orbit/ghost.png'
	)

/datum/asset/simple/vv
	assets = list(
		"view_variables.css" = 'html/admin/view_variables.css'
	)

/datum/asset/spritesheet/sheetmaterials
	name = "sheetmaterials"

/datum/asset/spritesheet/sheetmaterials/register()
	InsertAll("", 'icons/obj/stack_objects.dmi')

	// Special case to handle Bluespace Crystals
	Insert("polycrystal", 'icons/obj/telescience.dmi', "polycrystal")
	..()

/datum/asset/spritesheet/mafia
	name = "mafia"

/datum/asset/spritesheet/mafia/register()
	InsertAll("", 'icons/obj/mafia.dmi')
	..()

/datum/asset/spritesheet/loadout
	name = "loadout"

/datum/asset/spritesheet/loadout/register()
	var/list/outfits = list()
	var/list/icon_states_cache = list()
	for(var/j in subtypesof(/datum/job))
		var/datum/job/J = new j
		for (var/D in J.loadout_options)
			if (D in outfits)
				continue
			outfits += D
			var/datum/outfit/O = new D
			for(var/itemtype in O.get_all_possible_item_paths())
				var/obj/item/I = itemtype
				if(!ispath(itemtype, /obj/item))
					world.log << "NON-ITEM \"[itemtype]\" IN [O.type] OF [j]"
					continue
				var/icon_file = initial(I.icon)
				if(isnull(icon_file))
					world.log << "MISSING ICON FOR [initial(I.name)] IN [O.type] OF [j]"
					continue
				var/icon_state = initial(I.icon_state)
				if(!icon_states_cache[icon_file])
					icon_states_cache[icon_file] = icon_states(icon_file)
				if(isnull(icon_state) || !(icon_state in icon_states_cache[icon_file]))
					world.log << "MISSING ICON STATE[isnull(icon_state) ? null : " "][icon_state] FOR [itemtype]"
					continue
				var/c = uppertext(initial(I.color))
				var/icon_key = get_spritesheet_icon_key_from_type(I)
				if(sprites[icon_key]) // save us some work generating the icon if we already have it
					continue
				var/icon/Ic = icon(icon_file, icon_state, SOUTH)
				if (!isnull(c) && c != "#FFFFFF" && c != "#FFFFFFFF")
					Ic.Blend(c, ICON_MULTIPLY)
				Insert(icon_key, Ic)
	return ..()
