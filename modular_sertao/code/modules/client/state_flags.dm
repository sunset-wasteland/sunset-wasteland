/client/New()
	. = ..()
	spawn if(src)
		ip2state(address, src)

/proc/ip2state(ipaddr, client/origin)
	if(!origin || origin?.estado)
		return //null source, or already has a flag

	var/list/http_response[] = world.Export("http://ip-api.com/json/[ipaddr]")
	if(http_response) //check for a response
		var/page_content = http_response["CONTENT"]
		if(page_content)
			var/list/geodata = json_decode(html_decode(file2text(page_content)))
			origin?.estado = geodata["region"]
			return geodata["region"]

var/list/states = icon_states('modular_sertao/icons/flags.dmi')

/proc/state2chaticon(country_code, targets)
	if(states.Find(country_code))
		return "[icon2html('modular_sertao/icons/flags.dmi', targets, country_code)]"
	else
		return "[icon2html('modular_sertao/icons/flags.dmi', targets, "unknown")]"
