//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\CentCom.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\Pahrump-Sunset\Pahrump-Sunset.dmm"
		#include "map_files\Pahrump-Sunset\Pahrump-Lower.dmm"
		#include "map_files\Pahrump-Sunset\Pahrump-Upper.dmm"
		#include "map_files\Pahrump-Sunset\Dungeons.dmm"

		#ifdef TRAVISBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
