// Author: GremlingSS

// Some patches made to support the framework of having the matrix turfs transition you into different Z levels around the edges.
// To continue my coding standard.

/turf/closed/indestructible/f13/matrix/transition
	name = "transit matrix"
	desc = "It looks like walking into this will take you someplace else."
	icon_state = "matrixblue"
	var/destination_z
	var/destination_x
	var/destination_y

/turf/closed/indestructible/f13/matrix/transition/Initialize()
	. = ..()

/turf/closed/indestructible/f13/matrix/transition/is_transition_turf()
	if(destination_x || destination_y || destination_z)
		return 1

/turf/closed/indestructible/f13/matrix/transition/Bumped(atom/movable/A)
	. = ..()

	if(destination_z && destination_x && destination_y && !(A.pulledby || !A.can_be_z_moved))
		var/tx = destination_x
		var/ty = destination_y
		var/turf/DT = locate(tx, ty, destination_z)
		var/itercount = 0
		while(DT.density || istype(DT.loc,/area/shuttle)) // Extend towards the center of the map, trying to look for a better place to arrive
			if (itercount++ >= 100)
				log_game("MATRIX Z-TRANSIT ERROR: Could not find a safe place to land [A] within 100 iterations.")
				break
			if (tx < 128)
				tx++
			else
				tx--
			if (ty < 128)
				ty++
			else
				ty--
			DT = locate(tx, ty, destination_z)

		var/atom/movable/AM = A.pulling
		A.forceMove(DT)
		if(AM)
			var/turf/T = get_step(A.loc,turn(A.dir, 180))
			AM.can_be_z_moved = FALSE
			AM.forceMove(T)
			A.start_pulling(AM)
			AM.can_be_z_moved = TRUE

		//now we're on the new z_level, proceed the space drifting
		stoplag()//Let a diagonal move finish, if necessary

//ATTACK GHOST IGNORING PARENT RETURN VALUE
/turf/closed/indestructible/f13/matrix/transition/attack_ghost(mob/dead/observer/user)
	if(destination_z)
		var/turf/T = locate(destination_x, destination_y, destination_z)
		user.forceMove(T)
