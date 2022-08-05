/obj/screen/mov_intent
	icon = 'icons/fallout/UI/buttons_fallout2.dmi'

/obj/screen/mov_intent/update_icon()
	// todo: report back if this causes lag
	// it probably shouldn't because this should just run when ui style is changed
	. = ..()
	icon = tg_ui_icon_to_cit_ui(icon) // no-op if it's already set or unsupported

/obj/screen/sprintbutton
	name = "toggle sprint"
	icon = 'icons/fallout/UI/buttons_fallout2.dmi'
	icon_state = "act_sprint"
	layer = HUD_LAYER - 0.1
	var/mutable_appearance/flashy

/obj/screen/sprintbutton/update_icon()
	// todo: report back if this causes lag
	// it probably shouldn't because this should just run when ui style is changed
	. = ..()
	icon = tg_ui_icon_to_cit_ui(icon) // no-op if it's already set or unsupported

/obj/screen/sprintbutton/Click()
	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		H.default_toggle_sprint()


/obj/screen/sprintbutton/update_icon_state()
	var/mob/living/user = hud?.mymob
	if(!istype(user))
		return
	if(user.combat_flags & COMBAT_FLAG_SPRINT_ACTIVE)
		icon_state = "act_sprint_on"
	else if(HAS_TRAIT(user, TRAIT_SPRINT_LOCKED))
		icon_state = "act_sprint_locked"
	else
		icon_state = "act_sprint"

/obj/screen/sprintbutton/update_overlays()
	. = ..()
	var/mob/living/carbon/user = hud?.mymob
	if(!istype(user) || !user.client)
		return

	if((user.combat_flags & COMBAT_FLAG_SPRINT_ACTIVE) && user.client.prefs.hud_toggle_flash)
		if(!flashy)
			flashy = mutable_appearance('icons/mob/screen_gen.dmi', "togglehalf_flash")
		if(flashy.color != user.client.prefs.hud_toggle_color)
			flashy.color = user.client.prefs.hud_toggle_color
		. += flashy

//Sprint buffer onscreen code.
/datum/hud/var/obj/screen/sprint_buffer/sprint_buffer

/obj/screen/sprint_buffer
	name = "sprint buffer"
	icon = 'icons/fallout/UI/sprintbar.dmi'
	icon_state = "prog_bar_100"

/obj/screen/sprint_buffer/update_icon()
	// snowflake code, update to use something like tg_ui_icon_to_cit_ui later
	var/mob/living/carbon/user = hud?.mymob
	if(!istype(user) || !user.client)
		return
	switch(hud.ui_style)
		if('icons/fallout/UI/screen_fallout2.dmi', 'icons/fallout/UI/screen_fallout2_dark.dmi')
			icon = 'icons/fallout/UI/sprintbar.dmi'
		else
			icon = 'icons/effects/progessbar.dmi'

/obj/screen/sprint_buffer/Click()
	if(isliving(usr))
		var/mob/living/L = usr
		to_chat(L, "<span class='boldnotice'>Your sprint buffer's maximum capacity is [L.sprint_buffer_max]. It is currently at [L.sprint_buffer], regenerating at [L.sprint_buffer_regen_ds * 10] per second.")

/obj/screen/sprint_buffer/proc/update_to_mob(mob/living/L)
	var/amount = 0
	if(L.sprint_buffer_max > 0)
		amount = round(clamp((L.sprint_buffer / L.sprint_buffer_max) * 100, 0, 100), 5)
	icon_state = "prog_bar_[amount]"
